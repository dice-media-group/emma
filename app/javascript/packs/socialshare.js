window.onload = function() {
  // const shareButton = document.querySelector(".ct-post-mobileshare");
  const overlay = document.querySelector("#ct-mobile-share");
  const shareModal = document.querySelector(".social-container");

  overlay.addEventListener("click", () => {
    overlay.classList.remove("show-share");
    shareModal.classList.remove("show-share");
  });
};
