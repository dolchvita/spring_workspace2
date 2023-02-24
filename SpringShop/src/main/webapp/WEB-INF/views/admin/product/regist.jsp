<%@page import="com.edu.springshop.domain.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Category> categoryList=(List<Category>)request.getAttribute("categoryList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상품 등록폼</title>
<%@ include file="../inc/header_link.jsp" %>
<style type="text/css">
	.box-style{
		width:90px;
		height:95px;
		border:1px solid #ccc;
		display:inline-block;
		margin:5px;
	}
	.box-style img{
		width:65px;
		height:55px;
	}
	.box-style div{
		text-align:right;
		margin-right:5px;
		font-weight:bold;
	}
</style>
  </head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

<%@ include file="../inc/preloader.jsp" %>
<%@ include file="../inc/navbar.jsp" %>

  <!-- Main Sidebar Container -->
<%@ include file="../inc/sidebar_left.jsp" %>


  <!-- Content Wrapper. Contains page content -->
 	<div class="content-wrapper">

	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">상품등록</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">상품관리> 상품등록</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->


		<!-- Main content -->
    <section class="content" id="app1">
      <div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="form-group row">
					<select class="form-control" name="category_idx">
						<option value="0">카테고리 선택</option>
						<%for(Category category:categoryList){ %>
						<option value="<%=category.getCategory_idx()%>"><%=category.getCategory_name() %></option>
						<%} %>
					</select>
				</div>

				<div class="form-group row">
					<div class="col">
						<input type="text" name="product_name" class="form-control"
							placeholder="상품명">
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						<input type="text" name="brand" class="form-control"
							placeholder="브랜드">
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						<input type="number" name="price" class="form-control"
							placeholder="가격">
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						<input type="number" name="discount" class="form-control" placeholder="할인가">
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						<input type="file" name="photo" class="form-control" multiple>
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						이미지 나올 곳 <p/>
						<template v-for="json in imageList">
							<imagebox :src="json.src" :key="json.key" :idx="json.key"/>
						</template>
					</div>
				</div>

				<div class="form-group row">
					<div class="col">
						<textarea name="detail" class="form-control" id="detail"></textarea>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col">
						<button type="button" class="btn btn-danger" id="bt_regist">등록</button>
					</div>
				</div>
			</div>
		</div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.Main-content -->
  </div>
  <!-- /.content-wrapper -->
<%@ include file="../inc/footer.jsp" %>

  <!-- Control Sidebar -->
<%@ include file="../inc/sidebar_right.jsp" %>

  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@ include file="../inc/footer_link.jsp" %>
</body>
<script type="text/javascript">
	let app1;
	let key=0;
	
	const imagebox={
			template:`
				<div class="box-style">
					<div @click="delImg(p_idx)"><a href="#">X</a></div>
					<img :src="p_src"/>
				</div>
			`,
			props:["src", "idx"],
			data(){
				return{
					p_src:this.src,
					p_idx:this.idx
				};
			},
			methods:{
				delImg:function(idx){
					for(let i=0;i<app1.imageList.length;i++){
						let json=app1.imageList[i];
						
						if(json.key == idx){
							app1.imageList.splice(i , 1); //요소,개수
						}
					}
				}
			}
		}
	
	
	function init(){
		app1=new Vue({
			el:"#app1",
			data:{
				imageList:[]
			},
			components:{
				imagebox
			}
		});
	}
	
	// 중복 검사
	function checkDuplicate(file){
		let count=0;
		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			
			if(file.name==json.name){
				count++;
			}
		}
		return count;
	}
	
	
	// 미리보기 구현
	function preview(files){
		for(let i=0; i<files.length; i++){
			let file=files[i];
			
			if(checkDuplicate(file)<1){
				let reader=new FileReader();
				reader.onload=function(e){
					let json=[];
					key++;
					
					json['src']=e.target.result;
					json['file']=file;
					json['name']=file.name;
					json['key']=key;
					
					app1.imageList.push(json);
				}
				reader.readAsDataURL(file);
			}
		}
	}
	
	function regist(){
		let formData=new FormData();
		formData.append("category_idx", $("select[name='category_idx']").val());
		formData.append("product_name", $("input[name='product_name']").val());
		formData.append("brand", $("input[name='brand']").val());
		formData.append("price", $("input[name='price']").val());
		formData.append("discount", $("input[name='discount']").val());
		formData.append("detail", $("textarea[name='detail']").val());
		
		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			formData.append("photo", json.file);			
		}
		
		console.log("전송할 폼 데이터 ", formData);
 		$.ajax({
			url:"/admin/rest/product",
			type:"post",
			contentType:false,
			processData:false,
			data:formData,
			success:function(result, status, xhr){
				alert(xhr.msg);
			}
		});
	}
	
	
	$(function(){
		init();
		
		$("input[name='photo']").change(function(){
			preview(this.files);
		});

		$("#bt_regist").click(function(){
			regist();
		});
		
	});

</script>
</html>
    