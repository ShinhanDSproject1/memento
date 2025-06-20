<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<div class="sidebar">
	<div class="group-497">
		<div class="group-3780">
			<div class="group-75">
				<div class="group-4972">
					<img class="avatar-default"
						src="${cpath}/resources/images/mypage/sidebar/avatar-default0.svg" />
					<div class="frame-497">
						<img class="vuesax-linear-export"
							src="${cpath}/resources/images/mypage/sidebar/vuesax-linear-export0.svg" />
					</div>
				</div>
				<div class="div2">코딩하는 뭉뭉이</div>
				<div class="mento">mento</div>
				<div class="group-4973">
					<div class="group-4974">
						<div class="cash">Cash :</div>
						<div class="_53-000">53,000</div>
					</div>
					<div class="group-4975">
						<div class="point">
							<span> <span class="point-span">Point</span> <span
								class="point-span2">:</span>
							</span>
						</div>
						<div class="_530-p">530 P</div>
					</div>
				</div>
			</div>
			<div class="line-6"></div>
		</div>
	</div>
	<div class="frame-409">
		<div class="div3" onclick="location.href='page1'">
			<ul class="div-3-span">
				<li>대시보드</li>
			</ul>
		</div>
		<div class="div4" onclick="alert('준비중')">
			<ul class="div-4-span">
				<li>캐시 충전</li>
			</ul>
		</div>
		<div class="div5" onclick="location.href='page3'">
			<ul class="div-5-span">
				<li>결제내역</li>
			</ul>
		</div>
		<div class="spark-test" onclick="alert('준비중')">
			<ul class="spark-test-span">
				<li>Spark Test</li>
			</ul>
		</div>
		<div class="div6" onclick="alert('준비중')">
			<ul class="div-6-span">
				<li>멘토 자격시험</li>
			</ul>
		</div>
	</div>
</div>