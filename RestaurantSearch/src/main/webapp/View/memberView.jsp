<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-md-2">
		<span />
	</div>
		<div class="col-md-8">
			<h2>
				<strong>회원 상세정보</strong> <small class="font300"></small>
			</h2>
			<div class="form-group">
				<label>회원 이메일</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.memberId}" disabled/>
			</div>
			<div class="form-group">
				<label>닉네임</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.nickname}" disabled/>
			</div>
			<div class="form-group">
				<label>생년 월일</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.birthDate}" disabled/>
			</div>
			<div class="form-group">
				<label>성별</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.gender}" disabled/>
			</div>
			<div class="form-group">
				<label>전화번호</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.phoneNum}" disabled/>
			</div>
			<div class="form-group">
				<label>자기소개</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.selfIntro}" disabled/>
			</div>
			<div class="form-group">
				<label>회원 등급</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.memberType}" disabled/>
			</div>
			<div class="form-group">
				<label>관심음식</label> <input
					type="text" class="form-control" name=""
					value="${selectMember.interestFood}" disabled/>
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



