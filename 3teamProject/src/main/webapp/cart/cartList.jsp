<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="./cart/cartListJS.js"></script>
</head>
<body>
	<form action="./Order.bo" method="post">
		<!-- 임시주소 -->
		<table border="1px solid black">
			<tr>
				<th><input type="checkbox" checked="checked" id="CheckAll"></th>
				<th>이미지주소</th>
				<th>제품ID</th>
				<th>제품 이름</th>
				<th>옵션</th>
				<th>장바구니 수량</th>
				<th>가격</th>
				<th></th>
			</tr>
			<c:forEach var="dto" items="${dtoArray }">
				<tr name="cart" value="${dto.cart_id }">
					<td><input type="checkbox" name="cart_id"
						value="${dto.cart_id }" checked="checked"></td>
					<td><img alt="제품이미지" src="${dto.item_img_main }"></td>
					<td name="item_id">${dto.item_id }</td>
					<td name="item_name">${dto.item_name }</td>
					<td name="options_value">${dto.options_value }</td>
					<td name="cart_quantity">${dto.cart_quantity }</td>
					<td name="options_price">${dto.options_price * dto.cart_quantity }</td>
					<!-- 반응형으로 만들기 -->
					<td><input type="button" value="변경" onclick="changeOption('${dto.cart_id}','${dto.item_id}');"></td>
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="주문">
	</form>
</body>
</html>
