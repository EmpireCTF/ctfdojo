window.onload = () => {
  const form = document.getElementById("flag-form");

  function check(f, c) {
    a=new Uint8Array(1000),p=500,i=0,o="",
    f=f.split("").map(c=>c.charCodeAt(0));
    while(c[i]){({
      ">":(_=>p++),
      "<":(_=>p--),
      "+":(_=>a[p]++),
      "-":(_=>a[p]--),
      ".":(_=>o+=String.fromCharCode(a[p])),
      ",":(_=>a[p]=f.shift()),
      "[":(_=>{if(!a[p]){b=1;while(b){B=c[++i];if(B=="[")b++;if(B=="]")b--;}}}),
      "]":(_=>{b=1;while(b){B=c[--i];if(B=="[")b--;if(B=="]")b++;}i--;})
    })[c[i]]();i++;}
    return o;
  }

  const brain = ",>,>,>,>,++++>,--------->,+++++++++++++++++++++++++++++++++++"
  + "+++++++++++++>,>,----------------------------------------->,>,>,>,>,>,---"
  + ">,>,>,>,+++++++>,+++++++++++>,+++++++++++<<<<<<<<<<<<<<<<<<<<.>.>.>.>++++"
  + "+++++.>--.>+++++.>.>------------.>.>.>.>.>.>.>.>.>.>+.>+.>++++.";

  form.addEventListener("submit", event => {
    (check(document.getElementById("flag").value, brain) === "emp_rhet0ric_l1nguist")
    || event.preventDefault();
  });
};
