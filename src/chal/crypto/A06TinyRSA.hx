package chal.crypto;

/**
m = int.from_bytes(b"emp_sm4ll_n", "big")
122618318641007721293045614

p = 734468398408223
q = 731587760569901
n = p * q = 537328090800833704871724695923
e = 65537
c = pow(m, e, n) = 369978634490714241746606678590

phi = (p - 1) * (q - 1)
d = number.inverse(e, phi) = 451338542662847153738469524073

m' = pow(c, d, n) == m
*/
class A06TinyRSA extends Base {
  public function new() {
    super("06-tiny-rsa", '
<div class="code">Encryption:<br><pre>
p = ?, q = ?
e = 65537
flag = ?
n = p * q = 537328090800833704871724695923
c = pow(flag, e, n) = 369978634490714241746606678590
</pre><br><br>
Decryption:<br><pre>
phi = (p - 1) * (q - 1)
d = modinv(e, phi)
flag = pow(c, d, n)
</pre></div>
');
    flag = "emp_sm4ll_n";
    resources = [
         {link: "https://en.wikipedia.org/wiki/RSA_(cryptosystem)", text: "RSA (Wikipedia)"}
        ,{link: "https://en.wikipedia.org/wiki/Integer_factorization", text: "Integer factorisation (Wikipedia)"}
      ];
  }
}
