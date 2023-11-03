alert(1);

window.addEventListener('DOMContentLoaded', function(){
	$("#checkAll").click(function() {
		if ($("#checkAll").is(":checked")) $("input[name=cart_id]").prop("checked", true);
		else $("input[name=cart_id]").prop("checked", false);
	});
});