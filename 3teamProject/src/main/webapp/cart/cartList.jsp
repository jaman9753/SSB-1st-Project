<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="./cart/cartListJS.js"></script>
=======
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
>>>>>>> parent of e5478b5 (20231102)
</head>
<body>
	<form action="./Order.bo" method="post">
		<!-- 임시주소 -->
		<table border="1px solid black">
			<tr>
<<<<<<< HEAD
				<th><input type="checkbox" checked="checked" id="CheckAll"></th>
				<th>이미지주소</th>
				<th>제품ID</th>
				<th>제품 이름</th>
				<th>옵션</th>
				<th>장바구니 수량</th>
				<th>가격</th>
				<th></th>
=======
				<td><input type="checkbox" checked="checked" id="checkAll" ></td>
				<td>이미지주소</td>
				<td>제품ID</td>
				<td>제품 이름</td>
				<td>옵션</td>
				<td>장바구니 수량</td>
				<td>가격</td>
>>>>>>> parent of e5478b5 (20231102)
			</tr>
			<c:forEach var="dto" items="${dtoArray }">
				<tr name="cart" value="${dto.cart_id }">
					<td><input type="checkbox" name="cart_id"
						value="${dto.cart_id }" checked="checked"></td>
<<<<<<< HEAD
					<td><img alt="제품이미지" src="${dto.item_img_main }"></td>
					<td name="item_id">${dto.item_id }</td>
					<td name="item_name">${dto.item_name }</td>
					<td name="options_value">${dto.options_value }</td>
					<td name="cart_quantity">${dto.cart_quantity }</td>
					<td name="options_price">${dto.options_price * dto.cart_quantity }</td>
					<td><input type="button" value="변경"
						onclick="changeOption('${dto.cart_id}','${dto.item_id}');"></td>
=======
					<!-- 체크박스 전체 선택/해제 만들기 -->
					<td><img alt="제품이미지" src="${dto.item_img_server }"></td>
					<td>${dto.item_id }</td>
					<td>${dto.item_name }</td>
					<td><select name="options">
							<option hidden>${dto.options_name }
							<option value="${dto.options_id}">${dto.options_value }
								${dto.options_quantity } 개
					</select></td>
					<td><select name="cart_quantity">
							<option hidden>${dto.cart_quantity }
								<c:forEach begin="1" end="10" step="1" var="i">
									<option value="${i }"
										<c:if test="${dto.cart_quantity eq i }">selected="selected"</c:if>>${i }
								</c:forEach>
					</select></td>
					<td>${dto.options_price * dto.cart_quantity }</td>
>>>>>>> parent of e5478b5 (20231102)
					<!-- 반응형으로 만들기 -->
				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="주문">
	</form>
<script src="cartList.js"></script>
</body>
<<<<<<< HEAD
<script type="text/javascript">
	var path = window.location.pathname;
	alert(path);
	function changeOption(cart_id, item_id) {//제품ID받아오기
		$.ajax({
			type : "POST",
			url : "./cartAJAX.ca",
			dataType : "text",
			data : {
				"item_id" : item_id
			},
			error : function() {
				alert('통신실패!!');
			},
			success : function(data) {
				//alert('통신성공!!');
				var list = JSON.parse(data);//json 객체로 전환
				//객체를 사용해 웹에 뿌리기
				$("[name=cart][value=" + cart_id + "]>[name=options_value]")
						.text(list[0].options_id);
			}
		});
	}
</script>
=======
>>>>>>> parent of e5478b5 (20231102)
</html>
