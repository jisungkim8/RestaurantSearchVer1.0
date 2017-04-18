<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

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
			<!-- <input type="button" class="btn btn-warning" value="댓글쓰기" onclick="location.href='list.do'"> -->
			<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">댓글쓰기</button>
		
		<!-- Modal -->
  		<div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">
    
      		<!-- Modal content-->
      			<div class="modal-content">
        		<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
         					 <h4 class="modal-title">댓글쓰기</h4>
        			</div>
        		<form action="reviewWrite.do?restaurantId=${restaurantId}&moreCount=0&filterName=reviewId" enctype="multipart/form-data" method="post">
       			 <div class="modal-body">
        		  <p>댓글</p>
        		  <textarea class="form-control" rows="4" cols="50" name="content" placeholder="리뷰 내용을 작성해주세요."></textarea>
        		</div>
        			<div class="modal-footer">
        				  <button class="btn btn-primary" >Submit</button> 
        				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        			</div>
        	</form>
   		</div>
  	  </div>
 	 </div>
	</div>
			
	</form>
	<div class="col-md-2">
		<span />
	</div>
</div>



