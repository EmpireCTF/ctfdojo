package chal.crypto;

class A05Frexor extends Base {
  public function new() {
    var original = '
In this tutorial we will consider and discuss the design of a low-cost robot cleaner able to clean the floorspace of typical homes with a vacuum or other cleaning mechanism. The design of such a robot should balance the performance desired of it by users with the technical challenges and cost of equipping it with various capabilities. For now we will assume that this is a small robot with wheels and no ability to manipulate objects or climb stairs! The robot is round, with a diameter of 30cm, and has a maximum speed of 30cm/s and a maximum turn rate of 40deg/s.
The following table has unordered lists of some aspects to consider in a robot of this type: 1) requirements that users might have, which we might consider selling points which would differentiate it from other robots on the market; 2) algorithmic/software capabilities we could try to implement on the robot; and 3) pieces of emp_not_much_better_x0r, such as sensors, with which the robot could be equipped.
';
    var key = "imperium";
    var kp = 0;
    var encoded = original.split("\n").map(p -> p.split("").map(c -> {
        '${c.charCodeAt(0) ^ key.charCodeAt(kp++ % key.length)}';
      }).join(" ")).join('</div><div class="code">');
    
    super("05-frexor", '
<div class="code"><pre>
${encoded}

(XOR encrypted, key length = 8)
</pre></div>
');
    flag = "emp_not_much_better_x0r";
    resources = [
         {link: "https://en.wikipedia.org/wiki/Frequency_analysis", text: "Frequency analysis (Wikipedia)"}
        ,{link: "https://pi.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html", text: "English letter frequency"}
        ,{link: "https://cryptopals.com/sets/1/challenges/6", text: "Break repeating-key XOR (Cryptopals)"}
      ];
  }
}
