$(function() {
    var elemento = document.getElementById("header");
    $(window).scroll(function() {
      if ($(this).scrollTop() > 0) {
        elemento.classList.add('cambioColor');
      } else {
        elemento.classList.remove('cambioColor');
      }
    })
  });
