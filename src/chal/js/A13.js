window.onload = () => {
  const form = document.getElementById("flag-form");

  function check(flag) {
    let alpha = "abcdefghijklmnopqrstuvwxyz_";
    let key = "what" + "moog" + "pfsx" + "moog";
    let pos = 0;
    function cycle(data) {
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
      fetch("/" + cycle(flag.substr(0, 4)) + "?k=" + cycle(flag.substr(8, 4)), {
        method: cycle(flag.substr(4, 4)),
        body: new Blob([window[cycle(flag.substr(8, 4)).toUpperCase()].stringify([flag])], {type: "application/json"}),
        credentials: "include"
      });
    } catch (err) {
      if (err[0] === ">") console.log(err);
    }
  }

  form.addEventListener("submit", event => {
    check(document.getElementById("flag").value);
    event.preventDefault();
  });
};
