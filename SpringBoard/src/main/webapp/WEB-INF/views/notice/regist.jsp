<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function regist(){
		// 폼 태그 한번에 묶어서 보내기!!
		let formData=$("#form1").serialize();
		
		console.log(formData);
		$.ajax({
			url:"/rest/notices",
			type:"post",
			data:formData,
			success:function(result, status, xhr){
				alert(result);
			}
		});
	}

	$(function(){
		
		// 등록 버튼(비동기)
		$("#bt_regist").click(function(){
			regist();
		});
		
		// 목록 페이지 전환
		$("#bt_list").click(function(){
			location.href="/notice/list";
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
					<button type="button" class="btn btn-info" id="bt_regist">등록</button>
					<button type="button" class="btn btn-info" id="bt_list">목록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>