#!/usr/bin/env python3
"""Rebuild, execute, and validate in a fresh directory; never trust archived outputs.

No Python/JavaScript dependencies outside their standard libraries are needed.
Failure is recorded in manifest.json and returned as a nonzero exit status.
"""
import argparse
import csv
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import sys
import time
import uuid

SOURCE = Path(__file__).resolve().parent
QUICK = {'2x2': (2, 2, 0, 0), '2x3': (2, 3, 0, 0),
         '2x2-stop32': (2, 2, 32, 0), '4x4-stop8': (4, 4, 8, 0),
         '4x4-age24': (4, 4, 0, 24)}
LARGE = {'3x3': (3, 3, 0, 0), '4x4-stop16': (4, 4, 16, 0)}


def utc_now():
    return datetime.now(timezone.utc).isoformat()


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def load(path):
    return json.loads(path.read_text())


def compare(actual, expected, label):
    require(actual == expected, f'{label} mismatch: {actual!r} != {expected!r}')


def validate_csv(path, summary):
    fields = ('orbits', 'labeled', 'after_orbits', 'after_labeled', 'dead_orbits',
              'full_chain_orbits')
    rows = list(csv.DictReader(path.open()))
    require(bool(rows), f'empty layer table: {path}')
    ages = [int(row['age']) for row in rows]
    require(ages == sorted(set(ages)) and all(a >= 4 and a % 2 == 0 for a in ages),
            f'invalid layer order: {path}')
    compare(ages[-1], summary['last_age'], f'{path.name}: last age')
    for field in fields:
        values = [int(row[field]) for row in rows]
        require(all(v >= 0 for v in values), f'negative count: {path}, {field}')
        compare(sum(values), summary[field], f'{path.name}: {field} sum')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--large', action='store_true',
                        help='also enumerate full 3x3 and 4x4 stopped at first 16')
    parser.add_argument('--output-dir', type=Path,
                        help='new or empty directory; default: a unique runs/ subdirectory')
    args = parser.parse_args()
    if sys.flags.optimize:
        parser.error('do not use Python -O or PYTHONOPTIMIZE; the checkers use assertions')
    if sys.version_info < (3, 10):
        parser.error('Python 3.10 or newer is required')
    compiler = shutil.which(os.environ.get('CXX', 'g++'))
    node = shutil.which('node')
    if not compiler or not node:
        parser.error('g++ (or CXX) and Node.js with BigInt are required')
    name = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ') + '-' + uuid.uuid4().hex[:8]
    output = (args.output_dir or SOURCE / 'runs' / name).resolve()
    if output.exists() and (not output.is_dir() or any(output.iterdir())):
        parser.error(f'output directory must be new or empty: {output}')
    output.mkdir(parents=True, exist_ok=True)
    (output / 'results').mkdir()
    (output / 'states').mkdir()
    expected = load(SOURCE / 'expected.json')
    manifest = {
        'schema_version': 1, 'started_utc': utc_now(), 'mode': 'large' if args.large else 'quick',
        'status': 'running', 'proof_status': 'human proofs and executable verification, not Lean',
        'software': {'python': sys.version, 'platform': platform.platform()},
        'source_sha256': {p.name: digest(p) for p in sorted(SOURCE.iterdir())
                          if p.is_file() and p.suffix in ('.py', '.js', '.cpp', '.json', '.md', '.sh', '.patch')},
        'stages': [], 'completed_cases': [],
    }
    manifest_path = output / 'manifest.json'

    def save():
        manifest_path.write_text(json.dumps(manifest, indent=2) + '\n')

    def execute(label, command, stdout, stderr, env=None):
        record = {'name': label, 'command': list(map(str, command)), 'started_utc': utc_now()}
        manifest['stages'].append(record)
        save()
        print(f'Running {label}', flush=True)
        started = time.monotonic()
        with (output / stdout).open('w') as out, (output / stderr).open('w') as err:
            proc = subprocess.run(list(map(str, command)), cwd=output, stdout=out, stderr=err,
                                  env=env, check=False)
        record.update(exit_code=proc.returncode, elapsed_seconds=round(time.monotonic() - started, 6))
        save()
        require(proc.returncode == 0, f'{label} failed; see {output / stderr}')

    try:
        manifest['software']['node'] = subprocess.check_output([node, '--version'], text=True).strip()
        manifest['software']['compiler'] = subprocess.check_output([compiler, '--version'], text=True).splitlines()[0]
        git = subprocess.run(['git', '-C', str(SOURCE), 'rev-parse', 'HEAD'],
                             capture_output=True, text=True)
        manifest['source_commit'] = git.stdout.strip() if git.returncode == 0 else None
        binary = output / 'enumerate'
        execute('compile', [compiler, '-O3', '-std=c++17', '-Wall', '-Wextra', '-Werror',
                            SOURCE / 'enumerate.cpp', '-o', binary], 'build.stdout', 'build.stderr')
        execute('python_bounds', [sys.executable, SOURCE / 'bounds.py'], 'bounds.json', 'bounds.stderr')
        compare(load(output / 'bounds.json'), expected['bounds'], 'Python superset counts')
        execute('bigint_bounds', [node, SOURCE / 'verify_bounds.js'],
                'results/verified_bounds.json', 'results/verified_bounds.stderr')
        bounds = load(output / 'bounds.json')['geometry_causal']
        js = load(output / 'results/verified_bounds.json')
        compare(int(js['labeled']), bounds['including_initial_labeled'], 'labeled cross-check')
        compare(int(js['orbits']), bounds['including_initial_orbits'], 'orbit cross-check')
        compare(list(map(int, js['fixed'])), bounds['fixed'], 'all eight fixed counts')
        compare(list(map(int, js['initial_fixed'])), expected['bounds']['initial_extras']['fixed'],
                'all eight opening corrections')
        execute('inverse_line_exhaustion', [sys.executable, SOURCE / 'inverse.py'],
                'results/inverse.json', 'results/inverse.stderr')
        compare(load(output / 'results/inverse.json'), expected['inverse'], 'inverse exhaustion')
        cases = {**QUICK, **(LARGE if args.large else {})}
        for label, settings in cases.items():
            cmd = [binary, *settings]
            if label in ('2x2', '2x3'):
                cmd.append(output / 'states' / label)
            execute(label, cmd, f'results/{label}.csv', f'results/{label}.json')
            summary = load(output / f'results/{label}.json')
            compare(summary, expected[label], f'{label}: full summary')
            validate_csv(output / f'results/{label}.csv', summary)
            manifest['completed_cases'].append(label)
        execute('independent_raw_sets_and_closure', [sys.executable, SOURCE / 'verify_enumeration.py'],
                'results/verified_enumeration.json', 'results/verified_enumeration.stderr')
        compare(load(output / 'results/verified_enumeration.json'), expected['enumeration_verification'],
                'independent set/closure checks')
        execute('score_counterexample', [sys.executable, SOURCE / 'score_counterexample.py'],
                'results/score_equality_counterexample.json', 'results/score_equality_counterexample.stderr')
        certificate = load(output / 'results/score_equality_counterexample.json')
        compare((certificate['score'], certificate['rounds'], certificate['fours_including_initial']),
                (180, 24, 3), 'score counterexample')
        env = dict(os.environ, ENUM_BINARY=str(binary))
        execute('adversarial_regressions', [sys.executable, SOURCE / 'test_regressions.py'],
                'results/regressions.json', 'results/regressions.stderr', env=env)
        regressions = load(output / 'results/regressions.json')
        require(regressions['passed'] and regressions['tests_run'] >= 11, 'incomplete regression suite')
        manifest['status'] = 'passed'
    except Exception as error:
        manifest['status'] = 'failed'
        manifest['error'] = str(error)
        raise
    finally:
        manifest['finished_utc'] = utc_now()
        manifest['output_sha256'] = {p.relative_to(output).as_posix(): digest(p)
                                     for p in sorted(output.rglob('*'))
                                     if p.is_file() and p.name != 'manifest.json'}
        save()
    print(f'PASS: {len(manifest["completed_cases"])} newly executed enumeration cases; {manifest_path}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
