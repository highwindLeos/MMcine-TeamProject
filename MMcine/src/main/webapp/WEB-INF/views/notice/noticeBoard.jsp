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
		<link href="${conPath }/css/board.css" rel="stylesheet">
		<script></script>
		<title>noticeBoard</title>
	</head>
<body>
<jsp:include page="../main/headerNonNav.jsp" />
<c:if test="${not empty writeResult }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${writeResult}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty modifyNotice }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${modifyNotice}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<c:if test="${not empty deleteNotice }">
<script>
swal({
	  position: 'top-end',
	  type: 'success',
	  title: '${deleteNotice}',
	  showConfirmButton: false,
	  timer: 1500
	})
</script>
</c:if>
<div>
<ul id="btn_board" class="right">
	<li><i class="fas fa-keyboard"></i> 자유 게시판</li>
	<li><i class="fas fa-question-circle"></i> QnA 게시판</li>
	<li><a href="${conPath }/notice.do"><i class="fas fa-exclamation-circle"></i> 공지 게시판</a></li>
</ul>
<table class="board_table">
	<tr>
		<th><h3 class="left"><img id="logo_img" src="${conPath }/img/logo.png" alt="logo" /> 공지게시판입니다</h3></th>
	</tr>
	<tr>
		<td>
			<div id="accordion">
			  <c:if test="${empty listNotice }">
			  	<h3>표시할 공지가 없습니다.</h3>
			  </c:if>
			  <c:if test="${not empty listNotice }">
				  <c:forEach var="notice" items="${listNotice }">
					  <h2 id="nBoardTitle">${notice.nBoardTitle }</h2>
					  <div>
					    <p>
					    	${notice.nBoardContent }
					    </p>
					    <br />
					    <hr />
					    <br />
					    <c:if test="${empty notice.nBoardImg }">
					    <p>
					    	첨부파일 : 첨부파일 없음
					    </p>
					    </c:if>
					    <c:if test="${not empty notice.nBoardImg }">
					    <p>
					    	첨부파일 : <a href="${conPath }/noticeFile/${notice.nBoardImg }">${notice.nBoardImg }</a>
					    </p>
					    </c:if>
					    <c:if test="${not empty SessionAdmin }">
					    <hr />
					    <p class="right">
					    	<button onclick="location.href = 'noticeModifyForm.do?pageNum=${paging.currentPage }&nBoardNum=${notice.nBoardNum }'"><i class="fas fa-edit"></i></button>
					    	<button onclick="location.href = 'deleteNotice.do?pageNum=${paging.currentPage }&nBoardNum=${notice.nBoardNum }'" ><i class="fas fa-trash-alt"></i></button>
					    </p>
					    </c:if>
					  </div>
				  </c:forEach>
			  </c:if>
			</div>
		</td>
	</tr>
	<c:if test="${not empty SessionAdmin }">
	<tr>
		<td class="right">
			<button onclick="location.href = '${conPath }/noticeWriteForm.do?pageNum=${paging.currentPage }'" >공지쓰기</button>
		</td>
	</tr>
	</c:if>
</table>
<div class="page paging center">
	<c:if test="${paging.startPage > paging.blockSize}">
		<span class="center"><a href="${conPath }/notice.do?pageNum=${paging.startPage - 1 }">이전</a></span>
	</c:if>	
	<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
		<c:if test="${paging.currentPage == i }"> 
			<span class="center"><b>${i }</b></span>
		</c:if>
		<c:if test="${paging.currentPage != i }">
			<span class="center"><a href="${conPath }/notice.do?pageNum=${i }">${i }</a></span>
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage < paging.pageCnt }">
		<span class="center"><a href="${conPath }/notice.do?pageNum=${paging.endPage + 1 }">다음</a></span>
	</c:if>
</div>
</div>
<jsp:include page="../main/footer.jsp" />
</body>
<script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
 </script>
</html>