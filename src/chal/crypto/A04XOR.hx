package chal.crypto;

class A04XOR extends Base {
  public function new() {
    var original = 'The flag is emp_w34k_x0r';
    var key = "j".code;
    var encoded = original.split("").map(c -> '${c.charCodeAt(0) ^ key}').join(" ");
    
    super("04-xor", '
<div class="code"><pre>
${encoded}
(Each byte XOR-ed securely using the secret one-byte key!)
</pre></div>
');
    flag = "emp_w34k_x0r";
    resources = [
        {link: "https://en.wikipedia.org/wiki/XOR_cipher", text: "XOR cipher (Wikipedia)"}
      ];
  }
}
