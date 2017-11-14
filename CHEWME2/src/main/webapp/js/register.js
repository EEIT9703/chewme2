document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("memberId").onblur = chkId;
	document.getElementById("memName").onblur = chkname;
	document.getElementById("memNickN").onblur = chknickn;
	document.getElementById("memPwd").onblur = chkpwd;
	document.getElementById("memBirthday").onblur = chkbd;
	document.getElementById("memMail").onblur = chkmail;
	document.getElementById("memAddr").onblur = chkaddr;
	document.getElementById("memPhone").onblur = chkphone;
	document.getElementById("memIntr").onblur = chkintr;
})
function chkId() {
	var memberId = document.getElementById("memberId").value;
	if (memberId == "") {
		document.getElementById("idsp").innerHTML = "<img src='../CHEWME2/image/error.png' />帳號不可空白"
	} else {
		document.getElementById("idsp").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'><font color='green'>OK!</font></font>"
	}
}
function chkname() {
	var name = document.getElementById("memName").value;
	var nreg = /^[\u0800-\uFFFF]{2,}/
	if (name == "") {
		document.getElementById("name").innerHTML = "<img src='../CHEWME2/image/error.png' />姓名不可空白"
	} else if (name.length > 0) {
		if (nreg.test(name)) {
			document.getElementById("name").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
		} else {
			document.getElementById("name").innerHTML = "<img src='../CHEWME2/image/error.png' />請輸入中文姓名"
		}
	}
}
function chknickn() {
	var nickn = document.getElementById("memNickN").value;
	if (nickn == "") {
		document.getElementById("nickn").innerHTML = "<img src='../CHEWME2/image/error.png' />暱稱不可空白"
	} else {
		document.getElementById("nickn").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
function chkpwd() {
	var pwd = document.getElementById("memPwd").value;
	if (pwd == "") {
		document.getElementById("pwd").innerHTML = "<img src='../CHEWME2/image/error.png' />密碼不可空白"
	} else {
		document.getElementById("pwd").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
function chkbd() {
	var bd = document.getElementById("memBirthday").value;
	if (bd == "") {
		document.getElementById("bd").innerHTML = "<img src='../CHEWME2/image/error.png' />請填選生日"
	} else {
		document.getElementById("bd").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
function chkmail() {
	var mail = document.getElementById("memMail").value;
	var mailreg = /^([\w]+)(.[\w]+)*@([\w]+)(.[\w]{2,3}){1,2}$/;
	if (mail == "") {
		document.getElementById("mail").innerHTML = "<img src='../CHEWME2/image/error.png' />信箱不可空白"
	} else if (mail.length > 0) {
		if (mailreg.test(mail)) {
			document.getElementById("mail").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
		} else {
			document.getElementById("mail").innerHTML = "<img src='../CHEWME2/image/error.png' />信箱格式錯誤"
		}
	}
}
function chkaddr() {
	var addr = document.getElementById("memAddr").value;
	if (addr == "") {
		document.getElementById("addr").innerHTML = "<img src='../CHEWME2/image/error.png' />地址不可空白"
	} else {
		document.getElementById("addr").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
function chkphone() {
	var phone = document.getElementById("memPhone").value;
	if (phone == "") {
		document.getElementById("phone").innerHTML = "<img src='../CHEWME2/image/error.png' />電話不可空白"
	} else {
		document.getElementById("phone").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
function chkintr() {
	var intr = document.getElementById("memIntr").value;
	if (intr == "") {
		document.getElementById("intr").innerHTML = "<img src='../CHEWME2/image/error.png' />自我介紹不可空白"
	} else {
		document.getElementById("intr").innerHTML = "<img src='../CHEWME2/image/correct.png' /><font color='green'>OK!</font>"
	}
}
