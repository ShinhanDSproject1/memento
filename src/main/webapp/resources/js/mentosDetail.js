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


 