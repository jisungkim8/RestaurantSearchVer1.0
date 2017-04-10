<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- DeleteController에서 지정한 boardCommand->"command" -->

<div class="row">
	<div class="col-md-2">
		<span />
	</div>
	<form:form commandName="command">
		<div class="col-md-8">
			<h2>
				<strong>Forms</strong> <small class="font300">Shortcodes</small>
			</h2>
			<div class="form-group">
				<form:errors element="div" />
				<label><spring:message code="write.form.pwd" /></label> <input
					type="password" class="form-control" name="pwd" />
				<form:errors path="pwd" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary"
					value="<spring:message code="write.form.submit"/>" /> <input
					type="button" class="btn btn-success"
					value="<spring:message code="list.content.title"/>"
					onclick="location.href='list.do'" />
			</div>
		</div>
	</form:form>
	<div class="col-md-2">
		<span />
	</div>
</div>




<%-- <form:form commandName="command">
	<form:errors element="div" />
	<spring:message code="write.form.pwd" />
	<form:password path="pwd" />
	<form:errors path="pwd" />
	<br>

	<input type="submit" value="<spring:message code="write.form.submit"/>">
	<input type="button"
		value="<spring:message code="list.content.title"/>"
		onclick="location.href='list.do'">
</form:form> --%>