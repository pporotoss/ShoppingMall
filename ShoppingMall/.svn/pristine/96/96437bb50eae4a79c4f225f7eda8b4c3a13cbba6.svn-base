
/* 숫자만 입력 여부 체크 */
function notNumber(num, tag){
	var flag = false;
	if(num == ""){
		alert("숫자만 입력해주세요.");
		tag.focus();
		flag = true;
	}else if(num < 0){
		alert("정수만 입력해주세요.");
		tag.focus();
		flag = true;
	}
	return flag;
}

/* 이미지 여부 체크 */
function chkExt(filename){
	var imgFlag = false;
	var ext = filename.substring(filename.lastIndexOf(".")+1);
	var imgList = ["jpg", "png", "gif", "jpeg"];
	
	for(var i = 0; i < imgList.length; i++){
		if(ext.toLowerCase() == imgList[i]){
			imgFlag = true;
		}
	}
	
	return imgFlag;
}