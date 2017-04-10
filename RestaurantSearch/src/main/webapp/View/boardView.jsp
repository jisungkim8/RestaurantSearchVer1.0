<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					type="text" class="form-control" name="seq"
					value="${board.seq }" disabled/>
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
			<div class="form-group">
				<label>첨부파일</label>
				<a class="form-control"  href="file.do?filename=${board.filename}" disabled>${board.filename }</a>
				<p class="help-block" />
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-primary" value="수정" 
			   onclick="location.href='update.do?seq=${board.seq}'">
			<input type="button" class="btn btn-success" value="삭제" 
			   onclick="location.href='delete.do?seq=${board.seq}'">
			<input type="button" class="btn btn-warning" value="목록" onclick="location.href='list.do'">
			</div>
	</form>
	<div class="col-md-2">
		<span />
	</div>
</div>







<%-- <table width="600" border="0" cellspacing="0" cellpagging="0" align="center">
	<tr>
		<td colspan="2"><h3>스프링 게시판 </h3></td>	
	</tr>
	<tr>
		<td>번호</td>		
		<td>${board.seq }</td>		
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>${board.writer }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.title }</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr size="1" width="100%" noshade>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${board.content }</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr size="1" width="100%" noshade>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${board.hit }</td>
	</tr>
	<tr>
		<td>등록날짜</td>
		<td>${board.regdate }</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><a href="file.do?filename=${board.filename}">${board.filename }</a></td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="button" value="수정" 
			   onclick="location.href='update.do?seq=${board.seq}'">
			<input type="button" value="삭제" 
			   onclick="location.href='delete.do?seq=${board.seq}'">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</td>
	</tr>
</table> --%>