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
		<link href="${conPath }/css/movie.css" rel="stylesheet">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		
		<title>movieWriteForm</title>
	</head>
<body>
<jsp:include page="../main/headerNonNav.jsp" />
<div id="writeForm">
<form action="${conPath }/modifyNotice.do" method="POST" enctype="multipart/form-data" >
<input type="hidden" name="pageNum" value="${paging.currentPage }" />
<input type="hidden" name="nBoardNum" value="${noticeDetail.nBoardNum }" />
<input type="hidden" name="nBoardId" value="${SessionAdmin.aId }" />
<table>
	<tr>
		<th colspan="2"><h3>공지사항 수정 </h3></th>
	</tr>
	<tr>
		<td><h4>공지 제목</h4></td>
		<td><input type="text" name="nBoardTitle" value="${noticeDetail.nBoardTitle }" required="required"/></td>
	</tr>
	<tr>
		<td><h4>공지 내용</h4></td>
		<td>
			<textarea name="nBoardContent">${noticeDetail.nBoardContent }</textarea>
		</td>
	</tr>
	<tr>
		<td><h4>첨부파일 (10Mbyte)</h4></td>
		<td>
			<div id='view_area'></div>
			<input type="file" name="nBoardImgtemp" onchange="previewImage(this,'view_area');"  />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="center">
			<input type="submit" value="공지수정" />
			<input type="reset" value="재설정" />
			<input type="button" value="돌아가기" onclick="history.back()" />
		</td>
	</tr>
</table>
</form>
</div>	
<jsp:include page="../main/footer.jsp" />
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${conPath }/js/datepicker.js"></script> <!-- 데이터 픽커 -->
<script src="${conPath }/js/imagePreView.js" ></script> <!-- 이미지 첨부 프리뷰 -->
</html>