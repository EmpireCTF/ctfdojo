package chal.crypto;

class A03Frequency extends Base {
  public function new() {
    var original = '
As most people know who are versed in this century\'s technological effects, exact distances can be determined by timing the duration of a sound\' round trip between the deflecting object and its point of origin. This principle serves as the basis for all the radar, sonar and ultrasonics used every day around the world by air traffic ocntrollers, fishermen, and obstetricians. By using sound or electromagnetic waves, visible blips may be produced on a screen, indicating either a 747, a school of salmon, or the barely pumping heart of a fetus.
Of course echolocation has never belonged exclusively to technology. Microchiroptera (bats), Cetacean (porpoises and toothed whales), Delphinis delphis (flag, replace spaces with underscores: emp house of leaves) as well as certain mammals (flying foxes) and birds (oilbirds) all use sound to create extremely accurate acoustic images. However, comma, unlike their human counterparts, neither bats nor dolphins require an intermediary screen to interpret the echoes. They simply "see" the shape of sound.
Bats, for example, create frequency modulated [FM] images by producing constant-frequency signals [0.5 to 100+ ms] and FM signals [0.5 to 10ms] in their larynx. The respondent echoes are then translated into nerve discharges in the auditory cortex, enabling the bat not only to determine an insect\'s velocity and direction (through synaptic interpretation of Doppler shifts) but pinpoint its location to within a fraction of a millimeter.
';
    var alpha = "abcdefhgijklmnopqrstuvwxyzABCDEFHGIJKLMNOPQRSTUVWXYZ".split("");
    var substitute = "zyxempirctfgoalsbdhjknquvwZYXEMPIRCTFGOALSBDHJKNQUVW".split("");
    var encoded = original.split("\n").map(p -> p.split("").map(c -> {
        var oi = alpha.indexOf(c);
        oi == -1 ? c : substitute[oi];
      }).join("")).join('</div><div class="code">');
    
    super("03-frequency", '
<div class="code">${encoded}</div>
');
    flag = "emp_house_of_leaves";
    resources = [
         {link: "https://en.wikipedia.org/wiki/Frequency_analysis", text: "Frequency analysis (Wikipedia)"}
        ,{link: "https://pi.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html", text: "English letter frequency"}
      ];
  }
}
