<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="/resources/lightbox/dist/js/lightbox.js"></script>
<style type="text/css">
/* .myDocGrid{ 
 	margin-right: 45px !important; 
 } */
.img-responsive{
	width : 100%;
}
.fileList .img-responsive{
	display : block;
	width: 350px;
	height: 350px;
	border: 1px solid rgba(0,0,0, .7);
	box-shadow : 0 0 10px #000;
}

#lightbox-overlay{
	opacity : 0;
	pointer-events : none;
	position : absolute;
	top : 0;
	left : 0;
	width : 100%;
	height : 130vh;
	background-color: rgba(0,0,0, .7);
	transition : all .3s linear;
}


#lightbox-overlay.visible{
	opacity : 1;
	pointer-events : auto;
	z-index : 10;
}

#lightbox-image{
	display:block;
	width : 50%;
	height : auto;
	align-items : center;
	position : absolute;
	top : 50%;
	left : 50%;
	transform : translate(-50%, -50%);
	border : 1px solid #000;
	box-shadow : 0 0 20px #fff;
	border-radius : 20px;
}



.file-box {
	float: left;
	width: 300px;
	height : 500px;
}

.file-manager h5 {
	text-transform: uppercase;
}

.file-manager {
	list-style: none outside none;
	margin: 0;
	padding: 0;
}

.folder-list li a {
	color: #666666;
	display: block;
	padding: 5px 0;
}

.folder-list li {
	border-bottom: 1px solid #e7eaec;
	display: block;
}

.folder-list li i {
	margin-right: 8px;
	color: #3d4d5d;
}

.category-list li a {
	color: #666666;
	display: block;
	padding: 5px 0; 
}

.category-list li {
	display: block;
}

.category-list li i {
	margin-right: 8px;
	color: #3d4d5d;
}

.category-list li a .text-navy {
	color: #1ab394;
}

.category-list li a .text-primary {
	color: #1c84c6;
}

.category-list li a .text-info {
	color: #23c6c8;
}

.category-list li a .text-danger {
	color: #EF5352;
}

.category-list li a .text-warning {
	color: #F8AC59;
}

.file-manager h5.tag-title {
	margin-top: 20px;
}

.tag-list li {
	float: left;
}

.tag-list li a {
	font-size: 10px;
	background-color: #f3f3f4;
	padding: 5px 12px;
	color: inherit;
	border-radius: 2px;
	border: 1px solid #e7eaec;
	margin-right: 5px;
	margin-top: 5px;
	display: block;
}

.file {
	border: 1px solid #e7eaec;
	padding: 0;
	background-color: #ffffff;
	position: relative;
	margin-bottom: 10px;
	margin-right: 10px;
}

.file-manager .hr-line-dashed {
	margin: 15px 0;
}

.file .icon, .file .image {
	height: 100px;
	overflow: hidden;
}

.file .icon {
	padding: 15px 10px;
	text-align: center;
}

.file-control {
	color: inherit;
	font-size: 11px;
	margin-right: 10px;
}

.file-control.active {
	text-decoration: underline;
}

.file .icon i {
	font-size: 70px;
	color: #dadada;
}

.file .file-name {
	padding: 10px;
	background-color: #f8f8f8;
	border-top: 1px solid #e7eaec;
}

.file-name small {
	color: #676a6c;
}

ul.tag-list li {
	list-style: none;
}

.corner {
	position: absolute;
	display: inline-block;
	width: 0;
	height: 0;
	line-height: 0;
	border: 0.6em solid transparent;
	border-right: 0.6em solid #f1f1f1;
	border-bottom: 0.6em solid #f1f1f1;
	right: 0em;
	bottom: 0em;
}

a.compose-mail {
	padding: 8px 10px;
}

.mail-search {
	max-width: 300px;
}

.ibox {
	clear: both;
	margin-bottom: 25px;
	margin-top: 0;
	padding: 0;
}

.ibox.collapsed .ibox-content {
	display: none;
}

.ibox.collapsed .fa.fa-chevron-up:before {
	content: "\f078";
}

.ibox.collapsed .fa.fa-chevron-down:before {
	content: "\f077";
}

.ibox:after, .ibox:before {
	display: table;
}

.ibox-title {
	-moz-border-bottom-colors: none;
	-moz-border-left-colors: none;
	-moz-border-right-colors: none;
	-moz-border-top-colors: none;
	background-color: #ffffff;
	border-color: #e7eaec;
	border-image: none;
	border-style: solid solid none;
	border-width: 3px 0 0;
	color: inherit;
	margin-bottom: 0;
	padding: 14px 15px 7px;
	min-height: 48px;
}

.ibox-content {
	background-color: #ffffff;
	color: inherit;
	padding: 15px 20px 20px 20px;
	border-color: #e7eaec;
	border-image: none;
	border-style: solid solid none;
	border-width: 1px 0;
}

.ibox-footer {
	color: inherit;
	border-top: 1px solid #e7eaec;
	font-size: 90%;
	background: #ffffff;
	padding: 10px 15px;
}

a:hover {
	text-decoration: none;
}
</style>

<c:set value="${fileList}" var="fileList" />

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<input type="hidden" id = "docCode" value="${docCode }"/>

	<div class="apple3 row mt-2">
		<div class="col-12">
			<div class='mr-2 card workfitCardBg'style="border-radius: 0.7rem;">
				<div class='card-body p-4'>
					<div class='card p-3' style="border-radius: 0.7rem;">

						<h5 class='apple4 page-title text-dark pl-3 pt-2'
							style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;' id="boardTitle"></h5>

						<hr class="ml-3 mr-3">
						<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size: 19px;">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
			           			<span class="badge badge-warning badge-pill">TIP</span><br>
			           			<span id="tipsDoc"></span> 
		           			</div> 
						</div>
					</div>
					<div class='card p-3' style="border-radius: 0.7rem;">
						<div class="card-body p-4">
			<!-- 				<div class="row"> -->
								<div class="card-title mb-10">
									<div class="row">
										<div class="col-md-6 offset-6 d-flex justify-content-end  pr-3" style="font-size: 20px">
											<button class="active btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Grid View" id="drive-grid-toggle" onclick="showListStyle(this)">
												<i class="fa fa-th-large"  style="font-size: 25px"></i>
											</button>
											<button class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="List View" id="drive-list-toggle" onclick="showListStyle(this)">
												<i class="fa fa-list-ul"  style="font-size: 25px"></i>
											</button>
										</div>
									</div>
									
									<div class="apple3 card-tools m-3 d-flex justify-content-end text-dark" >
			<!-- 								<div class="col-md-12"> -->
												<div class="input-group justify-content-end">
			<!-- 		<form class="input-group input-group-sm" id="searchForm" style="width: 440px;"> -->
												<div class="pr-1"style="width : 120px">
													<select class="form-control col-md-12" name="searchType" id="searchType">
														<option value="fileName" <c:if test="${searchType == 'fileName' }"><c:out value="selected"/></c:if>>파일명</option>
														<option value="fileType" <c:if test="${searchType == 'fileType' }"><c:out value="selected"/></c:if>>파일 종류</option>
													</select> 
												</div>
												<div class="pr-2">
													<input type="text" name="searchWord" value="${searchWord }" class="apple4 form-control float-right" placeholder="검색어를 입력해주십시오.">
												</div>
												<div class="input-group-append">
													<button id="searchBtn" type="button" class="btn btn-primary workfitBtn"><i class="dripicons-search"></i></button>
												</div>
			<!-- 									<button id="searchTypeBtn" class="btn btn-primary" type="button" onclick="myDocList('application/pdf')">PDF 검색</button> -->
			<!-- 								</form> -->
											</div>
									</div>
			<!-- 							</div> -->
								</div>
								<div id="lightbox-overlay">
									<img src="" alt="확대" id="lightbox-image">
								</div>
								<div class="content" id="ContentBody">
										<!-- Upload modal -->
										<div id="full-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
										    <div class="modal-dialog modal-lg">
										        <div class="modal-content" id="uploadModal">
										            <div class="modal-header">
										                <h4 class="modal-title" id="fullWidthModalLabel">Modal Heading</h4>
										                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										            </div>
										            <div class="modal-body">
										                ...
										            </div>
										            <div class="modal-footer">
										                <button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
										                <button type="button" class="btn btn-primary">Save changes</button>
										            </div>
										        </div><!-- /.modal-content -->
										    </div><!-- /.modal-dialog -->
										</div>
										<!-- Upload modal END -->
										
										<div class="row pt-2" id="fileList" style="justify-content: left;">
<!-- 										<div class="row pt-2" id="fileList" style="justify-content: left; margin-left: 61px;"> -->
											<div class="col-md-9 animated fadeInRight">
											</div>
										</div>
								</div>
							</div>
			
		
		
		
		
								</div>
					<!--  두번째 카드 ~~~~~~    -->
				</div>
			</div>
		<div class="card  mr-2  ">
		</div>
	</div>
</div>
	
<%-- 	<c:set var="freqDocList" value="${freqDocList }" /> --%>
<%-- 	<c:set var="mydoclist" value="${mydoclist }" /> --%>
	

<script>
	var fileList = document.querySelector('#fileList');
	var docCode = document.querySelector('#docCode').value;
	var btnGrid = document.querySelector('#drive-grid-toggle');
	var btnList = document.querySelector('#drive-list-toggle');
	var boardTitle = document.querySelector('h5#boardTitle');
	var docTips = document.querySelector('span#tipsDoc');
	var usageSize = document.querySelector('#usageSize');
	var totalSize = document.querySelector('#totalSize');
	var imgTotal = document.querySelector('#imgTotal');
	var imgTotalSize = document.querySelector('#imgTotalSize');
	var mediaTotal = document.querySelector('#mediaTotal');
	var mediaTotalSize = document.querySelector('#mediaTotalSize');
	var docTotal = document.querySelector('#docTotal');
	var docTotalSize = document.querySelector('#docTotalSize');
	var otherTotal = document.querySelector('#otherTotal');
	var otherTotalSize = document.querySelector('#otherTotalSize');
	var totalTotal = document.querySelector('#totalTotal');
	var totalTotalSize = document.querySelector('#totalTotalSize');
// 	var uploadModalBtn = document.querySelector('#uploadModalBtn');
	
	var searchBtn = document.querySelector('#searchBtn');
	var jsonCode = null;
	var jsonType = null;
	const imgType = ['image/png','image/jpeg','image/gif','image/jpg','image/jfif'];
	const docType = ['application/pdf','xlsx','ppt','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','application/octet-stream','text/plain','application/msword'];
	const mediaType = ['audio/mpeg','video/mp4','video/webm','video/ogg','video/avi','video/asf'];
// 	var searchForm = document.querySelector('#searchForm');
// 	let data = new FormData(searchForm);
// 	let serializedFormData = serialize(data);
// 	console.log(JSON.stringify(serializedFormData));
	
	document.querySelectorAll('.myDocGrid').forEach(ttt => console.log(ttt.clientWidth));
	var myDocSizeChanger = function(data){
		console.log(data); 
		data.style.width = "400px";
		data.style.height = "auto";
	}
	var myDocList = function(data){
	$("#uploadModal").load("/workfit/document/insertDoc/myDoc");
	
// 		myDiskSize();
		console.log("내 파일 ㅇㅇ");
		console.log("docCode :",docCode);
		jsonType = 'myDoc';
		console.log(jsonType);
		boardTitle.innerText = "My 클라우드";
		docTips.innerText = "My 클라우드는 본인만 접근 가능한 클라우드 스토리지입니다."
		var xhr = new XMLHttpRequest();
// 		var searchType = document.querySelector('select[name="searchType"] option:selected');
		
		if(data != null){
			if(data.searchWord != null){
				console.log("myDocList Data 값 : ", data);
				xhr.open("GET", "/workfit/document/mydocList?searchType="+data.searchType+"&searchWord="+data.searchWord,true);
			}else{
				console.log("myDocList 종류 버튼 Data 값 : ", data);
				xhr.open("GET", "/workfit/document/mydocList?searchBtn="+data,true);
			}
		}else{
			console.log("myDocList data가 안들어와 있음....?")
	 		xhr.open("GET", "/workfit/document/mydocList",true);			
		}
// 		xhr.open("GET", "/workfit/document/mydocList?searchWord="+data.searchWord+"&searchType="+data.searchType);
		
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				var json = JSON.parse(xhr.responseText);
				jsonCode = JSON.parse(xhr.responseText);
				var code ='';
				var docType = 'myDoc';
				for ( var item in json) {
				var fileCode= json[item].myDocCode;
				var fileDate = json[item].myDocDate;
				var filePath = json[item].myDocPath;
				var filePathSer = filePath.substr(2);
				var fileName = json[item].myDocName;
				let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
				var fileType = json[item].myDocType;
					code += `<div class="card myDocGrid mr-3" style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem; width : 300px">                                  `
// 					code += `<div class="card mr-3 myDocGrid" style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                                  `
					code += `	<div class="card-body row p-2">                                                                                      `
					code += `		<div class="col-5 text-center">                                                                              `
					/*
					if(imgType.indexOf(fileType) >= 0 ){
// 						code += `			<i class="dripicons-heart" style="font-size: 35px"></i>                                                  `
						code += `			<img src="\${filePathSer}small/\${fileName}" style="width : 100px" >                                                  `
					}else if(docType.indexOf(fileType) != -1){
						code += `			<i class="dripicons-document" style="font-size: 35px"></i>                                                  `
					}else if(mediaType.indexOf(fileType) != -1){
						code += `			<i class="dripicons-trash" style="font-size: 35px"></i>                                                  `
					}else if(fileType.indexOf('total') != -1){
						code += `			<i class="dripicons-star" style="font-size: 35px"></i>                                                  `
					}else{
						code += `			<i class="dripicons-cross" style="font-size: 35px"></i>                                                  `
					}
					*/
					let selectImg = selectIcoImg(fileType,filePathSer,fileName);
// 					console.log(selectImg);
					code += `\${selectImg}`;
// 					code += `			<i class="dripicons-music" style="font-size: 35px"></i>                                                  `
					code += `		</div>                                                                                                       `
					code += `		<div class="col-7">                                                                                          `
					code += `    		<div class="row">                                                                     `
					code += `    			<div class="text-dark" style="width:170px; margin-left: 5px; word-break: break-word; font-size: 24px;font-weight: 900;" > \${fileName}</div>                                                                     `
					code += `    			<div class="row"> </div>                                                                    `
					code += `    			<h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span style="font-size: 15px">\${fileDated}</span></h6>    `
					code += `    	  		<div class="row offset-3">                                                                                                    `
					code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
					code += `    	  				<span style="font-size: 25px"><a href="get/\${fileCode}"<i class="dripicons-download">  </i></a></span> `
					code += `    	  			</div>                                                                                                       `
					code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
					code += `    	  				<span style="font-size: 25px"><a href="javascript:void(0)" onclick="deleteDoc('\${fileCode}','\${docType}')"><i class="dripicons-trash"></i></a></span>    `
					code += `    	  			</div>                                                                                                       `
					code += `    	  		</div>                                                                                                       `
					code += `    		</div>                                                                                                       `
					code += `		</div>                                                                                                       `
				  	code += `	</div>                                                                                                           `
					code += `</div>                                                                                                              `
					
				}
				
				fileList.innerHTML = code;
				
			}
			coDiskSize(docType);
		};
		xhr.send();
	}
	const selectIcoImg = function (fileType,filePathSer,fileName){
		var imgType = ['image/png','image/jpeg','image/gif','image/jpg','image/jfif'];
		switch(fileType){
		case 'image/png': case 'image/jpeg': case 'image/gif': case 'image/jpg': case 'image/jfif':
			return `<img alt='image' class='img-responsive' src='\${filePathSer}/\${fileName}' data-lightboximg='\${filePathSer}/\${fileName}' width='140px' height='160px'>`;
// 			return `<img alt='image' class='img-responsive' src='/resources/uploads/background/jjeBG.jpg' data-lightboximg='\${filePathSer}/\${fileName}' width='140px' height='160px'>`;
		case 'application/pdf':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/pdf.svg' height='160px' style='margin-left: -20px;' >";
		case 'application/octet-stream':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/doc.svg' height='160px' style='margin-left: -20px;' >";
		case 'text/plain':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/txt.svg' height='160px' style='margin-left: -20px;' >";
		case 'application/msword':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/doc.svg' height='160px' style='margin-left: -20px;' >";
		case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet': case 'application/haansoftxlsx':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/xls.svg' height='160px' style='margin-left: -20px;' >";
		case 'audio/mpeg':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/mpg.svg' height='160px' style='margin-left: -20px;' >";
		case 'video/mp4':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/avi.svg' height='160px' style='margin-left: -20px;' >";
		case 'video/webm':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/pdf.svg' height='160px' style='margin-left: -20px;' >";
		case 'video/ogg':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/aac.svg' height='160px' style='margin-left: -20px;' >";
		case 'video/asf':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/mov.svg' height='160px' style='margin-left: -20px;' >";
		case 'video/wmv':
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/wmv.svg' height='160px' style='margin-left: -20px;' >";
		default:
			return "<img alt='application/pdf' class='ml-1 img-responsive' src='https://coderthemes.com/highdmin/layouts/assets/images/file_icons/raw.svg' height='160px' style='margin-left: -20px;' >";
		}
	}
	searchBtn.addEventListener('click',function(e){
		e.preventDefault();
// 		alert('버튼 클릭');
		var searchWord = document.querySelector('input[name="searchWord"]').value;
		var searchType = document.querySelector('select#searchType option:checked').value;
// 		console.log(searchWord,searchType);
		var data = {
				searchType : searchType,
				searchWord : searchWord,
			};
		myDocList(data);
	})
	/*
	uploadModalBtn.addEventListener('click',function(){
		console.log("버튼 누를 당시의 Upload modal",jsonType);
		if(jsonType == 'myDoc'){
			console.log("동작됨?");
// 			$(".modal-content").load("/workfit/document/insertDoc/myDoc");	
			$(".modal-content").load("/workfit/document/list");	
		}
	})
	*/
	var deptDocList = function(){
		$("#uploadModal").load("/workfit/document/insertDoc/deptDoc");
// 		console.log("부서 문서 !!!!!!!!!!");
// 		console.log(jsonType);
		boardTitle.innerText = "부서 클라우드";
		docTips.innerText = "부서 클라우드는 부서원만 접근 가능한 클라우드 스토리지입니다."
		jsonType = 'deptDoc';
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/document/deptdocList");
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				let json = JSON.parse(xhr.responseText);
				jsonCode = JSON.parse(xhr.responseText);
				var code ='';
				for ( var item in json) {
					var fileCode= json[item].deptDocCode;
					var fileDate = json[item].deptDocDate;
					var filePath = json[item].deptDocPath;
					var filePathSer = filePath.substr(2);
					var fileName = json[item].deptDocName;
					let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
					var fileType = json[item].deptDocType;
					
						code += `<div class="card mr-3 myDocGrid" style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                                  `
						code += `	<div class="card-body row">                                                                                      `
						code += `		<div class="col-5 text-center">                                                                              `
						/*
						if(imgType.indexOf(fileType) >= 0 ){
//	 						code += `			<i class="dripicons-heart" style="font-size: 35px"></i>                                                  `
							code += `			<img src="\${filePathSer}small/\${fileName}" style="width : 100px" >                                                  `
						}else if(docType.indexOf(fileType) != -1){
							code += `			<i class="dripicons-document" style="font-size: 35px"></i>                                                  `
						}else if(mediaType.indexOf(fileType) != -1){
							code += `			<i class="dripicons-trash" style="font-size: 35px"></i>                                                  `
						}else if(fileType.indexOf('total') != -1){
							code += `			<i class="dripicons-star" style="font-size: 35px"></i>                                                  `
						}else{
							code += `			<i class="dripicons-cross" style="font-size: 35px"></i>                                                  `
						}
						*/
						let selectImg = selectIcoImg(fileType,filePathSer,fileName);
						console.log(selectImg);
						code += `\${selectImg}`;
//	 					code += `			<i class="dripicons-music" style="font-size: 35px"></i>                                                  `
						code += `		</div>                                                                                                       `
						code += `		<div class="col-7">                                                                                          `
						code += `    		<div class="row">                                                                     `
						code += `    			<h3 class="text-dark" style="margin-left: 10px;" > \${fileName}</h3>                                                                     `
						code += `    			<div class="row"> </div>                                                                    `
						code += `    			<h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span style="font-size: 15px">\${fileDated}</span></h6>    `
						code += `    	  		<div class="row offset-5">                                                                                                    `
						code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
						code += `    	  				<span style="font-size: 25px"><a href="get/\${fileCode}"<i class="dripicons-download">  </i></a></span> `
						code += `    	  			</div>                                                                                                       `
						code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
						code += `    	  				<span style="font-size: 25px"><a href="javascript:void(0)" onclick="deleteDoc('\${fileCode}','\${jsonType}')"><i class="dripicons-trash"></i></a></span>    `
						code += `    	  			</div>                                                                                                       `
						code += `    	  		</div>                                                                                                       `
						code += `    		</div>                                                                                                       `
						code += `		</div>                                                                                                       `
					  	code += `	</div>                                                                                                           `
						code += `</div>                                                                                                              `
						
					}
				
				
				fileList.innerHTML = code;
// 				fileList.innerHTML = '<h5>'+json[0].myDocCode+'</h5>';
				console.log("출력값 : " ,json);
// 				var days = json.businessTripDate.split(" ~ ");
// 				var expenseJson = JSON.parse(json.businessTripExpense);
			}
			coDiskSize(jsonType);
		};
		xhr.send();
	}
	
	
	
	const deleteDoc = function(code,docType){
		console.log("이벤트 : ",code);
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/document/delete/"+docType+"/"+code);
		xhr.onreadystatechange = function (mydocList){
			if(xhr.readyState == 4 && xhr.status == 200){
// 				let result = JSON.parse(xhr.responseText);
				if(xhr.responseText == "success"){
					console.log("부모 div 삭제하기..>!!");
// 					console.log("this는 담배!",e);
				}
				if(docType='myDoc'){
					console.log("myDOc이 삭제되어 흐뭇한 콘솔록좌..")
					myDocList();
				}else if(docType='deptDoc'){
					console.log("deptDoc이 삭제되어 흐뭇한 콘솔록좌..")
					deptDocList();
				}
				
			}
		};
		xhr.send();
	}
// 	const deleteMyDoc = function(code,docType){
// 		console.log("이벤트 : ",code);
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("get", "/workfit/document/delete/"+docType+"/"+code);
// 		xhr.onreadystatechange = function (mydocList){
// 			if(xhr.readyState == 4 && xhr.status == 200){
// // 				let result = JSON.parse(xhr.responseText);
// 				if(xhr.responseText == "success"){
// 					console.log("부모 div 삭제하기..>!!");
// 					console.log("this는 담배!",e);
// 				}
// 				myDocList();
// 			}
// 		};
// 		xhr.send();
// 	}
	
	
	var publicDocList = function(){
		$("#uploadModal").load("/workfit/document/insertDoc/publicDoc");
		console.log("공동 유틸 ㅇㅇ");
		boardTitle.innerText = "공용 클라우드";
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/workfit/document/publicdocList");
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				var json = JSON.parse(xhr.responseText);
				let code = '';
				

				code += `<div class="row pt-2" id="fileList" style="justify-content: left; margin-left: 61px;">                                     `;
				code += `    <div class="card mr-3 myDocGrid"                                                                                       `;
				code += `        style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                      `;
				code += `        <div class="card-body row">                                                                                        `;
				code += `            <div class="col-5 text-center"> <img alt="application/pdf" class="img-responsive"                              `;
				code += `                    src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/pdf.svg" height="160px"         `;
				code += `                    style="margin-left: -20px;"> </div>                                                                    `;
				code += `            <div class="col-7">                                                                                            `;
				code += `                <div class="row">                                                                                          `;
				code += `                    <h3 class="text-dark"> &nbsp;&nbsp;VSCode 1.68.1.exe</h3>                                                       `;
				code += `                    <div class="row"> </div>                                                                               `;
				code += `                    <h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span                                   `;
				code += `                            style="font-size: 15px">2023.02.06 21:02</span></h6>                                           `;
				code += `                    <div class="row offset-3">                                                                             `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="get/md136" <i="" class="dripicons-download"> </a></span> </div>                  `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="javascript:void(0)" onclick="deleteDoc('md136','myDoc')"><i                      `;
				code += `                                        class="dripicons-trash"></i></a></span> </div>                                     `;
				code += `                    </div>                                                                                                 `;
				code += `                </div>                                                                                                     `;
				code += `            </div>                                                                                                         `;
				code += `        </div>                                                                                                             `;
				code += `    </div>                                                                                                                 `;
				code += `    <div class="card mr-3 myDocGrid"                                                                                       `;
				code += `        style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                      `;
				code += `        <div class="card-body row">                                                                                        `;
				code += `            <div class="col-5 text-center"> <img alt="application/pdf" class="img-responsive"                              `;
				code += `                    src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/raw.svg" height="160px"         `;
				code += `                    style="margin-left: -20px;"> </div>                                                                    `;
				code += `            <div class="col-7">                                                                                            `;
				code += `                <div class="row">                                                                                          `;
				code += `                    <h3 class="text-dark"> &nbsp;&nbsp;KakaoTalk.exe</h3>                             `;
				code += `                    <div class="row"> </div>                                                                               `;
				code += `                    <h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span                                   `;
				code += `                            style="font-size: 15px">2023.02.06 21:02</span></h6>                                           `;
				code += `                    <div class="row offset-3">                                                                             `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="get/md141" <i="" class="dripicons-download"> </a></span> </div>                  `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="javascript:void(0)" onclick="deleteDoc('md141','myDoc')"><i                      `;
				code += `                                        class="dripicons-trash"></i></a></span> </div>                                     `;
				code += `                    </div>                                                                                                 `;
				code += `                </div>                                                                                                     `;
				code += `            </div>                                                                                                         `;
				code += `        </div>                                                                                                             `;
				code += `    </div>                                                                                                                 `;
				code += `    <div class="card mr-3 myDocGrid"                                                                                       `;
				code += `        style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                      `;
				code += `        <div class="card-body row">                                                                                        `;
				code += `            <div class="col-5 text-center"> <img alt="application/pdf" class="img-responsive"                              `;
				code += `                    src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/raw.svg" height="160px"         `;
				code += `                    style="margin-left: -20px;"> </div>                                                                    `;
				code += `            <div class="col-7">                                                                                            `;
				code += `                <div class="row">                                                                                          `;
				code += `                    <h3 class="text-dark"> &nbsp;&nbsp;Chrome.exe</h3>                                                `;
				code += `                    <div class="row"> </div>                                                                               `;
				code += `                    <h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span                                   `;
				code += `                            style="font-size: 15px">2023.02.06 21:02</span></h6>                                           `;
				code += `                    <div class="row offset-3">                                                                             `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="get/md143" <i="" class="dripicons-download"> </a></span> </div>                  `;
				code += `                        <div class="col-md-6" style="text-align: center;"> <span style="font-size: 25px"><a                `;
				code += `                                    href="javascript:void(0)" onclick="deleteDoc('md143','myDoc')"><i                      `;
				code += `                                        class="dripicons-trash"></i></a></span> </div>                                     `;
				code += `                    </div>                                                                                                 `;
				code += `                </div>                                                                                                     `;
				code += `            </div>                                                                                                         `;
				code += `        </div>                                                                                                             `;
				code += `    </div>                                                                                                                 `;
				code += `</div>																														`;														
				fileList.innerHTML = code;
				console.log("출력값 : " ,json);
// 				console.log("출력값 : " ,json[0].publicDocCode);
			}
		};
		xhr.send();
	}
	
	var checkFileDown = function(){
		console.log("체크 파일 다운로드");
		var xhr = new XMLHttpRequest();
		xhr.open("post", "/workfit/document/getCheck");
		var reqObj = new Object();
		
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4 && xhr.status == 200){
				var json = JSON.parse(xhr.responseText);
			}
		};
		xhr.send();
	}
		
	var showListStyle = function(bthis){
		console.log('showListStyle() On',bthis.id);
		var fileCodeE = document.querySelector('.file-name');
		console.log("jsonCode", jsonCode);
		let json = jsonCode;
		console.log("리스트 JSON :")
// 		jsonValue(json);
		console.log("showList Style :",jsonType);
		
		if(jsonType == 'myDoc' && bthis.id === 'drive-list-toggle'){
// 			alert('my Doc List 형식에 들어왔습니다.');
// 			console.log("file이름 값? : ",fileCodeE.innerText.split(" ")[0])
			let code = '';	
		
			code += `<table class="table table-hover table-centered mb-0">  `
			code += `<thead>                                                `
			code += `	<tr>                                                `
// 			code += `		<th class="apple2" scope="col">북마크</th>      `
			code += `		<th class="apple4" scope="col">순번</</th>  `
// 			code += `		<th class="apple2" scope="col">문서번호</</th>  `
			code += `		<th class="apple2" scope="col">부서번호</</th>  `
			code += `		<th class="apple2" scope="col">파일이름</th>    `
// 			code += `		<th class="apple2" scope="col">저장이름</th>    `
			code += `		<th class="apple2" scope="col">파일크기</th>    `
// 			code += `		<th class="apple2" scope="col">저장경로</th>    `
			code += `		<th class="apple2" scope="col">파일종류</th>    `
			code += `		<th class="apple2" scope="col">작성일</th>      `
// 			code += `		<th class="apple2" scope="col">작성자</th>      `
			code += `	</tr>                                               `
			code += `</thead>                                               `
			code += `<tbody>`
			code += `	<tr> `
			let cnt = 1;
			for(let item in json){
				let fileCode = json[item].myDocCode;
				let fileDate = json[item].myDocDate;
				let filePath = json[item].myDocPath;
				let filePathSer = filePath.substr(2);
				let fileName = json[item].myDocName;
				let fileNewName = json[item].myDocNewname;
				let fileSize = json[item].myDocSize;
				let fileSizeT = formatBytes(fileSize);
				let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
				let fileType = json[item].myDocType;
				let fileWriter = json[item].memId;
				let fileWriterDept = json[item].deptCode;
				let fileDocCode = json[item].docCode;
				if (fileType == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'){
					fileType = 'xls';
				}
				code += `     <td class="apple4 text-dark"> \${cnt++} </td>`
// 				code += `     <td class="apple4 text-dark"><a href="get/\${fileCode}"> \${fileCode}</a>  </td>`
// 				code += `     <td class="apple4 text-dark"> \${fileDocCode}  </td>`
				code += `     <td class="apple4 text-dark"> \${fileWriterDept}  </td>`
				code += `     <td class="apple4 text-dark"> \${fileName}  </td>`
// 				code += `     <td class="apple4 text-dark"> \${fileNewName}  </td>`
				code += `     <td class="apple4 text-dark"> \${fileSizeT}  </td>`
// 				code += `     <td class="apple4 text-dark"> \${filePath}  </td>`
				code += `     <td class="apple4 text-dark"> \${fileType}  </td>`
				code += `     <td class="apple4 text-dark"> \${fileDated}  </td>`
// 				code += `     <td class="apple4 text-dark"> \${fileWriter}  </td>`
				code += `</tr>`;
				}
			
			code += `</tbody>`
			code += `</table>`
			
			fileList.innerHTML = code;
		
		}
		else if(jsonType == 'myDoc' && bthis.id === 'drive-grid-toggle'){
			console.log('my Doc Grid 형식에 들어왔습니다.');
			
			
			let code = '';
			for ( var item in json) {
				var fileCode= json[item].myDocCode;
				var fileDate = json[item].myDocDate;
				var filePath = json[item].myDocPath;
				var filePathSer = filePath.substr(2);
				var fileName = json[item].myDocName;
				let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
				var fileType = json[item].myDocType;
					code += `<div class="card mr-3 myDocGrid" style="box-shadow: 1px 1px 10px #939393; border-radius: 0.7rem;min-width: 20%;width: 360px;">                                  `
					code += `	<div class="card-body row">                                                                                      `
					code += `		<div class="col-5 text-center">                                                                              `
					/*
					if(imgType.indexOf(fileType) >= 0 ){
// 						code += `			<i class="dripicons-heart" style="font-size: 35px"></i>                                                  `
						code += `			<img src="\${filePathSer}small/\${fileName}" style="width : 100px" >                                                  `
					}else if(docType.indexOf(fileType) != -1){
						code += `			<i class="dripicons-document" style="font-size: 35px"></i>                                                  `
					}else if(mediaType.indexOf(fileType) != -1){
						code += `			<i class="dripicons-trash" style="font-size: 35px"></i>                                                  `
					}else if(fileType.indexOf('total') != -1){
						code += `			<i class="dripicons-star" style="font-size: 35px"></i>                                                  `
					}else{
						code += `			<i class="dripicons-cross" style="font-size: 35px"></i>                                                  `
					}
					*/
					let selectImg = selectIcoImg(fileType,filePathSer,fileName);
					console.log(selectImg);
					code += `\${selectImg}`;
// 					code += `			<i class="dripicons-music" style="font-size: 35px"></i>                                                  `
					code += `		</div>                                                                                                       `
					code += `		<div class="col-7">                                                                                          `
					code += `    		<div class="row">                                                                     `
					code += `    			<h3 class="text-dark"> &nbsp;&nbsp;\${fileName}</h3>                                                                     `
					code += `    			<div class="row"> </div>                                                                    `
					code += `    			<h6 class="apple5 text-dark offset-3" style="font-size: 10px;"><span style="font-size: 15px">\${fileDated}</span></h6>    `
					code += `    	  		<div class="row offset-3">                                                                                                    `
					code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
					code += `    	  				<span style="font-size: 25px"><a href="get/\${fileCode}"<i class="dripicons-download">  </i></a></span> `
					code += `    	  			</div>                                                                                                       `
					code += `    	  			<div class="col-md-6" style="text-align: center;">                                                                                                    `
					code += `    	  				<span style="font-size: 25px"><a href="javascript:void(0)" onclick="deleteMyDoc('\${fileCode}')"><i class="dripicons-trash"></i></a></span>    `
					code += `    	  			</div>                                                                                                       `
					code += `    	  		</div>                                                                                                       `
					code += `    		</div>                                                                                                       `
					code += `		</div>                                                                                                       `
				  	code += `	</div>                                                                                                           `
					code += `</div>                                                                                                              `
					
				}
			fileList.innerHTML = code;
			}
			else if(jsonType == 'deptDoc' && bthis.id === 'drive-list-toggle'){
// 				alert('dept List 형식에 들어왔습니다.');
				let code = '';	
					code += `<table class="table table-hover table-centered mb-0"> `
					code += `<thead>                                                `
					code += `	<tr>                                                `
// 					code += `		<th class="apple2" scope="col">북마크</th>      `
// 					code += `		<th class="apple2" scope="col">문서번호</</th>  `
					code += `		<th class="apple4" scope="col">순번</</th>  `
					code += `		<th class="apple2" scope="col">부서번호</</th>  `
					code += `		<th class="apple2" scope="col">파일이름</th>    `
// 					code += `		<th class="apple2" scope="col">저장이름</th>    `
					code += `		<th class="apple2" scope="col">파일크기</th>    `
// 					code += `		<th class="apple2" scope="col">저장경로</th>    `
					code += `		<th class="apple2" scope="col">작성자</th>      `
					code += `		<th class="apple2" scope="col">작성일</th>      `
					code += `		<th class="apple2" scope="col">파일종류</th>    `
					code += `	</tr>                                               `
					code += `</thead>                                               `
					code += `<tbody>`
					code += `	<tr> `
					
					let cnt = 1;
					for(let item in json){
						let fileCode = json[item].deptDocCode;
						let fileDate = json[item].deptDocDate;
						let filePath = json[item].deptDocPath;
						let filePathSer = filePath.substr(2);
						let fileName = json[item].deptDocName;
						let fileNewName = json[item].deptDocNewname;
						let fileSize = json[item].deptDocSize;
						let fileSizeT = formatBytes(fileSize);
						let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
						let fileType = json[item].deptDocType;
						let fileWriter = json[item].memId;
						let fileWriterDept = json[item].deptCode;
						let fileDocCode = json[item].docCode;
						
						code += `     <td class="apple4 text-dark"> \${cnt++} </td>`
//			 			code += `     <td class="apple4 text-dark"><a href="get/\${fileCode}"> \${fileCode}</a>  </td>`
//			 			code += `     <td class="apple4 text-dark"> \${fileDocCode}  </td>`
						code += `     <td class="apple4 text-dark"> \${fileWriterDept}  </td>`
						code += `     <td class="apple4 text-dark"> \${fileName}  </td>`
//			 			code += `     <td class="apple4 text-dark"> \${fileNewName}  </td>`
						code += `     <td class="apple4 text-dark"> \${fileSizeT}  </td>`
//			 			code += `     <td class="apple4 text-dark"> \${filePath}  </td>`
			 			code += `     <td class="apple4 text-dark"> \${fileWriter}  </td>`
						code += `     <td class="apple4 text-dark"> \${fileDated}  </td>`
						code += `     <td class="apple4 text-dark"> \${fileType}  </td>`
						code += `</tr>`;
						}
					
					code += `</tbody>`
					code += `</table>`
					
					fileList.innerHTML = code;
			}
			else if(jsonType == 'deptDoc' && bthis.id === 'drive-grid-toggle'){
// 				alert('dept Doc Grid 형식에 들어왔습니다.');
				
				let code = '';
				
				for ( var item in json) {
					let fileCode = json[item].deptDocCode;
					let fileDate = json[item].deptDocDate;
					let filePath = json[item].deptDocPath;
					let filePathSer = filePath.substr(2);
					let fileName = json[item].deptDocName;
					let fileNewName = json[item].deptDocNewname;
					let fileSize = json[item].deptDocSize;
					let fileSizeT = formatBytes(fileSize);
					let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
					let fileType = json[item].deptDocType;
					let fileWriter = json[item].memId;
					let fileWriterDept = json[item].deptCode;
					let fileDocCode = json[item].docCode;
					
					
//	 				console.log("fileName",fileName);
					code += `<div class="file-box">`
					code += `<div class="file">`
					code += `<a href="get/\${fileCode}">`
					code += `<span class="corner"></span>`
						if(fileType == 'image/jpeg'){
							code += `<div class='image'>`
							code += `<img alt='image' class='img-responsive' src='\${filePathSer}small/\${fileName}' height='200px'>`
// 							alert('img');
						}else{
							code += `<div class="icon">`
// 							alert('icon');
						}
					
//	 				code += `<div class="icon">`
					code += `<i class="img-responsive fa fa-film"></i>`
					code += `</div>`
//	 				code += `<div class="file-name">a`
					code += `<div class="file-name">\${fileName} \${fileType}`
					code += `<br> \${fileSizeT}`
					code += `<small>추가날짜: \${fileDated}</small>`
					code += `</div>`
					code += `</a>`
					code += `</div>`
					code += `</div>`
				}
				fileList.innerHTML = code;
			}
	}
	
	var jsonValue = function(item){
// 		alert('함수 json에 들어옴');
		console.log(item);
		for(let item in json){
			let fileCode = json[item].myDocCode;
			let fileDate = json[item].myDocDate;
			let filePath = json[item].myDocPath;
			let filePathSer = filePath.substr(2);
			let fileName = json[item].myDocName;
			let fileNewName = json[item].myDocNewname;
			let fileSize = json[item].myDocSize;
			let fileDated = dayjs(fileDate).format("YYYY.MM.DD HH:MM");
			let fileType = json[item].myDocType;
			let fileWriter = json[item].memId;
			let fileWriterDept = json[item].deptCode;
			let fileDocCode = json[item].docCode;
		}
	}
	
	function formatBytes(bytes, decimals = 2) {
	    if (bytes === 0) return '0 Bytes';		// 숫자 형식까지 완벽하게 0 이면 0 Bytes

	    const k = 1024;							// 2의 10승, 용량 별 단위 구간.
	    const dm = decimals < 0 ? 0 : decimals;
	    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

	    const i = Math.floor(Math.log(bytes) / Math.log(k));

	    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
	};
	
	
	

	
	
	$(function(){
// 		$(".modal-content").load("/workfit/document/insertDoc/myDoc");
		document.addEventListener('click',lightbox);
		function lightbox(e){
// 			e.preventDefault();
			const elem = e.target;
			const elemId = elem.getAttribute('id');
			const lightboxOverlay = document.querySelector("#lightbox-overlay");
			const lightboxImage = document.querySelector("#lightbox-image");
			
			if(elem.hasAttribute('data-lightboximg')){
				lightboxOverlay.classList.add('visible');
				const newImage = elem.getAttribute('data-lightboximg');
				lightboxImage.setAttribute('src',newImage);
			}
			if(elemId == 'lightbox-overlay' ||elemId == 'lightbox-image'){
				lightboxOverlay.classList.remove('visible');
				lightboxImage.setAttribute('src','');
			}
		}
		myDocList();
	});
</script>