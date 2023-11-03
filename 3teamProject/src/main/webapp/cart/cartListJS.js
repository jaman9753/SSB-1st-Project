$(function() {
	$("#CheckAll").click(function() {
		if ($("#CheckAll").is(":checked")) $("input[name=cart_id]").prop("checked", true);
		else $("input[name=cart_id]").prop("checked", false);
	});

	$("input[name=cart_id]").click(function() {
		var total = $("input[name=cart_id]").length;
		var checked = $("input[name=cart_id]:checked").length;

		if (total != checked) $("#CheckAll").prop("checked", false);
		else $("#CheckAll").prop("checked", true);
	});
	
});
function changeOption(cart_id, item_id) {//제품ID받아오기 AJAX
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