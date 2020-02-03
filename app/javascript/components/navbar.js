const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.nvbr');
  console.log('it is loaded');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (window.innerHeight)) {
        navbar.classList.add('nvbr-opaque');
      } else {
        navbar.classList.remove('nvbr-opaque');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
