<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <link href="/resources/assets/css/ending.css" rel="stylesheet" type="text/css">	오늘의 할 일 CSS -->
<style>

/* 오늘의 할일 */

#insertTodo {
	background-color: inherit;
	border: none;
	border-bottom: 1px solid black;
	width: 300px;
}

#insertTodo:focus {
	outline: none;
}

.headerList a{
	font-size: 23px;
	margin-right : 10px;
}


.step-item.current:before {
    content: '';
    display: block;
    position: absolute;
    top: 51.5%;
    left: 48%;
    padding: 1.5em; 
    background-color: #f3ac63;
    border-radius: 50%;
    opacity: 0;
    z-index: -999;
    animation-name: animation-steps-current;
    animation-duration: 2s;
    animation-iteration-count: infinite;
    animation-timing-function: ease-out;
    
}

</style>
	<!--                 LOGO -->
	<a href="/workfit/main" class="topnav-logo ml-5"> 
	<span class="topnav-logo-lg">
		<img src="${pageContext.request.contextPath }/resources/assets/images/logo/workfitLogo.png" alt="" height="37">
	</span> 
	<span class="topnav-logo-sm"> 
		<img src="${pageContext.request.contextPath }/resources/assets/images/logo/logo_sm.png" alt="" height="16">
	</span>
	</a>
	<ul class="list-unstyled topbar-right-menu float-left mb-0 mt-3 ml-5 headerList">
		<li><a href="/workfit/approval/report" class="apple4 h4 mr-4 text-dark">전자결재</a></li>
		<li><a href="/workfit/schedule/index" class="apple4 h4 mr-4 text-dark">일정관리</a></li>
		<li><a href="/workfit/organization/organization" class="apple4 h4 mr-4 text-dark">인사/조직도</a></li>
		<li><a href="/workfit/mail/sendedMailView?mailFlag=received" class="apple4 h4 mr-4 text-dark">메일</a></li>
		<li><a href="/workfit/board/list/notice" class="apple4 h4 mr-4 text-dark">커뮤니티</a></li>
		<li><a href="/workfit/adminpage/commuteView" class="apple4 h4 mr-4 text-dark">인사관리</a></li>
		<li><a href="/workfit/document/list" class="apple4 h4 mr-4 text-dark">클라우드</a></li>
		<li><a href="/workfit/resource/resources" class="apple4 h4 mr-4 text-dark">예약관리</a></li>
<!-- 		<li><a href="/workfit/organizationmanage/organization" class="apple4 h4 mr-4 text-dark">인사</a></li> -->
		<sec:authorize access="hasRole('ROLE_LV3')">
			<li><a href="/workfit/admin/manageUser" class="apple4 h4 mr-4 text-dark">관리자</a></li>
		</sec:authorize>
	</ul>
	<ul class="list-unstyled topbar-right-menu float-right mb-0">
<%-- 		<c:if test="${serviceInfo > 1}"> --%>
<!-- 			<!--  톱니바퀴 --> 
<!-- 			<li class="notification-list workfitMouse" id="settingIcon" onclick="openWidget(this)"> -->
<!-- 				<i class="dripicons-gear noti-icon text-dark"></i> -->
<!-- 			</li> -->
<%-- 		</c:if> --%>
		<!-- 오늘의 할 일 -->
		
		<li class="notification-list workfitMouse" id="mainToDo"  data-toggle="modal" data-target="#toDoListModal">
			<i class="dripicons-checklist noti-icon text-dark pl-2"></i>
		</li>

		<!--  종  -->

		<li id="mybell" class="dropdown notification-list">
		<a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" id="topbar-notifydrop" role="button" aria-haspopup="true" aria-expanded="false"> 
			<div id="byhBellWrapper">
				<i class="dripicons-bell noti-icon text-dark"></i> 
			</div>	
<!-- 				<span class="noti-icon-badge"></span> -->
		</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg" aria-labelledby="topbar-notifydrop" style="">
				<!-- item-->
				<div class="dropdown-item noti-title">
					<h5 class="m-0">
						<span class="float-right"> <a href="javascript: void(0);" class="text-dark"> 
							<small class="apple-3">전체삭제</small>
						</a>
						</span>
						<span class="apple-3">알림</span>
					</h5>
				</div>

				<div style="max-height: 230px;" data-simplebar="init">
					<div class="simplebar-wrapper" style="margin: 0px;">
						<div class="simplebar-height-auto-observer-wrapper">
							<div class="simplebar-height-auto-observer"></div>
						</div>
						<div class="simplebar-mask">
							<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
								<div class="simplebar-content-wrapper" style="height: auto; overflow: hidden scroll;">
									<div id="mybellDiv" class="simplebar-content" style="padding: 0px;">
										<!-- item-->
										
										<!-- ---------------------알림 리스트 데이터 띄우기 시작------------------ -->
										
										<sec:authorize access="isAuthenticated()">
										
										<!-- 만약 읽지 않은 알람 리스트가 있다면 일단 flag에 식별자를 준다.(에이잭스로 넘겨서 해당 알람들을 전달받기 위해서) -->
<%-- 										<c:if var="alarmFlag" test="${not empty uncheckedNotList }"> --%>
<%-- 											<c:set var="isAnyUncheckedNotification" value="remain"></c:set> --%>
<%-- 										</c:if> --%>
<%-- 										<c:if test="${!alarmFlag }"> --%>
<%-- 											<c:set var="isAnyUncheckedNotification" value="notRemain"></c:set> --%>
<%-- 										</c:if> --%>
										<!-- 우선 해당 회원한테 온 모든 알람들을 집어넣는다 -->
										<c:if test="${not empty notVOList}">
										
<%-- 											<c:forEach items="${notVOList }" var="notVO"> --%>
											
<%-- 												<c:if var="notReadCheck" test="${notVO.notIsread eq 'true'}"> --%>
<%-- 													<c:set var="backColor" value="#e9ecef"></c:set> --%>
<%-- 												</c:if> --%>
												 
<%-- 												<a style="background-color : ${backColor}" onclick="fn_notClick(this)" name="${notVO.notNum }" id="${notVO.notRelatedUrl }" href="" class="dropdown-item notify-item"> --%>
<!-- 												<div class="notify-icon"> -->
<%-- 													<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }${senderProfileMap[notVO.notSender]}"> --%>
<!-- 												</div> -->
<!-- 												<p class="notify-details"  style="position : relative;"> -->
												
												
<%-- 												<span>${notVO.notContent }</span><i style="z-index : 100000; font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i> --%>
<%-- 												<small class="text-muted"><fmt:formatDate value="${notVO.notSendedDate}" pattern="yyyy-MM-dd HH:ss"/></small> --%>
<!-- 												</p> -->
<!-- 												</a> -->
												
<%-- 											</c:forEach> --%>

										</c:if>
										
										
										
<!-- 										<a href="javascript:void(0);" class="dropdown-item notify-item"> -->
<!-- 											<div class="notify-icon"> -->
<%-- 													<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"> --%>
<!-- 											</div> -->
<!-- 											<p class="notify-details"  style="position : relative;"> -->
<!-- 												Caleb Flakelar commented on  Adminasdfasdfasd<i style="font-size : 20px; position : absolute; top : 18px; left : 210px;" class="dripicons-cross"></i> -->
<!-- 												<small class="text-muted">1 min ago</small> -->
<!-- 											</p> -->
											
<!-- 										</a> -->
										
<!-- 										<a href="javascript:void(0);" class="dropdown-item notify-item"> -->
<!-- 											<div class="notify-icon"> -->
<%-- 													<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"> --%>
<!-- 											</div> -->
<!-- 											<p class="notify-details"  style="position : relative;"> -->
<!-- 												Caleb Flakelar commented on  Adminasdfasdfasd<i style="font-size : 20px; position : absolute; top : 18px; left : 210px;" class="dripicons-cross"></i> -->
<!-- 												<small class="text-muted">1 min ago</small> -->
<!-- 											</p> -->
											
<!-- 										</a> -->

										</sec:authorize>
										<!-- ---------------------알림 리스트 데이터 띄우기 끝 ------------------ -->
										
									</div>
								</div>
							</div>
						</div>
						<div class="simplebar-placeholder"
							style="width: 318px; height: 390px;"></div>
					</div>
					<div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
						<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
					</div>
					<div class="simplebar-track simplebar-vertical" style="visibility: visible;">
						<div class="simplebar-scrollbar" style="height: 135px; display: block; transform: translate3d(0px, 0px, 0px);"> </div>
					</div>
				</div>

				<!-- All-->
				<a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">  </a>
			</div>
		</li>




		<!--  프사  -->
		<li class="dropdown notification-list mr-3">
			<a class="nav-link dropdown-toggle nav-user arrow-none mr-0" style="background-color: inherit; border: none;" data-toggle="dropdown"
				id="topbar-userdrop" href="#" role="button" aria-haspopup="true"
				aria-expanded="false"> 
			<sec:authorize access="isAnonymous()">
			<span class="account-user-avatar">
					<img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">
			</span>
			<span>
					<span class="apple3 account-user-name text-dark">000님
					</span>
					<span class="apple3 account-position text-dark">시큐리티안댐
					</span>
			</span>
	    	</sec:authorize>
	    	<!-- //////////////로그인을하지 않은 경우 끝 ////////////////////////////-->
	    	<!-- //////////////로그인을 한 경우 시작 /////////////////////////////////-->
			<sec:authorize access="isAuthenticated()">
			<span class="account-user-avatar">
				<c:if test="${empty member.memProfileUrl }">
					<c:set value="${member.memName }" var="name"/>
					<img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="user-image" class="rounded-circle">				
				</c:if>
				<c:if test="${!empty member.memProfileUrl }">
					<img src="${member.memProfileUrl }" alt="${fn:substring(name,0,1) }" class="rounded-circle mr-1" style="width: 38px; height: 38px">
				</c:if>
			</span>
			<span>
			    	<span class="apple5 account-user-name text-dark" style="font-size: 17px;">
			    		<sec:authentication property="principal.memberVO.memName"/>
					</span>
					<span class="apple3 account-position text-dark" style="font-size: 15px;">
						<sec:authentication property="principal.memberVO.deptName"/>
					</span>
<!-- 			      <div class="user-panel mt-3 pb-3 mb-3 d-flex"> -->
<!-- 			        <div> -->
<!-- 			        	/logout으로 정해져 있음(post) -->
<!-- 			        	<form action="/logout" method="post"> -->
<!-- 							<button type="submit" class="btn btn-primary">로그아웃</button> -->
<%-- 			        		<sec:csrfInput/> --%>
<!-- 			        	</form> -->
<!-- 			        </div> -->
<!-- 			      </div> -->
		    </span>
		    </sec:authorize>
    		<!-- 로그인을 한 경우 끝 ////////////////////////////-->

		</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-menu-animated topbar-dropdown-menu profile-dropdown"
				aria-labelledby="topbar-userdrop" style="font-size: 17px;">

				<!-- item-->
				<a href="/workfit/mypage/main" class="dropdown-item notify-item">
					<i class="mdi mdi-account-circle mr-1"></i> <span class="apple6 ">마이 페이지</span>
				</a>

				<!-- item-->
				<a href="/workfit/mail/sendedMailView?mailFlag=received" class="dropdown-item notify-item">
					<i class="mdi mdi-account-edit mr-1"></i> <span class="apple6 ">메일</span>
				</a>
				<!-- item-->
				<form action="/logout" id="logoutForm" method="post">
					<a href="#" class="dropdown-item notify-item" onclick="logout()">
						<i class="mdi mdi-logout mr-1"></i> <span class="apple6">로그아웃</span>
					</a>
	        		<sec:csrfInput/>
		        </form>
				<!-- item-->
				<a href="javascript:void(0);" class="dropdown-item notify-item">
					<i class="mdi mdi-account-off-outline mr-1"></i> 
					<span class="apple6">퇴근</span>
				</a>
			</div>
		</li>
	</ul>
	<a class="button-menu-mobile disable-btn">
		<div class="lines">
			<span></span> <span></span> <span></span>
		</div>
	</a>
	
	<div id="testSseContent"></div>

 <!--  오른쪽 사이드 바 끝  --> 




<!-- 오늘의 할 일 -->
<!-- todoList 모달창 -->

<div id="toDoListModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="standard-modalLabel" aria-hidden="true" style="z-index:1002;">
	<div class="modal-dialog  modal-lg">
		<div class="modal-content" style="border-radius: 27px;">

			<div class="modal-header pl-4 pr-4">
				<h4 class="modal-title apple4 text-dark" style="font-size:23px;" id="standard-modalLabel">
					<i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일
				</h4>
				<div class="d-flex text-align-start">
					<h6 class="modal-title apple4 text-dark ml-2" style="font-size:17px;" id="toDoListTime"></h6>
				</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div class="card-body p-3 text-center"
					style="border-radius: 20px; background-color: inherit;">
					<div class="mb-4">
						<input class="apple5 text-dark text-center" type="text" style="font-size:23px; width:350px;" id="insertTodo"
							placeholder="당신의 오늘 할 일은 무엇인가요?">
					</div>
					<div id="insertTodoList"></div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->





















<script>
var toDofuncMain; 

//------------------------- 오늘의 할일 시작 --------------------
async function toDofunc(){
	var list
	var insertTodo = document.querySelector("#insertTodo");
	if(!insertTodo) return
	var insertTodoList = document.querySelector("#insertTodoList");
	var toDoListTime = document.querySelector("#toDoListTime");
	let today = new Date();   
	
	toDoListTime.innerHTML = today.toLocaleDateString();
	
	
    const headers = {
            header: token
        };
        
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        	const response = await axios.get("/selectTodoList")
    		toDoFuncSuc2(response.data);
    		return response.data;
}

// todoList 성공시 그려주는 부분 ! 
function toDoFuncSuc2(list){
// 	console.log("toDoFuncSuc 성공후 그리는 메소드 실행 ")
	console.log("list~~~~~~~~~~~~~~~~~~~~~~~~!",list)
	var insertTodoList = document.querySelector("#insertTodoList");
	console.log("찾아라~~~~~~~~~~~~~~~~~~~~ insertTodoList",insertTodoList)
	var str ="";
	for(let item of list){
    	let uuid =Date.now() + "";
		console.log("너네도니?돌았니?",item); 	
		var checkVal = item.todayCheck? "checked" : "";  
		str +=`<div class="ml-3"><h4 style="font-size:24px;" class="apple5 text-dark text-left ml-3 mb-2" data-memoid= "\${item.todayCode}" id="\${item.todayCode}"><input type="checkbox" \${checkVal} style="accent-color:#6c757d" class="mr-3 chkToDo" onchange="checkTodo(this)"> \${item.todayContent}<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none; position:absolute; left:85%;">x</button></h4></div>`;
	}
		insertTodoList.innerHTML = str;
	
}

  insertTodo.onkeydown=function(event){
	if(event.keyCode ==13){
        event.preventDefault();
        	var insertTodoVal = insertTodo.value;
            var div = document.createElement("div");
            div.setAttribute("class", "ml-3")
            
        	var h4 = document.createElement("h4");
        	h4.setAttribute("class", "apple5 text-dark text-left ml-3 mb-2")
        	h4.style.fontSize="24px";
        	
        	let uuid = Date.now() + "";
        	h4.setAttribute("id", uuid);
        	h4.setAttribute("data-memoid",uuid)
        	//console.log(h4);
        	
        	h4.innerHTML += "<input type='checkbox' style='accent-color:#6c757d' class='mr-3 chkToDo' onchange='checkTodo(this)'> " + insertTodoVal;
        	
        	
            const button = document.createElement("button");
            button.innerText = "x";
            button.style.backgroundColor="inherit";
            button.setAttribute("style","border:none; position:absolute; left:70%;")
            button.setAttribute("class", "delBtns ml-3")
        	
        	h4.appendChild(button);
        	div.appendChild(h4);
        	
        	insertTodoList.append(div.cloneNode(true));
			
        	// 봐봐
        	
        	
        	var delBtns = document.querySelectorAll(".delBtns");
        	
        	for(var btn of delBtns){
	        	btn.addEventListener("click", deleteToDo);
        	}
        	
        	document.querySelector("#insertTodo").value="";
        	
			jsonData={
				todayCode : uuid,
				todayContent : insertTodoVal
			}

        	var xhr = new XMLHttpRequest();
			xhr.open("POST","/insertTodoList",true);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.setRequestHeader(header,token);
			xhr.send(JSON.stringify(jsonData));
			xhr.onreadystatechange=()=>{
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log("할 일 칸을 지운다")
					insertTodo.innerText ="";
				}
			}

        }
  };
  
var deleteToDo = (e) => {
	var todayCode;
	console.log("e",e);
	//console.log("파라미터 종류",Object.prototype.toString.call(e))
	if(Object.prototype.toString.call(e).slice(8, -1) == 'HTMLButtonElement'){
		//console.log("디비에서 나와서 만들어진 버튼")
		//console.log("deleteToDo target id",e.parentElement.id);
		todayCode = e.parentElement.id
		var delTargets = document.querySelectorAll("h4[data-memoId='"+todayCode+"']");
		for(var item of delTargets){
			item.parentElement.remove();
		}
		
	}else{
		//console.log("새로 맨든 버튼")
// 		console.log("으악")
		todayCode = e.target.closest("h4").id;
		var delTargets = document.querySelectorAll("h4[data-memoId='"+todayCode+"']");
// 		console.log("delTargets",delTargets)
		for(var item of delTargets){
			item.parentElement.remove();
		}
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/deleteTodoList?todayCode="+todayCode, true);
	xhr.setRequestHeader(header, token);
	xhr.send();
	xhr.onreadystatechange=()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			//console.log(xhr.responseText);

		}

	};


}



// 오늘의 할 일 체크

function checkTodo(item){
	console.log("체크체크")
	todayCode = item.parentElement.id;
	console.log("todayCode",todayCode)
	

// 	var checkItems = document.querySelector(".mainRow h4[data-memoId='"+todayCode+"']") 	
// 		console.log("checkItems ~~~~~~~~~~~~~~~~~~~~~~~~!", checkItems)
// 		var target = checkItems.firstChild;
// 		target.checked = !target.checked;
		console.log("체크박스 값", item.checked)
		
		var check = item.checked? 1: 0;
			var map = {
						"todayCode" : todayCode,
			 			"check" : check
						}	
		
		
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/updateTodoList", true);
			xhr.setRequestHeader(header, token);
			xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
			xhr.send(JSON.stringify(map));
			xhr.onreadystatechange=()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
				
				}
			}
		
		
		
		
	
}

//------------------------- 오늘의 할일 끝 --------------------







var logout = () =>{
	document.getElementById('logoutForm').submit();
}



// 에이잭스를 통해서 해당 알림 데이터를 지우고 알림 리스트 상에서도 제거시켜주는 함수 
function fn_delNotfication(a){
	
	
	
// 	var header = '${_csrf.headerName}';
// 	var token =  '${_csrf.token}';
// 	  $.ajax({
// 			type : "post",
// 			url : "/workfit/notification/deleteProcess",
// 			beforeSend: function(xhr) {
// 	            xhr.setRequestHeader(header, token);
// 			},
// 			data : {"notNum" : $(a).parent().parent().attr("name")},
// 			success : function(res){
// 				console.log(res);
// // 				location.href = $(a).attr("id");
// 				$(a).parent().parent().remove();
				
// 			}
			
// 	  });
	
}

//에이잭스를 통해서 해당 공지를 읽은 것으로 처리하고 해당 URL로 보내주는 함수 
function fn_notClick(a){
	
// 	console.log($(a).attr("name"));
// 	console.log("a의 아이디 값 확인좀 할게요~"+$(a).attr("id"));	
	
// 	var header = '${_csrf.headerName}';
// 	var token =  '${_csrf.token}';
// 	  $.ajax({
// 			type : "post",
// 			url : "/workfit/notification/readProcess",
// 			beforeSend: function(xhr) {
// 	            xhr.setRequestHeader(header, token);
// 			},
// 			data : {"notNum" : $(a).attr("name")},
// 			success : function(res){
// 				console.log(res);
// 				location.href = $(a).attr("id");
				
// 			}
			
// 	  });
	
	
	
}

$(document).ready(function(){
	
	
	
	
	
	
	toDofuncMain = toDofunc();
	toDofuncMain.then((result)=>{
		console.log("와~~~~~~~~~~~~~~~ 실행~~~");
		toDoFuncSuc2(result);
	})
	// 오늘의 할 일 백드롭
	$("#toDoListModal").on("shown.bs.modal",function(e){
		console.log("안녕 나는 백드롭");
		$(".modal-backdrop").last().css("z-index","1001");
	})

	
	
	
	
	// 여기서 ajax로 알람을 보낼 notification이 있는 지 판별 해주고 remina인지 notRemain인지 결정하자 그러면 해결??	
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	  $.ajax({
			type : "post",
			url : "/workfit/notification/isAnyUnread",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
			},
			async : false,
			success : function(res){
				console.log(res);
				window.byhAlarmCheckForTest = res.isRemain;
				
				var notVOArr = res.notVOList;
				var uncheckedNotArr = res.uncheckedNotList;
				var senderProfileMap = res.senderProfileMap;
				var bellMaker = '';
				for(let i = 0; i < notVOArr.length; i++){
//						bellMaker += '<a href="'+notVOArr[i].notRelatedUrl+'" class="dropdown-item notify-item"><div class="notify-icon"><img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }'+notVOArr[i].memProfileUrl+'"'+'</div><p class="notify-details"  style="position : relative;">'+notVOArr[i].notContent+'<i style="font-size : 20px; position : absolute; top : 18px; left : 210px;" class="dripicons-cross"></i><small class="text-muted">'+notVOArr[i].notSendedDate+'</small></p>';
//						bellMaker += '<div class="notify-icon">';
//						bellMaker += '<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }'+notVOArr[i].memProfileUrl+'"';
//						bellMaker += '</div>';
//						bellMaker += '<p class="notify-details"  style="position : relative;">'+notVOArr[i].notContent;
//						bellMaker += '<i style="font-size : 20px; position : absolute; top : 18px; left : 210px;" class="dripicons-cross"></i>';
//						bellMaker += '<small class="text-muted">'+notVOArr[i].notSendedDate+'</small></p></a>';
					
					var voEle = notVOArr[i];
					
					if(voEle.notIsread == 'true'){
						var classifyText = '(읽음)';	
					}else{
						var classifyText = '';	
						
					}
					
					bellMaker += '<a class="dropdown-item notify-item" onclick="fn_notClick(this)" name="'+voEle.notNum+'" id="'+voEle.notRelatedUrl+'" href="#">';
					bellMaker += '<div class="notify-icon">';
					bellMaker += '<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }'+senderProfileMap[voEle.notSender]+'">';
					bellMaker += '</div>';
					bellMaker += '<p class="notify-details" style="position : relative;">';
					bellMaker += '<span>'+voEle.notContent+'</span><i style="z-index : 100000; font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i>';
					bellMaker += '<small style="display : inline-block;">'+voEle.notSendedDate+'  '+classifyText+'</small>';
// 					bellMaker += '<h6 style="margin-top : -17px; margin-left : 149px;"><span class="badge badge-danger">New</span></h6>';
// 					bellMaker += '<h6 style="display : inline-block; position : absolute; top : 22px; left : 179px;"><span class="badge badge-danger">New</span></h6>';
					bellMaker += '</p>';
					bellMaker += '</a>';
				}
				
				$("#mybellDiv").html(bellMaker);
// 				console.log("p태그 왜 append 안 됨??");
// 				$("#mybellDiv").children("p").append('<h6><span class="badge badge-danger">New</span></h6>');
				// 이게 정상! 
//					<a style="background-color : " onclick="fn_notClick(this)" name="NOT61" id="/workfit/approval/reception/requested?alarmDocCode=TEST248" href="" class="dropdown-item notify-item">
//					<div class="notify-icon">
//						<img class="img-fluid rounded-circle" src="/resources/uploads/profileImages/조팀장.png">
//					</div>
//					<p class="notify-details" style="position : relative;">
				
				
//					<span>조현수님이 휴가신청서 결재 요청을 하였습니다.</span><i style="z-index : 100000; font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i>
//					<small class="text-muted">2023-01-20 18:07</small>
//					</p>
//					</a>
				
				

				
			}
			
	  }); // 알람 리스트 뿌려주는 에이잭스 끝... 
	
	  // 테스트 
	  
	  
	
	//알람에서 X버튼 클릭 시 해당 알람을 삭제시키는 로직 
	 var header = '${_csrf.headerName}';
	 var token =  '${_csrf.token}';
	[...$(".notify-item")].map((element)=>{
		
		
	 	$(element).children("p").children("i").on("click",function(event){
	 		
	 		event.stopPropagation();
	 		event.preventDefault();
	 		  $.ajax({
	 				type : "post",
	 				url : "/workfit/notification/deleteProcess",
	 				beforeSend: function(xhr) {
	 		            xhr.setRequestHeader(header, token);
	 				},
	 				async : false,
	 				data : {"notNum" : $(element).attr("name")},
	 				success : function(res){
	// 					console.log(res);
	//	 				location.href = $(a).attr("id");
	 					$(element).remove();
						
	 				}
					
	 		  });
			
			
			
	 	}) // 클릭 이벤트 등록 끝... 
		
	}); // 알람 삭제 로직 끝 ...
	
	//알람 클릭 시 해당 알람상세 모달로 이동시켜주는 이벤트를 등록하는 로직 
	 var header = '${_csrf.headerName}';
	 var token =  '${_csrf.token}';
	[...$(".notify-item")].map((element)=>{
		
		
	 	$(element).on("click",function(event){
	 		
// 	 		event.stopPropagation();
	 		event.preventDefault();
	 		$.ajax({
				type : "post",
				url : "/workfit/notification/readProcess",
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
				},
				async : false,
				data : {"notNum" : $(element).attr("name")},
				success : function(res){
					console.log(res);
					location.href = $(element).attr("id");
					
				}
				
		  });
			
			
			
	 	}) // 클릭 이벤트 등록 끝... 
		
	}) // 알람 상세 모달 이동 로직 끝 ...
	
	
	
	



		
		  
		  
// var alarmFlag = '${isAnyUncheckedNotification}';
// console.log('영호의 alarmflag확인'+alarmFlag);
const eventSource = new EventSource("/workfit/notification/subscribe?remainAlarmFlag="+window.byhAlarmCheckForTest);

eventSource.onmessage = event => {
	if(event.data != ''){
		console.log("이벤트 데이터 확인"+JSON.stringify(event.data));
		var parsedEventData = JSON.parse(event.data)
		
		var target = document.querySelector('#mybell');
// 		var player = target.animate([
//  		    { transform: 'translate(0, 0);'},
//  		    { transform: 'translate(-10px, -15px)'},
//  		    { transform: 'translate(-8px, -8px)'},
//  		    { transform: 'translate(-4px, -4px)'},
//  		    { transform: 'translate(-6px, -6px)'},
//  		    { transform: 'translate(-3px, -3px)'},
//  		    { transform: 'translate(-6px, -6px)'},
//  		    { transform: 'translate(-3px, -3px)'},
//  		    { transform: 'translate(-1px, -1px)'},
//  		    { transform: 'translate(0, 0px)'}
//  		],{
//  		    duration : 2000,
//  		    delay:100
//  		});
			
		
		
		// 토스트 메시지 창 켜기 
//			target.click();
		
// 		var str = '<div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">'; 
// 		str += '<div class="toast-header">'; 
// 		str += '<img src="..." class="rounded mr-2" alt="...">'; 
// 		str += '<strong class="mr-auto">Bootstrap</strong>'; 
// 		str += '<small>11 mins ago</small>'; 
// 		str += '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">'; 
// 		str += '<span aria-hidden="true">&times;</span>';
// 		str += '</button>';
// 		str += '</div>'; 
// 		str += '<div class="toast-body">'; 
// 		str += '<a href="'+parsedEventData.notRelatedUrl+'">'+parsedEventData.notContent+'</a>'; 
// 		str += '</div>';
// 		str += '</div>';
		
// 		$("#testSseContent").append(str); 
		
// 		$(".toast").toast("show");
		
		// 종모양 뒤에 이펙트 + 빨간색 뱃지  
// 		$("#byhBellWrapper").addClass("step-item current");
		
		
		// 읽지 않은 알림이 있을 경우 빨간색 뱃지가 달린 상태가 유지되도록 함 
		var badgeSpanTag = '<span class="noti-icon-badge"></span>';
		$("#topbar-notifydrop").append(badgeSpanTag);
		
		
		// 결제 상신 요청과 같은 알림이 실시간으로 날라온다면 
		if(parsedEventData.requestType != "subscribe"){
			
			// 종 뒤에 빨간색 뱃지를 달아줌 
			var badgeSpanTag = '<span class="noti-icon-badge"></span>';
			$("#topbar-notifydrop").append(badgeSpanTag);
			
			// 종모양 뒤에 이펙트를 날림 
			$("#byhBellWrapper").addClass("step-item current");
			$("#topbar-notifydrop").click();
			// 드롭박스가 열리고 new뱃지를 단 알림이 append 된다 
			
			
// 			var eventDataStr = '<a href="'+parsedEventData.notRelatedUrl+'" class="dropdown-item notify-item"><div class="notify-icon"><img class="img-fluid rounded-circle" src="${pageContext.request.contextPath }'+parsedEventData.memProfileUrl+'"'+'</div><p class="notify-details"  style="position : relative;"><span>'+parsedEventData.notContent+'</span><i style="font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i><small class="text-muted">'+parsedEventData.notSendedDate+'</small></p></a>';
			var backgroundColor = '';
			if(parsedEventData.notIsread == 'true'){
				backgroundColor = '#e9ecef';	
			}else{
				backgroundColor = '';	
				
			}
			
			var newAlaramTag = document.createElement("a");
			$(newAlaramTag).css("background-color",backgroundColor);
			$(newAlaramTag).attr("href","#");
			newAlaramTag.name = parsedEventData.notNum;
			$(newAlaramTag).attr("id",parsedEventData.notRelatedUrl);
			$(newAlaramTag).attr("class","dropdown-item");
			$(newAlaramTag).addClass("notify-item");
			
			var eventDataStr = '<div class="notify-icon"><img class="img-fluid rounded-circle" src="'+parsedEventData.senderProfileUrl+'"></div><p class="notify-details" style="position : relative;"><span>'+parsedEventData.notContent+'</span><i style="z-index : 100000; font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i><small class="text-muted">'+parsedEventData.notStringDate+'</small><h6 style="margin-top : -17px; margin-left : 149px;"><span class="badge badge-danger">New</span></h6></p>';
// 			var eventDataStr = '<a style="background-color : '+backgroundColor+'" onclick="fn_notClick(this)" name="'+parsedEventData.notNum+'" id="'+parsedEventData.notRelatedUrl+'" href="" class="dropdown-item notify-item"><div class="notify-icon"><img class="img-fluid rounded-circle" src="'+parsedEventData.senderProfileUrl+'"></div><p class="notify-details" style="position : relative;"><span>'+parsedEventData.notContent+'</span><i style="z-index : 100000; font-size : 20px; position : absolute; top : 13px; left : 210px;" class="dripicons-cross"></i><small class="text-muted">'+parsedEventData.notStringDate+'</small><h6 style="margin-top : -17px; margin-left : 149px;"><span class="badge badge-danger">New</span></h6></p></a>';
			$(newAlaramTag).append(eventDataStr);
			
			var newAlaramTarget = $(newAlaramTag);
			// 새롭게 들어온 알람에 대한 클릭 이벤트 설정 시작 
			var header = '${_csrf.headerName}';
			var token =  '${_csrf.token}';
			
			newAlaramTarget.on("click",function(event){
				
				  event.preventDefault();
				  $.ajax({
						type : "post",
						url : "/workfit/notification/readProcess",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
						},
						async : false,
						data : {"notNum" : newAlaramTarget.prop("name")},
						success : function(res){
// 							console.log(res);
							location.href = newAlaramTarget.attr("id");
							
						}
						
				  });
				
			});
			// 새롭게 들어온 알람에 대한 클릭 이벤트 설정 끝    
			
			
			
			$("#mybellDiv").prepend(newAlaramTarget);
			
			
			
			
			
			
			
		}
		
	}
} // 에미터로부터 오는 onmessage에 대한 이벤트 등록 완료 


	// 	벨을 클릭했을 때 뒤에 뱃지가 있으면 뱃지를 없애줌 
	
	document.getElementById("topbar-notifydrop").addEventListener("click",function(e){
		if($("#topbar-notifydrop").find(".noti-icon-badge").length != 0){
			$("#topbar-notifydrop").find(".noti-icon-badge").remove();
		}		
	})


	
});	
	

</script>