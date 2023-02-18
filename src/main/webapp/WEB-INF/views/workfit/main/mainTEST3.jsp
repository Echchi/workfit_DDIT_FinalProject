<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 지윤아 많이 놀랐지? 너의 웨더 css와 애니메이션 css는 메인템플릿에 있단다..! 그만 정신차리도록해..  -->
<style>
/* 부서 출퇴근 */
.memStatusColor{
	position:absolute; 
	left:42px; 
	bottom:1px; 
	border-radius: 50%; 
	border: 1.5px solid white; 
	z-index: 10; 
	width : 13px; 
	height: 13px;
}

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

/*  SWEET ALERT를 위한 CSS코드    */
.swal-text {
	padding: 17px;
	display: block;
	margin: 22px;
	text-align: center;
	color: #61534e;
}
.widget{
	background-color: rgba(255, 255, 255, 0.7)
}
</style>
<div class="container" id="mainContainer">
<!-- 	<div class="row row-cols-2 mt-5 mainRow" data-plugin="dragula"></div> -->
	<div class="row row-cols-2 mt-5 mainRow" data-plugin=""></div>
</div>

<!-- 출근 버튼 클릭 시 나타날 모달창 -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalScrollableTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalScrollableTitle">출근하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="comStartContent">
				<!--         	큐알 이미지 및 기타 내용 입력 -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">출근 완료</button>
			</div>
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



<button id="commuteStart" style="display: none;" type="button"
	class="btn btn-primary" data-toggle="modal"
	data-target="#exampleModalScrollable">출근 버튼</button>
<!-- <button id="commuteEnd" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable2">퇴근 버튼</button> -->


<!-- SWEET ALERT를 위한 CDN코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" defer="defer">
var newsData;
var toDofuncData;
var getRequestedData;
var getDeptCalData; 
var getMyCalData; 
var getWeatherData;
var getMemStatusData;


//------------------------- 출퇴근 시작 --------------------

function fn_commuteStart(){
	var startBtn = $("#commuteStart");
	
	var commuteFlag = '${commuteFlag}';
	if(commuteFlag == 'commuteSuccess'){
		swal("이미 출근처리 됐습니다!", "You clicked the button!", "info");
		return;
	}
	$.ajax({
		type : "post",
		url : "/otp/generate",
		data : JSON.stringify({"memId" : "qodudgh85"}), // 여기서 qodudgh85라는 memId는 로그인 처리 후 세션에서 꺼내오거나 Spring Security에서 꺼내오면 된다.
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(res){
// 			console.log(res);
// 			console.log(res.url); 
			
			window.encodedKey = res.encodedKey;
			
			var tagsStr = "<img src='"+res.url+"'>";
			tagsStr += "<span id='pleaseInsertNum'>인증번호를 입력해주세요</span><input style='width : 250px;' type='text' id='simpleinput' class='form-control'>";
			tagsStr += "<button type='button' class='btn btn-dark btn-rounded' onclick='fn_verify()''>인증하기</button>";
			
// 			var imgTag = document.createElement("img");
// 			imgTag.src = res.url; 
             
             
			$(document.getElementById("comStartContent")).html(tagsStr);
			
		
		}
	});
	
	startBtn.click();

}

function fn_verify(){
// 	console.log($("#simpleinput").val());
	var nums = $("#simpleinput").val();
	
	var encodedKey = window.encodedKey;
// 	console.log(encodedKey);
// 	console.log(nums);
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	
	$.ajax({
		type : "post",
		url : "/otp/verify",
		data : JSON.stringify({"encodedKey" : encodedKey, "otpNumber" : nums}),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    },
		success : function(res){
// 			console.log(res); 
			if(res == "success"){
				location.href = "/workfit/main?flag=commuteSuccess";
			}else{
				
				$("#pleaseInsertNum").text("인증번호가 틀립니다. 다시 입력해주세요");
				$("#pleaseInsertNum").css("color","red");
			}
			
		
		}
	});
	
	
}



function fn_commuteEnd(){
// 	var endBtn = $("#commuteEnd");
// 	endBtn.click();
	swal({
		  title: "퇴근 하시겠습니까?",
		  text: "Once deleted, you will not be able to recover this imaginary file!",
		  icon: "info",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("퇴근 처리가 완료됐습니다!", {
		      icon: "success",
		    });
		    
		    var header = '${_csrf.headerName}';
			var token =  '${_csrf.token}';
		    $.ajax({
				type : "post",
				url : "/commuteEnd",
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    	},
				success : function(res){
// 					console.log("퇴근 성공 했는지 확인 "+res);
				}
			});
		    
		    
		  } else {
		    swal("Your imaginary file is safe!");
		  }
		});

}
// ------------------------ 출퇴근 끝 --------------------


// ------------------------- 메일 시작 --------------------
async function getMail(){
	console.log("메일 시작 ")
	
    const headers = {
        header: token
    }
    
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
    	const response = await axios.get("/workfit/dashGetMAil")
    	console.log("메일이 어떻게 오는거야..?",response.data)
		getMailSuc(response.data);
		return response.data;

}


	// 메일 성공했을 시 함수
function getMailSuc(list){
	var receiveMailList = document.querySelector("#receiveMailList");
	if(!receiveMailList){
		console.log("메일 그리기 실패 ")
		return;
	}
	var mailCount = document.querySelector("#mailCount")
	var count = 0;
	
			if(list.length == 0){
				var str = '<div class="justify-content-center text-dark apple6 align-items-center row text-dark pt-2 pl-3 pr-3" style="border-radius: 20px; background-color: #f8f9fc;">'
				str +="<p class='text-center ml-3'>받은 메일이 없습니다 </p>"
				str += "</div>"
				receiveMailList.innerHTML += str;
			}
			
			for(var item of list){
					console.log("찍어봐라 메일 제목",item.emailTitle)
					count++;
					var str = '<div class="text-dark apple6 justify-content-between align-items-center row text-dark pt-2 pl-3 pr-3 mr-1 ml-1 mb-2" style="border-radius: 20px; background-color: #f8f9fc;">'
					str +="<p class='mr-3'>"+item.memId+"</p>"
					str +="<p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-break:break-all;width: 200px;'>"+item.emailTitle+"</p>"
					
					var date = dayjs(item.emailDate);
					str +="<p class='ml-3' style='font-size:10px;'>"+date.format("YYYY.MM.DD HH:mm")+"</p>"
					str +="</div>"
					
				 if(count < 4){ 
					 receiveMailList.innerHTML += str;
					 
				}
					mailCount.innerHTML = count;

			}
}


// -------------------------  메일  끝 --------------------

// ------------------------- 결재할 것 시작 --------------------
async function getRequested(){
// 	console.log("결재 대기 시작 ")
	
	
    const headers = {
        header: token
    }
    
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
    	const response = await axios.get("/workfit/approval/reception/getRequested")
		getReqsuc(response.data);
		return response.data;
		
}


	// 결재할 것 성공했을 시 함수
function getReqsuc(list){
// 	console.log("2. 결재 대기 그려주는 함수 실행 ")
// 	console.log("2-1. 리스트는 이런 모양 ",list)
	var requestedList = document.querySelector("#requestedList");
	if(!requestedList){
// 		console.log("넌 없는거야 ", requestedList);
		console.log("결재 그리기 실패 ")
		return;
	}
	var mainAppvCount = document.querySelector("#mainAppvCount")
	var count = 0;
	
			if(list.length == 0){
// 				console.log("list.length",list.length)
				var str = '<div class="justify-content-center text-dark apple6 align-items-center row text-dark pt-2 pl-3 pr-3" style="border-radius: 20px; background-color: #f8f9fc;">'
				str +="<p class='text-center ml-3'>결재할 항목이 없습니다 </p>"
				str += "</div>"
				requestedList.innerHTML += str;
			}
			
			for(var item of list){
					count++;
					var str = '<div class="text-dark apple6 justify-content-between align-items-center row text-dark pt-2 pl-3 pr-3 mr-1 ml-1 mb-2" style="border-radius: 20px; background-color: #f8f9fc;">'
					str +="<p class='mr-3'>"+item.APPROVAL_DOC_CODE+"</p>"
					str +="<p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-break:break-all;width: 200px;'>"+item.APPROVAL_TITLE+"</p>"
					str +="<p>"+item.MEM_NAME+"</p>"
					
					var date = dayjs(item.APPROVAL_DATE);
					str +="<p class='ml-3' style='font-size:10px;'>"+date.format("YYYY.MM.DD HH:mm")+"</p>"
					str +="</div>"
					
				 if(count < 4){ 
					requestedList.innerHTML += str;
				}
				
					mainAppvCount.innerHTML = count;
			}
}


// -------------------------  결재할 것  끝 --------------------
//------------------------- 오늘의 할일 시작 --------------------
async function toDofunc(){
	var list
	var insertTodo = document.querySelector("#insertTodo");
	if(!insertTodo) return
	var insertTodoList = document.querySelector("#insertTodoList");
	var toDoListTime = document.querySelector("#toDoListTime");
	let today = new Date();   
	var mainTodoList = document.querySelector("#mainTodoList");
	//console.log("mainTodoList",mainTodoList)
	
	toDoListTime.innerHTML = today.toLocaleDateString();
	
	
    const headers = {
            header: token
        }
        
        axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
        	const response = await axios.get("/selectTodoList")
    		toDoFuncSuc(response.data);
    		return response.data;
}

// todoList 성공시 그려주는 부분 ! 
function toDoFuncSuc(list){
// 	console.log("toDoFuncSuc 성공후 그리는 메소드 실행 ")
	var mainTodoList = document.querySelector("#mainTodoList");
	if(!mainTodoList){
		return;
	}
	var insertTodoList = document.querySelector("#insertTodoList");
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
            button.setAttribute("class", "delBtns ml-3")
        	
        	h4.appendChild(button);
        	div.appendChild(h4);
        	
        	insertTodoList.append(div.cloneNode(true))
        	mainTodoList.append(div);
			
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
					//console.log(xhr.responseText);
				}
			}

        }
  });
  
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
//------------------------- 오늘의 할일 끝 --------------------

//------------------------- 뉴스 시작 --------------------
var res = "";
function getNews(){
// 	console.log("뉴스 넣기 전에 이거 있음 ???", document.querySelector('div[data-dashname="뉴스"]'))
// 	console.log("뉴스 시작,,,?")
    var newsJsonArr = [];
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/getNews", true);
	xhr.setRequestHeader(header, token);
	xhr.send();
	xhr.onreadystatechange=()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			// 백단에서 어느정도 자르고 옴 !!
			res = xhr.responseText;
            var x2js = new X2JS();
            var news = x2js.xml_str2json(res);
//             console.log("크롤링 json", news);
            for(let i = 0; i < 3 ; i++){
//             	console.log("여기는 ? ")
            	var newsJson = {};
            	res = news.ul.li[i].dl;
//             	console.log("여기는 ? 2")
//             	console.log(res.dt[1])
            	var newsTitle = res.dt[1].a.__text;
            	var newsLink = res.dt[0].a._href;
            	var newsImg = res.dt[0].a.img._src;
            	var newsMin = res.dd.span[2].__text;
            	var newsFrom = res.dd.span[1].__text;
            	
            	newsJson.newsTitle = newsTitle;
            	newsJson.newsLink = newsLink;
            	newsJson.newsImg = newsImg;
            	newsJson.newsMin = newsMin;
            	newsJson.newsFrom = newsFrom;
            	
            	newsJsonArr.push(newsJson);
            }	// end of for
            
            insertDataToNewsWidget(newsJsonArr);
            
		}	//	end of if

	}	// end of readystatechange
	return newsJsonArr;
}

// 위젯에 json데이터 넣기 
var insertDataToNewsWidget = (json) => {
// 	console.log("파라미터로 들어온 json", json)
// 	console.log("뉴스데이터 넣기")
	var newsWidget = document.querySelector('div[data-dashname="뉴스"]');
	if(!newsWidget){
		return;
	}
// 	console.log("위젯 div !!", newsWidget)
	var newsContent = newsWidget.querySelector(".newsContent");
// 	console.log("위젯 컨텐트 div", newsContent);
	
	var ContentHTML = "";
	ContentHTML += `<h4 class="apple5 text-dark">정치 분야 상위 뉴스</h4>`
	for(let item of json){
		ContentHTML += `<div class="row" onclick="window.open('\${item.newsLink}', '정치뉴스', 'width=450, height=500, screenX=461, screenY=153,location=no, status=yes,  scrollbars=yes')"> `
		ContentHTML += 		`<div class="col-8">`
		ContentHTML += 		`	<h5 class="apple4 text-dark">\${item.newsTitle}</h5>`
		ContentHTML += 		`	<h8 class="apple3">[\${item.newsFrom}] \${item.newsMin}</h8>`
		ContentHTML += 		`</div>`
		ContentHTML += 		`<div class="col-3">`
		ContentHTML += 		`	<img src="\${item.newsImg}" alt="\${item.newsTitle}" />`
		ContentHTML += 		`</div>`
		ContentHTML += `</div> `
	}
	
// 	console.log("내용 확인 : ", ContentHTML);
	newsContent.innerHTML = ContentHTML;
	
	

}
//------------------------- 뉴스 끝 --------------------

// ------------------------- 날씨 시작 --------------------




 function getWeather(){
	console.log("날씨 시작")
	var list;
	const API_KEY = "9d81bfbd29cac200f1bce9c849dea2da";
	
// 	async function onGeoOk(position){
	function onGeoOk(position){
		
	    const headers = {
	            header: token
	        }
		
	    const lat = position.coords.latitude;
	    const lon = position.coords.longitude;
	    
	    
// 	    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
// 	    	const response = await axios.get("https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid="+API_KEY+"&units=metric")
// 			getWeathersuc(response.data);
// 			return response.data;
			
	    const url = 'https://api.openweathermap.org/data/2.5/weather?lat='+lat+'&lon='+lon+'&appid='+API_KEY+'&units=metric';
	    fetch(url)
	        .then(response => response.json())
	        .then(data=> { 
	            list = data
// 	            console.log("날씨",list)
	            getWeathersuc(list)
	        });
	}   

	function onGeoError(){
// 	    console.log("엥 못찾음")
	}
	
	navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
	return list;
}

function getWeathersuc(data){
	   console.log("날씨 성공",data)
       const city =    document.querySelector('#city');
	   console.log("city",city)
	   if(!city) return;
       const weather = document.querySelector('#weather');
//        console.log("왜 안와?")
       city.innerText = data.name +" " +data.main.temp; 
       var weatherType = data.weather[0].main;
	   console.log("weatherType",weatherType)
       

       
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
        case 'clouds':
    		var str ="";
         	str +='<div class="icon cloudy">'
         	str +='	<div class="cloud">나오냐?</div>'
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

// -------------------------  부서캘린더  시작 --------------------
async function getDeptCal(){
// 	console.log("부서캘린더 시작");
	var list;
	
    const headers = {
            header: token
        }
        
     axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
     	const response = await axios.get("/workfit/schedule/getDeptCal")
 		getDeptCalSuc(response.data);
 		return response.data;
	
	
	
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET","/workfit/schedule/getDeptCal",true);
// 	xhr.setRequestHeader(header,token);
// 	xhr.send();
// 	xhr.onreadystatechange=()=>{
// 		if(xhr.status == 200 && xhr.readyState == 4){
// 			list = JSON.parse(xhr.responseText);
// 			getDeptCalSuc(list)
					
// 			return list;
// 		}
// 	}
}

function getDeptCalSuc(list){
	console.log("부서캘린더 성공",list);
	var deptToday = document.querySelector("#deptToday");
	if(!deptToday){
		return;
	}
	var deptTodayDate = document.querySelector("#deptTodayDate")
	var today = new Date();
	var todayDate = dayjs(today).format("DD");
	var todayDateWeek = dayjs(today).format("dd");
	
	deptTodayDate.innerHTML = "<div class='apple5 text-dark'style='font-size:11px;'>"+todayDateWeek+"요일</div>";
	deptTodayDate.innerHTML += "<div class='text-center apple8 text-dark'style='font-size:33px;'>"+todayDate+"</div>";
	
	var deptCalTitle = document.querySelector("#deptCalTitle");
	deptCalTitle.innerHTML += list[0].deptName + " 일정";
	var count = 0;
			if(!list[0].color){
				console.log("list.length",list.length)
				var str = "<div class='d-flex justify-content-center align-items-center'>"
				str += "<p class='text-dark apple6 text-center ml-3'>일정이 없습니다 </p>"
				str += "</div>"
				
				deptToday.innerHTML += str;
				return;
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
// -------------------------  내 캘린더  시작 --------------------
async function getMyCal(){
// 	console.log("내캘린더 시작");
	var list;
	
    const headers = {
            header: token
        }
        
     axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
     	const response = await axios.get("/workfit/schedule/getMyCal")
 		getMyCalSuc(response.data);
 		return response.data;
}

function getMyCalSuc(list){
	console.log("내 캘린더 성공",list);
	var myToday = document.querySelector("#myToday");
	if(!myToday){
		return;
	}
	var myTodayDate = document.querySelector("#myTodayDate")
	var today = new Date();
	var todayDate = dayjs(today).format("DD");
	var todayDateWeek = dayjs(today).format("dd");
	
	myTodayDate.innerHTML = "<div class='apple5 text-dark'style='font-size:11px;'>"+todayDateWeek+"요일</div>";
	myTodayDate.innerHTML += "<div class='text-center apple8 text-dark'style='font-size:33px;'>"+todayDate+"</div>";
	
	var myCalTitle = document.querySelector("#myCalTitle");
	myCalTitle.innerHTML += list[0].memName + " 일정";
	var count = 0;
			if(!list[0].color){
				console.log("list.length",list.length)
				var str = "<div class='d-flex justify-content-center align-items-center'>"
				str += "<p class='text-dark apple6 text-center ml-3'>일정이 없습니다 </p>"
				str += "</div>"
				
				myToday.innerHTML += str;
				return;
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
					myToday.innerHTML += str;
				}else{
					str += "<div class='apple4 mr-3' style='width:50px;font-size:15px;> 그 외 일정"+(list.length - 2) +"</div>"
					myToday.innerHTML += str;
					break;
				}
				
			}
}
// -------------------------  내 캘린더 끝 --------------------
//-------------------------  부서별 출퇴근 시작 --------------------

async function getMemStatus(){
	console.log("부서별 출퇴근 현황 시작");
	var list;
	
    const headers = {
            header: token
        }
        
	axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
   	const response = await axios.get("/getMemStatus")
	console.log("부서별 출퇴근 : ", response.data);
	drawMemStatus(response.data);
   	return response.data;
	
}

var drawMemStatus = (data) => {
	var content = document.querySelector(".memStatus");
	if(!content){
		return;
	}
	var str = ""
	/*
		{
	    "memName": "조현수",
	    "memJobGrade": "사원",
	    "memImg" : "/resources/어쩌구 저쩌구",
	    "status": "NO"
		}
		<div class="row">
          	<div class="text-center" >
          		<div class="img " style="position:relative; ">
           		<img alt="ㅠ" class="rounded-circle"src="/resources/uploads/profileImages/우는곰돌이.jpg" width="45px">
           		<div style="position:absolute; left:35px; bottom:1px; border-radius: 50%; border: 1.5px solid white; background-color: red; z-index: 10; width : 13px; height: 13px"></div>
          		</div>
          		<h4 class="apple4" style="font-size: 14px">조현수(사원)</h4>
          	</div>	
	
	*/
		str += '<div class="row">';
	for(let item of data){
		str += '	<div class="col text-center" >';
		str += '		<div class="img " style="position:relative; ">';
		str += '			<img alt="ㅠ" class="rounded-circle"src="'+item.memImg+'" width="45px" style="box-shadow: 1px 1px 10px #565656;">';
		
		if(item.status == "NO"){
			str += '		<div class="memStatusColor" style="background-color: #fe5c5b;" ></div>';
		}else{
			str += '		<div class="memStatusColor" style="background-color: #32c760;" ></div>';
		}
		str += '		</div>';
		str += '		<h4 class="apple4 text-dark mt-2 mb-0" style="font-size: 14px">'+item.memName+'</h4>';
		str += '		<h4 class="apple4 mt-0 mb-0" style="font-size: 12px">(' +item.memJobGrade+')</h4>';
		str += '	</div>';
	}
		str += '</div>';
	
	content.innerHTML = str;
	
}

// -------------------------  부서별 출퇴근 끝 --------------------





//------------------------- 대시보드 시작 --------------------

var mainContainer = document.querySelector("#mainContainer");
var body = document.querySelector("body");
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
var settingIcon = document.querySelector("#settingIcon");


//맨처음 메인 페이지 로드 될때 회원별 대시보드 리스트 출력하는 함수
var init = () => {
// 	console.log("init함수(회원별 대시보드 리스트 출력)")
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "/getMyDashboardList", true);
	xhr.setRequestHeader(header,token);
	xhr.send();
	xhr.onreadystatechange =()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let content = JSON.parse(xhr.responseText)
			var str = ""
// 			console.log("init함수 json데이터 : ", content);
			for(let dashItem of content){
				var rawData = dashItem.dashBoardListVO.widgetContent;
				var dataStart = rawData.substring(0,rawData.indexOf('<div')+5)
				var dataEnd = rawData.substring(rawData.indexOf('<div')+5, rawData.length) 
				var dataMiddle = `data-dashListCode="\${dashItem.dashListCode}" 
							data-dashboardCode = "\${dashItem.dashboardCode}" 
							data-dashName = "\${dashItem.dashBoardListVO.dashName}" 
							data-dashImg = "\${dashItem.dashBoardListVO.dashImg}"` 
				resData = dataStart.concat(dataMiddle, dataEnd)
// 				console.log(resData)
				str += resData;
// 				console.log("순서는 ~~ ", dashItem.dashSeq);
			}
			mainContainer.querySelector(".mainRow").innerHTML= str;
			
// 			var widgets = document.querySelectorAll(".widget");
// 			for(var item of widgets){
// 				item.draggable=true;
// 				item.addEventListener('dragstart', (e) => {
// 		            console.log("드래그되닝 ~!~!~!~!~!~!~!")
// 		        })
// 			}
			DeleteWidget('before');
			newsData = getNews();
			toDofuncData = toDofunc();
			getRequestedData = getRequested();
			getDeptCalData = getDeptCal();
			getMyCalData = getMyCal();
			getWeatherData = getWeather();
			getMemStatusData = getMemStatus();
			getMailData = getMail();

			console.log("init끝이야~~")
		}
			

	} //onreadystatechange 끝
	
}	// init 끝


let drake;
//톱니 클릭하면 위젯 나오는 거
function openWidget(param){
// 	console.log("톱니바퀴 클릭함 ! ")
	var widgetList = document.querySelector("#widgetList");
// 	console.log("얍얍",widgetList);
	var mainRow = document.querySelector(".mainRow");

	var options = {};
	if(widgetList){
		options = {
		  moves: function (el, source, handle, sibling) {
			    return false; // elements are always draggable by default
			  },	
		};
	}
// 	let drake;
	if(drake){
		drake.destroy();
	}
	drake = dragula([mainRow], options);
// 	console.log(drake)
	
	
	if(!widgetList){
		// 드래귤라 넣어주기 
// 		drake = dragula([mainRow], options);
// 		console.log("위젯 리스트 있니 ?", widgetList)
		var div = document.createElement("div");
		div.style.position = "fixed";
		div.style.bottom = 0;
		div.style.zIndex = 22000000;
		div.style.width = "100%";
		div.style.height = "20%";
		div.style.backgroundColor = "rgb(250,251,254,0.8)";
		div.setAttribute("id","widgetList");
		div.setAttribute("class","justify-content-center slide-top p-2 row");
	
	
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/getDashboardItemImage", true);
		xhr.setRequestHeader(header,token);
		xhr.send();
		xhr.onreadystatechange =()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
				let itemList = JSON.parse(xhr.responseText)
// 				console.log("골골이 바꿈 : ", itemList);
				for(item of itemList){
					/*
					item
					
					{
					    "dashListCode": "WIDGET6",
					    "dashName": "결재할것",
					    "dashImg": "/resources/uploads/widgets/결재할것.png",
					    "widgetStatus": "\u0000",
					    "widgetMoveUri": null,
					    "widgetDataUri": null,
					    "widgetContent": "<div class=\"card shadow-lg mt-3 col-6 ml-3 mr-1 widget\"\r\n    style=\"border-radius: 27px; backdrop-filter: blur(10px);\">\r\n<button class=\"shadow-lg DashDelBtn hide\" ><i class=\"dripicons-cross\" style=\"font-size: 17px;\"></i></button>\n    <div class=\"card-body p-3\">\r\n        <h5 class=\"apple4 text-dark text-left\" style=\"font-size: 17px;\">\r\n            <i class=\"dripicons-broadcast text-dark mr-2\"></i> 결재할 것\r\n        </h5>\r\n        <div class=\"card-body p-3\"\r\n            style=\"border-radius: 20px; background-color: #f8f9fc;\">\r\n            <h4 class=\"apple5 text-dark text-center\">어쩌구 저쩌구 블라블라</h4>\r\n        </div>\r\n    </div>\r\n</div>"
					}
					
					*/
					var itemDiv = document.createElement("div");
					itemDiv.setAttribute("class","p-2 mr-4 text-center");
					
					var imgTag = document.createElement("img");
					imgTag.style.width = "50px";
					imgTag.style.height = "50px";
					imgTag.setAttribute("src",item.dashImg);
					imgTag.setAttribute("class","widgetImg");
					imgTag.setAttribute("draggable",true);
					
					var imgName = document.createElement("div")
					imgName.innerHTML = item.dashName;
					var rawContent = item.widgetContent;
// 					console.log("원래 내용이야 : ", rawContent)
					var dataStart = rawContent.substring(0,rawContent.indexOf('<div')+5)
					var dataMiddle = `data-dashListCode="\${item.dashListCode}" 
								data-dashName = "\${item.dashName}" 
								data-dashImg = "\${item.dashImg}"` 
					var dataEnd = rawContent.substring(rawContent.indexOf('<div')+5, rawContent.length) 
					resContent = dataStart.concat(dataMiddle, dataEnd)
// 					console.log("잘 나왔을까? ", resContent)
// 					imgName.setAttribute('data-content', item.widgetContent);
					imgName.setAttribute('data-content', resContent);
					
					imgName.setAttribute('class', "mt-2 apple9 text-center text-dark");
					
					itemDiv.appendChild(imgTag);
					itemDiv.appendChild(imgName);
					div.append(itemDiv);
				}
			}
			body.append(div);
			// 위젯 이미지 클릭 이벤트
			imgClickEvent();
		}
		
		// 삭제 버튼 생성
		addDelButton();
		// 덜덜 추가
		addDulDul();

			
		
	}else{
		// 드래귤라 날리기 
// 		drake.destroy();
// 		drake = dragula([mainRow], options);
// 		console.log("widgetList있니 ?",widgetList);
		widgetList.classList.remove("slide-top");
		widgetList.classList.add("slide-bottom");
		
		// 삭제 버튼 삭제
		
		var DashDelBtns = document.querySelectorAll(".DashDelBtn")
		for(var btn of DashDelBtns){
			btn.classList.remove("fadein")
			btn.classList.add("fadeout")
		}
		
		// 덜덜 빼기
		noDulDul();
		
		setTimeout(()=>{
			var DashDelBtns = document.querySelectorAll(".DashDelBtn")
			for(var btn of DashDelBtns){
				btn.classList.add("hide")
				btn.classList.remove("fadeout")
			}
			widgetList.remove();
		},"800")
		
		var dbWidgetList = document.querySelectorAll(".widget");
		var widgetArr = [];
		var index = 0;
		for(let dbWidget of dbWidgetList){
			index ++;
// 			console.log("넣을 위젯이야 ~~ ",dbWidget)
// 			console.log(dbWidget.dataset)
			/*
				dataset
				{
				    "dashlistcode": "WIDGET3",
				    "dashboardcode": "D6",
				    "dashname": "부서캘린더",
				    "dashimg": "/resources/uploads/widgets/부서캘린더.png"
				}
			
			*/
			var widgetJSON = {};
			widgetJSON.dashboardCode = dbWidget.dataset.dashboardcode == undefined ? null : dbWidget.dataset.dashboardcode;	// 프라이머리키
			widgetJSON.dashListCode = dbWidget.dataset.dashlistcode;	// 위젯 정보 코드 
			widgetJSON.dashSeq = index;	// 순서 
			
			
			/*
			  -- db 에 이미 있는 친구들 
			  <div data-dashlistcode="WIDGET2" data-dashboardcode="D5" data-dashname="오늘의할일" data-dashimg="/resources/uploads/widgets/오늘의할일.png" id="toDoList" data-toggle="modal" data-target="#toDoListModal" class="card shadow-lg mt-3 col-6 ml-3 mr-1 widget" style="border-radius: 27px; backdrop-filter: blur(10px); animation-delay: 0.02s;">
				<button class="shadow-lg DashDelBtn hide"><i class="dripicons-cross" style="font-size: 17px;"></i></button>	
				<div class="card-body p-3">						
							<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일</h5>
							<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;" id="mainTodoList">
							<div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid="d283e91e-7773-4f20-bc7f-5c857cb67845" id="d283e91e-7773-4f20-bc7f-5c857cb67845"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> 메모~<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div><div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid="5828bd02-164b-45c4-9224-448f7463b7e5" id="5828bd02-164b-45c4-9224-448f7463b7e5"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> 메모메모<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div><div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid="0aefd396-354c-4634-b6fe-dd5da379f1d0" id="0aefd396-354c-4634-b6fe-dd5da379f1d0"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> 위드젯!<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div></div>
						</div>
				</div>
			
			  -- db 에 없는 친구들
			  <div data-dashlistcode="WIDGET12" data-dashname="오늘의 알림" data-dashimg="/resources/uploads/widgets/오늘의알림.png" class="card shadow-lg mt-3 col-5 ml-3 mr-1 widget" style="border-radius: 27px; backdrop-filter: blur(10px); animation-delay: 0s;">
			  <button class="shadow-lg DashDelBtn hide"><i class="dripicons-cross" style="font-size: 17px;"></i></button>
			      <div class="card-body p-3">
			          <h5 class="apple4 text-dark text-left" style="font-size: 17px;">
			              <i class="dripicons-volume-medium text-dark mr-2"></i>오늘의 알림
			          </h5>
			          <div class="card-body p-3" style="border-radius: 20px; background-color: #f8f9fc;">
			              <h4 class="apple5 text-dark text-center">여기에 오늘의 알림 띄울 거임 ~~</h4>
			          </div>
			      </div>
			  </div>
			*/
			
			widgetArr.push(widgetJSON);
			
		}	// end of for 
// 		console.log(widgetArr);
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/insertDashboardMain2DB", true);
		xhr.setRequestHeader(header,token);
		xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
		xhr.send(JSON.stringify(widgetArr));
		xhr.onreadystatechange =()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
					console.log(xhr.responseText);
			}
		}
	}

}



// 덜덜 추가
var addDulDul = () => {
	console.log("야 덜덜 시작한다~~~~")
	var widgetMain = document.querySelectorAll(".widget");
// 	console.log("widgetMain",widgetMain)
	for(var item of widgetMain){
		var random = (Math.random()*0.1).toFixed(2);
		console.log("랜덤",random)
		item.classList.add("duldul");
		item.classList.add("shakshak");
		item.style.animationDelay = random+"s";
	}
}

// 덜덜 빼기
var noDulDul = () => {
// 	console.log("덜덜 뺀다~~")
	var widgetMain = document.querySelectorAll(".widget");
// 	console.log("widgetMain",widgetMain)
	for(var item of widgetMain){
		item.classList.remove("duldul");
		item.classList.remove("shakshak");
	}
	
}

// 삭제버튼 추가
var addDelButton = () => {
// 	console.log("삭제 버튼 추가 ! ")
	var DashDelBtns = document.querySelectorAll(".DashDelBtn")
	for(var btn of DashDelBtns){
		btn.classList.remove("hide")
		btn.classList.add("fadein")
	}
}


// 위젯 없애기
var DeleteWidget = (time) => {
// 	console.log("화면위젯 삭제 버튼 누르면 실행하는 메소드 ! ")
	var DashDelBtns = document.querySelectorAll(".DashDelBtn");
	for(var btn of DashDelBtns){
// 		btn.removeEventListener('click', deleteEvent(e))
		btn.onclick=(e) => {
// 			console.log(e)
// 			console.log(time)
			if(time == 'after'){
				e.preventDefault();
			}
			// 화면에서 없애기
	        e.target.closest('div').remove();
			// 위젯 리스트에 다시 추가
			var widgetList = document.querySelector("#widgetList");
// 			console.log("widgetList",widgetList)
			var itemDiv = document.createElement("div");
	
			itemDiv.setAttribute("class","p-2 mr-2");
			var imgTag = document.createElement("img");
			imgTag.style.width = "50px";
			imgTag.style.height = "50px";
			imgTag.setAttribute("src",e.target.closest('div').dataset.dashimg);
			imgTag.setAttribute("class","widgetImg");
			imgTag.setAttribute("draggable",true);
			
			// 밑에 이미지 이름도 넣어주기 
			/*
			밑에 들어갈 내용들
			
			<div data-content="db내용" class="mt-2 apple8 text-center text-dark">출/퇴근</div>
			
			
			*/
			var dataTag = e.target.closest('div');
// 			console.log("머머잇니 " , dataTag.dataset)
			var imgName = document.createElement("div")
			imgName.innerHTML = dataTag.dataset.dashname;
			imgName.setAttribute('class', "mt-2 apple8 text-center text-dark");
			imgName.setAttribute('data-content', dataTag.outerHTML);
			
			// 내용 가공 나중에 생각해야함 (왜냐 ? 안에 내용물 바꿔야 하니깐 !!)
	//			var rawContent = dataTag.innerHTML;
	//			console.log("원래 내용이야 : ", rawContent)
	//			var dataStart = rawContent.substring(0,rawContent.indexOf('<div')+5)
	//			var dataMiddle = `data-dashListCode="\${item.dashListCode}"
	//						data-dashName = "\${item.dashBoardListVO.dashName}" 
	//						data-dashImg = "\${item.dashImg}"`; 
	//			var dataEnd = rawContent.substring(rawContent.indexOf('<div')+5, rawContent.length) 
	//			resContent = dataStart.concat(dataMiddle, dataEnd)
	//			console.log("잘 나왔을까? ", resContent)
	////				imgName.setAttribute('data-content', item.widgetContent);
	//			imgName.setAttribute('data-content', resContent);
			
	//			imgName.setAttribute('class', "mt-2 apple8 text-center text-dark");
			
			
			itemDiv.appendChild(imgTag);
			itemDiv.appendChild(imgName);		// 종은 추가 
			widgetList.append(itemDiv);
			
			imgClickEvent();			// 이걸 왜 넣었냐 ? 위젯  삭제하고 나면 클릭 이벤트가 안먹거등여~ 
			
		}
	}
}




// 위젯 이미지 클릭 이벤트
var imgClickEvent = () => {
// 	console.log("위젯 클릭이벤트 함수 실행 !")
	var imgs = document.querySelectorAll(".widgetImg");
	for(var img of imgs){
// 		console.log(img.closest("div"));
		img.closest("div").onclick=(e) => {
			e.preventDefault();
//             console.log("클릭한다~!~! 누구 클릭했서??", e.target);
            var mainRow = document.querySelector(".mainRow"); 
            var dataInfo;
            // div클릭한 경우랑 / img클릭한 경우랑 비교해야함!!
            if(e.target.tagName == 'IMG'){								// 이미지 클릭한 경우 
	            var newNode = e.target.nextElementSibling;
	            dataInfo = newNode.innerHTML;
// 	            console.log("넣을 친구야~", newNode.dataset.content)
	            
	            mainRow.insertAdjacentHTML('beforeend', newNode.dataset.content);
	            e.target.closest("div").remove();
            }else if(e.target.tagName == 'DIV'){						// div 클릭한 경우 
            	var newNode = e.target.querySelector("div");
	            dataInfo = newNode.innerHTML;
//             	console.log("div 선택할때 새로 넣을 친구 ~", newNode)
	            mainRow.insertAdjacentHTML('beforeend', newNode.dataset.content);
	            e.target.remove();
            }
           	console.log("ptag정보 : ",dataInfo);
           	
            addDelButton();		// 삭제버튼 추가 
            addDulDul();		// 덜덜 추가 
            DeleteWidget('after');		// 위젯 삭제 이벤트 추가 
            
            switch (dataInfo) {
			case "결재할것":
	            getRequestedData.then((result)=>{
					console.log("와 짱신기하다 결재",result);
		            getReqsuc(result);					// 결재할 것 데이터 뿌리기
				});
				
				break;
			case "메일":
				getMailData.then((result)=>{
					console.log("와 짱신기하다 메일",result);
					getMailSuc(result);					// 결재할 것 데이터 뿌리기
				});
				
				break;
			case "오늘의 할 일":
				toDoFuncData.then((result)=>{
	            	console.log("와 짱신기하다 오늘의 할 일",result)
	            	toDoFuncSuc(result);
	            });	
				
				break;
			case "팀별 출퇴근":
				getMemStatusData.then((result)=>{
	            	console.log("와 짱신기하다 팀별 출퇴근",result)
	            	drawMemStatus(result);
	            });	
				
				break;
			case "날씨":
	            getWeatherData.then((result)=>{
	            	console.log("와 짱신기하다 날씨",result)
	            	getWeathersuc(result);
	            });				// 날씨 데이터 뿌리기 
				
				break;
			case "출/퇴근":
				
				break;
			case "뉴스":
	            insertDataToNewsWidget(newsData);	// 뉴스 데이터 뿌리기
				
				break;
			case "부서 캘린더":
	            getDeptCalData.then((result)=>{
					console.log("와 짱신기하다 부서캘",result);
					getDeptCalSuc(result);					// 부서캘린 데이터 뿌리기
				});
				
				break;
			case "내 캘린더":
				getMyCalData.then((result)=>{
					console.log("와 짱신기하다 내 캘",result);
					getMyCalSuc(result);					// 내캘린 데이터 뿌리기
				});
				
				break;

			default:
				break;
			}
//             console.log("!!!!!!!!!!!!!!!!!!!!!!!! 데이터가 안뿌려지네!")
            
            
           
        }
	}
	
}


//------------------------- 대시보드 끝 --------------------


init();
// var newsData = getNews();
// var toDofuncData = toDofunc();
// var getRequestedData = getRequested();
// var getDeptCalData = getDeptCal();
// var getMyCalData = getMyCal();
// var getWeatherData = getWeather();
// var getMemStatusData = getMemStatus();



</script>
