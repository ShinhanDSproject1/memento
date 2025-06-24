<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keepgoing-member</title>
</head>
<body>
    <section class="modal-mock-up">
        <section class="detail_info">
            <div class="logo-name">
                <div class="logo"><img src="${cpath}/resources/images/nunnu_icon.webp"></div>
                <div class="name">눈누입니다</div>
                <div class="studyinfo">
                    <span class="studytype">코드폭탄 해피빈</span>
                    <i class="fa-solid fa-circle graydot"></i>
                    <span class="language">JAVA</span>
                </div>
            </div>
            <div class="info">
                <div class="members">
                    <i class="fa-regular fa-user"></i>
                    <span class="info-text">33</span>
                </div>
                <div class="leader">
                    <i class="fa-solid fa-crown"></i>
                    <span class="info-text">눈누</span>
                </div>
                <div class="price">
                    <i class="fa-solid fa-coins"></i>
                    <span class="info-text">10000</span>
                </div>
            </div>
            <div class="study-style">
                <canvas id="myChart"></canvas>
            </div>

            <div class="location-img">
                <img src="${cpath}/resources/images/location.png">
            </div>
            <div class="location-text">
                <i class="fa-solid fa-location-dot"></i>
                <span>서울 마포구 월드컵북로4길 65 1층</span>
            </div>
        </section>
        <section class="main">
            <div id="dynamicKeepgoing">
                <div class="activity-img">
                    <img src="${cpath}/resources/images/study_img.jpg">
                </div>
                <div class="keepgoing-chat">
                    <div class="chatservice">
                        <div class="chat-title">눈누입니다 채팅방</div>
                        <div class="chat-context">
                            <div id="chat" class="chat">
                                <div class="others">
                                    <img src="${cpath}/resources/images/aa.png">
                                    <span class="chat-message">안녕하세요</span>
                                </div>
                                <div class="mychat">
                                    <span class="chat-message">안녕하세요</span>
                                    <img src="${cpath}/resources/images/nunnu_icon.webp">
                                </div>
                            </div>
                            <div class="message-input-box">
                                <textarea id="messageValue" placeholder="메세지를 입력하세요."></textarea>
                                <div class="message-buttons">
                                    <div class="message-services">
                                        <button><i class="fa-regular fa-image" style="color: #74C0FC;"></i></button>
                                        <button><i class="fa-solid fa-file-arrow-up" style="color: #63E6BE;"></i></button>
                                        <button type="button" id="emojiBtn"><i class="fa-regular fa-face-smile" style="color: #FFD43B;"></i></button>
                                    </div>
                                    <div class="send-close">
                                        <button type="button" id="resetBtn"><i class="fa-solid fa-circle-xmark"></i></button>

                                        <button id="sendBtn"><i class="fa-solid fa-paper-plane"></i></button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-buttons">
                        <div class="member-buttons">
                            <button id="memberListBtn">팀원 목록보기</button>
                            <button id="payBtn">회비 결제하기</button>
                            <button id="leaveBtn">탈퇴하기</button>
                            <button id="updateBtn">수정하기</button>
                            <button id="deleteBtn">삭제하기</button>
                    </div>

                </div>
            </div>
        </section>
    </section>
</body>
</html>