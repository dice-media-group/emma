// animation will be available _after_ page has loaded
document.addEventListener("DOMContentLoaded", function() {
    // scroll to different parts of the page
    // scroll into 
    // https://github.com/iamdustan/smoothscroll
    // scroll from the menu button to the menu in the footer

    menuTarget = document.querySelector('.ct-nav-mobile');
    footerTarget = document.querySelector('#footer-menu');

    console.log(menuTarget);
    console.log(footerTarget);
    menuTarget.addEventListener('click', function(e) {
            e.preventDefault();
            footerTarget.scrollIntoView({ behavior: 'smooth' });
    });

});
