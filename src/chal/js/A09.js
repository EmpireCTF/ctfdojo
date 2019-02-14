window.onload = () => {
  const form = document.getElementById("flag-form");

  function check(f) {
    if(f.length!==14)return false;f=f.split("");
    let p=0,s=(i,m)=>{p=(p+i)%f.length;return f.splice(p,1)[0]===m;};
    
    return s(4,"b")        &&s(3,"_")&&s(4,"s")
         &&s(3,"_")    &&s(5,"_")        &&s(3,"p")
         &&s(4,"o")       &&s(3,"4")
         &&s(3,"j")               &&s(2,"c")
         &&s(3,"m")                      &&s(3,"k")
         &&s(4,"t")    &&s(2,"e")      &&!f.length;
     /***********/         /*******************/
  }

  form.addEventListener("submit", event => {
    (check(document.getElementById("flag").value))
    || event.preventDefault();
  });
};
