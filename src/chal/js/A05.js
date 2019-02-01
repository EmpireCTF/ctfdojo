window.onload = () => {
  const form = document.getElementById("flag-form");

  function checkWordLength(H, H2) {
    // H: one word of the flag (_ separated)
    // H2: intended length of the word
    return Η.length === H2;
  }
  function checkValue(H0, H4) {
    // H0: one word of the flag (_ separated)
    // H4: intended value
    return H[0] == H4; // brackets added for emphasis
  }
  function checkThreeLong(H3) {
    // H3: one word of the flag (_ separated)
    for (i = 0; i < H3.length; i++) {
      if (H3[i] != 3) {
        return false;
      }
    }
    return true;
  }
  function checkLetters(H, H1) {
    // H: one word of the flag (_ separated)
    // H1: allowed letters
    return Η
      .join("_") // append _ (actually faster because of word alignment)
      .split("") // split into characters
      .filter(c => H1.split("").indexOf(c) !== -1) // filter out bad letters
      .join("") == H1; // still the same string after filtering?
  }

  form.addEventListener("submit", event => {
    // I love the seventh letter of the alphabet!
    // Split flag on underscores:
    Η = document.getElementById("flag").value.split("_");
    (
    // format: xxx_xxx_xxx, each xxx must be 3 characters long
    // make sure to label our arguments for best code style (viz. Swift)
       checkWordLength(H = Η[0], H2 = 3)
    && checkWordLength(H = Η[1], H2 = 3)
    && checkWordLength(H = Η[2], H2 = 3)
    // second word must be a 3-character long 7 (really wide!)
    && checkValue(H0 = Η[1], H4 = 7)
    // double check that the second word is 3 characters long
    // inline the checkWordLength function for better performance though
    && ((H, H2) => H.length === H4)(H = Η[1], H2 = 3)
    // let's face it:
    // the first word is always emp
    && Η[0] === "emp"
    // second (2) through last (Η.length - 1 because 0-indexed)
    // should all be 3 long
    && checkThreeLong(H3 = H.slice(2, H.length - 1))
    // any of the letters grkth should not appear in the third word!
    && checkLetters(H = Η, "grkth")
    // double check that the third word is 3 characters long
    // you never know
    && checkWordLength(Η = Η[2], H2 = 3)
    ) || event.preventDefault();
  });
};
