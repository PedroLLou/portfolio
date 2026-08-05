/* =========================================================
   Pedro Lourençoni Lima - portfólio
   Revelação da nav fixa. Sem dependências.

   A troca de idioma saiu daqui: cada idioma tem a própria URL
   e o seletor virou dois links. O que sobrou é uma coisa só.
   ========================================================= */
(function () {
  'use strict';

  var pillnav = document.getElementById('pillnav');
  var hero = document.getElementById('top');
  if (!pillnav || !hero) return;

  var visible = null;
  var trigger = 0;

  // Cacheado para o handler de scroll nunca tocar no layout.
  function measure() {
    trigger = hero.offsetHeight * 0.75;
  }

  // Aparece quando o hero já rolou quase todo.
  function sync() {
    var next = window.scrollY > trigger;
    if (next === visible) return;
    visible = next;
    pillnav.classList.toggle('is-visible', next);
  }

  function onResize() {
    measure();
    sync();
  }

  measure();
  sync();

  window.addEventListener('scroll', sync, { passive: true });
  window.addEventListener('resize', onResize, { passive: true });
  window.addEventListener('load', onResize);
})();
