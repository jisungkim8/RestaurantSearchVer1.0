<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		alert("deleteAction")
		var checkRow = "";
		//checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기

		/* if (checkRow == '') {
			alert("삭제할 대상을 선택하세요.");
			return false;
		} */
		//console.log("### checkRow => {}" + checkRow); */

		if (confirm("게시판 글을 삭제 하시겠습니까?")) {

			$("input[name='checkRow']:checked").each(function() {
				checkRow = checkRow + $(this).val() + ",";
				alert("checkRow=>"+checkRow);
				$.ajax({
		    		url:'/RestaurantSearch/adminBoardDelete.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
		    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
		    		data:{boardNum:$(this).val()},
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

<!-- <div class="row">
	<div class="col-lg-12">
		<div class="col-md-2">
			<span />
		</div>
		<div class="col-md-8">
			<h2>
				<strong>게시판</strong> <small class="font300">게시판</small>
			</h2>
		</div>
		<div class="col-md-2">
			<span />
		</div>
		<div class="col-md-4">
			<span />
		</div> -->

<!-- <form action="list.do" name="search" method="get"
			onsubmit="return searchCheck()">
			<div class="col-md-2">
				<select name="keyField" class="form-control">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
					<option value="all">전체</option>
				</select> <span/>
			</div>
			<div class="col-md-2">
				<span /><input type="text" class="form-control" name="keyWord">
			</div>
			<div class="col-md-8">
				<span /><input type="submit" value="찾기" class="btn btn-default">
				<input type="button" class="btn btn-primary"	value="글삭제" onclick="location.href='write.do'">
				<input type="button" class="btn btn-primary"	value="글쓰기" onclick="location.href='write.do'">
			</div>
		</form> -->

<h2>
	<br> <strong style="margin-left: 150px;">식당 검색 게시판</strong>
	<!-- <small class="font300">게시판</small> -->
</h2>

<section class="panel">

	<header class="panel-heading">
		<!-- <div class="col-md-9">
				<span>
				<input type="button" class="btn btn-primary"
						value="글삭제" onclick="location.href='write.do'"></span>
				</div>
				<div class="col-md-3">
					<span>
					
					<input type="button" class="btn btn-primary"
						value="글쓰기" onclick="location.href='write.do'"></span>
				</div> -->

	</header>

	<!-- <div class="col-md-2">
				<span />
			</div> -->

	<div class="col-md-1"></div>

	<div class="col-md-10">
		<table  class="table table-striped table-advance table-hover">
			<thead>
				<tr style="background-color:#F29661">
				<c:if test="${sessionScope.userLoginInfo.memberId eq 'kicRestAdmin@rest.com'}">
					<th width="5" style="text-align: center;"><input type="checkbox" name="checkAll" id="th_checkAll"
						onclick="checkAll();" /></th>
				</c:if>
					<!-- <th>번호</th> -->
					<th width="250" style="text-align: center; ">제목</th>
					<th width="50" style="text-align: center; ">작성자</th>
					<th width="50" style="text-align: center; ">등록일</th>
					<th width="50" style="text-align: center; ">조회수</th>
				</tr>
			</thead>
			<c:if test="${count==0}">
				<tbody>
					<tr>
						<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
					</tr>
				</tbody>
			</c:if>
			<!-- 데이터가 존재한다면  -->
			<c:forEach var="article" items="${list}">
				<tbody>
					<tr>
						<c:if test="${sessionScope.userLoginInfo.memberId eq 'kicRestAdmin@rest.com'}">
						<td width="5" style="text-align: center;" class="center"><input type="checkbox" name="checkRow"
							value="${article.boardNum}" /></td>
						</c:if>
						<%-- <td>${article.boardNum}</td> --%>
						<td width="250" style="text-align: center;"><a href="detail.do?boardNum=${article.boardNum }">${article.title}</a>
							<c:if test="${article.hit >=20}">
								<img src="design/images/hot.gif">
							</c:if></td>
						<td width="50" style="text-align: center;">${article.writer}</td>
						<td width="50" style="text-align: center;">${article.regdate}<%-- <fmt:formatDate value="${article.regdate}" timeStyle="medium" pattern="yyyy-MM-dd   hh:mm" /> --%></td>
						<td width="50" style="text-align: center;">${article.hit}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>

	<div class="col-md-1"></div>

	<!-- <div class="col-md-2">
				<span />
			</div> -->


</section>
<div style="margin-left: 200px;">
	<form action="list.do" name="search" method="get"
		onsubmit="return searchCheck()">
		<div class="row"
			sytle="border:1px blue solid;margin:0 auto;width:750px;height:100px; text-align:left;">
			<div class="col-md-3">
				<select name="keyField" class="form-control">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
					<option value="all">전체</option>
				</select>
			</div>
			<div class="col-md-4">
				<input type="text" class="form-control" name="keyWord">
			</div>
			<div class="col-md-5">
				<input type="submit" value="찾기" class="btn btn-default">
				<input type="button" class="btn btn-primary" value="글쓰기" onclick="location.href='write.do'">
				<c:if test="${sessionScope.userLoginInfo.memberId eq 'kicRestAdmin@rest.com'}">
				<input type="button" class="btn btn-primary" value="글삭제"	onclick="deleteAction()">
				</c:if>
			</div>
		</div>
	</form>
</div>

<!-- <div class="col-md-4">
			<span/>
		</div>
		
	</div>
</div> -->


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