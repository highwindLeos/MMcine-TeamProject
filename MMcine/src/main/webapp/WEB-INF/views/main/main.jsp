<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="" rel="stylesheet">
		<script></script>
		<title>Main</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
			$(document).ready(function(){
				$('.detail').each(function(idx, item){
					 $(this).click(function(){
						 $('.movieCode').each(function(idx2, item2){
							 if(idx == idx2){
								$('#myModal2').css('display', 'block');
								var sandData = 'movieCode='+$(this).val()+'&cusId='+'${SessionCustomer.cusId}';
								//alert(sandData);
								$.ajax({
									url : '${conPath}/detailMovie.do',
									type : 'post',
									data : sandData,
									dataType : 'html',
									success : function(data, status){
										$('#showMovie').html(data);
									},
									error : function(){
										$('#showMovie').html('');
									}
								});
							 }
					 	});	
					}); 
				 }); 
				
				$('.close2').click(function (){
					 $('#myModal2').css('display','none');
				}); //상세창 닫기 버튼
				 
				 $('.reservation').each(function(idx, item){
					 $(this).click(function(){
						 $('.movieCode').each(function(idx2, item2){
							 if(idx == idx2){
								location.href = '${conPath}/reservation.do?movieCode=';
							 } // if end
					 	});	
					 });
				 });
			}); 
		</script>
	</head>
<body>
<jsp:include page="header.jsp" />
<!-- movie -->
<div class="movie">
	<a class="btn" href="${conPath }/movieListPage.do">박스 오피스</a>
	<a class="btn" href="${conPath }/movieOpen.do">최근 개봉작</a>
	<a class="btn" href="${conPath }/movieExpected.do">개봉 예정작</a>
	<a class="btn" href="${conPath }/movieDatabase.do">영화 DB</a>
</div>
<div>
	<table id="movieCard">
		<tr>
			<c:set var="i" value="1" />
			<c:forEach var="movie" items="${movieList }">
			<td>
				<div class="movieCard center">
					<img class="poster" src="${conPath }/movieImg/${movie.movieImg1 }" alt="${movie.movieImg1 }" /><br />
					<span class="number">${i}</span><br />
					<h3 class="left">&nbsp;&nbsp; ${movie.movieName }</h3>
					<p class="left xs_size">&nbsp;&nbsp; 누적관객수 - ${movie.movieAccrue }</p>
					<button class="detail"><i class="fas fa-film"></i> 상세보기</button>
					<input type="hidden" class="movieCode" name="movieCode" value="${movie.movieCode }"/>
					<button class="reservation"><i class="fas fa-ticket-alt"></i> 예매하기</button>
				</div>
			</td>
			<c:set var="i" value="${i+1 }" />
			</c:forEach>
		</tr>
	</table>
</div>
<div id="event" class="backgroundWhite" >
	<div>
		<div class="first">
			<table class="boardList">
				<tr>
					<td colspan="2" class="colorWhite backgroundMain"><h3><i class="fas fa-clipboard-list"></i> 자유 게시판</h3></td>
				</tr>
				<tr>
					<td><b>순번</b></td>
					<td><b>제목</b></td>
				</tr>
			</table>
		</div>
		<div class="second">
			<table class="boardList">
				<tr>
					<td colspan="2" class="colorWhite backgroundAquamarin"><h3><i class="far fa-question-circle"></i> QnA 게시판</h3></td>
				</tr>
				<tr>
					<td><b>순번</b></td>
					<td><b>제목</b></td>
				</tr>
			</table>
		</div>
		<div class="third">
			<table class="boardList">
				<tr>
					<td colspan="2" class="colorWhite backgroundLightGray"><h3><i class="fas fa-exclamation-circle"></i> 공지 게시판</h3></td>
				</tr>
				<tr>
					<td><b>순번</b></td>
					<td><b>제목</b></td>
				</tr>
				<c:set var="i" value="1" />
				<c:forEach var="notice" items="${noticeNew }">
				<tr>
					<td>${i}</td>
					<td class="xs_size"><a href="${conPath }/notice.do">${notice.nBoardTitle }</a></td>
				</tr>
				<c:set var="i" value="${i = i + 1 }" />
				</c:forEach>
			</table>
		</div>
		<div class="clear"></div>
		<div class="banner">
			banner
		</div>
	</div>
</div>
<!-- 상세보기 모달 -->
<div id="myModal2" class="modal2">
  <!-- Modal content -->
  <div class="modal-content2">
    <span class="close2">&times;</span>
    <br />
    <div id="showMovie"></div>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>