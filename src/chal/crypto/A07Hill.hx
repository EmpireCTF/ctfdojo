package chal.crypto;

/**
from sympy import Matrix, pprint

secret = {24, 4, 4, 19} = ord(YEET)
A
Matrix([
[ 1,  8, 12, 15],
[ 4,  1, 17,  8],
[20, 20,  1, 12],
[ 0,  0,  0,  1]]) = {{ 1,  8, 12, 15},{ 4,  1, 17,  8},{20, 20,  1, 12},{ 0,  0,  0,  1}}
A_inv
Matrix([
[25, 24, 20, 25],
[24, 21,  5, 10],
[ 8, 10, 21, 16],
[ 0,  0,  0,  1]]) = {{25, 24, 20, 25},{24, 21,  5, 10},{ 8, 10, 21, 16},{ 0,  0,  0,  1}}

enc = {{ 1,  8, 12, 15},{ 4,  1, 17,  8},{20, 20,  1, 12},{ 0,  0,  0,  1}} * {24, 4, 4, 19} modulo 26
enc = {25, 8, 12, 19} = ord(ZIMT)

dec = {{25, 24, 20, 25},{24, 21,  5, 10},{ 8, 10, 21, 16},{ 0,  0,  0,  1}} * {25, 8, 12, 19} modulo 26

*/
class A07Hill extends Base {
  public function new() {
    super("07-hill", '
<div class="code">Alphabet:<br><pre>
A = 0, B = 1, C = 2, ... Z = 25
ord(TEST) = vec(19, 4, 18, 19)
</pre><br><br>
Encryption:<br><pre>
key = mat[ord(BIMP), ord(EBRI), ord(UUBM), ord(AAAB)]
 = mat[
   1,  8, 12, 15
   4,  1, 17,  8
  20, 20,  1, 12
   0,  0,  0,  1
]
secret = ?
c = key * ord(secret) = ord(ZIMT)
flag = "emp_&lt;secret&gt;"
</pre></div>
');
    flag = "emp_yeet";
    resources = [
         {link: "https://en.wikipedia.org/wiki/Hill_cipher", text: "Hill cipher (Wikipedia)"}
        ,{link: "https://live.sympy.org/", text: "SymPy Live"}
      ];
  }
}
