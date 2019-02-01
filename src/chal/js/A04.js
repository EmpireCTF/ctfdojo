window.onload = () => {
  const form = document.getElementById("flag-form");

  function xor(key, str) {
    let out = "";
    for (let i = 0; i < str.length; i++) {
      out += String.fromCharCode(str.charCodeAt(i) ^ key[i % key.length]);
    }
    return out;
  }

  form.addEventListener("submit", event => {
    eval(xor([1,3,3,7],"gob`/ubktf>:<fufm+{hs+X33/3\x7f51^+#L7L/_{73c_\x7f1g$@3vf[y32$_.Km]{3c]{2?s_{69A#kzY\"[y2a|X q[y2;Ad_{72c_\x7f10!.("))
    || event.preventDefault();
  });
};
