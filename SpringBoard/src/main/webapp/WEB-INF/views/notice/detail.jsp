<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>
<%
	int notice_idx=(Integer)request.getAttribute("notice_idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function getDetail(){
		$.ajax({
			url:"/rest/notices/<%=notice_idx%>",
			type:"get",
			success:function(result, status, xhr){
				// 결과값을 받아서 화면에 반영해야 하므로 여기서 작성!
				$("input[name='title']").val(result.title);
				$("input[name='writer']").val(result.writer);
				$("textarea[name='content']").val(result.content);
			}
		});
	}

	
	function edit(){
		let formData=$("#form1").serialize();
		
		$.ajax({
			url:"/rest/notices",
			type:"put",
			data:formData
		});
	}
	
	function del(){
		$.ajax({
			url:"/rest/notices/<%=notice_idx%>",
			type:"delete",
			success:function(result, status, xhr){
				alert(result);
			}
		});
	}
	
	
	$(function(){
		getDetail();

		$("#bt_list").click(function(){
			location.href="/notice/list";
		});

		$("#bt_edit").click(function(){
			if(confirm("수정하시겠습니까?")){
				edit();
			}
		});

		$("#bt_del").click(function(){
			if(confirm("삭제하시겠습니까?")){
				del();
			}
		});
		
	});

</script>
</head>
<body>
	<div class="container m-5">
		<div class="row">
			<div class="col">
				<form id="form1">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Enter email" name="title">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Enter email" name="writer">
					</div>
					<div class="form-group">
						<textarea class="form-control" name="content"></textarea>
					</div>
				</form>
				<div class="form-group">
					<button type="button" class="btn btn-info" id="bt_edit">수정</button>
					<button type="button" class="btn btn-info" id="bt_del">삭제</button>
					<button type="button" class="btn btn-info" id="bt_list">목록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>