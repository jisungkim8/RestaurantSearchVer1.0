<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body class = "bg-primary">
	<center>
		<h2 style="padding-bottom: 10px;"> 패스워드찾기</h2>
		<form action="pwdSearch.do" method="post">
		<div style='display:table-cell;vertical-align:middle'>
			<table width="500" border="4" class="table table-bordered">
				<tr class='success'>
					<td align="center" valign="middle" class='text-success' style="padding-top: 15px;">이메일</td>
					<td width="500"><input type="text" class="form-control" name="memberId" size="30" placeholder="이메일을 입력하세요."></td>
 				</tr>
 				<tr class='success'>
					<td align="center" width="170" class='text-success' style="padding-top: 15px;">생년월일</td>
					<td width="500"><input type="text" class="form-control" name="birthDate" size="50" placeholder="생년월일 숫자8자리를 입력하세요. ex) 20010101"></td>
 				</tr>
			<!-- 	<tr height="40">
					<td align="center" width="200">전화번호</td>
					<td width="300"><input type="text" name="phoneNum" size="30"></td>
 				</tr> -->
				<tr height="10" class='danger'>
					<td align="center" colspan="2"><input type="submit" class="btn btn-primary"
						value="패스워드찾기"></td>
				</tr>
			</table>
			</div>
		</form>
	</center>
	
	<c:if test="${pwdSearchCheck=='search' }">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;패스워드가 고객님의 이메일 계정으로 전송되었습니다.</h3><br>
	</c:if>
	<c:if test="${pwdSearchCheck=='notsearch' }">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정확하지 않은 계정과 생년월일입니다.</h3><br>
	</c:if>
</body>
</html>