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
		<title>movieDetail</title>
		<link rel="stylesheet" href="${conPath }/css/movie.css" />
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script src="${conPath }/js/starRating.js"></script>
		<script>
		$(document).ready(function(){ 
			$('.page span').click(function(){
				var movieCode = $('#movieCode').val();
				//alert($(this).html());
				var thisTd = $(this).html();
				$.ajax({
					url: '${conPath}/detailMovieComant.do',
					type: 'POST',
					data: 'movieCode='+movieCode+'&pageNum='+$(this).html(),
					datatype: 'html',
					success: function(data, status){
						$('#comantOut').html(data);
						$('.page span').each(function(idx, item){
							$(this).removeClass('selected');
							if(idx  == thisTd){							
								$(this).addClass('selected');
							}
						});
					}
				});			
			}); // 페이징 paging ajax
			
			$('#like').click(function(){
				var movieCode = $('#movieCode').val();
				
				if (${empty SessionCustomer}){
					swal('로그인 후 가능한 서비스 입니다.', '', 'error');
					return false;
				} else {
					location.href = '${conPath}/writeRecomm.do?movieCode='+movieCode+'&cusId='+'${SessionCustomer.cusId}';
				}
			}); //보고 싶어요 하기
			$('#unlike').click(function(){
				var movieCode = $('#movieCode').val();
				
				if (${empty SessionCustomer}){
					swal('로그인 후 가능한 서비스 입니다.', '', 'error');
					return false;
				} else {
					location.href = '${conPath}/updateRecomm.do?movieCode='+movieCode+'&cusId='+'${SessionCustomer.cusId}';
				}
			}); //보고 싶어요 삭제하기
			
			$('.deleteComant').each(function (idx, item) {
				$(this).click(function(){
					$('input[name=rCode]').each(function (idx2, item2){
						location.href = 'deleteComant.do?rCode=' + $(item2).val();
					});
				})
			}); // 코멘트 삭제 이벤트
			
		});
		</script>
	</head>
<body>
<div>
	<c:forEach var="i" begin="0" end="0">
	<div>
		<input type="hidden" id="movieCode" name="movieCode" value="${movieDetail[i].movieCode }" />
		<input type="hidden" name="mScore" value="0" />
	</div>
	</c:forEach>
	<div id="comantOut">
		<table>
			<tr>
				<c:if test="${empty movieComant }">
				<td colspan="2">
					<h2 class="center">
						<img class="noneContentImg" src="${conPath }/img/nocontent.png" alt="nocontent" />표시할 코멘트가 없습니다.
					</h2>
				</td>
				</c:if>
				<c:set var="j" value="1" />
				<c:forEach var="comant" items="${movieComant }" >
				<td>
					<div id="comantBlock">
						<img class="comantImg" src="${conPath }/customerPhoto/${comant.cusPhoto}" alt="nocontent" />
						<h2 class="comantId colorAquamarin">${comant.cusId }</h2>
						<p class="comantDate colorLightGray xs_size">등록일 <fmt:formatDate value="${comant.rRdate }" pattern="yyyy-MM-dd"/></p>
						<p class="comantTitle"><b>${comant.rTitle }</b></p>
						<p class="comantContent">${comant.rContent }</p>
						<c:if test="${SessionCustomer.cusId eq comant.cusId or not empty SessionAdmin }">
							<p class="comantDelete"><button class="deleteComant">삭제</button></p>
							<input type="hidden" name="rCode" value="${comant.rCode }">
						</c:if>
					</div>
				</td>
				<c:if test="${j % 2 == 0 }">
					<tr></tr>
				</c:if>
				<c:set var="j" value="${j + 1 }" />
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
</body>
</html>