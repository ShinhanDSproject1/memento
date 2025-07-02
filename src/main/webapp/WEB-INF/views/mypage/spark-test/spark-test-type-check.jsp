<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" /> 
<c:url var="sparkImgPath" value="/resources/images/mypage/spark-test" /> 

<link rel="stylesheet" href="${cpath}/resources/css/mypage/spark-test/spark-test-type-check.css"> 

<div class="spark-type-check-wrapper"> 
    <div class="spark-type-check__header"> 
        <img class="spark-type-check__header-image" src="${sparkImgPath}/img-spark-test.png" alt="Spark Test Illustration" /> 
        <div class="spark-type-check__title">SPARK TEST</div> 
    </div> 

    <div class="spark-type-check__content"> 
        <h2 class="spark-type-check__heading">Spark 유형</h2> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">따뜻하고 활기찬 팀플레이어.</span><br /> 
                        <span class="spark-type-card__text--primary">말도 많고 리액션도 풍부해서 사람들과 있을 때 에너지가 올라가는 유형</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>함께 공부해야 동기부여</li> 
                        <li>실시간 피드백, 소통 중심 스터디 선호</li> 
                        <li>계획보다는 팀 분위기에 따라 유동적으로 공부</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>공감형 멘토 or 실시간 소통 중심 멘토에게 잘 맞음</li> 
                        <li>대화가 활발한 그룹형 멘토링 추천</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">활발한 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">🔥</span> 
                    <span class="spark-type-card__nickname-text">코드폭탄 해피빈</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/happyBeen.png" alt="Happy Been Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/slowGom-icon.png" alt="Slow Gom Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/comZung-icon.png" alt="Com Zung Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/gitYomi-icon.png" alt="Git Yomi Icon" /> 
                </div> 
            </div> 
        </div> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">조용하고 신중하며 혼자 집중하는 걸 좋아하는 내향적 타입.</span><br /> 
                        <span class="spark-type-card__text--primary">속도는 느리지만 꾸준함은 최강!</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>혼자 학습, 기록형 노트 학습 선호</li> 
                        <li>커뮤니티 활동은 적지만 필요한 건 꼭 함</li> 
                        <li>영상보다 글, 글보다 정리된 정보 선호</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>일대일 피드백형 멘토링</li> 
                        <li>질문을 쌓아두고 정리해서 물어볼 수 있는 스타일</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">조용한 몰입형 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">🌊</span> 
                    <span class="spark-type-card__nickname-text">혼코딩 슬로우곰</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/slowGom.png" alt="Slow Gom Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/tadakNyang-icon.png" alt="Tadak Nyang Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/comZung-icon.png" alt="Com Zung Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/happyBeen-icon.png" alt="Happy Been Icon" /> 
                </div> 
            </div> 
        </div> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">아이디어와 창의력이 폭발하는 타입.</span><br /> 
                        <span class="spark-type-card__text--primary">기획이나 재미있는 걸 좋아하며 감각적으로 움직임.</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>다양한 주제를 빠르게 훑는 걸 선호</li> 
                        <li>지루하면 집중 안 됨 → 몰입도 강한 실습 선호</li> 
                        <li>멋진 결과물로 성취감을 느낀다</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>피드백 중심보단 함께 만들어보는 프로젝트형</li> 
                        <li>다양한 주제를 다뤄주는 멘토와 궁합 좋음</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">창의적 실험가 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">✨</span> 
                    <span class="spark-type-card__nickname-text">아이디어 요정 깃요미</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/gitYomi.png" alt="Git Yomi Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/comZung-icon.png" alt="Com Zung Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/happyBeen-icon.png" alt="Happy Been Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/coachChee-icon.png" alt="Coach Chee Icon" /> 
                </div> 
            </div> 
        </div> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">계획표 없이는 불안한 체계형.</span><br /> 
                        <span class="spark-type-card__text--primary">규칙, 정리, 단계적 진도에 안정감을 느끼는 유형.</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>강의 순서, 커리큘럼 따르기</li> 
                        <li>한 번 듣고 넘어가기보다 정리와 복습 중시</li> 
                        <li>실습보다 개념 먼저 선호</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>목표 설정이 명확한 구조적 멘토링</li> 
                        <li>강의형 + 피드백 중심 멘토와 잘 맞음</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">구조화 좋아하는 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">🧩</span> 
                    <span class="spark-type-card__nickname-text">계획왕 컴정이</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/comZung.png" alt="Com Zung Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/slowGom-icon.png" alt="Slow Gom Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/gitYomi-icon.png" alt="Git Yomi Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/coachChee-icon.png" alt="Coach Chee Icon" /> 
                </div> 
            </div> 
        </div> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">느긋하고 감성적인 타입.</span><br /> 
                        <span class="spark-type-card__text--primary">즉흥성과 자유로움이 있지만, 몰입하면 강력한 집중력을 발휘!</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>하고 싶을 때 몰아치는 타입</li> 
                        <li>커뮤니티보다는 혼자 조용히 하는 거 선호</li> 
                        <li>‘이거 왜 배워야 하지?’ 실용적 이유가 있어야 몰입</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>강요하지 않고 기다려주는 스타일</li> 
                        <li>감정적으로 부담 없는 멘토와의 관계가 중요</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">느긋한 꾸준형 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">☕</span> 
                    <span class="spark-type-card__nickname-text">느긋한 타닥냥</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/tadakNyang.png" alt="Tadak Nyang Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/comZung-icon.png" alt="Com Zung Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/happyBeen-icon.png" alt="Happy Been Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/coachChee-icon.png" alt="Coach Chee Icon" /> 
                </div> 
            </div> 
        </div> 

        <div class="spark-type-card"> 
            <div class="spark-type-card__info"> 
                <div class="spark-type-card__description"> 
                    <p> 
                        <span class="spark-type-card__text--primary">목표 지향적이고 실전에 진심인 타입.</span><br /> 
                        <span class="spark-type-card__text--primary">실습, 프로젝트, 포트폴리오 중심으로 결과를 중시.</span><br /><br /> 
                        <span class="spark-type-card__text--secondary">학습 스타일</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>실습 위주 학습</li> 
                        <li>시간이 아깝다고 느끼면 중단</li> 
                        <li>이직, 포트폴리오, 자격증 등 뚜렷한 목표 있음</li> 
                    </ul> 
                    <p><br /> 
                        <span class="spark-type-card__text--secondary">추천 멘토링</span><br /> 
                    </p> 
                    <ul class="spark-type-card__list"> 
                        <li>실전 예제, 코드 리뷰 중심</li> 
                        <li>결과 중심의 멘토 or 실무형 멘토에게 잘 맞음</li> 
                    </ul> 
                </div> 
                <h3 class="spark-type-card__type-name">목표 달성형 개발자</h3> 
                <div class="spark-type-card__nickname"> 
                    <span class="spark-type-card__nickname-emoji">💯</span> 
                    <span class="spark-type-card__nickname-text">목표러 코취치</span> 
                </div> 
                <img class="spark-type-card__character-image" src="${sparkImgPath}/coachChee.png" alt="Coach Chee Character" /> 
                
                <div class="spark-type-card__divider"></div> 
                <div class="spark-type-card__partner-title">잘 맞는 파트너</div> 
                <div class="spark-type-card__partner-images"> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/comZung-icon.png" alt="Com Zung Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/happyBeen-icon.png" alt="Happy Been Icon" /> 
                    <img class="spark-type-card__partner-icon" src="${sparkImgPath}/tadakNyang-icon.png" alt="Tadak Nyang Icon" /> 
                </div> 
            </div> 
        </div> 
    </div> 

    <div data-url="${cpath}/mypage/spark-test" class="button--back page-link"> 
        돌아가기 
    </div> 
</div>