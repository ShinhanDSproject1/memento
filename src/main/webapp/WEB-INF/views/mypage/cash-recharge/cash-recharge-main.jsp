<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<c:url var="cashImgPath" value="/resources/images/mypage/cash-recharge" />
<link rel="stylesheet" href="${cpath}/resources/css/mypage/cash-recharge/cash-recharge-main.css" />

 <section class="cash-recahrge">
    <div class="group-200">
      <div class="me">
        <span>
          <span class="me-span">me</span>
          <span class="me-span2">캐시충전</span>
        </span>
      </div>
      <div class="line-20"></div>
      <img class="me-mento-3" src="${cashImgPath}/title.png" />
    </div>
    <div class="group-422">
      <div class="group-166">
        <div class="rectangle-223"></div>
        <div class="_5-10">지금 충전하면 추가적립 5~10%를 드려요!</div>
        <div class="me2">me캐시는 모든 활동에 쓸 수 있어요!</div>
        <img class="image-18" src="${cashImgPath}/logo.png" />
      </div>
      <div class="frame-423">
        <div class="group-167" onclick="changeRectangleColor(event)">
          <div class="rectangle-224"></div>
          <img
            class="vuesax-linear-money-recive"
            src="${cashImgPath}/won.svg"
          />
          <div class="_5-000">5,000원</div>
          <div class="rectangle-225"></div>
          <div class="_250-5">
            <ul class="_250-5-span">
              <li>추가 캐시 250원 제공(5%)</li>
            </ul>
          </div>
        </div>
        <div class="group-168" onclick="changeRectangleColor(event)">
          <div class="rectangle-2242"></div>
          <img
            class="vuesax-linear-money-recive2"
            src="${cashImgPath}/won.svg"
          />
          <div class="_10-000">10,000원</div>
          <div class="rectangle-2252"></div>
          <div class="_500-5">
            <ul class="_500-5-span">
              <li>추가 캐시 500원 제공(5%)</li>
            </ul>
          </div>
        </div>
        <div class="group-169" onclick="changeRectangleColor(event)">
          <div class="rectangle-2243"></div>
          <img
            class="vuesax-linear-money-recive3"
            src="${cashImgPath}/won.svg"
          />
          <div class="_30-000">30,000원</div>
          <div class="rectangle-2253"></div>
          <div class="_1-500-10">
            <ul class="_1-500-10-span">
              <li>추가 캐시 1,500원 제공(10%)</li>
            </ul>
          </div>
        </div>
        <div class="group-170" onclick="changeRectangleColor(event)">
          <div class="rectangle-2244"></div>
          <img
            class="vuesax-linear-money-recive4"
            src="${cashImgPath}/won.svg"
          />
          <div class="_50-000">50,000원</div>
          <div class="rectangle-2254"></div>
          <div class="_5-000-10">
            <ul class="_5-000-10-span">
              <li>추가 캐시 5,000원 제공(10%)</li>
            </ul>
          </div>
        </div>
        <div class="group-171" onclick="changeRectangleColor(event)">
          <div class="rectangle-2245"></div>
          <img
            class="vuesax-linear-money-recive5"
            src="${cashImgPath}/won.svg"
          />
          <div class="_100-000">100,000원</div>
          <div class="rectangle-2255"></div>
          <div class="_10-000-10">
            <ul class="_10-000-10-span">
              <li>추가 캐시 10,000원 제공(10%)</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="frame-4232">
        <div class="group-178">
          <div class="me3">
            <span>
              <span class="me-3-span">보유</span>
              <span class="me-3-span2">me</span>
              <span class="me-3-span">캐시</span>
            </span>
          </div>
          <div class="_0">0원</div>
          <div class="line-21"></div>
        </div>
        <div class="group-165">
          <div class="button"></div>
          <div class="group-164">
            <div class="me4">현재 보유 me캐시</div>
            <div class="_02">0원</div>
            <div class="_5000">5000원</div>
            <div class="_5250">5250원</div>
            <div class="_250">250원</div>
            <div class="_03">0원</div>
            <div class="div">충전 금액</div>
            <div class="me5">추가 적립 me캐시</div>
            <div class="me6">이벤트 me캐시</div>
            <div class="me7">충전중인 총 me캐시</div>
            <div class="line-26"></div>
          </div>
        </div>
        <div class="group-175">
          <div class="div2">위 내용을 확인하였으며 결제에 대해 동의합니다.</div>
          <img
            class="vuesax-linear-arrow-circle-down"
            src="${cashImgPath}/check.svg"
          />
        </div>
        <div class="group-173">
          <div class="rectangle-226"></div>
          <div class="me8" onclick="changeButtonColor(event)">
            <span>
              <span class="me-8-span">me</span>
              <span class="me-8-span2">캐시 충전하기</span>
            </span>
          </div>
        </div>
      </div>
      <div class="frame-177">
        <div class="div3">꼭 확인해주세요</div>
        <div class="rectangle-227"></div>
        <div
          class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me"
        >
          <span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
              me캐시란?
              <br />
            </span>
            <ul
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span2"
            >
              <li>
                한 번 충전하면 손쉽게 사용 가능한 ‘me:mento만의 간편한 결제
                수단’입니다.
              </li>
              <li>충전한 me캐시는 me:mento에서만 사용할 수 있습니다.</li>
            </ul>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span3"
            >
              <br />
              <br />
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
              사용 순서
              <br />
            </span>
            <ul
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span2"
            >
              <li>
                이벤트me캐시 &gt; 추가적립me캐시 &gt; 충전me캐시 순서로
                사용됩니다.
              </li>
            </ul>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span3"
            >
              <br />
              <br />
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
              충전 취소 및 환불
              <br />
            </span>
            <ul
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span2"
            >
              <li>
                충전 후 한 번도 사용하지 않은 경우, 결제수단에 따라 충전일로부터
                7일 이내에 [me캐시충전&gt;충전/사용내역]에서 직접 결제취소 하실 수
                있습니다.
              </li>
              <li>
                충전일로부터 7일이 경과 한 후 충전취소와 예치금환불은 고객센터로
                문의 주시기 바랍니다.
              </li>
              <li>
                단, iOS앱에서 충전한 me캐시의 취소는 애플 정책에 따라 애플
                고객센터(080-333-4000)를 통해서만 가능합니다.
              </li>
              <li>
                단, Google Play로 충전한 me캐시는 구글 정책에 따라 결제 후 48시간
                이내에는 Google Play 고객센터를 통해, 48시간 이후에는 교보문고
                고객센터(
              </li>
            </ul>
            <ul
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span4"
            >
              <li>1:1 문의하기</li>
            </ul>
            <ul
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span2"
            >
              <li>)를 통해 취소할 수 있습니다.</li>
            </ul>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span3"
            >
              ※
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
              me캐시의 상세 안내 내용은 
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span5"
            >
              이용안내
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
               및 
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span5"
            >
              이용약관
            </span>
            <span
              class="me-me-mento-me-me-mento-me-me-me-7-me-7-i-os-me-080-333-4000-google-play-me-48-google-play-48-1-1-me-span"
            >
               페이지에서 확인해주세요.
            </span>
          </span>
        </div>
      </div>
    </div>
  </section>
  
    <script src="${cpath}/resources/js/mypage/cash-recharge/cash-recharge-main.js"></script>