<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<div class="col-md-1">
				<span /><input type="submit" value="찾기" class="btn btn-default">
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