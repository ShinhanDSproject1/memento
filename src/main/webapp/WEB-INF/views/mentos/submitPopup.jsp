<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- submitPopup.jsp -->
<style>
  #submitPopup:checked ~ #submitLayer {
    display: flex;
  }

  .popup-layer {
  /*   display: none; */
  }
</style>

<!-- 팝업 트리거 -->
<input type="checkbox" id="submitPopup" style="display: none;" />

<!-- 팝업 내용 -->
<div class="popup-layer" id="submitLayer">
  <div class="rectangle-294">
    <div class="frame-3783">
      <div class="emoji">👍</div>
      <div class="popup-title">멘토스가 성공적으로 개설되었습니다</div>
      <div class="confirm-btn-box">
        <label for="submitPopup" class="confirm-btn">확인</label>
      </div>
    </div>
  </div>
</div>
