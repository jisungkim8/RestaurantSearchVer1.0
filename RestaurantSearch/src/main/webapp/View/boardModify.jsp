<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-2">
		<span />
	</div>
	<spring:hasBindErrors name="command" />
	<form:errors path="command" />

	<form action="update.do" enctype="multipart/form-data" method="post">
		<div class="col-md-8">
			<h2>
				<strong>Forms</strong> <small class="font300">Shortcodes</small>
			</h2>
			<div class="form-group">
				<label><%-- <spring:message code="write.form.boardNum" /> --%></label> <input
					type="hidden" class="form-control" name="boardNum"
					value="${command.boardNum }" />
				<%-- <form:errors path="command.boardNum" /> --%>
			</div>
			<div class="form-group">
				<label><spring:message code="write.form.title" /></label> <input
					type="text" class="form-control" name="title"
					value="${command.title }" />
				<form:errors path="command.title" />
			</div>
			<div class="form-group">
				<label><spring:message code="write.form.writer" /></label> <input
					type="text" class="form-control" name="writer"
					value="${command.writer }" />
				<form:errors path="command.writer" />
			</div>
			<div class="form-group">
				<label><spring:message code="write.form.pwd" /></label> <input
					type="password" class="form-control" name="pwd" />
				<form:errors path="command.pwd" />
			</div>
			<div class="form-group">
				<label><spring:message code="write.form.content" /></label>
				<textarea class="form-control" rows="10" cols="50" name="content">${command.content }</textarea>
				<form:errors path="command.content" />
			</div>
			<div class="form-group">
				<label><spring:message code="write.form.upload" /></label> <input
					type="file" class="form-control" name="upload" />
					<c:if test="${!empty command.filename }">	(${command.filename }) 파일이 등록되어있습니다. </c:if>
				<p class="help-block" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary"
					value="<spring:message code="write.form.submit"/>" /> <input
					type="button" class="btn btn-success"
					value="<spring:message code="list.content.title"/>"
					onclick="location.href='list.do'" />
			</div>
		</div>
	</form>
	<div class="col-md-2">
		<span />
	</div>
</div>



<%-- <!--게시판의 글쓰기와 동일하다. -->
<spring:hasBindErrors name="command" />
<form:errors path="command" />
<form action="update.do" enctype="multipart/form-data" method="post">

	<input type="hidden" name="boardNum" value="${command.boardNum }">

	<spring:message code="write.form.title" />
	<input type="text" name="title" value="${command.title }">
	<form:errors path="command.title" />
	<br>

	<spring:message code="write.form.writer" />
	<input type="text" name="writer" value="${command.writer }">
	<form:errors path="command.writer" />
	<br>

	<spring:message code="write.form.pwd" />
	<input type="password" name="pwd">
	<form:errors path="command.pwd" />
	<br>

	<spring:message code="write.form.content" />
	<textarea rows="10" cols="50" name="content">${command.content }</textarea>
	<form:errors path="command.content" />
	<br>

	<spring:message code="write.form.upload" />
	<input type="file" name="upload">
	<c:if test="${!empty command.filename }">
	(${command.filename }) 파일이 등록되어있습니다.<br>
	</c:if>
	<input type="submit" value="<spring:message code="write.form.submit"/>">
	<input type="button"
		value="<spring:message code="list.content.title"/>"
		onclick="location.href='list.do'">
</form> --%>

