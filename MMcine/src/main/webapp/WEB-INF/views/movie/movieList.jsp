<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="conPath" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="" rel="stylesheet">
		<title>movieList</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
			$(document).ready(function(){
				
				 $('.detail').each(function(idx, item){
					 $(this).click(function(){
						 $('.movieCode').each(function(idx2, item2){
							 if(idx == idx2){
								 $('#myModal2').css('display','block');
								 
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
				
				 
				$('.deleteMovie').each(function (idx, item) {
					$(this).click(function(){
						$('.movieCode').each(function (idx2, item2){
							if(idx == idx2){
								location.href = 'deleteMovie.do?movieCode=' + $(item2).val();
							}
						});
					})
				}); // 영화 삭제 이벤트
				
				$('.modifyMovie').each(function (idx, item) {
					$(this).click(function(){
						$('.movieCode').each(function (idx2, item2){
							if(idx == idx2){
								location.href = 'movieModifyForm.do?movieCode=' + $(item2).val();
							}
						});
					})
				}); // 영화 수정 이벤트
				
				
			}); 
		</script>
	</head>
<body>
<%-- 경고창 코드 --%>
<jsp:include page="../main/headerSubNav.jsp" />
<c:if test="${not empty writeReviewResult }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${writeReviewResult}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty deleteComantResult }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${deleteComantResult}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty writerecommResult }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${writerecommResult}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty updaterecommResult }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${updaterecommResult}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty resultMovieDelete }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${resultMovieDelete}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<div>
	<c:if test="${empty movieList }">
	<div>
		<h1 id="noneMovie" class="center" >표시할 영화가 없습니다.</h1>
	</div>
	</c:if>
	<table id="movieCard">
		<tr>
			<c:set var="i" value="1" />
			<c:forEach var="movie" items="${movieList }">
			<td class="center">
				<div class="movieCard">
					<img class="poster" src="${conPath }/movieImg/${movie.movieImg1 }" alt="${movie.movieImg1 }" /><br />
					<c:if test="${i <= 10 }">
						<span class="number">${i}</span>
					</c:if>
					<h3 class="left">&nbsp;&nbsp; ${movie.movieName }</h3>
					<p class="left xs_size">&nbsp;&nbsp; 누적관객수 - ${movie.movieAccrue }</p>
					<button class="detail"><i class="fas fa-film"></i> 상세보기</button>
					<input type="hidden" class="movieCode" name="movieCode" value="${movie.movieCode }" />
					<input type="hidden" class="cusId" name="cusId" value="${SessionCustomer.cusId }" />
					<button class="reservation"><i class="fas fa-ticket-alt"></i> 예매하기</button>
					<c:if test="${not empty SessionAdmin }">
					<br />
					<button class="modifyMovie"><i class="fas fa-edit"></i> 영화수정</button>
					<button class="deleteMovie"><i class="fas fa-trash"></i> 영화삭제</button>
					</c:if>
				</div>
			</td>
			<c:if test="${i % 6 == 5 }">
			<tr></tr>
			</c:if>
			<c:set var="i" value="${i+1 }"/>
			</c:forEach>
		</tr>
	</table>
</div>
<div class="page paging center">
	<c:if test="${paging.startPage > paging.blockSize}">
		<span class="center"><a href="${conPath }/movieListPage.do?pageNum=${paging.startPage - 1 }">이전</a></span>
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage == i }"> 
			<span class="center"><b>${i }</b></span>
		</c:if>
		<c:if test="${paging.currentPage != i }">
			<span class="center"><a href="${conPath }/movieListPage.do?pageNum=${i }">${i }</a></span>
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage < paging.pageCnt }">
		<span class="center"><a href="${conPath }/movieListPage.do?pageNum=${paging.endPage + 1 }">다음</a></span>
	</c:if>
</div>
<!-- 상세보기 모달 -->
<div id="myModal2" class="modal2">
  <!-- Modal content -->
  <div class="modal-content2">
    <span class="close2">&times;</span>
    <div id="showMovie"></div>
  </div>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>