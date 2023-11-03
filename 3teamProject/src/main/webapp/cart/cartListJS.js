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