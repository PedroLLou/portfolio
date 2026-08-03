/* =========================================================
   Pedro Lourençoni Lima - portfólio
   Language switch + sticky nav reveal. No dependencies.
   ========================================================= */
(function () {
  'use strict';

  var STORAGE_KEY = 'pl.lang';
  var LANGS = ['pt', 'en'];

  var root = document.documentElement;
  var buttons = document.querySelectorAll('[data-setlang]');
  var cvLink = document.getElementById('cv-link');

  var CV = {
    pt: 'uploads/curriculo-pt.pdf',
    en: 'uploads/curriculo-en.pdf'
  };

  // Each page declares its own titles on <html data-title-pt/-en>, so this
  // script works unchanged on the home page and on any case study.
  var TITLE = {
    pt: root.getAttribute('data-title-pt') || document.title,
    en: root.getAttribute('data-title-en') || document.title
  };

  /* ---------- language ---------------------------------- */

  function stored() {
    try {
      var v = localStorage.getItem(STORAGE_KEY);
      return LANGS.indexOf(v) > -1 ? v : null;
    } catch (e) {
      return null;
    }
  }

  function remember(lang) {
    try { localStorage.setItem(STORAGE_KEY, lang); } catch (e) { /* private mode */ }
  }

  function setLang(lang, persist) {
    if (LANGS.indexOf(lang) === -1) lang = 'pt';

    root.lang = lang;
    document.title = TITLE[lang];
    if (cvLink) cvLink.setAttribute('href', CV[lang]);

    for (var i = 0; i < buttons.length; i++) {
      var isActive = buttons[i].getAttribute('data-setlang') === lang;
      buttons[i].setAttribute('aria-pressed', isActive ? 'true' : 'false');
    }

    if (persist) remember(lang);
  }

  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', function () {
      setLang(this.getAttribute('data-setlang'), true);
    });
  }

  // Saved choice wins; otherwise fall back to the browser's language.
  var initial = stored();
  if (!initial) {
    var nav = (navigator.language || 'pt').toLowerCase();
    initial = nav.indexOf('pt') === 0 ? 'pt' : 'en';
  }
  setLang(initial, false);

  /* ---------- sticky nav reveal -------------------------- */

  var pillnav = document.getElementById('pillnav');
  var hero = document.getElementById('top');

  if (pillnav && hero) {
    var visible = null;
    var trigger = 0;

    // Cached so the scroll handler never touches layout.
    function measure() {
      trigger = hero.offsetHeight * 0.75;
    }

    // Reveal once the hero has mostly scrolled past.
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
  }
})();
