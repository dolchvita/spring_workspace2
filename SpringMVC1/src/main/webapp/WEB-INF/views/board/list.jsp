<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container m-5">
		<div class="row">
			<div class="col">
				<div class="form-group">
					<input type="email" class="form-control" placeholder="제목 입력" id="title">
				</div>			
				<div class="form-group">
					<input type="email" class="form-control" placeholder="작성자 입력" id="writer">
				</div>			
				<div class="form-group">
					<textarea type="email" class="form-control" id="content">내용 입력</textarea>
				</div>			
			</div>
		</div>
	</div>
</body>
</html>