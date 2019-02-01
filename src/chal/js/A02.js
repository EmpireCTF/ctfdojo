window.onload = () => {
  const input = document.getElementById("flag")
       ,form = document.getElementById("flag-form");

  // XOR is literally unbreakable!
  function xor(key, str) {
    let out = "";
    for (let i = 0; i < str.length; i++) {
      out += String.fromCharCode(str.charCodeAt(i) ^ key[i % key.length]);
    }
    return out;
  }

  form.addEventListener("submit", event => {
    if (xor([84, 94, 67, 104], input.value) !== "13379;.[,11") {
      event.preventDefault(); // prevent form submission (no page re-load)
    }
  });
};
