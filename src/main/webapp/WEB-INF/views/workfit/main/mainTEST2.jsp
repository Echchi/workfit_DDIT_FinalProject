<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/assets/css/weather.css" rel="stylesheet" type="text/css">
<div class="container" id="mainContainer" >
	<div class="row row-cols-2 mt-5 mainRow" data-plugin="dragula">
	
	
		<div id="toDoList" class="card shadow-lg mt-3 col-6 ml-3 mr-1 widget"
			style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide">
				<i class="dripicons-cross" style="font-size: 17px;"></i>
			</button>
			<div class="card-body p-3" data-toggle="modal"
				data-target="#toDoListModal">
				<h5 class="apple4 text-dark text-left" style="font-size: 17px;">
					<i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일
				</h5>
				<div class="card-body p-3"
					style="border-radius: 20px; background-color: #f8f9fc;"
					id="mainTodoList"></div>
			</div>
		</div>



		<div class="card shadow-lg mt-3 col-6 ml-3 mr-1 widget"
			style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide">
				<i class="dripicons-cross" style="font-size: 17px;"></i>
			</button>
			<div class="card-body p-3">
				<h5 class="apple4 text-dark text-left" style="font-size: 17px;">
					<i class="dripicons-broadcast text-dark mr-2"></i> 결재대기 <span class="apple4 countAppv badge badge-light badge-pill flaot" id="mainAppvCount"></span>
				</h5>
				<div id="requestedList" onClick="location.href ='/workfit/approval/reception/requested'" style="cursor:pointer;"></div>
			</div>
		</div>
		
		
		<div class="card shadow-lg mt-3 col-5 ml-3 mr-1 widget"
			style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide">
				<i class="dripicons-cross" style="font-size: 17px;"></i>
			</button>
			<div class="card-body p-3">
				<h5 class="apple4 text-dark text-left" style="font-size: 17px;">
					<i class="dripicons-volume-medium text-dark mr-2"></i> ${memDeptName } 일정
				</h5>
				<div class="row d-flex justify-content-center">
					<div id="deptTodayDate" onClick="location.href ='/workfit/schedule/index'" class="col-3 card-body p-3 mr-2" style="cursor:pointer;border-radius: 20px; background-color: #f8f9fc;"></div>
					<div id="deptToday" onClick="location.href ='/workfit/schedule/index'" class="text-center col-8 card-body p-2" style="cursor:pointer;border-radius: 20px; background-color: #f8f9fc;"></div>
				</div>
			</div>
		</div>
		
		
		
			<div id="getWeather" class="col-3 mr-3 ml-3 widget d-flex justify-content-center pt-4" onClick="location.href ='#'" style="cursor: pointer; border-radius: 20px; background-color: inherit;">
				<div class="apple6 text-light" style="font-size:20px;"></div>
				<div></div>
			</div>
			
			
			
			
			
			
	</div>
	
</div>





<!-- todoList 모달창 -->

<div id="toDoListModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="standard-modalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="border-radius: 27px;">
			<div class="modal-header pl-4 pr-4">
				<h4 class="modal-title apple4 text-dark" id="standard-modalLabel">
					<i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일
				</h4>
				<div class="d-flex text-align-start">
					<h6 class="modal-title apple4 text-dark ml-1" id="toDoListTime"></h6>
				</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div class="card-body p-3 text-center"
					style="border-radius: 20px; background-color: inherit;">
					<div class="mb-4">
						<input class="apple5 text-dark" type="text" id="insertTodo"
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


<style>

#insertTodo {
	background-color: inherit;
	border: none;
	border-bottom: 1px solid black;
	width: 300px;
}

#insertTodo:focus {
	outline: none;
}

.hide {
	display: none;
}
</style>



<script>
// 에치치 위젯 추가
// ------------------------- 날씨 시작 --------------------
function getWeather(){
	var list;
	const API_KEY = "9d81bfbd29cac200f1bce9c849dea2da";
	
	function onGeoOk(position){
	    const lat = position.coords.latitude;
	    const lon = position.coords.longitude;
	    const url = 'https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lon+'&appid='+API_KEY+'&units=metric';
	    fetch(url)
	        .then(response => response.json())
	        .then(data=> { 
	            list = data
	            getWeathersuc(list)
	        });
	}   

	function onGeoError(){
	    console.log("엥 못찾음")
	}
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
	return list;
}

function getWeathersuc(data){
       const city =    document.querySelector('#getWeather div:first-child');
       const weather = document.querySelector('#getWeather div:last-child');
       
       city.innerText = data.name +" / " +data.main.temp; 
       var weatherType = data.weather[0].main;
       

       
       switch(weatherType){
        case 'Thunderstorm':
    		var str ="";
         	str +='<div class="icon thunder-storm">'
         	str +='<div class="cloud"></div>       '
         	str +='<div class="lightning">         '
         	str +='  <div class="bolt"></div>      '
         	str +='  <div class="bolt"></div>      '
         	str +='</div>                          '
         	str +='</div>                          '
        	 	break;
        case 'Drizzle':
   			var str ="";
         	str +='<div class="icon cloudy">'
         	str +='	<div class="cloud"></div>'
         	str +='	<div class="cloud"></div>'
         	str +='</div>'
        	 	break;
        case 'Rain':
  			var str ="";
         	str +='<div class="icon rainy"> '
         	str +='<div class="cloud"></div>'
         	str +='<div class="rain"></div> '
        	 	break;
        case 'Snow':
    		var str ="";
         	str +='<div class="icon flurries">'
         	str +='<div class="cloud"></div>  '
         	str +='<div class="snow">         '
         	str +='  <div class="flake"></div>'
         	str +='  <div class="flake"></div>'
         	str +='</div>                     '
         	str +='</div>                     '
        	 	break;
        case 'Clear':
    		var str ="";
         	str +='<div class="icon sunny">  '
         	str +='<div class="sun">         '
         	str +='  <div class="rays"></div>'
         	str +='</div>                    '
         	str +='</div>                    '
        	 	break;
        case 'Clouds':
    		var str ="";
         	str +='<div class="icon cloudy">'
         	str +='	<div class="cloud"></div>'
         	str +='	<div class="cloud"></div>'
         	str +='</div>'
        	 	break;
        default:
    		var str ="";
         	str +='<div class="icon cloudy">'
         	str +='	<div class="cloud"></div>'
         	str +='	<div class="cloud"></div>'
         	str +='</div>'
        	break;
       }
       
     weather.innerHTML = str;
}

// ------------------------- 날씨 끝 --------------------
// ------------------------- 결재할 것 시작 --------------------
function getRequested(){
	var mainAppvCount = document.querySelector("#mainAppvCount")
	var list;
	// 결재할 것 리스트 출력 
	var xhr = new XMLHttpRequest();
	xhr.open("GET","/workfit/approval/reception/getRequested",true);
	xhr.setRequestHeader(header,token);
	xhr.send();
	xhr.onreadystatechange=()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			list = JSON.parse(xhr.responseText);
			getReqsuc(list);
		}
	}
	return list
}


	// 결재할 것 성공했을 시 함수
function getReqsuc(list){
	var requestedList = document.querySelector("#requestedList");
	var count = 0;
			if(list.length == 0){
				console.log("list.length",list.length)
				var str = '<div class="justify-content-center text-dark apple6 align-items-center row text-dark pt-2 pl-3 pr-3" style="border-radius: 20px; background-color: #f8f9fc;">'
				str +="<p class='text-center ml-3'>결재할 항목이 없습니다 </p>"
				str += "</div>"
				requestedList.innerHTML += str;
			}
			
			for(var item of list){
					var str = '<div class="text-dark apple6 justify-content-between align-items-center row text-dark pt-2 pl-3 pr-3 mr-1 ml-1 mb-2" style="border-radius: 20px; background-color: #f8f9fc;">'
					str +="<p class='mr-3'>"+item.APPROVAL_DOC_CODE+"</p>"
					str +="<p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-break:break-all;width: 200px;'>"+item.APPROVAL_TITLE+"</p>"
					str +="<p>"+item.MEM_NAME+"</p>"
					
					var date = dayjs(item.APPROVAL_DATE);
					str +="<p class='ml-3' style='font-size:10px;'>"+date.format("YYYY.MM.DD HH:mm")+"</p>"
					str +="</div>"
					
				 if(count < 3){ 
					requestedList.innerHTML += str;
				}
			
				count++;
			}
}


// -------------------------  결재할 것  끝 --------------------
// -------------------------  부서캘린더  시작 --------------------
function getDeptCal(){
	var list;
	var deptTodayDate = document.querySelector("#deptTodayDate")
	var today = new Date();
	var todayDate = dayjs(today).format("DD");
	var todayDateWeek = dayjs(today).format("dd");
	
	deptTodayDate.innerHTML = "<div class='apple5 text-dark'style='font-size:11px;'>"+todayDateWeek+"요일</div>";
	deptTodayDate.innerHTML += "<div class='text-center apple8 text-dark'style='font-size:33px;'>"+todayDate+"</div>";

	var xhr = new XMLHttpRequest();
	xhr.open("GET","/workfit/schedule/getDeptCal",true);
	xhr.setRequestHeader(header,token);
	xhr.send();
	xhr.onreadystatechange=()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			list = JSON.parse(xhr.responseText);
			getDeptCalSuc(list)
					
		}
	}
	return list;
}

function getDeptCalSuc(list){

	var deptToday = document.querySelector("#deptToday");
	var count = 0;
			if(list.length == 0){
				console.log("list.length",list.length)
				deptToday.innerHTML ="<p class='text-dark apple6 text-center ml-3'>일정이 없습니다 </p>"
			}
			
			for(var item of list){
					count++;
					var color = item.color.substring(1)
					var str = "<div class='d-flex justify-content-between align-items-center'>"
					str +='<span><img src="/resources/assets/images/'+color+'.png" height="13px" width="13px"></span>'
					str +="<div class='text-dark apple6 mr-3' style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-break:break-all;width: 200px;'>"+item.title+"</div>"
					str += "</div>"
					
					if(item.allDay){
						str += "<div class='apple4 text-right'>하루종일</div>"
					}else{
						var startTime = dayjs(item.start); 
						var endTime = dayjs(item.end); 
						str += "<div class='apple4 text-right' style='font-size:15px;white-space: nowrap;'>"+startTime.format("HH:mm")+" - "+endTime.format("HH:mm") +"</div>"
					}
					
			 	if(count < 2){ 
					deptToday.innerHTML += str;
				}else{
					str += "<div class='apple4 mr-3' style='width:50px;font-size:15px;> 그 외 일정"+(list.length - 2) +"</div>"
					deptToday.innerHTML += str;
					break;
				}
				
			}
}
// -------------------------  부서캘린더 끝 --------------------
// ------------------------- 오늘의 할일시작 --------------------
// 오늘의 할 일

function toDofunc(){
	var list;
	var insertTodo = document.querySelector("#insertTodo");
	var insertTodoList = document.querySelector("#insertTodoList");
	var toDoListTime = document.querySelector("#toDoListTime");
	let today = new Date();   
	var mainTodoList = document.querySelector("#mainTodoList");
	//console.log("mainTodoList",mainTodoList)
	
	toDoListTime.innerHTML = today.toLocaleDateString();
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/selectTodoList", true);
	xhr.setRequestHeader(header,token);
	xhr.send();
	xhr.onreadystatechange =()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			list = JSON.parse(xhr.responseText);
			toDofuncSuc (list)
		}
	}
	
	return list;
	
	function toDofuncSuc (list){
		for(let item of list){
        	let uuid = self.crypto.randomUUID();
			//console.log(item);
			var str ="";
			str +=`<div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid= "\${item.todayCode}" id="\${item.todayCode}"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> \${item.todayContent}<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div>`;
			insertTodoList.innerHTML += str;
			mainTodoList.innerHTML += str;
			
		}
	}
	
	
	
	insertTodo.addEventListener("keydown", function(event){
		if(event.keyCode ==13){
	        event.preventDefault();
	        	var insertTodoVal = insertTodo.value;
	            var div = document.createElement("div");
	            div.setAttribute("class", "ml-3")
	            
	        	var h4 = document.createElement("h4");
	        	h4.setAttribute("class", "apple5 text-dark text-left ml-3")
	        	
	        	let uuid = self.crypto.randomUUID();
	        	h4.setAttribute("id", uuid);
	        	h4.setAttribute("data-memoid",uuid)
	        	//console.log(h4);
	        	
	        	h4.innerHTML += "<input type='checkbox' style='accent-color:#6c757d' class='mr-3'> " + insertTodoVal;
	        	
	            const button = document.createElement("button");
	            button.innerText = "x";
	            button.style.backgroundColor="inherit";
	            button.style.border="none";
	            button.setAttribute("class", "ml-3")
	            button.addEventListener("click", deleteToDo);
	        	
	        	h4.appendChild(button);
	        	div.appendChild(h4);
	        	
	        	insertTodoList.append(div.cloneNode(true))
	        	mainTodoList.append(div);
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
						//console.log(xhr.responseText);
					}
				}
	
	        }
	}); 
}

var deleteToDo = (e) => {
	var todayCode;
	//console.log("e",e);
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
		todayCode = e.target.closest("h4").id;
		var delTargets = document.querySelectorAll("h4[data-memoId='"+todayCode+"']");
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
//------------------------- 오늘의 할일 끝 --------------------



$(function() {
	toDofunc();
	getRequested();
	getDeptCal();
	getWeather();
})



</script>
