$(function(){
	$("#createId").click(function(){
		alert("클릭되었음");
		
		
		
	})
	
	
	
	
})

function loginCheck(){
	//document.폼객체명.입력양식객체명
	if(document.login.mem_id.value==""){
		alert("아이디를 입력해 주세요.");
		document.login.mem_id.focus();
		return; //return false;
	}
	if(document.login.mem_passwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.login.mem_passwd.focus();
		return;
	}
	
	//document.폼객체명.submit();
	document.login.submit();
}

//약관으로 이동
function memberReg(){
	document.location.href="agreement.jsp"	
}

//회원가입시 필수입력을 체크해주는 함수 -> jQuery
function inputCheck(){
	if(document.regForm.mem_id.value==""){
		alert("아이디를 입력해 주세요.");
		document.regForm.mem_id.focus();
		return;
	}
	if(document.regForm.mem_passwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regForm.mem_passwd.focus();
		return;
	}
	if(document.regForm.mem_repasswd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regForm.mem_repasswd.focus();
		return;
	}
	if(document.regForm.mem_name.value==""){
		alert("이름을 입력해 주세요.");
		document.regForm.mem_name.focus();
		return;
	}
	
	if(document.regForm.mem_email.value==""){
		alert("이메일을 입력해 주세요.");
		document.regForm.mem_email.focus();
		return;
	}
	if(document.regForm.mem_phone.value==""){
		alert("연락처를 입력해 주세요.");
		document.regForm.mem_phone.focus();
		return;
	}
	if(document.regForm.mem_job.value=="0"){
		alert("직업을 선택해 주세요.");
		document.regForm.mem_job.focus();
		return;
	}
	
	if(document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.mem_repasswd.focus();
		return;
	}
	//<input type="button"->RegisterProc.jsp로 이동
	document.regForm.submit();
}

//중복ID체크 해주는 자바스크립트 함수 선언
/*function idCheck(id){
	if(id==""){
		alert('아이디를 먼저 입력하세요.')
		document.regForm.mem_id.focus()//커서입력
	}else{
		url="IdCheck.jsp?mem_id="+id;   // request.getParameter("mem_id");
		window.open(url,"post","left=900, top=200, width=300, height=150");
	}
}*/

//닫기 클릭-> <a href="#" onclick="win_close()">닫기</a>
function win_close(){
	self.close();
}

//우편번호를 검색해주는 함수 선언
function zipCheck(){
	//check매개변수->창을 실행했을때 검색전 또는 검색 후를 구분하기 위한 인자
	url="ZipCheck.jsp?check=y";                      //검색전의 창의 모습
	//open(불러올 문서명,창제목,창의 옵션(width,height,left,top(위치)
	//scrollbars=yes|no,menubar,status(상태바)=yes)
	window.open(url,"post","toolbar=no,"+
			"scrollbars=yes,menubar=no,status=yes, " +
			"left=900,top=300,width=500,height=300")



}