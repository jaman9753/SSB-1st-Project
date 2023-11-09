<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="./location/location.js"></script>
</head>
<body>
	<table border="1px solid black">
		<tr>
			<th>배송지ID</th>
			<th>수취인이름</th>
			<th>수취인전화번호</th>
			<th>배송지우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>배송지이름</th>
			<th>배송요청사항</th>
		</tr>
		<c:forEach var="dto" items="${dtoArray }">
			<tr>
				<td><input type="radio" name="location_id" value="${dto.location_id}"></td>
				<td>${dto.location_name}</td>
				<td>${dto.location_phone}</td>
				<td>${dto.location_postcode}</td>
				<td>${dto.location_add}</td>
				<td>${dto.locationD_add}</td>
				<td>${dto.location_title}</td>
				<td>${dto.location_requested}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" value="${dtoArray[0].member_id}" id="member_id">
	<input type="button" value="배송지 추가" onclick="location.href='./locationInsert.lo'">
	<input type="button" value="배송지 수정" onclick="selectLocation('locationReWrite.lo')">
	<input type="button" value="배송지 삭제" onclick="selectLocation('deleteLocation.lo')">
</body>
</html>