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
		
		<title>movieModifyForm</title>
	</head>
<body>
<jsp:include page="../main/headerNonNav.jsp" />
<div id="writeForm">
<form action="${conPath }/modifyMovie.do" method="POST" enctype="multipart/form-data" >
<c:forEach var="i" begin="0" end="0">
<input type="hidden" name="movieCode" value="${movieDetail[i].movieCode }" >
<table>
	<tr>
		<th colspan="2"><h3>영화 수정</h3></th>
	</tr>
	<tr>
		<td><h4>영화이름</h4></td>
		<td><input type="text" name="movieName" value="${movieDetail[i].movieName }" required="required"/></td>
	</tr>
	<tr>
		<td><h4>영화장르</h4></td>
		<td>
			<select name="movieGener">
				<option value="">--장르를 선택하세요--</option>
				<option value="A" <c:if test="${movieDetail[i].movieGener == 'A'}">selected="selected"</c:if> >액션</option>
				<option value="D" <c:if test="${movieDetail[i].movieGener == 'D'}">selected="selected"</c:if> >드라마</option>
				<option value="R" <c:if test="${movieDetail[i].movieGener == 'R'}">selected="selected"</c:if>>로맨스</option>
				<option value="C" <c:if test="${movieDetail[i].movieGener == 'C'}">selected="selected"</c:if>>코메디</option>
				<option value="F" <c:if test="${movieDetail[i].movieGener == 'F'}">selected="selected"</c:if>>판타지/SF</option>
				<option value="H" <c:if test="${movieDetail[i].movieGener == 'H'}">selected="selected"</c:if>>공포/호러</option>
				<option value="S" <c:if test="${movieDetail[i].movieGener == 'S'}">selected="selected"</c:if>>스릴러</option>
				<option value="W" <c:if test="${movieDetail[i].movieGener == 'W'}">selected="selected"</c:if>>전쟁</option>
				<option value="M" <c:if test="${movieDetail[i].movieGener == 'M'}">selected="selected"</c:if>>다큐멘터리</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><h4>영화개봉일</h4></td>
		<td>
			<input type="text" id="datepicker" name="movieOpenDate" value="${movieDetail[i].movieOpenDate }" />
		</td>
	</tr>
	<tr>
		<td><h4>영화설명(줄거리)</h4></td>
		<td>
			<textarea name="movieSummary">${movieDetail[i].movieSummary }</textarea>
		</td>
	</tr>
	<tr>
		<td><h4>영화 대표사진 (필수)</h4></td>
		<td>
			<div id='view_area'></div>
			<input type="file" name="movieImg1temp" onchange="previewImage(this,'view_area');" required="required" />
		</td>
	</tr>
	<tr>
		<td><h4>영화 대표사진 2</h4></td>
		<td>
			<input type="file" name="movieImg2temp" />
		</td>
	</tr>
	<tr>
		<td><h4>영화 대표사진 3</h4></td>
		<td>
			<input type="file" name="movieImg3temp" />
		</td>
	</tr>
	<tr>
		<td><h4>영화 대표사진 4</h4></td>
		<td>
			<input type="file" name="movieImg4temp" />
		</td>
	</tr>
	<tr>
		<td><h4>영화 대표사진 5</h4></td>
		<td>
			<input type="file" name="movieImg5temp" />
		</td>
	</tr>
	<tr>
		<td><h4>영화 영상 (필수)</h4></td>
		<td>
			<input type="text" name="movieVideo" value="${movieDetail[i].movieVideo }" required="required" />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="center">
			<input type="submit" value="수정하기" />
			<input type="reset" value="재설정" />
			<input type="button" value="돌아가기" onclick="history.back()" />
		</td>
	</tr>
</table>
</c:forEach>
</form>
</div>	
<jsp:include page="../main/footer.jsp" />
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${conPath }/js/datepicker.js"></script> <!-- 데이터 픽커 -->
<script src="${conPath }/js/imagePreView.js" ></script> <!-- 이미지 첨부 프리뷰 -->
</html>