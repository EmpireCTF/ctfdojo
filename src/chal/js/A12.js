window.onload = () => {
  const form = document.getElementById("flag-form");

  function check(flag) {
    let alpha = "abcdefghijklmnopqrstuvwxyz_";
    emp_truth = true;
    function cycle(data, key) {
      let pos = 0;
      return data
        .split("")
        .map(c => {
          let ci = alpha.indexOf(c);
          let ki = alpha.indexOf(key[pos++ % key.length]);
          if (ci === -1 || ki === -1) throw ">:( angurry";
          return alpha[(ci + ki) % alpha.length]
        })
        .join("");
    }
    try {
      return window[cycle("flag", "_kaf")](cycle("aaaaorjbd", flag));
    } catch (err) {
      if (err[0] === ">") console.log(err);
      return false;
    }
  }

  form.addEventListener("submit", event => {
    check(document.getElementById("flag").value)
    || event.preventDefault();
  });
};
