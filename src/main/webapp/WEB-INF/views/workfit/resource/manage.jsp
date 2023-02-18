<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
.table th, .table td {
    vertical-align : middle;
    border-bottom: 1.5px solid #dbdee0 !important;
    border-top: 1.5px solid #dbdee0 !important;
}
.table tr:hover{
  	background-color: #e7ecf1;  
}
</style>
<div class='row mt-2'>
	<div class='col-12'>
		<div class='card mr-2 workfitCardBg'>
			<div class='card-body p-4'>
				<div class='card p-3' style="border-radius: 0.7rem;">
					<div class='card-title ml-3 '>
						<h5 class='apple4 page-title text-dark p-2 headerTitle'
							style='font-size: 31px; letter-spacing: 2px; font-weight: bold;'>자원관리</h5>
						<hr class="ml-3 mr-3 mt-1 mb-1">
						<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
		           			자원관리에서는 관리자가 회사의 비품 및 자원을 관리할 수 있습니다<br>
		           			리스트 및 상세페이지를 통해 자원의 효율적인 관리가 가능합니다
	           			</div>
					</div>
				</div>	
				<!--  해당 자원들 출력하기  -->
				<div class='card p-4' style="border-radius: 0.7rem;">
					<div class='card-title ml-3'>
						<h5 class='apple4 page-title text-dark p-2 headerTitle'
							style='font-size: 31px; letter-spacing: 2px; font-weight: bold;'>${type }</h5>
					</div>
					<div class="row ml-3 mr-3 apple4" id="resources">
						<div class="col-4 mb-4 pt-2">
							<!--  종류별 선택하는 dropdown 출력하는 부분 -->
							<div class="dropdown show">
	                              	<button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" 
	                              		data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                                     전체
	                                 	</button>
	                                 	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);" x-placement="bottom-start">
	                                      	<a class="dropdown-item" href="javascript:void(0);" onclick="showTypeList('')" style="font-size: 18px;">전체</a>
	                                  	<c:forEach var="type" items="${resourceType }">
	                                      	<a class="dropdown-item" href="javascript:void(0);"  style="font-size: 18px;" onclick="showTypeList('${type}')">${type }</a>
	                                  	</c:forEach>
	                                 	</div>
	                              </div>
						</div>
						<div class="col-4 offset-4 text-right">
			                <button class="btn workfitBtn" id="newResourceBtn" style="font-size: 17px; color: white;" data-toggle="modal" data-target="#newResource-Modal">자원 등록하기</button>                                                                     
						</div>
					</div>	
					<div class="col-12 apple4 text-dark">
						<table id="datatable-buttons" class="apple3 table dt-responsive nowrap w-100 text-center listTbl" name="dTbl">
							<thead>
								<tr class="apple3 text-dark text-center" style="font-size:19px;">
					                <th class='apple4' scope='col'>종류</th>                                                                       
					                <th class='apple4' scope='col'>이름</th>                                                                     
					                <th class='apple4' scope='col'>위치</th>
						            <th class='apple4' scope='col'>기타</th>                                                                      
					                <th class='apple4' scope='col'>수정</th>                                                                      
					                <th class='apple4' scope='col'>삭제</th>                                                                      
								</tr>
							</thead>
			              	<tbody id="listTbody" style="font-size: 17px;">
				              	<c:forEach var="res" items="${resources }">
				              		<tr>
				              			<td>${res.resourceType }</td>
				              			<td>${res.resourceName }</td>
				              			<td>${res.resourcePlace }</td>
			              				<td>${res.fixtures[0].fixtureName }</td>
				              			<td><button class="apple4 pl-3 pr-3 pt-1 pb-1 workfitBtn showDetail" style="font-size: 17px; id="${res.resourceCode}" >수정</button></td>
				              			<td><button class="apple4 pl-3 pr-3 pt-1 pb-1 workfitBtn showDetail" style="font-size: 17px; id="${res.resourceCode}" >삭제</button></td>
				              		</tr>
				              	</c:forEach>
		            		</tbody>
						</table>					
	            	</div>
					<!-- 해당 자원 출력 끝 -->
				</div>
				</div>
			</div>
			<!-- end of content-header -->
		</div>
	</div>

<!--  상세페이지 모달 -->
<div id="detail-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <form action="" class="pl-3 pr-3 singUpRes">
	        <div class="modal-header">
		        <div class="text-center mt-2">
		        	<!-- 상세 자원 이름 -->
		            <h1 class="apple4 text-dark text-left ml-3 mt-2" id="resourceTitle" style="font-size:30px;"></h1>
		            <h1 class="apple4 text-grey text-left ml-3" style="font-size:20px;"></h1>
		        </div>
	        </div>
            <div class="modal-body apple3 text-dark" >
          		<div class="row">
          			<!--  왼쪽 자원 상세 정보 -->
          			<div class="col-6 mt-3">
          				<div style="height: 300px;">
							<img alt="자원 정보 사진입니다" id="dbresourceImg" 
								src=""
								style="object-fit: cover; width: 100%; height: 100%">        					
          				</div>
          				<div class="infos mt-4" style="height: 300px;">
          				<div class='card shadow-lg'>
							<div class='card-body'>
								<div class='card-title'>
		          					<table class='table mb-0' style="color: black; font-size: 18px">                                                                
		          						<tr>
		          							<td rowspan="2">비품정보</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td>123</td>
		          						</tr>
		          						<tr>
		          							<td>위치</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td>설명</td>
		          							<td></td>
		          						</tr>
		          					</table>
		          				</div>
		          			</div>
		          		</div>			
          				</div>
          			</div>
          			<!-- 오른쪽 캘린더 출력 -->
          			<div class="col-6">
          				<!--  캘린더 출력 -->
          				<div id="calendar" style="height: 600px"></div>
          			</div>
          		</div>
            </div>
            <div class="modal-footer">
				<button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
            </div>
        </form>
        </div>
    </div>
</div>
<!-- 상세정보 모달 끝 -->

<!-- 자원 등록하기 모달 -->
<!-- 
	필요한 정보 -> 자원 종류(카테고리) / 자원명 / 구매 가격 / 구매 일시 / 위치 / 회사코드(내가 넣음) / 설명 / 사진
	               비품명 / 수량
 -->
<div id="newResource-Modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true" style="z-index: 2000; font-size: 16px;">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content ">
           	<form id="newResForm">
	            <div class="modal-header">
	                <h4 class="modal-title apple5 text-dark mt-1" id="standard-modalLabel" 
	                	style=" font-size: 27px">
	                	추가하기
	                </h4>
	            </div>
	            <div class="modal-body pl-4">
	                    <div class="form-group col-2 pl-0">
	                        <label for="resourceCode">카테고리</label>
                        	<select class="custom-select" name="resourceType">
							    <option selected>전체</option>
                               	<c:forEach var="type" items="${resourceType }">
								    <option value="${type }">${type }</option>
                               	</c:forEach>
							</select> 
                        </div>
	                    <hr/>
	                    <div class="row">
		                    <div class="col-4">
			                    <div class="form-group">
			                        <label for="resourceName">이름</label>
			                        <input class="form-control" type="text" id="resourceName" name="resourceName" required="required" placeholder="자원 명을 입력해주세요">
			                    </div>
			                    <div class="form-group" id="time">
			                        <label for="resourceImg">사진</label>
			                        <div class="apple4 text-center mb-1" id="resImgDiv" 
			                        	style="height: 85px; border: 1px solid #dee2e6; border-radius : 0.25rem;   
			                        	display : flex; justify-content : center; align-items : center;">이미지를 올려주세요</div>
			                        <input class="form-control" type="file" id="resourceImg" name="resourceImg" required="required" placeholder="사진을 선택해주세요">
			                    </div>
		                    </div>
		                    <div class="col-5">
			                    <div class="form-group">
			                        <label for="resourceDate">구매 일시</label>
			                        <input class="form-control" type="date" id="resourceDate" name="resourceDate" required="required" placeholder="">
			                    </div>
			                    <div class="form-group">
			                        <label for="resourcePrice">구매 가격</label>
			                        <input class="form-control" type="text" id="resourcePrice" name="resourcePrice" required="required" placeholder="">
			                    </div>
			                    <div class="form-group">
			                        <label for="fixtureName">비품명(선택한 것마다 고쳐야함)</label>
			                        <input class="form-control" type="text" id="fixtureName" name="fixtureName" required="required" placeholder="">
			                    </div>
		                    </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="resourceInfo">설명</label>
	                        <input class="form-control" type="text" required id="resourceInfo" name="resourceInfo" placeholder="">
	                    </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
	                <button type="button" class="btn btn-primary newResource">확인</button>
	            </div>
	        <sec:csrfInput/>
	        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 자원 등록하기 모달 끝 -->


<script>

var header = '${_csrf.headerName}';
console.log(header);
var token =  '${_csrf.token}';
console.log(token);
let leftArrow = document.querySelector(".dripicons-chevron-left");
let rightArrow = document.querySelector(".dripicons-chevron-right");
let dateHeader = document.querySelector("#dateHeader");

// 분류별 버튼
let dropBtn = document.querySelector("#dropdownMenuButton");
// 분류별 내용 리스트
let dropList = document.querySelectorAll(".dropdown-item");
// 리스트 출력하는 tbody
let listTbody = document.querySelector("#listTbody");

// 사진 썸네일 보여주기
let resImgDiv = document.querySelector("#resImgDiv");			// 이미지 띄울 div
let resourceImg = document.querySelector("#resourceImg");		// file input 객체
resourceImg.onchange = () => {
       let fileReader = new FileReader();  // 파일 읽어주는 아저씨(고마웡)
       fileReader.readAsDataURL(resourceImg.files[0]);
       fileReader.onload = () => {
//            console.log(fileReader.result); // 읽은 내용이 result에 있음
           let myImg = document.createElement("img");
           let divStyle = getComputedStyle(resImgDiv);		// 이미지 띄울 div 스타일 객체
           myImg.style.width = divStyle.width; myImg.style.height = divStyle.height;
           myImg.src = fileReader.result;
           console.log(myImg);
           resImgDiv.innerHTML = "";    		// 가지고 있는 거 다 버리기!
           resImgDiv.appendChild(myImg);    	// div태그에 img 태그 자식으로 넣기!
       };
};

// 자원 등록 모달 submit 이벤트
var newResInsert = document.querySelector(".newResource");	// 등록 버튼
var newResForm = document.querySelector("#newResForm");	// 자원 등록 폼
newResInsert.onclick = () => {
	let formData = new FormData(newResForm);		// formData 에 폼 객체 넣기
	formData.append("resourceImg", resourceImg.files[0]);
	for(let key of formData.keys()){
		console.log(key);
	}
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("post", "/workfit/resource/newResInsert", true);
// 	xhr.onreadystatechange = () => {
// 		if(xhr.readyState == 4 && xhr.status == 200){
// 			console.log(xhr.responseText);
// 		}
// 	}
	
}


// 상세페이지 버튼에 이벤트 주기
var detailEvent = () => {
	var detailBtns = document.querySelectorAll(".showDetail");
	for (let detailBtn of detailBtns) {
		detailBtn.addEventListener("click", function(e) {
// 			alert("클릭햇슝");
			var resourceId = e.target.id;	// 자원 코드
			
			var jsonText = showDetail(resourceId);		// 해당 단일 자원 json 가져오는 함수
			console.log("json 단건 문자열", jsonText)
			insertDetailModal(JSON.parse(jsonText));
			
			$('#detail-modal').on('shown.bs.modal', function(e) {
				// 모달이 클라이언트에게 보여주는 순간 캘린더 그리기!
// 				openCalendar();
	// 			$(".toastui-calendar-detail-container").css("position", "relative").css("right:800px").css("bottom", "500px");
				
			}).modal('show');
			// 상세페이지 모달 띄우기
		})// end of eventListener
	}// end of for
}

// 해당 소분류 리스트 가져오는 메소드
var showTypeList = (type) => {
	console.log("소분류 ?", type);
	if(type != null && type.trim().length != 0){
		console.log("if문 들어옴???",type)
		dropBtn.innerHTML= type;
	}else{
		type = "all";
	}
	
	var headerTitle = document.querySelector(".headerTitle").innerHTML;
	console.log("종류 !!!", header)
	var code = "";
	switch (headerTitle){
	  case '회의실' :
		  code = 'R'
	    break; 
	  case '차량' : 
		  code = 'C'
	    break; 
	  case '전자기기' : 
		  code = 'D'
	    break; 
	}
	var jsonData = {};
	jsonData.code = code;
	jsonData.type = type;
	console.log("보낼데이터", jsonData)
	console.log("헤더", header)
	console.log("토큰", token)
	var typeAjax = new XMLHttpRequest();
	typeAjax.open("post", "/workfit/resource/typeList", true );
	typeAjax.onreadystatechange = () => {
		if(typeAjax.readyState == 4 && typeAjax.status == 200){
			
			var jsonText = JSON.parse(typeAjax.responseText);
			console.log(jsonText);
			var text = "";
			for(let i = 0; i< jsonText.length ; i++){
				text += "<tr>";
				text += `	<td>\${jsonText[i].resourceType}</td>`;
				text += `	<td>\${jsonText[i].resourceName}</td>`;
				text += `	<td>\${jsonText[i].resourcePlace}</td>`;
				text += `	<td>`;
				for(let j = 0 ; j < jsonText[i].fixtures.length ; j++){
					console.log(jsonText[i].fixtures[j].fixtureName);
					text += `\${jsonText[i].fixtures[j].fixtureName }`;
				}
				text += `	</td>`;
				text += `	<td><button class="btn btn-light showDetail" id="\${jsonText[i].resourceCode}" >상세보기</button></td>`;
				text += "</tr>";
			};
			listTbody.innerHTML = text;
		};
		// 새롭게 들어간 이벤트 등록하기!!!!!!
		detailEvent();
	};
	typeAjax.setRequestHeader(header, token);
	typeAjax.setRequestHeader('Content-Type', 'application/json;');
	typeAjax.send(JSON.stringify(jsonData));
};

// 단건 정보 가져오는 메소드
var showDetail = (resourceId) =>{
	console.log("showDetail 아이디", resourceId)
	var jsonResult;	
	var xhr = new XMLHttpRequest();
	xhr.open("post", '/workfit/resource/detail', false);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			jsonResult = xhr.responseText;
		}
	}
	xhr.setRequestHeader(header, token);
	xhr.send(resourceId);
	
	return jsonResult;
}

// 모달에 가져온 데이터 넣는 메소드
var detailTitle = document.querySelector("#resourceTitle");
var dbresourceImg = document.querySelector("#dbresourceImg");
var infoDiv = document.querySelector(".infos");
var insertDetailModal = (json) => {
	console.log("모달 값 넣기", json)
	// 자원 title 값 넣기
	detailTitle.innerHTML = json.resourceName;
	
	// 이미지 경로 넣기
	dbresourceImg.src = json.resourceImg;

	// 비품 정보 넣기
	var fixtureInfo = "";
	for(let info of json.fixtures){
		// 비품명
		fixtureInfo += info.fixtureName;		
	}
	console.log("비품정보", fixtureInfo);
	infoDiv.querySelectorAll("td")[1].innerHTML = fixtureInfo;
	
	// 자원 위치 넣기
	infoDiv.querySelectorAll("td")[4].innerHTML = json.resourcePlace;
	
	// 자원 설명 넣기
	infoDiv.querySelectorAll("td")[6].innerHTML = json.resourceInfo;
	
}
// ----------------------------모달에 가져온 데이터 넣는 메소드 끝
$(function(){
	
	// 데이터 테이블 변경 시작 ! 
	$.fn.dataTable.ext.errMode = 'none';
	$("#example").dataTable().fnDestroy();
	var lang_kor = {
		"search" : "검색 : ",
		"paginate" : {
                 "first" : "첫 페이지",
                 "last" : "마지막 페이지",
                 "next" : "<i class='dripicons-chevron-right'></i>",
                 "previous" : "<i class='dripicons-chevron-left'></i>"
             },
	};
	
	
	$('#datatable-buttons').DataTable({
		destroy : false,
		info : false,
		lengthChange : false,
		"pagingType": "simple_numbers",
		language : lang_kor
	});

	$('.dataTables_paginate').addClass('pagination-rounded');
		
		
	
	// 상세보기 버튼에 이벤트 주는함수
	detailEvent();
});

</script>
<style>
/* 드롭다운 메뉴 스타일 */
#dropdownMenuButton, #newResourceBtn{
	border:1px solid lightgrey; 
	color: black; 
	font-size: 18px;
}
</style>

