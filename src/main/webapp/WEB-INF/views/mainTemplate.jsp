<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>WORKFIT</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description">
<meta content="Coderthemes" name="author">
<!-- App favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/logo/workfitLogo.png">
<!-- 대시보드 css -->
<link href="/resources/assets/css/weather.css" rel="stylesheet" type="text/css"> <!-- 날씨 CSS -->
<link href="/resources/assets/css/dashAni.css" rel="stylesheet" type="text/css">	<!-- 애니메이션 CSS -->

<!-- 전자결재 css -->
<link href="/resources/assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/vendor/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
 <link href="/resources/assets/css/vendor/summernote-bs4.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resources/customCSS/datepickerCSS.css" />
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
<!-- App css -->
<link href="/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css">
<link href="/resources/assets/css/app-modern.min.css" rel="stylesheet" type="text/css" id="light-style">
<link href="/resources/assets/css/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" disabled="disabled">
	
<link href="/resources/assets/css/vendor/simplemde.min.css" rel="stylesheet" type="text/css">
	
<!-- 근태관리 도넛 차트 css 시작 -->
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<!-- 근태관리 도넛 차트 css 끝 -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!--  dayjs 날짜 얻는 것~! -->
<script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.7/locale/ko.min.js"></script>
<!-- dayjs 해당 일정 사이에 포함되어있는지 사용 하기 !! -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/plugin/isBetween.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/plugin/isSameOrBefore.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/plugin/isSameOrAfter.min.js"></script>
<script>
	dayjs.locale('ko');
	dayjs.extend(dayjs_plugin_isSameOrAfter);
	dayjs.extend(dayjs_plugin_isSameOrBefore);
	dayjs.extend(dayjs_plugin_isBetween);
</script>
<!-- dayjs 끝 -->

<!-- axios -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<!--  xml to json -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>

<!-- 엑셀투제이슨 sheetjs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!-- FileSaver saveAs CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>

<!-- dragula -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor/dragula.min.js"></script>




<!-- 메일을 위한 js 시작 -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor/simplemde.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.inbox.js"></script>

<!-- 메일에서 파일 업로드 위한 js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/vendor/dropzone.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/ui/component.fileupload.js"></script> --%>
<!-- 메일을 위한 js 끝 -->


<!-- ckeditor -->
<script src="/resources/ckeditor/ckeditor.js"></script>

<!-- 조직도 트리를 위한 CSS 코드 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.css" />
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/screen.css" /> --%>
<!-- jQTree API CDN 코드 -->
<script
	src="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.js"
	type="text/javascript"></script>

<!-- 부서의 조직도를 위한 googlechart API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 조직도 트리를 위한 CSS(letfNav바에서) -->

<!-- APEX 차트 CDN코드 시작 -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/vendor/apexcharts.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.apex-column.js"></script> --%>
<!-- APEX 차트 CDN코드 끝 -->
		<!-- 조직도 트리를 위한 CSS 코드 -->
<%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.css"/> --%>
<%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/screen.css" /> --%>
		<!-- jQTree API CDN 코드 -->
		<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/jquery.cookie.js"></script>
		<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.js" type="text/javascript"></script>
		
		<!-- 부서의 조직도를 위한 googlechart API -->
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<!-- 조직도 트리를 위한 CSS(letfNav바에서) -->
		
		<!--  토스트 알러트 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
		
			
		<!-- CHART.JS 가장 최신버전 시작 -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<!-- CHART.JS 가장 최신버전 끝 -->
		
		
		
<style>
#codeList {
	display: inline-block;
}


#codeList span {
	font-size: 15px;
}

.filetree li {
 	padding: 3px 0 3px 16px !important; 
}

#mycontent {
	display: inline-block;
}

#contextmenu {
	text-align: left;
}


.blackBtn{
	background-color:black; color:white; border-radius:27px;
}


		#codeList{
			display : inline-block;
	
			}
		/* 조직도에서 우클릭 시 나타나는 메뉴창에 대한 CSS 시작 */
		.mymenu:hover {
/* 		  background: #CE93D8; */
/* 		  border-left: 3px solid #9C27B0; */
		}
		/* 조직도에서 우클릭 시 나타나는 메뉴창에 대한 CSS 끝 */
		#codeList span{
			font-size : 15px;
		}
		
		.filetree li { padding: 3px 0 15px 16px; }
		
		#mycontent{
			display : inline-block;
		}
		
		
		
		#contextmenu {
		text-align: left;
		}		
		
/* 	카드 설정  */
	.workfitCardBg{
		border-radius:0.85rem !important; 
		background-color:rgba(255,255,255,0.85) !important;
	}
	
/* 	진지한 버튼 설정 */
	.workfitBtn{
		font-size:13px; color:white; background-color:#5F7CBB;  border:none;
	}
/* 왕진지 버튼 설정 */
	.workfitBtn2{
		font-size:13px; color:white; background-color:#5F7CBB;  border:none; padding:11px;
	}

/* 커서 */
	.workfitMouse{
		cursor: pointer;
	}


.btn-primary:hover{
	background-color: #5F7CBB !important;
	border-color: none !importnat;
}	

/* .btn:hover{ */
/* 	color:white !important; */
/* } */
	
/* 토스트 알람  */

#toast-container > .toast-success{ 
 	background-color: rgb(112, 179, 145); 
	text-align: center;
	border-radius: 15px;
}

#toast-container > .toast-error{ 
	background-color: rgb(206,112,105); 
	text-align: center;
	border-radius: 15px;
}

.headCenter{
	top: 100px;
	margin: 0 auto;
	left: 50%;
}

input:focus{
	outline:none;
}

/* 데이터 테이블 */
 /*줄*/
 #datatable-buttons > tr{
 	border-color: #dbdee0 !important;
 }

button {
  border: 0;
  background: none;
  cursor: pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 30px -25px #061626;
  top: 100px;
  left: 100px;
  width : 500px;
  height : 710px;
  display: none;
}
.main_popup.on {
  display: block;
  background-color: #fff;
}
.main_popup .img_wrap {
  width: 500px;
  height: 600px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: -10px;
}
.main_popup .btn_close {
  width: 32px;
  height: 32px;
  position: absolute;
  top: 17px;
  right: 17px;
  font-size: 0;
  border: 0;
  z-index : 11;
  background: none;
}
.main_popup .btn_close::before {
  content: "";
  width: 2px;
  height: 14px;
  background-color: #998f8f;
  position: absolute;
  top: 0;
  left: 14px;
  transform: rotate(45deg);
}
.main_popup .btn_close::after {
  content: "";
  width: 14px;
  height: 2px;
  background-color: #998f8f;
  position: absolute;
  top: 6px;
  left: 8px;
  transform: rotate(45deg);
}
.main_popup .btn_today_close {
  width: 100%;
  height: 50px;
  background-color: #fff;
  text-align: center;
  color: #e00;
  font-size: 14px;
  display: block;
}
.main_popup .btn_today_close span {
  display: block;
  line-height: 10px;
  vertical-align: bottom;
  opacity: 0.8;
}
.table tr:hover{
  	background-color: #e7ecf1;  
}



	
	</style>
<script>
	/* 토스트 알러트 설정 */
	toastr.options = {
            closeButton: false,
            progressBar: false,
            positionClass:'headCenter',
            timeOut: 500
        };
/* 	ChatBot Main Function	*/	
// 	const checkStatus = function(){
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET","/workfit/chatbot/status",true);
// 		xhr.onreadystatechange = function(){
// 			if(xhr.readyState == 4 && xhr.status == 200){
// // 				console.log(xhr.responseText);
// 				let chkValue = JSON.parse(xhr.responseText);
// // 				chatbotStatus = chkValue.CHATBOT_STATUS;
// 				statusFlag.value = chkValue.CHATBOT_STATUS;
// // 				console.log("여기요? ",statusFlag);
// 				if(statusFlag.value == 'y'){
// // 					console.log("채팅봇이 구매된 상태입니다.");
// 					chatbotMain.style.display='block';
// 				}else{
// // 					console.log("채팅봇이 구매되지 않았습니다.");
// 					chatbotMain.style.display='none';
// 				}
// 			}
// 		}
// 		xhr.send();
// 	}
		
	

	$(function(){
// 		checkStatus();
// 		toggleMainPopup();
	});
</script>
</head>
			<body class="" data-layout="detached"
			data-layout-config="{&quot;leftSidebarCondensed&quot;:false,&quot;darkMode&quot;:false, &quot;showRightSidebarOnStart&quot;: true}"
			style="margin-left: 0px; margin-right: 0px; max-width: 100% !important; 
			background-image: url(/resources/uploads/background/background.jpg); background-size: cover;">
<%-- 	<c:if test="${empty jjebg }"> --%>
<!-- 		<body class="" data-layout="detached" -->
<!-- 			data-layout-config="{&quot;leftSidebarCondensed&quot;:false,&quot;darkMode&quot;:false, &quot;showRightSidebarOnStart&quot;: true}"> -->
<%-- 	</c:if> --%>
<!-- <body class="" data-layout="detached" -->
<!-- 	data-layout-config="{&quot;leftSidebarCondensed&quot;:false,&quot;darkMode&quot;:false, &quot;showRightSidebarOnStart&quot;: true}"> -->
	<div class="navbar-custom topnav-navbar "  style="background-color:rgba(255,255,255,0.7) !important;">
		<!-- 헤더 들어갈 자리 -->
		<tiles:insertAttribute name="header" />
	</div>
<%-- 	<c:if test="${!empty jjebg  }"> --%>
<!-- 		<div class="container-fluid mm-active" id="bigContainer" -->
<!-- 			style="margin-left: 0px; margin-right: 0px; max-width: 100% !important;  -->
<!-- 			background-image: url(/resources/uploads/background.jpg); background-size: cover;"> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${empty jjebg }"> --%>
<!-- 		<div class="container-fluid mm-active" id="bigContainer" -->
<!-- 			style="margin-left: 0px; margin-right: 0px !important;"> -->
<%-- 	</c:if> --%>
		<div class="wrapper mm-show">
			<!--  왼쪽 사이드 메뉴 들어갈 자리 -->
			<tiles:insertAttribute name="leftNav" />
			<div class="content-page pl-2">
				<div class="content">
					<!--  내용 들어갈 자리  -->
					<tiles:insertAttribute name="content" />
					<!-- Chatbot -->
<!-- 					<input type="hidden" id="statusFlag" value=""/> -->
<!-- 					<div class="digibot-sc-launcher " tabindex="0" dir="ltr" style="background-color: transparent; box-shadow: none; border-radius: 0%;"> -->
<!-- 						<img class="digibot-sc-open-icon" id="chatbotMain" src="/resources\assets\images\ico-messenger.png" title="Workfit 챗봇입니다"" -->
<!-- 							aria-label="Workfit 챗봇입니다" style="transition-property: none;position: fixed;top: 82%;left: 92%;display: none;"> -->
<!-- 					</div> -->
					<div class="main_popup"></div>
					<!-- Chatbot End -->
				</div>
				<footer class="footer">
					<!-- 푸터 들어갈 자리 -->
<%-- 					<tiles:insertAttribute name="footer" /> --%>
				</footer>
			</div>
		</div>
		<!-- end wrapper-->
	</div>
	<!-- END Container -->


	<!-- bundle -->
	<script src="/resources/assets/js/vendor.min.js"></script>
	<script src="/resources/assets/js/app.min.js"></script>
	<script src="/resources/assets/js/vendor/dragula.min.js"></script>
	<script src="/resources/assets/js/ui/component.dragula.js"></script>


	<!-- Datatables js -->
	<script src="/resources/assets/js/vendor/jquery.dataTables.min.js"></script>
	<script src="/resources/assets/js/vendor/dataTables.bootstrap4.js"></script>
	<script src="/resources/assets/js/vendor/dataTables.responsive.min.js"></script>
	<script src="/resources/assets/js/vendor/responsive.bootstrap4.min.js"></script>
	<script src="/resources/assets/js/pages/demo.datatable-init.js"></script>

	<script src="/resources/assets/js/vendor/dataTables.buttons.min.js"></script>
	<script src="/resources/assets/js/vendor/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/js/vendor/buttons.html5.min.js"></script>
	<script src="/resources/assets/js/vendor/buttons.flash.min.js"></script>
	<script src="/resources/assets/js/vendor/buttons.print.min.js"></script>
	<script src="/resources/assets/js/vendor/summernote-bs4.min.js"></script>
	
	<!-- 근태관리 도넛 차트 CDN 시작  -->
<!-- 	<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script> -->
	<!-- 근태관리 도넛 차트 CDN 끝 -->

	
	
	
<!--  오늘의 할 일  -->
<!-- todoList 모달창 -->

<!-- 	<div id="toDoListModal" class="modal fade" tabindex="-1" role="dialog" -->
<!-- 		aria-labelledby="standard-modalLabel" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content" style="border-radius: 27px;"> -->
<!-- 				<div class="modal-header pl-4 pr-4"> -->
<!-- 					<h4 class="modal-title apple4 text-dark" id="standard-modalLabel"> -->
<!-- 						<i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일 -->
<!-- 					</h4> -->
<!-- 					<div class="d-flex text-align-start"> -->
<!-- 						<h6 class="modal-title apple4 text-dark ml-1" id="toDoListTime"></h6> -->
<!-- 					</div> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-hidden="true">×</button> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div class="card-body p-3 text-center" -->
<!-- 						style="border-radius: 20px; background-color: inherit;"> -->
<!-- 						<div class="mb-4"> -->
<!-- 							<input class="apple5 text-dark" type="text" id="insertTodo" -->
<!-- 								placeholder="당신의 오늘 할 일은 무엇인가요?"> -->
<!-- 						</div> -->
<!-- 						<div id="insertTodoList"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<!-- /.modal-content --> 
<!-- 		</div> -->
 		<!-- /.modal-dialog --> 
<!-- 	</div> -->
 	<!-- /.modal --> 
		
	
	
	
	
	
	<script>
	var toggleMainPopup = function(data) {
		  if(data != null){
			  window.localStorage.removeItem('today');
			  console.log("메인템플릿 팝업 갱신");
// 			  data = 0;
// 			  data.value = 0;
			  console.log("팝업 갱신 후 popupCnt : ",data);
		  }
		  /* 스토리지 제어 함수 정의 */
		  var handleStorage = {
		    // 스토리지에 데이터 쓰기(이름, 만료일)
		    setStorage: function (name, exp) {
		      // 만료 시간 구하기(exp를 ms단위로 변경)
		      var date = new Date();
		      date = date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);	// 24시간.
// 		      date = date.setTime(date.getTime() + exp * 30 * 1000);		// 30초 테스트용..

		      // 로컬 스토리지에 저장하기
		      // (값을 따로 저장하지 않고 만료 시간을 저장)
		      localStorage.setItem(name, date)
		    },
		    // 스토리지 읽어오기
		    getStorage: function (name) {
		      var now = new Date();
		      now = now.setTime(now.getTime());
		      // 현재 시각과 스토리지에 저장된 시각을 각각 비교하여
		      // 시간이 남아 있으면 true, 아니면 false 리턴
		      return parseInt(localStorage.getItem(name)) > now
		    }
		  };
		  
		  
		  // 쿠키 읽고 화면 보이게
		  if (handleStorage.getStorage("today")) {
		    $(".main_popup").removeClass("on");
		  } else {
		    $(".main_popup").addClass("on");
		  }

		  // 오늘하루 보지 않기 버튼
		  $(".main_popup").on("click", ".btn_today_close", function () {
		    // 로컬 스토리지에 today라는 이름으로 1일(24시간 뒤) 동안 보이지 않게
		    handleStorage.setStorage("today", 1);
		    $(this).parents(".main_popup.on").removeClass("on");
		  });

		  // 일반 닫기 버튼
		  $(".main_popup").on("click", ".btn_close", function () {
		    $(this).parents(".main_popup.on").removeClass("on");
		  });
		}
	$(function(){
// 		checkStatus();
		$('.main_popup').load('/workfit/board/popup');
		toggleMainPopup();
	});
	
	</script>
</body>
</html>