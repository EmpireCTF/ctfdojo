package chal.crypto;

class A02Tau extends Base {
  public function new() {
    var original = '
The number π is a mathematical constant. Originally defined as the ratio of a circle\'s circumference to its diameter, it now has various equivalent definitions and appears in many formulas in all areas of mathematics and physics. It is approximately equal to 3.14159. It has been represented by the Greek letter "π" since the mid-18th century, though it is also sometimes spelled out as "pi". It is also called Archimedes\' constant, or emp_2951_half_4_c1rcl3.
';
    var alpha = "abcdefhgijklmnopqrstuvwxyzABCDEFHGIJKLMNOPQRSTUVWXYZ".split("");
    var substitute = "empirctfgoalsbdhjknquvwxyzEMPIRCTFGOALSBDHJKNQUVWXYZ".split("");
    var encoded = original.split("").map(c -> {
        var oi = alpha.indexOf(c);
        oi == -1 ? c : substitute[oi];
      }).join("");
    
    super("02-tau", '
<div class="code">${encoded}</div>
');
    flag = "emp_2951_half_4_c1rcl3";
    resources = [
        {link: "https://en.wikipedia.org/wiki/Substitution_cipher", text: "Substitution cipher (Wikipedia)"}
      ];
  }
}
