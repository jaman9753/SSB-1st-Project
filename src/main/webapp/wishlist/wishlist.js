$(function() {
	//위시리스트 감지
	var wishlistDiv = document.querySelectorAll("div.wishlist");
	$.ajax({
			type: "POST",
			url: "./getWishlist.aj",
			dataType: "text",
			data: {
				
			},
			error: function() {
				alert('통신실패!!');
			},
			success: function(data) {
				var item_idArr = JSON.parse(data);
				var value;
				for (let i = 0; i < wishlistDiv.length; i++) {
					value = wishlistDiv[i].getAttribute('value');
					item_idArr.find(function(element){
						if(element == value){
							$('div[value=' + value + ']').html("<img src='' alt='inserted'>");
						}
					});
				}
			}
		});
	//위시리스트 선택/해제
	$(".wishlist").click(function() {
		var item_id = $(this).attr("value");
		$.ajax({
			type: "POST",
			url: "./insertWishlist.aj",
			dataType: "text",
			context: this,
			data: {
				"item_id": item_id
			},
			error: function() {
				alert('통신실패!!');
			},
			success: function(data) {
				var input = data.replaceAll('"',"");
				if (input == "inserted") {
					html = "<img src='' alt='inserted'>";
				} else if (input == "deleted") {
					html = "<img src='' alt='deleted'>";
				} else {
					alert("실패");
				}
				$(this).html(html);
				if (input == "inserted") {
					if (confirm("위시리스트 페이지로 이동하시겠습니까?") == true) {
						location.href = "./wishlist.wl";
					} else {
						return false;
					}
				}
			}
		});
	});
	
	//전체선택
	$("#checkAll").click(function() {//체크박스 전체선택/해제
		if ($("#checkAll").is(":checked")) $("input[name=wishlist_id]").prop("checked", true);
		else $("input[name=wishlist_id]").prop("checked", false);
	});
	$("input[name=wishlist_id]").click(function() {//체크박스 전체선택 감지
		var total = $("input[name=wishlist_id]").length;
		var checked = $("input[name=wishlist_id]:checked").length;
		if (total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);
	});
});
function deleteCart() {//장바구니 삭제
	arrayData();//선택된 체크박스값 추출
	var checkArray = $("#checkArray").val();
	//옵션 null값 체크
	if (checkArray == "") {
		alert("제품을 선택해 주십시오");
		return;
	}
	//AJAX
	$.ajax({
		type: "POST",
		url: "./insertWishlist.aj",
		dataType: "text",
		data: {
			"cart_id": checkArray
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			var result = JSON.parse(data);
			//옵션 삭제 결과
			if (result = 1) {
				alert("삭제완료");
			} else if (result = 0) {
				alert("삭제실패");
			} else {
				alert("알수없는 오류");
			}
			//페이지 새로고침
			location.reload();
		}
	});
}
function arrayData() {//배열 넘기기
	var checkArray = new Array();
	$("input:checkbox[name=wishlist_id]:checked").each(function() {
		checkArray.push(this.value);
	});
	$("#checkArray").val(checkArray);
}




//위시리스트 양식
//<div class="wishlist" value="item_id">
//	<img src="위시리스트이미지" alt="위시리스트">
//</div>
