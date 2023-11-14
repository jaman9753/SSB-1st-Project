<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="./location/locationPopup.js"></script>
</head>
<body>
	<input type="button" value="팝업" onclick="listPopup(1)">
	<input type="button" value="배송지 추가(팝업)" onclick="insertPopup(1,-1)">
	<input type="button" value="배송지 삭제(팝업)" onclick="updatePopup(1,7)">
</body>
</html>