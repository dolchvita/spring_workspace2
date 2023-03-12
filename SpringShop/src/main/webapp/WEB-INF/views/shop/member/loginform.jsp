<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
	<%@ include file="../inc/header.jsp"%>
</head>

<body>
    <!-- Page Preloder -->
	<%@ include file="../inc/preloder.jsp"%>


    <!-- Offcanvas Menu Begin -->

	<%@ include file="../inc/main_navi.jsp"%>
    <!-- Offcanvas Menu End -->


    <!-- Header Section Begin -->
    <%@ include file="../inc/header_section.jsp"%>
    <!-- Header Section End -->

	
	<!-- 회원가입 컨텐츠 시작 -->
	<section>
		<div calss="container">
			<div class="row m-5">
				<div class="col">
					<form id="form1">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter email" name="id">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter password" name="pass">
						</div>
						
						<button type="button" class="btn btn-primary" id="bt_google">구글 로그인</button>
						
					</form>
				</div>
			</div>
		</div>	
	</section>
	<!-- 회원가입 컨텐츠 끝 -->
	
	
	<!-- Instagram Begin -->
	<%@ include file="../inc/insta.jsp" %>
	<!-- Instagram End -->
	
	<!-- Footer Section Begin -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- Footer Section End -->
	
	<!-- Search Begin -->
	<%@ include file="../inc/search.jsp" %>
	<!-- Search End -->
	
	<!-- Js Plugins -->
	<%@ include file="../inc/footer_link.jsp" %>

<script>

	

	$(function(){
		$("#bt_google").click(function(){
			// 반환받은 url 주소로 연결해주기
			location.href="<%=request.getAttribute("url")%>";
			// 승인 시 callback 함수 작동!
		});
		
	});
</script>
</body>

</html>