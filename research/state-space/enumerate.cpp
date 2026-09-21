// Exact rolling-age enumeration. No estimated cardinalities or hash-only identities.
// Build: g++ -O3 -std=c++17 enumerate.cpp -o enumerate
// Usage: enumerate H W target max_age [dump_prefix]
// target=0 permits continued play. max_age=0 completes the finite small board.
// Full 4x4 is intentionally rejected: 4-bit rank encoding ends at rank 15.
#include <algorithm>
#include <array>
#include <cstdint>
#include <charconv>
#include <system_error>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <stdexcept>
#include <string>
#include <vector>
using U=uint64_t;
int H,W,C,TARGET,AGE,NS;
std::vector<std::vector<std::vector<int>>> lines;
std::vector<std::vector<int>> perms;
std::vector<std::vector<std::vector<U>>> lut;
std::vector<std::vector<U>> rowtable;
std::vector<std::vector<unsigned char>> rowmax;

U encode(const std::vector<int>& x){U r=0;for(int i=0;i<C;i++)r|=U(x[i])<<(4*i);return r;}
void setup(){
 for(int d=0;d<4;d++){
  std::vector<std::vector<int>> ls;
  int count=d<2?H:W, len=d<2?W:H;
  for(int l=0;l<count;l++){std::vector<int> v;
   for(int p=0;p<len;p++){int t=(d%2)?len-1-p:p;v.push_back(d<2?l*W+t:t*W+l);} ls.push_back(v);
  }lines.push_back(ls);
 }
 for(int s=0;s<(H==W?8:4);s++){
  std::vector<int> p(C);
  for(int r=0;r<H;r++)for(int c=0;c<W;c++){
   int a=r,b=c;
   if(s&1)b=W-1-b;
   if(s&2)a=H-1-a;
   if(s&4)std::swap(a,b);
   p[r*W+c]=a*W+b;
  }perms.push_back(p);
 }
 NS=perms.size();int chunks=(C+3)/4;
 lut.resize(NS,std::vector<std::vector<U>>(chunks));
 for(int s=0;s<NS;s++)for(int ch=0;ch<chunks;ch++){
  int n=std::min(4,C-4*ch),lim=1<<(4*n);lut[s][ch].resize(lim);
  for(int x=0;x<lim;x++){U out=0;for(int j=0;j<n;j++)out|=U((x>>(4*j))&15)<<(4*perms[s][4*ch+j]);lut[s][ch][x]=out;}
 }
 rowtable.resize(5);rowmax.resize(5);
 for(int n=1;n<=4;n++){
  int lim=1<<(4*n);rowtable[n].resize(lim);rowmax[n].resize(lim);
  for(int x=0;x<lim;x++){
   std::vector<int> a,b;for(int j=0;j<n;j++){int v=(x>>(4*j))&15;if(v)a.push_back(v);}
   bool overflow=false;
   for(size_t j=0;j<a.size();){if(j+1<a.size()&&a[j]==a[j+1]){int v=a[j]+1;if(v>15)overflow=true;b.push_back(v);j+=2;}else b.push_back(a[j++]);}
   U out=0;int mx=0;for(size_t j=0;j<b.size();j++){out|=U(b[j])<<(4*j);mx=std::max(mx,b[j]);}
   rowtable[n][x]=overflow?UINT64_MAX:out;rowmax[n][x]=mx;
  }
 }
}
U transform(U b,int s){U v=0;for(size_t ch=0;ch<lut[s].size();ch++){v|=lut[s][ch][unsigned(b&65535)];b>>=16;}return v;}
U canon(U b){U ans=b;for(int s=1;s<NS;s++)ans=std::min(ans,transform(b,s));return ans;}
int orbit(U b){int stab=0;for(int s=0;s<NS;s++)stab+=transform(b,s)==b;if(!stab||NS%stab)throw std::runtime_error("bad stabilizer");return NS/stab;}
U slide(U b,int d,int& mx){U out=0;mx=0;
 for(const auto& line:lines[d]){unsigned row=0;for(size_t j=0;j<line.size();j++)row|=unsigned((b>>(4*line[j]))&15)<<(4*j);
  U v=rowtable[line.size()][row];if(v==UINT64_MAX)throw std::runtime_error("rank overflow");mx=std::max(mx,int(rowmax[line.size()][row]));
  for(size_t j=0;j<line.size();j++)out|=((v>>(4*j))&15)<<(4*line[j]);
 }return out;}
void unique(std::vector<U>& v){std::sort(v.begin(),v.end());v.erase(std::unique(v.begin(),v.end()),v.end());}
void check_invariants(U b,int expected_age){
 std::array<int,16> ns{};int mass=0,mx=0;
 for(int i=0;i<C;i++){int r=(b>>(4*i))&15;ns[r]++;mx=std::max(mx,r);if(r)mass+=1<<r;}
 if(mass!=expected_age)throw std::runtime_error("incorrect mass layer");
 if(C-ns[0]<2)throw std::runtime_error("too few tiles");
 int tail=0;for(int q=15;q>=3;q--){tail+=ns[q];if(q<=C+2&&tail>C+2-q)throw std::runtime_error("rank invariant");if(q>C+2&&tail)throw std::runtime_error("max-rank invariant");}
 int light=2*ns[1]+4*ns[2];for(int q=3;q<=mx;q++){if(light<2*(q-2))throw std::runtime_error("latency invariant");light+=(1<<q)*ns[q];}
}
int parse_nonnegative(const char* argument) {
 const std::string text(argument);
 int value=0;
 const auto parsed=std::from_chars(text.data(),text.data()+text.size(),value);
 if(text.empty()||parsed.ec!=std::errc()||parsed.ptr!=text.data()+text.size()||value<0)
  throw std::runtime_error("expected a nonnegative decimal integer: "+text);
 return value;
}
int main(int argc,char**argv){try{
 if(argc!=5&&argc!=6)throw std::runtime_error("usage: enumerate H W target max_age [dump_prefix]");
 H=parse_nonnegative(argv[1]);W=parse_nonnegative(argv[2]);
 TARGET=parse_nonnegative(argv[3]);AGE=parse_nonnegative(argv[4]);
 // Validate dimensions BEFORE multiplication, so malicious inputs cannot overflow.
 if(H<1||W<1||H>4||W>4)throw std::runtime_error("supported dimensions: 1..4 x 1..4");
 C=H*W;
 if(C<2)throw std::runtime_error("board needs at least two cells");
 if(TARGET&&(TARGET<8||(TARGET&(TARGET-1))))throw std::runtime_error("target must be zero or a power of two >=8");
 if(AGE&&(AGE<8||AGE%2))throw std::runtime_error("age cap must be even and >=8");
 if(C>14&&!TARGET&&!AGE)throw std::runtime_error("unrestricted 4x4 needs a wider encoding; use a declared target/age cap");
 if(C>14&&((TARGET&&TARGET>32768)||(!TARGET&&AGE>=65536)))throw std::runtime_error("cap too large for 4-bit ranks");
 setup();std::map<int,std::vector<U>> pending;
 for(int i=0;i<C;i++)for(int j=i+1;j<C;j++)for(int a=1;a<=2;a++)for(int b=1;b<=2;b++)pending[(1<<a)+(1<<b)].push_back(canon((U(a)<<(4*i))|(U(b)<<(4*j))));
 std::cout.exceptions(std::ios::badbit|std::ios::failbit);
 std::cout<<"age,orbits,labeled,after_orbits,after_labeled,dead_orbits,full_chain_orbits\n";
 U total=0,raw=0,totalafter=0,totalafterraw=0,dead=0,chains=0;int last=0;bool win=false;
 while(!pending.empty()){
  auto it=pending.begin();int age=it->first;auto states=std::move(it->second);pending.erase(it);
  if(AGE&&age>AGE)continue;
  unique(states);if(states.empty())continue;last=age;
  U lr=0,ld=0,lc=0;std::vector<U> afters;afters.reserve(4*states.size());
  for(U b:states){lr+=orbit(b);check_invariants(b,age);bool can=false;
   unsigned seen=0;for(int i=0;i<C;i++)seen|=1u<<((b>>(4*i))&15);
   if(C<=14&&seen==((1u<<(C+2))-4))lc++;
   for(int d=0;d<4;d++){int mx;U a=slide(b,d,mx);if(a==b)continue;can=true;
    if(TARGET&&(1<<mx)>=TARGET){win=true;continue;}afters.push_back(canon(a));
   }if(!can)ld++;
  }
  unique(afters);U ar=0;for(U a:afters)ar+=orbit(a);
  // Deduplicating afterstates before spawning reduces repeated work.
  for(U a:afters)for(int i=0;i<C;i++)if(!((a>>(4*i))&15))for(int rank=1;rank<=2;rank++){
   int next=age+(1<<rank);if(AGE&&next>AGE)continue;
   pending[next].push_back(canon(a|(U(rank)<<(4*i))));
  }
  if(argc>5){
   const std::string name=std::string(argv[5])+"-"+std::to_string(age)+".txt";
   std::ofstream f;
   f.exceptions(std::ios::badbit|std::ios::failbit);
   f.open(name);
   for(U b:states)f<<b<<'\n';
   f.close();
  }
  total+=states.size();raw+=lr;totalafter+=afters.size();totalafterraw+=ar;dead+=ld;chains+=lc;
  std::cout<<age<<','<<states.size()<<','<<lr<<','<<afters.size()<<','<<ar<<','<<ld<<','<<lc<<'\n'<<std::flush;
  for(auto& kv:pending)unique(kv.second);
 }
 std::cerr<<"{\"H\":"<<H<<",\"W\":"<<W<<",\"target\":"<<TARGET<<",\"age_cap\":"<<AGE<<",\"last_age\":"<<last<<",\"orbits\":"<<total<<",\"labeled\":"<<raw<<",\"after_orbits\":"<<totalafter<<",\"after_labeled\":"<<totalafterraw<<",\"dead_orbits\":"<<dead<<",\"full_chain_orbits\":"<<chains<<",\"win_reached\":"<<(win?"true":"false")<<"}\n";
 return 0;
 }catch(const std::exception&e){std::cerr<<e.what()<<'\n';return 1;}}
