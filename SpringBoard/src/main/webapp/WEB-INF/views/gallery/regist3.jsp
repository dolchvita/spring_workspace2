<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리3</title>
<style type="text/css">
	.boxStyle{
	width:70px;
	height:85px;
	border:2px solid #ccc;
	display:inline-block; /*inline:다른요소와 공존, block:크기설정*/
	margin:5px;
	}
	.boxStyle img{
		width:65px;
		height:55px;
	}
	.boxStyle div{
		text-align:right;
		margin-right:5px;
		font-weight:bold;
	}
</style>
<script type="text/javascript">
	let app1;
	let key=0;
	
	const imagebox={
			template:`
				<div class="boxStyle">
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
					
					for(let i=0; i<app1.imageList.length; i++){
						let json=app1.imageList[i];
						console.log(json);
					
						if(json.key==idx){
							app1.imageList.splice(i, 1);
						}
					}
				}
			}
	};
	
	
	function init(){
		app1=new Vue({
			el:"#app1",
			components:{
				imagebox
			},
			data:{
				count:3,
				imageList:[]
			}
			
		});
	}
	
	
	function checkDuplicate(filename){
		let count=0;
		
		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			
			if(json.name==filename){
				count++;
			}
		}
		return count;
	}
	
	
	function preview(files){
		console.log("???");
		
		for(let i=0; i<files.length; i++){
			let file=files[i];
			
			if(checkDuplicate(file.name)<1){
				let reader=new FileReader();
				reader.onload=function(e){
					
					key++;
	
					let json=[];
					
					json['src']=e.target.result;
					json['key']=key;
					json['name']=file.name;
					json['file']=file;
					
					app1.imageList.push(json);
					console.log(app1.imageList);
				}
				reader.readAsDataURL(file);
			}
		}
	}
	
	function regist(){
		let formData=new FormData();
		
		formData.append("title", $("input[name='title']").val());
		formData.append("writer", $("input[name='writer']").val());
		formData.append("content", $("textarea[name='content']").val());

		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			
			// 6-1) 파일 전체를 보내기!  -- 같은 이름이므로 배열화 될 것임
			formData.append("photo", json.file);
		}
		
		$.ajax({
			url:"/rest/gallery/regist",
			type:"POST",
			contentType:false,
			processData:false,
			
			data:formData,
			success:function(result, status, xhr){
				alert(result);
			}
		});
		
	}
	
	
	$(function(){
		init();
		
		$("input[name=photo]").change(function(){
			preview(this.files);
		});
		
		
		$("#bt_regist").click(function(){
			regist();
		});
		
	});
</script>
</head>
<body>
<body>
	<div class="container m-5" id="app1">
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
						<textarea class="form-control" name="content">내용 입력</textarea>
					</div>
					<div class="form-group">
						<input type="file" class="form-control" name="photo" multiple>
					</div>
					<div class="form-group" id="preview">
						<p>이미지 나올 곳</p>
						<template v-for="json in imageList">
							<imagebox :key="json.key" :src="json.src" :idx="json.key"/>
						</template>
					</div>
					
				</form>
				<div class="form-group">
					<button type="button" class="btn btn-info" id="bt_regist">등록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>