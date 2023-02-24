<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리2</title>
<style type="text/css">
	.boxStyle{
		width:100px;
		height:115px;
		border:2px solid;
		display:inline-block;
		margin:5px;
	}
	.boxStyle img{
		width:90px;
		height:105px;
	}
	.boxStyle div{
		text-align:right;
		margin-right:5px;
		font-weight:bold;
	}
</style>
<script type="text/javascript">
	// 뷰 컴포넌트가 될 녀석
	let app1;
	let key=0;
	
	// 2 제어할 디자인 포넌트를 뷰 템플릿으로 만들기 
	// css로 접근 가능
	const imagebox={
		template:`
			<div class="boxStyle">
				<div @click="delImg(p_idx)"><a href="#">X</a></div>
				<img :src="p_src"/>
			</div>
		`,
		props:["source", "idx"],
		data(){
			return{
				p_src:this.source,
				p_idx:this.idx
			};
		},
		methods:{
			delImg:function(idx){
				
				// idx 값을 조사해서 일치하면 삭제!
				for(let i=0; i<app1.imageList.length; i++){
					let json=app1.imageList[i];
					
					if(json.key==idx){
						app1.imageList.splice(i,1);		// 몇번째 요소?(this), 몇개?
					}
				}
				
			}
		}
	};
	// 3-6) 속성 들어갈 데이터는 함수 표시 하고 return 에서 연결
	// 속성 탬플릿 태그 안에 반영할 때 : 표시해야함!!!!!

	
	function init(){
		app1=new Vue({
			el:"#app1"	,	// 제어될 id 명시

			// 2-1) 등록할 컴포넌트 등록 -- 태그처럼 사용 가능!
			components:{
				imagebox
			},
			data:{
				count:3,
				src:[],
				imageList:[]
			}
		});
	}

	
	// 5 이미지 중복 여부 체크 !
	function checkDuplicate(filename){
		let count=0;
		
		// 5-1) 이미지 리스트에 있는 파일 이름들을 꺼내서 비교하기!	* 조사하려면? -- 반복문
		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			
			if(json.name==filename){
				count++;
			}
		}
		return count;
	}
	
	
	function preview(files){
		for(let i=0; i<files.length; i++){
			let file=files[i];
			
			if(checkDuplicate(file.name)<1){
				//3-2) 이미지 반영 객체 
				let reader=new FileReader();
				reader.onload=function(e){
					
					/* 3-4) 이미지 소스를 템플릿의 소스로 반영하려면? 어떻게 전달하지?
								이럴때 app1의 데이터를 이용해서 props 넘기면 되려나? */			
					//app1.src.push(e.target.result);
					
					key++;
					
					// 4) 이미지 리스트 배열에 DTO 형식으로 담기  (key & value)
					let json=[];
					json['src']=e.target.result;
					json['key']=key;
					json['name']=file.name;
					json['file']=file;
					
					app1.imageList.push(json);
				}
				// 3-3) 실제 반영할 파일 명시
				reader.readAsDataURL(file);
			}
		}
	}
	
	
	function regist(){
		// 6 폼 데이터 객체 활용해서 보내기
		let formData=new FormData();
		
		formData.append("title", $("input[name='title']").val());
		formData.append("writer", $("input[name='writer']").val());
		formData.append("content", $("textarea[name='content']").val());

		for(let i=0; i<app1.imageList.length; i++){
			let json=app1.imageList[i];
			
			// 6-1) 파일 전체를 보내기!  -- 같은 이름이므로 배열화 될 것임
			formData.append("photo", json.file);
		}
		console.log(formData);
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
		
		// 3-1) 선택한 이미지 배열 넘기
		$("input[name='photo']").change(function(){
			preview(this.files);
		});
		
	
		$("#bt_regist").click(function(){
			regist();
		});
	
	});
</script>
</head>
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
					
					<!-- 1 컴포넌트 디자인 먼저 짜보자  -->
					<template v-for="json in imageList">
					
						<!-- 3-5) 템플릿에 전달하 속성 지정 :속성="뷰 data 접근 가능"-->
						<imagebox :key="json.key" :source="json.src" :idx="json.key"/>
						
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