document.addEventListener('turbolinks:load', function() {
   
  const btnTopo = document.getElementById('btn-topo');   

  if (btnTopo) { // só se existir
    window.addEventListener("scroll", function () {
      if (window.scrollY > 300) {
        btnTopo.style.display = "block";
        setTimeout(() => {
          btnTopo.style.opacity = "1";
          btnTopo.style.transform = "translateY(0)";
        }, 10);
      } else {
        btnTopo.style.opacity = "0";
        btnTopo.style.transform = "translateY(20px)";
        setTimeout(() => {
          btnTopo.style.display = "none";
        }, 400);
      }
    });

    btnTopo.addEventListener("click", function (e) {
      e.preventDefault();
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
    });
  }

  // Efeito de rolagem suave para links internos
  document.querySelectorAll('a[href^="#"]').forEach(link => {
    link.addEventListener("click", function (e) {
      const href = this.getAttribute("href");
      if (href.length > 1) { // Só tenta scrollar se o href não for apenas "#"
        const destino = document.querySelector(href);
        if (destino) {
          e.preventDefault();
          destino.scrollIntoView({ behavior: "smooth" });
        }
      }
    });
  }); 

});

// Função Botão Topo
document.addEventListener("DOMContentLoaded", () => {
  const btn = document.getElementById("btn-topo");
  window.addEventListener("scroll", () => {
    if (window.scrollY > 200) {
      btn.classList.add("show");
    } else {
      btn.classList.remove("show");
    }
  });
});

