document.addEventListener("DOMContentLoaded", function () {
  const toggler = document.getElementById("menu-toggle");
  const wrapper = document.getElementById("wrapper");

  if (toggler && wrapper) {
    toggler.addEventListener("click", function (e) {
      e.preventDefault();
      wrapper.classList.toggle("toggled");
    });
  }
});
