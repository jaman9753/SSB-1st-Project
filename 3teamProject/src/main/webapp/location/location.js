$(function() {
	
});
function selectLocation(url) {
	var location_id = $("[name=location_id]:checked").val();
	var member_id = $("#member_id").val();
	if(location_id!=null){
		location.href="./"+ url + "?location_id=" + location_id + "&member_id=" + member_id;
	}
}