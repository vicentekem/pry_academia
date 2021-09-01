const nav = document.querySelector('.nav-container');
window.addEventListener('scroll', function() {
    nav.classList.toggle('active', window.scrollY>0)
})