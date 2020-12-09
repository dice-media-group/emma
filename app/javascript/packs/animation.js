
// animate moving 'text me' coin //
const coin      = document.querySelector(".coin");
// sectionOne .home-intro
const footer    = document.querySelector('footer');

const footerOptions     = {
        root: null, // Sets the framing element to the viewport
    rootMargin: "0px",
    threshold: 0.5
};
const footerObserver    = new IntersectionObserver(function(
    entries, 
    footerObserver
) {
    entries.forEach(entry => {
        console.log(entry.target);
      if (entry.isIntersecting){
        coin.classList.add("pushed_to_right");
      }else{
        coin.classList.remove("pushed_to_right")
      }
    })
}, footerOptions)

footerObserver.observe(footer);


