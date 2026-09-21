"""Adversarial regression checks, separate from the large enumeration benchmarks."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest
from itertools import combinations_with_replacement, product

from filters import (eligible_spawns, is_initial, line_in_slide_image, necessary,
                     validate)
from inverse import forward_line, inverse_line, predecessors
from verify_enumeration import load_dump, raw_bfs


class RulesTests(unittest.TestCase):
    def test_no_chain_merge(self):
        self.assertEqual(forward_line((2, 2, 4, 4)), (4, 8, 0, 0))
        self.assertEqual(forward_line((2, 2, 2, 2)), (4, 4, 0, 0))
        self.assertIn((4, 2, 2, 4), inverse_line((4, 4, 4, 0)))
        self.assertFalse(inverse_line((2, 2, 4, 0)))

    def test_closed_image_characterization(self):
        checked = 0
        for length in range(1, 5):
            for row in product((0, 2, 4, 8, 16, 32), repeat=length):
                self.assertEqual(line_in_slide_image(row), bool(inverse_line(row)), row)
                checked += 1
        self.assertEqual(checked, 1554)

    def test_invalid_value_domains(self):
        for row in ((), (1, 0), (-2, 0), (3, 0), (True, 0), (2.0, 0)):
            with self.assertRaises(ValueError):
                inverse_line(row)
        for board in ((2, 3, 0, 0), (2, -4, 0, 0), (2, 4, 0), (True, 4, 0, 0)):
            with self.assertRaises(ValueError):
                validate(board, 2, 2)
            with self.assertRaises(ValueError):
                predecessors(board, 2, 2)

    def test_predecessor_obstruction(self):
        board = (2, 4, 8, 8, 4, 4, 8, 16, 16, 32, 64, 64, 16, 32, 128, 256)
        self.assertTrue(necessary(board, 4, 4, exact_image=False))
        self.assertFalse(eligible_spawns(board, 4, 4, exact_image=True))
        self.assertFalse(predecessors(board, 4, 4))
        self.assertFalse(necessary((128, 8, 2) + (0,) * 13, 4, 4, exact_image=False))

    def test_initial_exception(self):
        board = [0] * 16
        board[5], board[10] = 2, 4
        self.assertTrue(is_initial(board))
        self.assertFalse(eligible_spawns(board, 4, 4))
        self.assertTrue(necessary(board, 4, 4))

    def test_all_small_reachable_boards_pass(self):
        for height, width in ((2, 2), (2, 3)):
            for board in raw_bfs(height, width):
                self.assertTrue(necessary(board, height, width), board)

    def test_tagged_cost_invariant(self):
        checked = 0
        for cells in range(2, 5):
            alphabet = [(1, 0)] + [(rank, flag) for rank in range(2, cells + 2)
                                  for flag in (0, 1)]
            def valid(inventory):
                costs = sorted((rank - flag for rank, flag in inventory), reverse=True)
                return all(s <= cells - i for i, s in enumerate(costs))
            for size in range(1, cells + 1):
                for inv in combinations_with_replacement(alphabet, size):
                    if not valid(inv):
                        continue
                    for i in range(size):
                        for j in range(i + 1, size):
                            if inv[i][0] != inv[j][0]:
                                continue
                            parent = (inv[i][0] + 1, max(inv[i][1], inv[j][1]))
                            merged = [tile for k, tile in enumerate(inv) if k not in (i, j)]
                            self.assertTrue(valid(merged + [parent]))
                            checked += 1
                    if size < cells:
                        for spawn in ((1, 0), (2, 1)):
                            self.assertTrue(valid(list(inv) + [spawn]))
        self.assertGreater(checked, 100)


class CliTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.binary = os.environ['ENUM_BINARY']

    def test_invalid_arguments(self):
        bad = [('2x', '2', '0', '0'), ('2', '2', '0', '8junk'),
               ('99999999999999999999', '2', '0', '0'),
               ('2147483647', '2147483647', '0', '0'),
               ('-1', '2', '0', '0'), ('1', '1', '0', '0'),
               ('4', '4', '0', '0'), ('4', '4', '65536', '0'),
               ('2', '2', '12', '0'), ('2', '2', '0', '9'),
               ('2', '2', '0', '0', 'prefix', 'extra')]
        for args in bad:
            result = subprocess.run([self.binary, *args], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0, args)

    def test_failed_dump_is_not_success(self):
        with tempfile.TemporaryDirectory() as directory:
            prefix = str(Path(directory) / 'missing-directory' / 'states')
            result = subprocess.run([self.binary, '2', '2', '0', '0', prefix],
                                    capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertNotIn('"orbits":110', result.stderr)

    @unittest.skipUnless(Path('/dev/full').exists(), '/dev/full is a Linux I/O test')
    def test_failed_stdout_is_not_success(self):
        with open('/dev/full', 'wb') as output:
            result = subprocess.run([self.binary, '2', '2', '0', '0'],
                                    stdout=output, stderr=subprocess.PIPE)
        self.assertNotEqual(result.returncode, 0)

    def test_dump_mutations_are_rejected(self):
        source = Path('states')
        for mutation in ('duplicate', 'wrong_age', 'out_of_range', 'noncanonical'):
            with tempfile.TemporaryDirectory() as directory:
                target = Path(directory)
                for file in source.glob('2x2-*.txt'):
                    shutil.copy2(file, target / file.name)
                file = target / '2x2-4.txt'
                rows = file.read_text().splitlines()
                if mutation == 'duplicate':
                    rows.insert(0, rows[0])
                elif mutation == 'wrong_age':
                    file.rename(target / '2x2-3.txt')
                elif mutation == 'out_of_range':
                    rows[0] = str(1 << 16)
                else:
                    rows[0] = str(0x1100)
                if mutation != 'wrong_age':
                    file.write_text('\n'.join(rows) + '\n')
                with self.assertRaises(ValueError, msg=mutation):
                    load_dump(2, 2, target)


if __name__ == '__main__':
    suite = unittest.defaultTestLoader.loadTestsFromModule(__import__(__name__))
    result = unittest.TextTestRunner(verbosity=2).run(suite)
    print(json.dumps({'tests_run': result.testsRun, 'failures': len(result.failures),
                      'errors': len(result.errors), 'skipped': len(result.skipped),
                      'passed': result.wasSuccessful()}, indent=2))
    raise SystemExit(0 if result.wasSuccessful() else 1)
