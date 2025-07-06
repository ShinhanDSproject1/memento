//1.좋아요 기능
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.like-heart-btn').forEach(function(btn){
    btn.addEventListener('click', function(e){
      e.preventDefault();
       e.stopPropagation();
      btn.classList.toggle('liked');
    });
  });
});


 // 2. 광고 슬라이드 기능
document.addEventListener('DOMContentLoaded', function(){
  const slides = document.querySelectorAll('.advertisement-slide');
  let now = 0;
  function show(idx) {
    slides.forEach((el, i) => el.classList.toggle('active', i === idx));
  }
  document.querySelector('.ad-prev').onclick = () => {
    now = (now-1+slides.length)%slides.length; show(now);
  };
  document.querySelector('.ad-next').onclick = () => {
    now = (now+1)%slides.length; show(now);
  };
  setInterval(() => {
    now = (now+1)%slides.length; show(now);
  }, 4000); // 4초마다 자동 넘김
  show(now); // 첫 장 보이기
});

