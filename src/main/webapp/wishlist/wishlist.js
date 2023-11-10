$(function() {
	$(".wishlist").click(function() {
		
		$.ajax({
			type: "POST",
			url: "./insertWishlist.aj",
			dataType: "text",
			data: {
				"item_id": item_id,
				"member_id": member_id
			},
			error: function() {
				alert('통신실패!!');
			},
			success: function(data) {
				var html = $(this).html();
				if (data == "inserted") {
					html = "<img class='.wishlish' src='' alt='위시리스트'>";
					alert("inserted");
				} else if (data == "deleted") {
					html = "<img class='.wishlish' src='' alt='위시리스트'>";
					alert("deleted");
				} else {
					alert("실패");
				}
				$(this).html(html);
				if (data == "selected") {
					if (confirm("위시리스트 페이지로 이동하시겠습니까?") == true) {
						location.href = "./wishlist/wishlist.jsp";
					} else {
						return false;
					}
				}
			}
		});
	});
});
