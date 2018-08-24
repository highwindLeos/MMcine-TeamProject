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
				//alert(movieCode);
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
<c:if test="${empty movieDetail }">
<div>
	<h1 class="center">표시할 평가가 없습니다.</h1>
	<br />
</div>
</c:if>
<c:if test="${not empty movieDetail }">
<div id="movieDetail">
	<c:forEach var="i" begin="0" end="0">
	<table class="movieDetail">
		<tr>
			<td class="detailImg"><img class="detailImg" src="${conPath }/movieImg/${movieDetail[i].movieImg1 }" alt="${movieDetail[i].movieImg1 }" /></td>
			<td>
				<table class="movieDetail">
					<tr>
						<td><h2><i>[ ${movieDetail[i].movieName } ]</i></h2><br></td>
					</tr>
					<tr>
						<td><b>개봉일 : ${movieDetail[i].movieOpenDate }</b></td>
					</tr>
					<tr>
						<td><b>누적관객수</b> - <span class="score">${movieDetail[i].movieAccrue }명</span></td>
					</tr>
					<tr>
						<td><b>장르</b> - 
						<c:if test="${movieDetail[i].movieGener == 'A' }">액션</c:if>
						<c:if test="${movieDetail[i].movieGener == 'D' }">드라마</c:if>
						<c:if test="${movieDetail[i].movieGener == 'R' }">로맨스</c:if>
						<c:if test="${movieDetail[i].movieGener == 'C' }">코미디</c:if>
						<c:if test="${movieDetail[i].movieGener == 'F' }">판타지/SF</c:if>
						<c:if test="${movieDetail[i].movieGener == 'H' }">공포/호러</c:if>
						<c:if test="${movieDetail[i].movieGener == 'S' }">스릴러</c:if>
						<c:if test="${movieDetail[i].movieGener == 'W' }">전쟁</c:if>
						<c:if test="${movieDetail[i].movieGener == 'M' }">다큐멘터리</c:if>
						<br></td>
					</tr>
					<tr>
						<td>
							<b>영화 평가 총점</b> - <span class="score">${movieDetail[i].mScore }</span> Point <br />
							<b>영화 투표수</b> - <span class="score">${voteCnt }명</span> <br />
							<b>평점</b> - <span class="score">
								<c:if test='${fn:substring(((((movieDetail[i].mScore) / voteCnt) * 100) / 100), 0, 4) == "NaN" }'>
									0
								</c:if>
								<c:if test='${fn:substring(((((movieDetail[i].mScore) / voteCnt) * 100) / 100), 0, 4) != "NaN" }'>
									${fn:substring(((((movieDetail[i].mScore) / voteCnt) * 100) / 100), 0, 4) }
								</c:if>
							</span><br />
							<b>보고싶어요</b> - <span class="score">${recommCnt }</span>
						</td>
					</tr>
					<tr>
						<td class="right">
							<c:if test="${movieRecomm == 0 }">
								<button id="like"><i class="far fa-heart"></i> 보고싶어요</button>
							</c:if>
							<c:if test="${movieRecomm == 1 }">
								<button id="unlike"><i class="fas fa-heart"></i> 보고싶어요 했음</button>
							</c:if>
							<button id="timetable" class="colorAquamarin">상영시간표</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<div>
		<h3>영화 줄거리</h3>  
		<p>${movieDetail[i].movieSummary }</p>
		<input type="hidden" id="movieCode" name="movieCode" value="${movieDetail[i].movieCode }" />
		<input type="hidden" name="mScore" value="0" />
	</div>
	<br />
	<br />
	<div id="slideDetail">
		<div>
			<img class="full_width slideDetail" src="${conPath }/movieImg/${movieDetail[i].movieImg1 }" alt="${movieDetail[i].movieImg1 }" />
		</div>
		<div>
			<img class="full_width slideDetail" src="${conPath }/movieImg/${movieDetail[i].movieImg2 }" alt="${movieDetail[i].movieImg2 }" />
		</div>
		<div>
			<img class="full_width slideDetail" src="${conPath }/movieImg/${movieDetail[i].movieImg3 }" alt="${movieDetail[i].movieImg3 }" />
		</div>
		<div>
			<img class="full_width slideDetail" src="${conPath }/movieImg/${movieDetail[i].movieImg4 }" alt="${movieDetail[i].movieImg4 }" />
		</div>
		<div>
			<img class="full_width slideDetail" src="${conPath }/movieImg/${movieDetail[i].movieImg5 }" alt="${movieDetail[i].movieImg5 }" />
		</div>
	</div>
	<div>
		<iframe class="full_width slideDetail" src="${movieDetail[i].movieVideo }" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>
	<c:if test="${not empty SessionCustomer }">
	<div id="comant">
		<form action="${conPath }/writeReview.do" method="POST" >
		<table>
			<tr>
				<td>
					<img src="${conPath }/customerPhoto/${SessionCustomer.cusPhoto }" alt="${SessionCustomer.cusPhoto }" />
				</td>
				<td>
					<span class="star-input">
					  <span class="input">
					    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
					    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
					    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
					    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
					    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
					    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
					    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
					    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
					    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
					    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
					  </span>
					  <output for="star-input"><b>0</b>점</output>
					</span>
				</td>
				<td>
					<input type="text" name="rTitle" placeholder="제목을 입력해주세요." required="required"/><br />
					<textarea name="rContent" placeholder="평가내용을 입력해주세요." required="required"></textarea>
					<input type="hidden" name="movieCode" value="${movieDetail[i].movieCode }" />
					<input type="hidden" name="mScore" value="0" />
				</td>
				<td>
					<input type="submit" value="입력" />
				</td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
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
	<%-- paging --%>
	<div class="page paging center">
		<c:if test="${paging.startPage > paging.blockSize}">
			<span class="center"><a href="${conPath }/detailMovie.do?pageNum=${paging.startPage - 1 }">◀</a></span>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				<span class="selected center">${i }</span>
			</c:if>
			<c:if test="${i != paging.currentPage }">
				<span class="center">${i }</span>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<span class="center"><a href="${conPath }/detailMovie.do?pageNum=${paging.endPage + 1 }">▶</a></span>
		</c:if>
	</div>
</div>
</c:if>
</body>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${conPath }/slick/slick.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#slideDetail').slick({
	  arrows : true,
	  dots : true,
	  autoplay : true
  });
});
</script>
</html>