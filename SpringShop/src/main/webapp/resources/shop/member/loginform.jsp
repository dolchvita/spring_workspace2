<%@page import="com.jspshop.domain.Product"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="/inc/header.jsp" %>
</head>

<body>
    <!-- Page Preloder -->
	<%@include file="/inc/preloder.jsp" %>

    <!-- Offcanvas Menu Begin -->
	<%@include file="/inc/main_navi.jsp" %>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
	<%@include file="/inc/header_section.jsp" %>
    <!-- Header Section End -->



	<div class="container m-3">
		<div calss="row">

			<div class="card card-danger">
				<div class="card-header">
					<h3 class="card-title">Different Width</h3>
				</div>
				<div class="card-body">
					<form id="form1">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter ID" name="id">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter Password" name="pass">
						</div>
	
						<div class="form-group text-center">
							<button type="button" class="btn btn-outline-success" id="bt_login">Login</button>
							<button type="button" class="btn btn-outline-danger" id="bt_regist">Join</button>
						</div>
					</form>
				</div>
				<!-- /.card-body -->
			</div>

		</div>
	</div>



	<!-- Instagram Begin -->
	<%@include file="/inc/insta.jsp" %>
	<!-- Instagram End -->
	
	<!-- Footer Section Begin -->
	<%@include file="/inc/footer.jsp" %>
	<!-- Footer Section End -->
	
	<!-- Search Begin -->
	<%@include file="/inc/search.jsp" %>
	<!-- Search End -->
	
	<!-- Js Plugins -->
	<%@include file="/inc/footer_link.jsp" %>
</body>
<script type="text/javascript">
	function loginCheck(){
		$("#form1").attr({
			action:"/member/login.jsp",
			type:"post"
		});
		$("#form1").submit();
	}

	$(function(){
		$("#bt_regist").click(function(){
			$(location).attr("href","/member/joinform.jsp");
		});
		
		$("#bt_login").click(function(){
			loginCheck();
		});
	});

</script>
</html>
