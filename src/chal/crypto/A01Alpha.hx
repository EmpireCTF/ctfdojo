package chal.crypto;

class A01Alpha extends Base {
  public function new() {
    super("01-alpha", '
<div class="code">5 13 16 _ 2 21 20 _ 9 20 _ 23 1 19 _ 5 14 3 18 25 16 20 5 4</div>
');
    flag = "emp_but_it_was_encrypted";
    resources = [
        {link: "https://en.wikipedia.org/wiki/English_alphabet", text: "English alphabet (Wikipedia)"}
      ];
  }
}
