// this function runs after the HTML is loaded:
window.onload = () => {
  // get references to elements
  const input = document.getElementById("flag")
       ,form = document.getElementById("flag-form");

  // when form is submitted:
  form.addEventListener("submit", event => {
    if (btoa(input.value) === "ZW1wX2phdmFfYzBtbWFfc2NyaXB0") {
      // ok, form will submit
    } else {
      event.preventDefault(); // prevent form submission (no page re-load)
    }
  });
};
