<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- tippy 관련 cdn 마우스 올리면 상세 일정 나오는 것 -->
<!-- <script src="https://unpkg.com/tippy.js@2.0.9/dist/tippy.all.min.js"></script> -->
<!-- <script src="https://unpkg.com/@popperjs/core@2.11.5/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://unpkg.com/tippy.js@6.3.7/dist/tippy-bundle.umd.min.js"></script> -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tippy.js/6.3.7/themes/light.min.css" />
<style>
#memoBox {
	display : none;
}
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: rgb(255,102,24);
  text-decoration: none;
}


/* 이전 오늘 이후 버튼 */
.fc .fc-button-primary{
	background-color:inherit;
	color: #323a46 !important;
	border: none;
}


.fc .fc-button-primary:hover {
	background-color:inherit;
	color: #6c757d;
	border: none;
}
.fc .fc-button-primary:active{
	background-color:#fff;
	color: #6c757d;
	border: none;
	box-shadow:	none;
}

/*일자*/
.fc-daygrid-day-number{
    color: #323a46;
    font-size:17px;
    font-family: 'apple5';
 }


/*제목*/
#fc-dom-1{
    color: #6c7680;
    font-size:31px !important;
    font-family: 'apple5';	
}

/*이벤트 제목*/
.fc-event-title {
	font-size: 17px;
    font-family: 'apple5';	
}

/*이벤트 시간*/
.fc-event-time{
	font-size: 17px;

}
    
/*달력제목*/
.fc-toolbar-title{
	color: #323a46 !important;
}

.fc .fc-button-primary:disabled{
	background-color:inherit;
	color: #6c757d;
	border: none;
}

/*요일 */
.fc-col-header-cell-cushion {
	color: #323a46;
	font-size: 19px;
  }
  
.hide{
	display:none;
}

/*today*/
#calendar > div.fc-header-toolbar.fc-toolbar.fc-toolbar-ltr > div:nth-child(1) > button.fc-today-button.fc-button.fc-button-primary{
	font-size: 21px;
}

#insertModal{
/*  	height: 300px; */
/*   	width: 505.875px; */
	min-width: 500px;
	position: absolute;
	z-index:22000000000;
}
#DetailModal{
/*  	height: 300px; */
/*   	width: 505.875px; */
	min-width: 500px;
	position: absolute;
	z-index:22000000000;
}
.colorListItem{
	padding:4px;
	text-align:center;
	width:49x;
	background-color:white;
	border: 1px solid #e3e7ea;
}

/* select#color option[value="#03bd9e"]{ background-image:url('/resources/assets/images/03bd9e.png');   } */

</style>

	<!-- insertModal -->
	<div class="layer-popup  card hide shadow" id="insertModal">
	  <div class=" card-body text-dark">
		  	<div class=" row">
		  		<div class="col-6 text-left mb-2">
		        	<h4 id="insertTitle" class="apple3"></h4>
		        </div>
		        <div class=" col-6 text-right">
		        	<button type="button" id="insertModalcloseBtn" class="btn btn-light" style="background-color:inherit; border:none;">X</button>
		        </div>
		    </div>
	      		<div class=" row">
	      			<div class=" col-4">
	      				
	      				
	      				<div class="form-control form-control-sm" style="padding:0px;width:50px;" id="colors">
	      					<div class="d-flex justify-content-center align-items-center" style="width:50px; height:30px;" id="colorPick"></div>
	      					<ul class="hide" id="colorList" style="list-style:none; padding-left:0px;z-index:100;">
	      						<li class="colorListItem" value="#03bd9e"><img id="#03bd9e" src="/resources/assets/images/03bd9e.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#bbdc00"><img id="#bbdc00" src="/resources/assets/images/bbdc00.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#ff4040"><img id="#ff4040" src="/resources/assets/images/ff4040.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#ffbd42"><img id="#ffbd42" src="/resources/assets/images/ffbd42.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#ff5583"><img id="#ff5583" src="/resources/assets/images/ff5583.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#9e5fff"><img id="#9e5fff" src="/resources/assets/images/9e5fff.png" height="20px" width="20px"></li>
	      						<li class="colorListItem" value="#00a9ff"><img id="#9d9d9d" src="/resources/assets/images/9d9d9d.png" height="20px" width="20px"></li>
	      					</ul>
	      				</div>

	      			</div>
	      			<div class="col-8 text-right">
	      				  <input style="accent-color:#6c757d;" type="radio" id="memIdInsert" name="insertCalType" value="${memId }" checked/>
      					  <label class="apple2 mr-2" for="${memName }">${memName }</label>
	      				  <input style="accent-color:#6c757d;" type="radio" id="deptNameInsert" name="insertCalType" value="${memDeptCode }" />
      					  <label class="apple2 mr-2" for="deptName">${memDeptName }</label>
	      			</div>
	      		</div>
	      	   <input type="text" class="apple3 form-control form-control-sm mb-2 mt-2" id="title" placeholder="일정 제목을 입력해주세요">
	           <input type="text" class="apple3 form-control form-control-sm" id="memo" placeholder="일정 내용을 입력해주세요">
	        <div class="insertModal mt-2">
	        	<label for="title" class="apple3">시작날짜 : </label><input class="ml-2" type="date" style="border:0.5px solid #dee2e6; color:#6c757d;" id="start">
	        	<label for="title" class="apple3 ml-3">종료날짜 : </label><input class="ml-2" type="date" style="border:0.5px solid #dee2e6; color:#6c757d;" id="end"><br>       
		        <span class="apple5">allDay여부 : </span><input type="checkbox" id="allDay"  onchange='handleChange(this)' checked="checked" style="accent-color:#6c757d "><br>
	        </div>
	        <div class=" row mt-2 hide" id="timeSelect">
	        	<div class=" col-6 text-left">
		         <label for="start" class="apple3">시작시간:</label>
		         <select class="form-control form-control-sm" id="startTime">
		            <option value="09:00">09:00</option>
		            <option value="10:00">10:00</option>
		            <option value="11:00">11:00</option>
		            <option value="12:00">12:00</option>
		            <option value="13:00">13:00</option>
		            <option value="14:00">14:00</option>
		            <option value="15:00">15:00</option>
		            <option value="16:00">16:00</option>
		            <option value="17:00">17:00</option>
		            <option value="18:00">18:00</option>
		         </select>
	         </div>
	         <div class=" col-6 text-left">
		         <label for="end" class="apple3">종료시간:</label>
		         <select class="form-control form-control-sm" id="endTime">
		            <option value="10:00">10:00</option>
		            <option value="11:00">11:00</option>
		            <option value="12:00">12:00</option>
		            <option value="13:00">13:00</option>
		            <option value="14:00">14:00</option>
		            <option value="15:00">15:00</option>
		            <option value="16:00">16:00</option>
		            <option value="17:00">17:00</option>
		            <option value="18:00">18:00</option>
		            <option value="19:00">19:00</option>
		         </select>
		        </div>
         </div>
         <div class="text-right">
         	<button type="button" style="background-color:#5F7CBB; color:white;" class="apple5 mt-2 btn btn-light" id="insertBtn">등록</button>
         </div>
         </div>
        </div>
	


<div class="layer-popup card hide shadow"  id="DetailModal">
		  <div class=" card-body text-dark">
		  	<div class=" row">
		  		<div class="col-6 text-left">
		        	<h4 class="apple3" id="DtitleVal"></h4>
		        </div>
		        <div class=" col-6 text-right">
		        	<button type="button" id="datilModalcloseBtn" class="btn btn-light" style="background-color:inherit; border:none;">X</button>
		        </div>
		    </div>
		        <div>
	      			<p class="card-text apple3" id="DmemoVal"></p>
	      		</div>
	        <div class=" row mt-1">
	        	<div class=" col-6 text-left">
	        		<span id="start4Allday" class="apple5">시작날짜 : </span>
	      			<p class="card-text apple3" id="DstartVal"></p>
	      		</div>
	        	<div class=" col-6 text-left">
	        		<span id="end4Allday" class="apple5">종료날짜 : </span>
	      			<p class="card-text apple3" id="DendVal"></p>
	      		</div>
	        </div>
	        <div id="delGroupId" style="display:none;">
	        </div>
	        <div class="text-right mr-3">
				<button type="button" style="background-color:#5F7CBB; color:white;" class="apple4 mt-2 btn btn-light" id="calModifyBtn">수정</button>
	         	<button type="button" class="apple4 mt-2 btn btn-light" id="calDeleteBtn">삭제</button>
         	</div>
         </div>
        </div>
        
		<div class='mr-2  ml-2 mt-3 card p-3 workfitCardBg' style="border-radius: 0.7rem;">
			<div class='card p-3' style="border-radius: 0.7rem;">
		
				<h5 class='apple4 page-title text-dark pl-3 pt-2'
					style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>일정관리</h5>
		
				<hr class="ml-3 mr-3 mt-1 mb-1">
				<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size: 19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
					일정관리에서는 자신의 일정과 부서의 일정을 관리할 수 있는 공간입니다<br>
					부서 일정 등록 시, 전 부서원들에게 일정이 공유됩니다
				</div>
			</div>
		</div>
	<!-- 달력 시작 -->
<div class="card mr-2  ml-2 workfitCardBg justify-content-center mt-3 mb-3">
	<div class=" card-body" id="ContentBody">
				<div style="background-color:#ffffff; position:absolute; top:27px; width:30%; height:100px; border-top-left-radius: 0.7rem; border-top-right-radius: 0.7rem; margin-bottom:0px; ">
						<div class="row pl-3 pt-3 pb-2" >
							<input class="ml-2 mr-3" onclick="getCheckboxValue()" id="memId" type="checkbox" checked="checked" value="${memId }" style="accent-color:#6c757d "><br>
							<div class=" apple6 mr-5"style="font-size:21px; color:black;">${memName } 달력</div>
							<input class="ml-2 mr-3" onclick="getCheckboxValue()" id="memDeptName" type="checkbox" checked="checked" value="${memDeptCode }" style="accent-color:#6c757d "><br>
							<div class=" apple6" style="font-size:21px; color:black;">${memDeptName } 달력</div>
						</div>
				</div>
		<div class="card p-3 mt-5" style="border-radius: 0.7rem;">
			<div id="calendar" class="apple4"> </div>
		</div>
	</div>
</div>


<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
var Dataid = 0;	// 캘린더 시퀀스
var insertModal = document.querySelector("#insertModal");
var insertModalcloseBtn = document.querySelector("#insertModalcloseBtn"); 
var body = document.querySelector("body"); 
var allDay = document.querySelector("#allDay");	// 모달 안에 올데이~!
var timeSelect = document.querySelector("#timeSelect");	// 모달 안에 시간 선택 디브
var DetailModal = document.querySelector("#DetailModal");	// 디테일 모달..
var DallDay = document.querySelector("#DallDay");	// 디테일 모달 안에 올데이~!
var DtimeSelect = document.querySelector("#DtimeSelect");	// 디테일 모달 안에 시간 선택 디브
var calDeleteBtn = document.querySelector("#calDeleteBtn");
var calModifyBtn = document.querySelector("#calModifyBtn");
var endTime = document.querySelector("#endTime");
var end = document.querySelector("#end");
var start = document.querySelector("#start");
var calType
var colors = document.querySelector("#colors");
var colorPick = document.querySelector("#colorPick");
var colorList = document.querySelector("#colorList");
var colorListItem = document.querySelectorAll(".colorListItem");

colors.onclick=()=>{
	colorList.classList.toggle("hide");
}

for(var item of colorListItem){
	item.onclick=function(){
		colorPick.innerHTML = this.firstChild.outerHTML; 
	}
}


function selecteColor(e){
	console.log(e.target.parentElement.innerHTML)
	colorPick.innerHTML += e.target.parentElement.innerHTML
	console.log(colorPick)
}


function getCheckboxValue(){
	  const query = 'input[class="calendarType"]:checked';
	  const selectedEls = document.querySelectorAll(query);
	  
	  let memId = document.querySelector("input[id='memId']:checked")?document.querySelector("input[id='memId']:checked").value:null;
	  let memDeptName = document.querySelector("input[id='memDeptName']:checked")?document.querySelector("input[id='memDeptName']:checked").value:null;
	  
	  let jsonObject = {
			  memId:memId,
			  memDeptName:memDeptName
	  }
	  console.log(jsonObject);
	  
// 	  if(true){
// 		  return;
// 	  }
	  getCal(jsonObject)
}



function handleChange(checkbox) {
	console.log("checkbox 확인",checkbox);
    if(checkbox.checked == true){
    	timeSelect.classList.add("hide");
    	end.disabled;
    	start.disabled;
    	if(start.value != end.value){
    		console.log("start.value",start.value)
    		end.value=start.value;
    	}
    }else{
    	timeSelect.classList.remove("hide");
    	end.enabled;
    	start.enabled;
   }
}




allDay.onchange=()=>{
	timeSelect.classList.toggle("hide");
	end.toggleAttribute("disabled")
	start.toggleAttribute("disabled")
	if(start.value != end.value){
		console.log("start.value",start.value)
		end.value=start.value;
	}
}

insertModalcloseBtn.onclick=()=>{
	insertModal.classList.add("hide");
}

datilModalcloseBtn.onclick=()=>{
	DetailModal.classList.add("hide");
}

// 다른 곳 누르면 꺼지는 함수
$(document).mouseup(function (e){
	var LayerPopup = $(".layer-popup");
	if(LayerPopup.has(e.target).length === 0){
		LayerPopup.addClass("hide");
	}
});





function getCal(calType){
	
	
	console.log(calType)
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		contentHeight: 800,			// 캘린더 내부 길이 조정
    	expandRows : true,
		headerToolbar : { // 헤더에 표시할 툴 바
			left : 'prev today next',
			center : 'title',
			right : '',
		},
		selectable : true, // 달력 일자 드래그 설정가능
		droppable : true,
		editable : true,
		eventDisplay: 'block',
		eventTimeFormat: { 
			    hour: '2-digit',
			    minute: '2-digit',
			    hour12: false
		},
		events : function(info, successCallback, failureCallback) {
			console.log("이거보세요",calType)
			// 디비에 저장된 일정 뿌리기
			$.ajax({
				  url: "/workfit/schedule/calendar",
				  type: "POST",
				  data : JSON.stringify(calType),
				  beforeSend: function(xhr) {
			            xhr.setRequestHeader(header, token);
			    	},
			      contentType: 'application/json; charset=utf-8',
				  dataType: "JSON",
// 				  traditional: true,
				  async: false, //동기
				  success : function(data){					
					console.log(data)
					successCallback(data);
					
				  },
				  error : function(request,status,error){
// 					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				  }
			});
		},
		eventDrop : function(info){
			
			
			
			//초기값 세팅
			var groupId = info.event._def.groupId;
			var id = info.event._def.publicId
			var title = info.event._def.title;
			var memo = info.event._def.extendedProps.memo;
			var color = info.event.borderColor;
			var calType = info.event.id;
			var allDay = info.event.allDay;
			var groupId = info.event.groupId;

			
			// 날짜 계산 
			var startJson = calStartDate(info.event.startStr);
			var endJson = calEndDate(info.event.endStr);
				
				var jsonObject = {
						calType : calType,
						title : title,
						memo : memo,
						start : startJson.full,
						end : endJson.full,
						allDay : allDay,
						color : color,
						groupId : groupId
				}

				if(allDay == false){
					jsonObject.end = startJson.start+ " " + endJson.endTime;
				}

			
			console.log("업데이트 컨트롤러로 가기 전",jsonObject);
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/workfit/schedule/update.do", true);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.setRequestHeader(header, token);
			xhr.send(JSON.stringify(jsonObject));
			xhr.onreadystatechange =()=>{
				if(xhr.readyState==4 && xhr.status==200){
					console.log(xhr.responseText);
				}
			}
				
	    	
			
		},

		eventClick : function(arg){						// 이벤트 클릭시
					
// 			let calDiv= document.querySelector("body > div.container-fluid.mm-active > div > div.content-page > div > div.card.justify-content-center.mt-3.mb-3");
			let calDiv= document.querySelector("body > div.wrapper.mm-show > div.content-page > div > div.card.justify-content-center.mt-3.mb-3");
		
			DetailModal.style.position="absolute";
			
			if(event.pageX > 1240){
				DetailModal.style.left = (event.pageX - 503)+"px";
			}else{
				DetailModal.style.left = event.pageX + "px";
				
			}
			
			DetailModal.style.top =  event.pageY - calDiv.getBoundingClientRect().top - document.documentElement.scrollTop  + "px";
			
			console.log("arg",arg)
			
		    var DtitleVal = document.querySelector("#DtitleVal");
			var DmemoVal = document.querySelector("#DmemoVal");
		    var DstartDayVal = document.querySelector("#DstartVal");
		    var DendDayVal = document.querySelector("#DendVal");
		    var start4Allday = document.querySelector("#start4Allday");	// 시작 시간으로 변경하기 위함
		    var end4Allday = document.querySelector("#end4Allday");		// 끝 시간으로 변경하기 위함
		    
		    
		    DtitleVal.innerText = arg.event._def.title;
		    DmemoVal.innerText = arg.event._def.extendedProps.memo;
		    var groupId = arg.event._def.groupId;
		  	var endJson = calEndDate(arg.event.endStr);
            var startJson = calStartDate(arg.event.startStr)

		    
		    console.log("arg.event.allDay",arg.event.allDay)
		    if(arg.event.allDay == false){
		    	start4Allday.innerText = "시작시간";
		    	end4Allday.innerText = "종료시간";
		    	DstartDayVal.innerText = startJson.startTime;
		    	DendDayVal.innerText = endJson.endTime;
		    }else{
		    	start4Allday.innerText = "시작날짜";
		    	end4Allday.innerText = "종료날짜";
		    	DstartDayVal.innerText = arg.event.startStr;
		    	DendDayVal.innerText = endJson.end;
		    }
			
				DetailModal.classList.remove("hide");
			
				calDeleteBtn.onclick=()=>{
					console.log("groupId",groupId);
					
							console.log("groupId : " + groupId)
							var xhr = new XMLHttpRequest();
							xhr.open("GET", "/workfit/schedule/delete.do?groupId="+groupId,true);
							xhr.setRequestHeader(header, token);
							xhr.send();
							xhr.onreadystatechange=()=>{
								if(xhr.status==200 && xhr.readyState==4){
									console.log(xhr.responseText);
									arg.event.remove();
									DetailModal.classList.add("hide");
									toastr.error( '<h4 style="font-size:17px;" class="apple4">삭제완료</h4>');
								}	
							};

			
				}
				
				
				
				calModifyBtn.onclick=()=>{
					
					insertModal.style.top =  DetailModal.style.top
					insertModal.style.left =  DetailModal.style.left
					
					
					var insertTitle = document.querySelector("#insertTitle");
					
					insertTitle.innerText = "일정수정"
					var btnName = document.querySelector("#insertBtn")
					console.log("btnName",btnName)
					
					if(btnName){
						insertBtn.setAttribute("id","calModifySend")
					}
					
					var calModifySend = document.querySelector("#calModifySend");
					calModifySend.innerText = "수정"
					
					
					var startDay = document.querySelector("#start");
				    var endDay = document.querySelector("#end");
				    var startTime = document.querySelector("#startTime");
				    var endTime2 = document.querySelector("#endTime");
					var title = document.querySelector("#title");
					var memo = document.querySelector("#memo");
					var allDay = document.querySelector("#allDay");
					var color = document.querySelector("#colorPick");
					var timeSelect = document.querySelector("#timeSelect");
					var insertCalType = document.querySelectorAll("input[name='insertCalType']");
					
					
					var groupId = arg.event._def.groupId;
					title.value = arg.event._def.title;
					memo.value = arg.event._def.extendedProps.memo;
					var colorImg = arg.event.borderColor.substring(1);
					color.innerHTML =  '<img id="'+arg.event.borderColor+'" src="/resources/assets/images/'+colorImg+'.png" height="20px" width="20px">'
					allDay.value = arg.event.allDay;
					console.log(insertCalType);
					
					for(var type of insertCalType){
						if(arg.event._def.publicId == type.value){
							type.checked = true;
						}
					}
					
					

					
					console.log("allDay.value",allDay.value)
					console.log("startJson.start",startJson.start)
					console.log("endJson.end",endJson.end)
					
					startDay.value = startJson.start;
					
					console.log("allDay.value 잘못된듯",allDay.value)
					
					if(allDay.value == "false"){
						allDay.checked = false;
						endDay.value = startJson.start;
						timeSelect.classList.remove("hide");
					}else{
						allDay.checked = true;
						endDay.value = endJson.end;
						timeSelect.classList.add("hide");
// 						end.disabled = true;
// 						start.disabled = true;
					}
					
					
					endTime2.value = endJson.endTime;
					startTime.value = startJson.startTime;
					
					
					calModifySend.onclick=()=>{
					// 수정된 내용
						var titleVal = document.querySelector("#title").value;
						var memoVal = document.querySelector("#memo").value;
						var allDayCheckVal = document.querySelector("#allDay");
						var colorVal = document.querySelector("#colorPick").firstChild.id;
						var startDayVal = document.querySelector("#start").value;
					    var endDayVal = document.querySelector("#end").value;
					    var startTimeVal = document.querySelector("#startTime").value;
					    var endTime2Val = document.querySelector("#endTime").value;
						var newEndJson = calEndDate(endDayVal);
					    console.log("endDayVal",endDayVal)
					    console.log("colorVal",colorVal)
						var jsonObject = {
								title : titleVal,
								memo : memoVal,
								start : startDayVal,
								end : newEndJson.end3,
								allDay : allDayCheckVal.checked,
								color : colorVal,
								groupId : groupId
							}
					
						
						if(allDayCheckVal.checked == false){
							jsonObject.start = startDayVal+" "+startTimeVal;
							jsonObject.end = startDayVal+ " " + endTime2Val;
							jsonObject.textColor = color;
						}
						
						
						console.log("캘린더 컨트롤러로 넘겨줄 객체 ", jsonObject);
					
						
						var xhr = new XMLHttpRequest();
						xhr.open("POST","/workfit/schedule/update.do",true);
						xhr.setRequestHeader('Content-Type','application/json');
						xhr.setRequestHeader(header, token);
						xhr.send(JSON.stringify(jsonObject));
						xhr.onreadystatechange=()=>{
							if(xhr.readyState ==4 && xhr.status==200){
								console.log(xhr.responseText);
								arg.event.remove();
								console.log(start + " " + startTime.value)
								if(allDayCheckVal.checked){
									calendar.addEvent({
										groupId: groupId,
										title: titleVal,
										start : startDayVal,
										end : newEndJson.end3,
										memo : memoVal,
										color : colorVal,
										textColor : "#ffffff",
										allDay: allDayCheckVal.checked,
									})
									
								}else{
									calendar.addEvent({
										groupId: groupId,
										title: titleVal,
										start : startDayVal + " " + startTimeVal,
										end : startDayVal + " " + endTime2Val,
										memo : memoVal,
										color : colorVal,
										textColor : colorVal,
										allDay: false,
									})
									
								}
								toastr.success( '<h4 style="font-size:17px;" class="apple4">수정완료</h4>');
								insertModal.classList.add("hide");
							}
						};		
						
						
					
			    	}
					
					insertModal.classList.remove("hide");
					DetailModal.classList.add("hide");
				}
		  
		},

		
		select : function(info){			      						// 일정추가
		
			var btnName = document.querySelector("#calModifySend")
			
			if(btnName){
				calModifySend.setAttribute("id","insertBtn")
			}
			var insertBtn = document.querySelector("#insertBtn");
			
			insertBtn.innerText = "등록"
			insertTitle.innerText = "일정등록"
			
			
			let calDiv= document.querySelector("body > div.wrapper.mm-show > div.content-page > div > div.card.justify-content-center.mt-3.mb-3");
				insertModal.style.position="absolute";
				
				if(event.pageX > 1240){
					insertModal.style.left = (event.pageX - 503)+"px";
				}else{
					insertModal.style.left = event.pageX + "px";
					
				}
				
				insertModal.style.top =  event.pageY - calDiv.getBoundingClientRect().top - document.documentElement.scrollTop  + "px";
				
				
				// 창 비우기
				for(var i of insertModal.getElementsByTagName("input")){
					if(i.type== "radio"){
						console.log(i.type)
						continue
					}
					i.value = "";
				}
				colorPick.innerHTML = '<img id="#00a9ff" src="/resources/assets/images/00a9ff.png" height="20px" width="20px">';
				
				allDay.checked;
				
				
				var insertCalType = document.querySelector("input[name='insertCalType']").value
				var memIdInsert = document.querySelector("#memIdInsert")
				var deptNameInsert = document.querySelector("#deptNameInsert")
				
				if(insertCalType == calType.memId){

					memIdInsert.checked = true;
				}else{

					deptNameInsert.checked = true;
				} 
				
				
				
			insertModal.classList.remove("hide");
			
			
			
			var arg = info;
			
			// 날짜들
		    var startDay = document.querySelector("#start");
		    var endDay = document.querySelector("#end");
		    var startTime = document.querySelector("#startTime");
		    var endTime2 = document.querySelector("#endTime");
			
		    
			// 날짜 계산 
		  	var start = info.startStr;  // 처음날짜 캘린더제공하는
			
		  	startDay.value = start;
		  	
		  	console.log("인서트 info.endStr",info.endStr)
		  	var endJson = calEndDate(info.endStr);
            var startJson = calStartDate(info.startStr)
			
			endDay.value = endJson.end;
			
			insertBtn.onclick = function(event, arg){
				event.preventDefault();
				var title = document.querySelector("#title").value;
				var memo = document.querySelector("#memo").value;
				var allDayCheck = document.querySelector("#allDay");
				var color = document.querySelector("#colorPick").firstChild.id;
				var insertCalType = document.querySelector("input[name='insertCalType']:checked").value
				
				var jsonObject = {
						calType : insertCalType,
						title : title,
						memo : memo,
						start : startJson.full,
						end : endJson.full,
						allDay : allDayCheck.checked,
						color : color,
						textColor : "#ffffff",
				}
				
				if(allDayCheck.checked == false){
					jsonObject.start = start+ " " + startTime.value;
					jsonObject.end = start+ " " + endTime2.value;
					jsonObject.textColor = color;
				}
				
				console.log(jsonObject);
				console.log("캘린더 컨트롤러로 넘겨줄 객체 ", jsonObject);
				var xhr = new XMLHttpRequest();
				xhr.open("POST","/workfit/schedule/insert.do",true);
				xhr.setRequestHeader('Content-Type','application/json');
				xhr.setRequestHeader(header, token);
				xhr.send(JSON.stringify(jsonObject));
				xhr.onreadystatechange=()=>{
					if(xhr.readyState ==4 && xhr.status==200){
						console.log(xhr.responseText);
						Dataid = parseInt(xhr.responseText);
						
						console.log(start + " " + startTime.value)
						if(allDayCheck.checked){
							calendar.addEvent({
								groupId: Dataid,
								title: title,
								start : start,
								end : endJson.end2,
								memo : memo,
								color : color,
								textColor : "#ffffff",
								allDay: allDayCheck.checked,
							})
							
						}else{
							calendar.addEvent({
								groupId: Dataid,
								title: title,
								start :  start+ " " + startTime.value,
								end : endJson.end + " " + endTime2.value,
								memo : memo,
								color : color,
								textColor : color,
								allDay: false,
							})
							
						}
					}
				};						
				
				insertModal.classList.add("hide");

			}
			
			calendar.unselect();
			
			
		},
		nowIndicator: true, // 현재 시간 마크
// 		locale: 'ko',
	    titleFormat: function (date) {
	        year = date.date.year;
	        month = date.date.month + 1;

	        return year + "년 " + month + "월";
	      },
	     weekday:'long'

	});
	calendar.render();
	
};



document.addEventListener('DOMContentLoaded', function() {
		  
		  let jsonObject = {
				  memId:'${memId}',
				  memDeptName :'${memDeptCode}'
		  }
		  getCal(jsonObject);		
});




function calStartDate (startStr){
	console.log("calStartDate 작동");
	var startJson={};
	console.log("startStr",startStr);
  	var startDate = new Date(startStr);
  	var month = ((startDate.getMonth()+1) < 10) ? "0" + (startDate.getMonth()+1) : (startDate.getMonth()+1);
	var day = (startDate.getDate() < 10) ? "0" + startDate.getDate() : startDate.getDate();
	var start = startDate.getFullYear() + "-" + month + "-" + day;
	startJson.start = start;
	
	var startH = startDate.getHours() < 10? "0" + startDate.getHours() : startDate.getHours()
	var startM = startDate.getMinutes() < 10? "0" + startDate.getMinutes() : startDate.getMinutes()
	var startTime = startH + ":" +startM	
	
	startJson.startTime = startTime;
	var full = start +" " + startTime
	
	startJson.full = full;
	console.log(startJson)
	return startJson;
}

function calEndDate(endStr){
	console.log("calEndDate 작동");
	
	var endJson={};
  	var date = new Date(endStr);
  	date.setDate(date.getDate() - 1);
  	var month = ((date.getMonth()+1) < 10) ? "0" + (date.getMonth()+1) : (date.getMonth()+1);
	var day = (date.getDate() < 10) ? "0" + date.getDate() : date.getDate();
	var end = date.getFullYear() + "-" + month + "-" + day;
	
	endJson.end = end;
	
	// 하루씩 빠지는 이슈 해결
	var day2 = (date.getDate()+1 < 10) ? "0" + (date.getDate()+1) : (date.getDate()+1);
	var end2 = date.getFullYear() + "-" + month + "-" + day2;
	
	endJson.end2 = end2;
	
	var day3 = (date.getDate() < 10) ? "0" + (date.getDate()+2) : (date.getDate()+2);
	var end3 = date.getFullYear() + "-" + month + "-" + day3;
	
	endJson.end3 = end3;
	
	var endH = date.getHours() < 10? "0" + date.getHours() : date.getHours()
	var endM = date.getMinutes() < 10? "0"+date.getMinutes() : date.getMinutes()
	var endTime = endH + ":" +endM	
	
	endJson.endTime = endTime;
	
	endJson.full = end2 + " " + endTime
	
	console.log(endJson);
	return endJson;
}




</script>