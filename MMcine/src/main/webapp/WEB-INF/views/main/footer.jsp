<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/footer.css" rel="stylesheet">
<script>
window.onload = function() {
	
	var aModal = document.getElementById('adminModal');
	var aBtn = document.getElementById("adminBtn");
	var aSpan = document.getElementsByClassName("adminClose")[0];                                          
	
	aBtn.onclick = function() {
		aModal.style.display = "block";
	}
	
	aSpan.onclick = function() {
		aModal.style.display = "none";
	}
	
}
</script>
</head>
<body>
	<div id="foot_wrap">
		<div id="foot_content">
			<div id="foot_left">
				<div id="foot_logo">
					<img id="foot_logo_img" src="${conPath }/img/logo2.png" alt="로고이미지">
				</div>
				<div id="foot_link">
					<ul>
						<li>
							<a href="#">맴버소개</a>
						</li>
						<li>
							<a href="#">회사소개</a>
						</li>
						<li>
							<a href="#">고객센터</a>
						</li>
						<li>
							<a href="#">오시는길</a>
						</li>
						<li>
							<span id="adminBtn">관리자로그인</span>
						</li>
						<c:if test="${empty SessionCustomer and not empty SessionAdmin }">
						<li>
							<a href="${conPath }/admin_join_view.do">관리자등록</a>
						</li>
						</c:if>
					</ul>
				</div>
				<div id="foot_addr">
					<span>서울특별시 종로구 삼일대로 17길 51 스타골드 빌딩 4층</span><br>
					<span>맴버명&nbsp;박현준 | 이승훈 | 김동석 | 심재열 | 오병욱</span>
				</div>
			</div>
			<div id="foot_right">
				<div id="foot_tel">
					<span id="foot_tel_ars">ARS</span>
					<span id="foot_tel_num">02-738-5001</span>
				</div>
				<div id="foot_copy">
					<span>Copyright 2018 by MegaMaxCinema All rights reserved</span>
				</div>
			</div>
		</div>		
	</div>
	<!-- 관리자모달 -->
	<div id="adminModal" class="adminModal">
	     <!-- Modal content -->
	  <div class="adminModal-content">
	       <span class="adminClose">&times;</span>                                                               
			 <div id="login_window">
				<div id="login_logo">
					<img src="${conPath }/img/logo2.png" alt="logo" id="logo_img">
					<span>관리자로그인</span>
				</div>
				<div id="login_form">
					<form action="${conPath }/alogin.do" method="post">
						<div id="login_input_id">
							<input type="text" name="aId" required="required" placeholder="아이디">
						</div>
						<div id="login_input_pw">
							<input type="password" name="aPw" required="required" placeholder="비밀번호">
						</div>
						<div id="login">
							<input type="submit" id="submit" value="로그인">
						</div>
					</form>
				</div>						
			</div> 	
	  </div>
	</div>
</body>
</html>