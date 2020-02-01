const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.nav');
  console.log('it is loaded');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (window.innerHeight)) {
        navbar.classList.add('nav-opaque');
      } else {
        navbar.classList.remove('nav-opaque');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
