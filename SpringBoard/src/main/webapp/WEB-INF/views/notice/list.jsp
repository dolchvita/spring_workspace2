<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>
<%
	
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	let app1;
	
	const row={
			template:`
				<tr>
					<td>{{json.notice_idx}}</td>
					<td @click=getDetail(json.notice_idx)><a href="#">{{json.title}}</a></td>
					<td>{{json.writer}}</td>
					<td>{{json.content}}</td>
					<td>{{json.regdate}}</td>		
				</tr>
			`,
			props:["notice"],
			data(){
				return{
					json:this.notice
				};
			},
			methods:{
				getDetail:function(notice_idx){
					location.href="/notice/detail?notice_idx="+notice_idx;
				}
			}
	}

	function getList(){
		$.ajax({
			url:"/rest/notices",
			type:"get",
			success:function(result, status, xhr){
				console.log(result);		// 	result 자체가 제이슨으로 넘어온다!!
				app1.noticeList=result;
			}
		});
	}

	function init(){
		app1=new Vue({
			el:"#app1",
			components:{
				row
			},
			data:{
				noticeList:3
			}
		});
	}

	$(function(){
		init();
		getList();
		
		$("#bt_regist").click(function(){
			location.href="/notice/registform";
		});
	});
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container m-5" id="app1">
		<div class="row">
			<div class="col">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>내용</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<template v-for="notice in noticeList">
							<row :notice="notice" :key="notice.notice_idx"/>
						</template>
					</tbody>
				</table>
				<div class="form-group">
					<button type="button" class="btn btn-info" id="bt_regist">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>