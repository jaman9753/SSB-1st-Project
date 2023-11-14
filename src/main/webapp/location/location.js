function selectLocation(url) {//수정,삭제
	var location_id = $("[name=location_id]:checked").val();//배송지ID 가져오기
	var member_id = $("#member_id").val();//회원ID 가져오기
	if (location_id != null) {//배송지ID가 있을 떄
		if (url == 'deleteLocation.lo' && !confirm("삭제하시겠습니까?")) {//삭제 시 재확인
			return false;
		}
		//페이지 이동
		location.href = "./" + url + "?location_id=" + location_id + "&member_id=" + member_id;
	} else {//배송지를 선택하지 않았을 떄
		alert("배송지를 선택해주세요");
	}
}
