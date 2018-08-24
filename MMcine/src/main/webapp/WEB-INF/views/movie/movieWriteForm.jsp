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
<form action="${conPath }/writeMovie.do" method="POST" enctype="multipart/form-data" >
<table>
	<tr>
		<th colspan="2"><h3>영화 등록</h3></th>
	</tr>
	<tr>
		<td><h4>영화이름</h4></td>
		<td><input type="text" name="movieName" required="required"/></td>
	</tr>
	<tr>
		<td><h4>영화장르</h4></td>
		<td>
			<select name="movieGener">
				<option value="">--장르를 선택하세요--</option>
				<option value="A">액션</option>
				<option value="D">드라마</option>
				<option value="R">로맨스</option>
				<option value="C">코메디</option>
				<option value="F">판타지/SF</option>
				<option value="H">공포/호러</option>
				<option value="S">스릴러</option>
				<option value="W">전쟁</option>
				<option value="M">다큐멘터리</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><h4>영화개봉일</h4></td>
		<td>
			<input type="text" id="datepicker" name="movieOpenDate" />
		</td>
	</tr>
	<tr>
		<td><h4>영화설명(줄거리)</h4></td>
		<td>
			<textarea name="movieSummary"></textarea>
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
			<input type="text" name="movieVideo" required="required" />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="center">
			<input type="submit" value="입력" />
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