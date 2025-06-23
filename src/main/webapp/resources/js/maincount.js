  function animateCountUp(el, target, duration = 2000) {
    let start = 0;
    let startTime = null;

    function update(timestamp) {
      if (!startTime) startTime = timestamp;
      const progress = timestamp - startTime;
      const rate = Math.min(progress / duration, 1);
      const current = Math.floor(rate * target);
      el.textContent = current.toLocaleString();

      if (rate < 1) {
        requestAnimationFrame(update);
      }
    }

    requestAnimationFrame(update);
  }

  // 요소가 화면에 보일 때 시작
  function handleCountUpOnScroll() {
    const items = document.querySelectorAll('.stat-value');
    const triggered = new Set();

    function checkVisible() {
      items.forEach((el, index) => {
        if (triggered.has(index)) return;

        const rect = el.getBoundingClientRect();
        if (rect.top < window.innerHeight && rect.bottom >= 0) {
          const count = parseInt(el.getAttribute('data-count'));
          animateCountUp(el, count);
          triggered.add(index);
        }
      });
    }

    window.addEventListener('scroll', checkVisible);
    window.addEventListener('load', checkVisible);
  }

  document.addEventListener('DOMContentLoaded', handleCountUpOnScroll);