<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	function checkAll() {
		if ($("#th_checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}

	/* 삭제(체크박스된 것 전부) */
	function deleteAction() {
// 		alert("deleteAction")
		var checkRow = "";
		//checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기

		/* if (checkRow == '') {
			alert("삭제할 대상을 선택하세요.");
			return false;
		} */
		//console.log("### checkRow => {}" + checkRow); */

		if (confirm("회원(들)을 삭제 하시겠습니까?")) {

			$("input[name='checkRow']:checked").each(function() {
				checkRow = checkRow + $(this).val() + ",";
// 				alert("checkRow=>"+checkRow);
				$.ajax({
		    		url:'/RestaurantSearch/adminMemberDelete.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
		    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
		    		data:{"memberId":$(this).val()},
		    		type : "POST",
		    		//3.success:콜백함수명(매개변수)
		    		success:function(args){
		    			location.reload();
		    		}
		    	})//$.ajax
			});
		}
	}
</script>
<div class="row">
	<div class="col-lg-12">
		<div class="col-md-2">
			<span />
		</div>
		<div class="col-md-8">
			<h2>
				<strong>회원관리</strong> <small class="font300"></small>
			</h2>
		</div>
		<div class="col-md-2">
			<span />
		</div>
		<section class="panel">
			<header class="panel-heading">
				<div class="col-md-9">
					<span />
				</div>
				<div class="col-md-3">
					<span></span>
				</div>
			</header>
			<div class="col-md-2">
				<span />
			</div>
			<div class="col-md-8">
				<table class="table table-striped table-advance table-hover">
					<thead>
						<tr>
							<th width="5" style="text-align: center;"><input type="checkbox" name="checkAll" id="th_checkAll"
						onclick="checkAll();" /></th>
							<th>회원 이메일</th>
							<th>닉네임</th>
							<th>성별</th>
							<th>회원 등급</th>
						</tr>
					</thead>
					<c:if test="${count==0}">
						<tbody>
							<tr>
								<td align="center">등록된 회원이 없습니다.</td>
							</tr>
						</tbody>
					</c:if>
					<!-- 데이터가 존재한다면  -->
					<c:forEach var="article" items="${list}">
						<tbody>
							<tr>
								<td width="5" style="text-align: center;" class="center"><input type="checkbox" name="checkRow"
							value="${article.memberId}" /></td>
								<td><a href="memDetail.do?memberId=${article.memberId }">${article.memberId}                         </a>
								<td>${article.nickname}</td>
								<td>${article.gender}<%-- <fmt:formatDate value="${article.regdate}" timeStyle="medium" pattern="yyyy-MM-dd   hh:mm" /> --%></td>
								<td>${article.memberType}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-2">
				<span />
			</div>
		</section>
		<div class="col-md-4">
			<span />
		</div>
		<form action="memList.do" name="search" method="get"
			onsubmit="return searchCheck()">
			<div class="col-md-1">
				<select name="keyField" class="form-control">
					<option value="memberId">회원 이메일</option>
					<option value="nickname">닉네임</option>
					<option value="all">전체</option>
				</select> <span />
			</div>
			<div class="col-md-2">
				<span /><input type="text" class="form-control" name="keyWord">
			</div>
			<div class="col-md-2">
				<input type="submit" value="찾기" class="btn btn-default"/>
				<input type="button" class="btn btn-primary" value="회원삭제"	onclick="deleteAction()">
			</div>
		</form>
		<div class="col-md-4">
			<span />
		</div>
	</div>
</div>
<tr>
	<td align="center">${pagingHtml }</td>
</tr>








<%-- <table width="100%" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="right" colspan="5"><input type="button" value="글쓰기"
			onclick="location.href='write.do'"></td>
	</tr>

	<tr bgcolor="#F3F3F3">
		<td width="50">번호</td>
		<td>제목</td>
		<td width="70">글쓴이</td>
		<td width="100">날짜</td>
		<td width="70">조회수</td>
	</tr>
	<c:if test="${count==0}">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
	</c:if>
	<!-- 데이터가 존재한다면  -->
	<c:forEach var="article" items="${list}">
		<tr>
			<td align="center">${article.boardNum}</td>
			<td><a href="detail.do?boardNum=${article.boardNum }">${article.title}</a></td>
			<td>${article.writer}</td>
			<td>${article.regdate}</td>
			<td>${article.hit}</td>
		</tr>
	</c:forEach>
	<tr>
		<td align="center" colspan="5">${pagingHtml }</td>
	</tr>
</table> --%>