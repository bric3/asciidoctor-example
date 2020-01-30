// Tocbot dynamic TOC, works with tocbot 3.0.2
// https://github.com/asciidoctor/asciidoctor/issues/699#issuecomment-321066006

var toctitle = document.getElementById('toctitle');
var path = window.location.pathname;
if (toctitle != null) {
    var oldtoc = toctitle.nextElementSibling;
    var newtoc = document.createElement('div');
    newtoc.setAttribute('id', 'tocbot');
    newtoc.setAttribute('class', 'js-toc desktop-toc');
    oldtoc.setAttribute('class', 'mobile-toc');
    oldtoc.parentNode.appendChild(newtoc);
    tocbot.init({
        contentSelector: '#content',
        headingSelector: 'h1, h2, h3, h4, h5, h6',
        positionFixedSelector: 'body',
        fixedSidebarOffset: 90,
        smoothScroll: false
    });
}