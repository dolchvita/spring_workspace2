<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/inc/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style type="text/css">
.boxstyle{
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
/* 
	뷰컴포넌트가 여러개 생성시 고유의 키값이 필요하다.
	또한 중복 체크도 해야 하기 때문에 key 를 명시하고, 중복시 값을 증가시킨다.
*/
let key=0;

const imagebox={
		template:`
			<div class="boxStyle">
				<div @click="delImg(p_idx)"><a href="#">X</a></div>
				<img :src="p_src"/>
			</div>					
		`,
		
		/*이 컴포넌트를 태그로 호출하는 자가 넘긴 속성을 받으려면  props로 받는다*/
		props:['src', 'idx'],
		data(){
			return {
				
				/*
				props 용도: 외부에서 전달된 속성값을 보관하기 위한 변수 
				p_src의 용도: 내부탬플릿에서 접근하기 위한 변수
				*/
				p_src:this.src, 
				p_idx:this.idx
			};
		},
		methods:{
			delImg:function(idx){
				alert(idx);
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


// 2-1 사진이 선택되면 그 사진이 우리가 준비한 배열에 이미 존재하는지 먼저 체크할 것임!
function checkDuplicate(filename){
	let count=0;
	for(let i=0; i<app1.imageList.length; i++){
		let json=app1.imgList[i];
		console.log("꺼낸 재이슨~~~", json);
		
		
		if(filename==json.name){
			count++;	// 2-2 중복 발견되면 증
			break;
		}
	}
	return count;
}



function preview(files){
	console.log("넘겨받은 파일 ", files);
	
	for(let i=0; i<files.length; i++){
		let file=files[i];
		console.log(file);
		
		console.log("반환값은?~~~ ", checkDuplicate(file.name));
		
		//2-3 중복여부 먼저 체크 후 배열 세팅
		if(checkDuplicate(file.name)<1){
			let reader=new FileReader();
			
			reader.onload=(e)=>{
				// 뷰의 리스트로 밀어넣기!
				key++;
				
				let json=[];	//2-1) DTO처럼 속성 여러개를 하나로 묶어 이미지 배열에 담기
				json['binary']=e.target.result;
				json['key']=key;
				json['name']=file.name;		//	중복 체크시 사용할 파일이름
				json['file']=file;
				
				app1.imageList.push(json);
				console.log("현재 이미지 리스트 "+app1.imageList[i]);
			}
			reader.readAsDataURL(file);		//	reader가 생성된 지역화 영역 안에 존재하기
		}
	}
}


// 비동기로 등록폼 보내기!
function regist(){
	// 전송할 데이터를 담은 객체 만들기
	let formData=new FormData();
	
	formData.append("title", $("input[name='title']").val());
	formData.append("writer", $("input[name='writer']").val());
	formData.append("content", $("textarea[name='content']").val());
	
	//파일 보내기 !
	for(let i=0; i<app1.imageList.length; i++){
		let json=app1.imageList[i];
		
		console.log(json," 보낼 파일들 잘 있냐고~~");
		formData.append("photo", json.file);
	}
	
	
	$.ajax({
		// 비동기 컨트롤러 작동! (/rest)
		url:"/rest/gallery/regist",
		type:"post",
		
		// 바이너리 전송시 반드시 명시해야 할 것! 1) contentType  2) processData
		contentType:false,
		processData:false,
		
		data:formData,
		success:function(result,status,xhr){
			alert(result);

		}
	});
}


$(function(){
	init();
	
	$("input[name='photo']").change(function(){
		// 사진의 정보를 넘겨주기 !
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
						
						<template v-for="json in imageList">
						
							<!-- 여기 입력된 변수들은 템플릿의 props 로 들어간다 -->
							<imagebox :src="json.binary" :key="json.key" :idx="json.key" />	
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