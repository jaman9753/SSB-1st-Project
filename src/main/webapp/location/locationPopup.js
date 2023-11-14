function listPopup(member_id) {
	window.open("./locationPopup.lo?&member_id=" + member_id, "배송지", "width = 500, height = 500, top = 100, left = 200, location = no");
}
function insertPopup(member_id, location_id) {
	window.open("./locationInsert.lo?&member_id=" + member_id + "&location_id=" + location_id, "신규배송지", "width = 500, height = 500, top = 100, left = 200, location = no");
}
function updatePopup(member_id, location_id) {
	window.open("./locationInsert.lo?&member_id=" + member_id + "&location_id=" + location_id, "수정배송지", "width = 500, height = 500, top = 100, left = 200, location = no");
}

