window.addEventListener('pagehide', () => {
  document.documentElement.style.visibility = 'hidden';
});
window.addEventListener('pageshow', event => {
  if (event.persisted) {
    document.documentElement.style.visibility = 'hidden';
    window.location.reload();
  } else {
    document.documentElement.style.visibility = '';
  }
});
