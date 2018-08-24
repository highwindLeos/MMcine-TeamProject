<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/header.css" rel="stylesheet">
<!-- slick thema -->
<link rel="stylesheet" type="text/css" href="${conPath }/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="${conPath }/slick/slick-theme.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.26.11/dist/sweetalert2.all.min.js"></script>
<script src="${conPath }/js/modal.js"></script>
<script>
	$(document).ready(function(){
		 var idx = 0;		
		 //로그인전
		$('#login_btn').click(function(){	
			if(idx==0){
				$('#login_window').css('display','block');	
				idx=1;
			}else if(idx==1){
				$('#login_window').css('display','none');	
				idx=0;
			}			
		});
		
		//사용자&관리자로그인후
		$('#loginAfter_btn').click(function(){	
			if(idx==0){
				$('#loginAfter_window').css('display','block');	
				idx=1;
			}else if(idx==1){
				$('#loginAfter_window').css('display','none');	
				idx=0;
			}			
		});
		
		// 영화 쓰기
		$('#movieWrite').click(function(){
			location.href = 'writeMovieForm.do';
		});

	});
</script>
</head>
<body>
<div id="head_wrap">
	<%-- 사용자로그인후 --%>
	<c:if test="${not empty SessionCustomer and empty SessionAdmin }">
	<div id="gnb_wrap">
		<div id="gnb">
			<div id="gnb_logo_div">
				<a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" alt="logo" id="logo_img"></a>
			</div>
			<ul>			
				<li><a href="${conPath }/movieListPage.do">영화</a></li>
				<li><a href="#">영화관</a></li>
				<li><a href="#">스토어</a></li>
				<li><a href="#">게시판</a>
					<div id="loginAfter_window">
						<form action="#" method="get">
							<div id="my_grade">
								<!-- 회원등급 조인해서 등급받아오기 -->
								<h3>${SessionCustomer.cusId}님 환영합니다.</h3>
								<p>${SessionCustomer.cusName }님의 고객등급은 <span
									<c:if test="${'NORMAL' eq SessionCustomer.cusGrade}">
										class="normal"
									</c:if>
									<c:if test="${'SILVER' eq SessionCustomer.cusGrade}">
										class="silver"
									</c:if>
									<c:if test="${'GOLD' eq SessionCustomer.cusGrade}">
										class="gold"
									</c:if>
									<c:if test="${'PLATINUM' eq SessionCustomer.cusGrade}">
										class="platinum"
									</c:if>
									<c:if test="${'VIP' eq SessionCustomer.cusGrade}">
										class="vip"
									</c:if>
									<c:if test="${'VVIP' eq SessionCustomer.cusGrade}">
										class="vvip"
									</c:if>
								>${SessionCustomer.cusGrade }</span> 입니다.</p>
								<p>할인율 : ${SessionCustomer.cusDiscount }%</p>
								
							</div>
							<div id="my_point">
								<p>${SessionCustomer.cusName }님 포인트 : ${SessionCustomer.cusPoint }p</p>
								<p>${SessionCustomer.cusName }님 구매누적금액 : ${SessionCustomer.cusSum }원</p>
							</div>
							<div id="all_info">
								<!-- 나의 메가맥스 -->
								<div id="my_info">
							    	<img src="${conPath }/customerPhoto/${SessionCustomer.cusPhoto }" alt="megamax" id="customer_photo1" onclick="location.href='${conPath }/main.do'"/>
							    	<p class="info_font" onclick="location.href='${conPath }/main.do'">나의 메가맥스</p> 
								</div>
								<!-- 예매현황 -->
								<div id="ticket_info">
									<img src="${conPath }/img/ticketImg.png" alt="ticketConfirm" id="customer_photo1" onclick="location.href='${conPath }/main.do'"/>
									<p class="info_font" onclick="location.href='${conPath }/main.do'">예매확인/취소</p> 
								</div>
								<!-- 스토어내역 -->
								<div id="store_info">
									<img src="${conPath }/img/storeImg.png" alt="storeHistory" id="customer_photo1" onclick="location.href='${conPath }/main.do'"/>
									<p class="info_font" onclick="location.href='${conPath }/main.do'">스토어 구매내역</p>
								</div>
							</div>
							<div id="logout_back">
								<%-- <input id="my_modify_btn" type="button" value="정보수정" onclick="location.href='${conPath}/modify_view.do'"> --%>
								<input id="logout_btn" type="button" value="로그아웃" onclick="location.href='${conPath}/logout.do'">								
							</div>	
						</form>
					</div>				
				</li>
				<li>
					<img src="${conPath }/customerPhoto/${SessionCustomer.cusPhoto }" alt="${SessionCustomer.cusPhoto }" id="customer_photo">
					<a href="#" id="loginAfter_btn">${SessionCustomer.cusName }님&nbsp;&nbsp;<img src="${conPath }/img/1.png" alt="infomation" /></a>
				</li>
			</ul>
		</div>
	</div>	
	</c:if>
	<%-- 관리자로그인후 --%>
	<c:if test="${empty SessionCustomer and not empty SessionAdmin }">
		<div id="gnb_wrap">
			<div id="gnb">
				<div id="gnb_logo_div">
					<a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" alt="logo" id="logo_img"></a>
				</div>
				<ul>			
					<li><a href="${conPath }/movieListPage.do">영화</a></li>
					<li><a href="#">영화관</a></li>
					<li><a href="#">스토어</a></li>
					<li><a href="#">게시판</a>
						<div id="loginAfter_window">
							<div id="loginAfter_form">
								<form action="#" method="get">
									<div id="#">
										<span id="movieWrite">영화등록</span>
									</div>
									<div id="#">
										
									</div>
									<div id="#">
										<hr>
									</div>
									
									<input id="logout_btn" type="button" value="로그아웃" onclick="location.href='${conPath}/logout.do'">
								</form>
							</div>						
						</div>	
					</li>
					<li><a href="#" id="loginAfter_btn">${SessionAdmin.aName }관리자님</a></li>
				</ul>
			</div>
		</div>	
	</c:if>
	<c:if test="${empty SessionCustomer and empty SessionAdmin }"><%-- 로그인전메뉴 --%>
		<div id="gnb_wrap">
			<div id="gnb">
				<div id="gnb_logo_div">
					<a href="${conPath }/main.do"><img src="${conPath }/img/logo.png" alt="logo" id="logo_img"></a>
				</div>
				<ul>			
					<li><a href="${conPath }/movieListPage.do">영화</a></li>
					<li><a href="#">영화관</a></li>
					<li><a href="#">스토어</a></li>
					<li>
						<a href="#">게시판</a>
						<%-- 로그인 모달 --%>
						<div id="login_window">
							<div id="login_logo">
								<img src="${conPath }/img/logo.png" alt="logo" id="logo_img">
								<span>로그인</span>
							</div>
							<div id="login_form">
								<form action="${conPath }/login.do" method="post">
									<div id="login_input_id">
										<input type="text" name="cusId" required="required" placeholder="아이디">
									</div>
									<div id="login_input_pw">
										<input type="password" name="cusPw" required="required" placeholder="비밀번호">
									</div>
									<div id="login">
										<input type="submit" value="로그인">
									</div>
									<input id="login_join_btn" type="button" value="회원가입" onclick="location.href='${conPath}/join_view.do'">
									<input id="login_search_btn" type="button" value="ID/PW찾기" onclick="location.href='${conPath}/findIDnPW.do'">
								</form>
							</div>						
						</div>
					</li>
					<li><a href="#" id="login_btn">로그인</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<div>
		<div id="slide">
			<c:forEach var="i" begin="1" end="4">
		    <div>
		    	<img class="slider" src="${conPath }/img/slide${i}.jpg" alt="img${i}">
		    </div>
		    </c:forEach>
		    <div>
		    	<iframe class="slider" src="https://www.youtube.com/embed/ZbLXW5mNdUY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>	
		    </div>
		</div><%-- 슬라이드 --%>
		<div id="snb_wrap">
			<div id="snb">
				<div id="snb_left">
					<div id="all_nav">
						<a href="#">전체메뉴</a>
					</div>
					<ul>						
						<li><a href="#">공지사항</a></li>
						<li><a href="#">오시는 길</a></li>
						<li><a href="#">주차장 안내</a></li>
					</ul>
				</div>
				<div id="snb_right">
					<a href="#">상영시간표</a>
				</div>
			</div>
		</div>		
	</div>
    <!-- The Modal -->
    <div id="myModal1" class="modal1"> 
      <!-- Modal content -->
      <div class="modal-content">
      	<div id="modal-content-left">
      		<h4>영화</h4>
      		<p><a href="${conPath }/movieOpen.do">최신 개봉작</a></p>
      		<p><a href="#">현재 상영작</a></p>
      		<p><a href="#">과거 상영작</a></p>
      		<p><a href="#">영화표 예매</a></p>
      		<p><a href="#">영화상영 시간표</a></p>
      		<h4>스토어</h4>
      		<p><a href="#">먹거리</a></p>		
      	</div>
      	<div id="modal-content-right">
      		<div class="close1">&times;</div>
      		<h4>영화관</h4>
      		<p><a href="#">영화관 소개</a></p>
      		<p><a href="#">오시는 길</a></p>
      		<p><a href="#">주차장 안내</a></p>
      		<h4>게시판</h4>
      		<p><a href="#">자유 게시판</a></p>
      		<p><a href="#">QnA 게시판</a></p>
      		<p><a href="${conPath }/notice.do">공지 게시판</a></p> 
      	</div>
      	<div id="modal-content-bottom">
      		<img src="${conPath }/img/menuAll.jpg" alt="menuAll.jpg" />
      	</div>
      </div> 
    </div>	
</div>
</body>
<script type="text/javascript" src="${conPath }/slick/slick.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#slide').slick({
	  arrows : true,
	  dots : true,
	  autoplay : true
  });
});
</script>
</html>