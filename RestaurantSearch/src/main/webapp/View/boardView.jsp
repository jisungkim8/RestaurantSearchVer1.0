<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-2">
		<span />
	</div>
		<div class="col-md-8">
			<h2>
				<strong>Forms</strong> <small class="font300">Shortcodes</small>
			</h2>
			<div class="form-group">
				<label>번호</label> <input
					type="text" class="form-control" name="boardNum"
					value="${board.boardNum}" disabled/>
			</div>
			<div class="form-group">
				<label>제목</label> <input
					type="text" class="form-control" name="title"
					value="${board.title }" disabled/>
			</div>
			<div class="form-group">
				<label>작성자</label> <input
					type="text" class="form-control" name="writer"
					value="${board.writer }" disabled/>
			</div>
			<div class="form-group">
				<label>등록일</label> <input
					type="text" class="form-control" name="regdate"
					value="${board.regdate }" disabled/>
			</div>
			<div class="form-group">
				<label>조회수</label> <input
					type="text" class="form-control" name="hit"
					value="${board.hit }" disabled/>
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="10" cols="50" name="content" disabled>${board.content }</textarea>
			</div>
			<c:if test="${board.filename != null }">
			<div class="form-group">
				<label>첨부파일</label>
				<a class="form-control"  href="file.do?filename=${board.filename}" disabled>${board.filename }</a>
				<p class="help-block" />
			</div>
			</c:if>
			<div class="form-group">
				<input type="button" class="btn btn-primary" value="수정" 
			   onclick="location.href='update.do?boardNum=${board.boardNum}'">
			<input type="button" class="btn btn-success" value="삭제" 
			   onclick="location.href='delete.do?boardNum=${board.boardNum}'">
			<input type="button" class="btn btn-warning" value="목록" onclick="location.href='list.do'">
			</div>
	</form>
	<div class="col-md-2">
		<span />
	</div>
</div>



