window.onload = () => {
  const form = document.getElementById("flag-form");

function welcome2The(V)/*MazeScript!*/{
f=/*+lAu*/V["s"/*>vWW.*/+"plit"]("");a=
m=/*. o+..F..<   y.HH.*/`${welcome2The}`
    ./*a hax r A.+<YY.*/split("\n");x =
21/*.Ff+.....+./*_*/;.0;g=u=i=0;v=1;for
(;/*.*/a&&"  z   . ??."&&i++< 100;){x+=
u/* .  +....m+...<..a+o...v*/;g+=v;if(x
<0||g<0||-x>=i||x>36+u||10.0<g)return 0
/*..+.......n+o*/;({".":/*.*/()=>{},"<"
:()=>{u=-/*..c.......<....<*/1;v=0},">"
:()=>{u=1;v=0?1337:0},"^":()=>{v=-1;u=0
},"v":()=>{v=1;u=0},"+":()=>{for(r of[0
,1])for(o of[[0,-1],[1,0],[0,1],[-1,0]]
)if(m[g+o[1]][x+o[0]]===(r?".":f[0])){[
u,v]=o;x+=u;g+=v;r||f.shift();return;}}
,"A":()=>{x=15;g=3},"?":()=>{i+=100}})[
m[g][x]]();}return!f.length&&i===169.;}

  form.addEventListener("submit", event => {
    let flag = document.getElementById("flag").value;
    try {
      (flag.substr(0, 4) === "emp_" && (welcome2The(flag.substr(4))))
      || event.preventDefault();
    } catch (err) {
      event.preventDefault();
    }
  });
};
