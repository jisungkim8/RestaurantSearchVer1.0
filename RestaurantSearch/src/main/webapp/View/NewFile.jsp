<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

    

    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>

<HEAD>

<TITLE> </TITLE>

</HEAD>

<script language="javascript">

 var count = 1;

 var addCount;

 

//���߰�

function addInputBox() {

 for(var i=1; i<=count; i++) {

  if(!document.getElementsByName("test"+i)[0]) {

   addCount = i;

   break;

  }

  else addCount = count;

 }




 var addStr = "<tr><td width=40><input type=checkbox name=checkList value="+addCount+" size=40 ></td><td width=140><input type=file name=test"+addCount+" size=40></td></tr>";

 var table = document.getElementById("dynamic_table");

 var newRow = table.insertRow();

 var newCell = newRow.insertCell();

 newCell.innerHTML = addStr;

 count++;

}

 

//�����

function subtractInputBox() {

 var table = document.getElementById("dynamic_table");

 //var max = document.gForm.checkList.length;

 //alert(max);

 var rows = dynamic_table.rows.length;

 var chk = 0;

 if(rows > 1){

  for (var i=0; i<document.gForm.checkList.length; i++) {

   if (document.gForm.checkList[i].checked == true) {

    table.deleteRow(i);

    i--;

    count--;

    chk++;

   }

  }

  if(chk <= 0){

   alert("������ ���� üũ�� �ּ���.");

  }

   }else{

    alert("���̻� ������ �� �����ϴ�.");

   }

}

 

function submitbutton() {

 var gform = document.gForm;

 gform.count.value = eval(count);

 //alert(count);

 gForm.submit();

 return;

}

</script>




<BODY -nLoad="addInputBox()">

<input type="button" value="�� �߰�" onclick="javascript:addInputBox();"> : <input type="button" value="�� ����" onclick="javascript:subtractInputBox();"><br><br>

<input type="button" value="����" onclick="javascript:submitbutton();">

<form name="gForm" action="upload.do" enctype="multipart/form-data" method="post" >

  <input type="hidden" name="count" >

   

<table  cellpadding=0 cellspacing=0 id="" border="1">

<tr>

 <td width="40">üũ</td>

 <td width="160">����</td>

</tr>

<tr>

<table cellpadding=0 cellspacing=0 id="dynamic_table" border="1">

</table>

</tr>

</table>

</form>




</BODY>

</HTML>


