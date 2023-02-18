<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="container" id="mainContainer">
		<div class="row row-cols-2 mt-5 mainRow" data-plugin="dragula">
			<!--  오늘의 알림 -->
			<div class="widget card shadow-lg mt-3 col-6 ml-3 mr-1" style="border-radius: 27px; position:relative; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide" ><i class="dripicons-cross" style="font-size: 17px;"></i></button>
			 <i class=" dripicons-dots-3 text-dark mr-2 detailIcon"></i>
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;">
						 <i class="dripicons-broadcast text-dark mr-2"></i> 오늘의 알림
						 
						 </h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h4 class="apple5 text-dark text-center">어쩌구 저쩌구 블라블라</h4>
						</div>
				</div>
			</div>
			<!--  출/퇴근 -->
			<div class="widget card shadow-lg mt-3 col-5 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class=" dripicons-enter text-dark mr-2"></i> 출 · 퇴근</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h3 class="apple6 text-dark text-center">  
								근무 시간  HH : mm
							</h3>
							<div class="d-flex justify-content-center mt-3">
								<button type="button" class="apple5 btn btn-secondary btn-rounded" onclick="fn_commuteStart()">출근</button>
								<button type="button" class="apple5 btn btn-secondary btn-rounded ml-4" onclick="fn_commuteEnd()">퇴근</button>
							</div>
						</div>
				</div>
			</div>
			<!-- 공지사항 -->
			<div class="widget card shadow-lg mt-3 col-5 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-volume-medium text-dark mr-2"></i> 공지사항</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h4 class="apple5 text-dark text-center">어쩌구 저쩌구 블라블라</h4>
						</div>
				</div>
			</div>
			<!-- 오늘의 할일 -->
			<div id="toDoList" class="card shadow-lg mt-3 col-6 ml-3 mr-1 widget" style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide" ><i class="dripicons-cross" style="font-size: 17px;"></i></button>	
			<div class="card-body p-3" data-toggle="modal" data-target="#toDoListModal">						
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;" id="mainTodoList">
						</div>
					</div>
			</div>
			<!-- 부서캘린더 -->
			<div class="card shadow-lg mt-3 col-5 ml-3 mr-1 widget"
			    style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide" ><i class="dripicons-cross" style="font-size: 17px;"></i></button>
			    <div class="card-body p-3">
			        <h5 class="apple4 text-dark text-left" style="font-size: 17px;">
			            <i class="dripicons-volume-medium text-dark mr-2"></i> 부서캘린더
			        </h5>
			        <div class="card-body p-3"
			            style="border-radius: 20px; background-color: #f8f9fc;">
			            <h4 class="apple5 text-dark text-center">부서캘린더~~</h4>
			        </div>
			    </div>
			</div>
			<!-- 팀별 출퇴근 현황 -->
			<div class="card shadow-lg mt-3 col-12 ml-3 mr-1 widget"
			    style="border-radius: 27px; backdrop-filter: blur(10px);">
			<button class="shadow-lg DashDelBtn hide" ><i class="dripicons-cross" style="font-size: 17px;"></i></button>
			    <div class="card-body p-3">
			        <h5 class="apple4 text-dark text-left" style="font-size: 17px;">
			            <i class="dripicons-volume-medium text-dark mr-2"></i>팀별출퇴근
			        </h5>
			        <div class="card-body p-3 memStatus"
			            style="border-radius: 20px; background-color: #f8f9fc;">
			            <div class="row">
<!-- 			            	<div class="text-center" style="border: 1px solid black"> -->
			            	<div class="text-center" >
			            		<div class="img " style="position:relative; ">
				            		<img alt="ㅠ" class="rounded-circle"src="/resources/uploads/profileImages/우는곰돌이.jpg" width="45px">
				            		<div style="position:absolute; left:44px; bottom:1px; border-radius: 50%; border: 1.5px solid white; background-color: red; z-index: 10; width : 13px; height: 13px"></div>
			            		</div>
			            		<h4 class="apple4" style="font-size: 14px">조현수(사원)</h4>
			            	</div>
			            	<div class="col-2">
			            		<div class="img">
				            		<img alt="ㅠ" class="rounded-circle" src="/resources/uploads/profileImages/우는곰돌이.jpg" width="35px">
				            		<div style="border-radius: 50%; background-color: red; z-index: 10; width : 10px;  height: 10px"></div>
			            		</div>
			            		<div class="name">조현수(사원)</div>
			            	</div>
			            	<div class="col-2">
			            		<div class="img">
				            		<img alt="ㅠ" class="rounded-circle" src="/resources/uploads/profileImages/우는곰돌이.jpg" width="35px">
				            		<div style="border-radius: 50%; background-color: red; z-index: 10; width : 10px; height: 10px"></div>
			            		</div>
			            		<div class="name">조현수(사원)</div>
			            	</div>
			            	<div class="col-2">
			            		<div class="img">
				            		<img alt="ㅠ" class="rounded-circle" src="/resources/uploads/profileImages/우는곰돌이.jpg" width="35px">
				            		<div style="border-radius: 50%; background-color: red; z-index: 10; width : 10px; height: 10px"></div>
			            		</div>
			            		<div class="name">조현수(사원)</div>
			            	</div>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 날씨 -->
			<div class="widget card shadow-lg mt-3 col-5 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-volume-medium text-dark mr-2"></i> 오늘의날씨</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h4 class="apple5 text-dark text-center">여기에 날씨 띄울 거임 ~~</h4>
						</div>
				</div>
			</div>
			<!--  뉴스 -->
			<div class="card shadow-lg mt-3 col-5 ml-3 mr-1 widget" data-dashname="뉴스"
			    style="border-radius: 27px; backdrop-filter: blur(10px);">
				<button class="shadow-lg DashDelBtn hide" ><i class="dripicons-cross" style="font-size: 17px;"></i></button>
			    <div class="card-body p-3">
			        <h5 class="apple4 text-dark text-left" style="font-size: 17px;">
			            <i class="dripicons-volume-medium text-dark mr-2"></i> 오늘의 뉴스
			        </h5>
			        <div class="card-body p-3 newsContent"
			            style="border-radius: 20px; background-color: #f8f9fc;">
			        </div>
			    </div>
			</div>
		</div>
	</div>



<!-- 출근 버튼 클릭 시 나타날 모달창 -->
<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">출근하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

<!-- 퇴근 버튼 클릭 시 나타날 모달창 -->
<!-- <div class="modal fade" id="exampleModalScrollable2" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true"> -->
<!--   <div class="modal-dialog modal-dialog-scrollable" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalScrollableTitle2">퇴근하기</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body" id="comEndContent"> -->
<!-- <!--         	큐알 이미지 및 기타 내용 입력 --> 
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">퇴근 완료</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->


<button id="commuteStart" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable">출근 버튼</button>
<!-- <button id="commuteEnd" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable2">퇴근 버튼</button> -->

<!-- SWEET ALERT를 위한 CSS코드   -->
<style>
.swal-text {
  padding: 17px;
  display: block;
  margin: 22px;
  text-align: center;
  color: #61534e;
}
</style>
<!-- SWEET ALERT를 위한 CDN코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

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
 			//console.log(res);
			//console.log(res.url); 
			
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
// 	//console.log($("#simpleinput").val());
	var nums = $("#simpleinput").val();
	
	var encodedKey = window.encodedKey;
// 	//console.log(encodedKey);
// 	//console.log(nums);
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
			//console.log(res); 
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
					//console.log("퇴근 성공 했는지 확인 "+res);
				}
			});
		    
		    
		  } else {
		    swal("Your imaginary file is safe!");
		  }
		});

}
// ------------------------ 출퇴근 끝 --------------------

// 위젯추가
// ------------------------- 결재할 것 시작 --------------------
function getRequested(){
	var mainAppvCount = document.querySelector("#mainAppvCount")
	
	// 결재할 것 리스트 출력 
	var xhr = new XMLHttpRequest();
	xhr.open("GET","/workfit/approval/reception/getRequested",true);
	xhr.setRequestHeader(header,token);
	xhr.send();
	xhr.onreadystatechange=()=>{
		if(xhr.status == 200 && xhr.readyState == 4){
			let list = JSON.parse(xhr.responseText);
			console.log("list",list)
			var requestedList = document.querySelector("#requestedList");
			var count = 0;
					for(var item of list){
							var str = '<div class="text-dark apple6 justify-content-between align-items-center row text-dark pt-2 pl-3 pr-3 mr-1 ml-1 mb-2" style="border-radius: 20px; background-color: #f8f9fc;">'
							str +="<p class='mr-3'>"+item.APPROVAL_DOC_CODE+"</p>"
							str +="<p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;word-break:break-all;width: 150px;'>"+item.APPROVAL_TITLE+"</p>"
							str +="<p>"+item.MEM_NAME+"</p>"
							
							var date = dayjs(item.APPROVAL_DATE);
							str +="<p class='ml-3'>"+date.format("YYYY.MM.DD HH:mm")+"</p>"
							str +="</div>"
						if(count < 3){ 
							requestedList.innerHTML += str;
						}
						count++;
					}
		}
	}
}

// -------------------------  결재할 것  끝 --------------------
// ------------------------- 오늘의 할일시작 --------------------
// 오늘의 할 일

function toDofunc(){
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
			let list = JSON.parse(xhr.responseText);
			for(let item of list){
	        	let uuid = self.crypto.randomUUID();
				//console.log(item);
				var str ="";
				str +=`<div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid= "\${item.todayCode}" id="\${item.todayCode}"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> \${item.todayContent}<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div>`;
				insertTodoList.innerHTML += str;
				mainTodoList.innerHTML += str;
				
			}
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

//------------------------- 뉴스 시작 --------------------
var res = "";
function getNews(){
	console.log("뉴스 시작,,,?")
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
            var newsJsonArr = [];
            console.log("크롤링 json", news);
            for(let i = 0; i < 3 ; i++){
            	
            	var newsJson = {};
            	res = news.ul.li[i].dl;
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
            }
            
            insertDataToNewsWidget(newsJsonArr);
            
            /*
	            [1].a.__text
	            console.log("제목 : ", res.dt[1].a.__text)
	            console.log("링크 : ", res.dt[0].a._href)
	            console.log("이미지 : ", res.dt[0].a.img._src)
	            console.log("몇분전  : ", res.dd.span[2].__text)
            
            필요한 정보 : 제목 / 링크 / 몇분전 / 이미지
            제목 : news.ul.li[i].dl.dt[1]
            
            {
			    "dl": {
			        "dt": [
			            {
			                "a": {
			                    "img": {
			                        "_src": "https://imgnews.pstatic.net/image/origin/025/2023/01/26/3255724.jpg?type=ofullfill106_72",
			                        "_width": "106",
			                        "_height": "72",
			                        "_alt": "황덕순 前수석 조사한 감사원…통계조작 의혹 文청와대 겨눈다",
			                        "_onError": "javascript:this.src='https://ssl.pstatic.net/static.news/image/news/2009/noimage_106x72.png';"
			                    },
			                    "_href": "https://n.news.naver.com/mnews/article/025/0003255724?sid=100",
			                    "_class": "nclicks(fls.list)"
			                },
			                "_class": "photo"
			            },
			            {
			                "a": {
			                    "_href": "https://n.news.naver.com/mnews/article/025/0003255724?sid=100",
			                    "_class": "nclicks(fls.list)",
			                    "__text": "황덕순 前수석 조사한 감사원…통계조작 의혹 文청와대 겨눈다"
			                }
			            }
			        ],
			        "dd": {
			            "span": [
			                {
			                    "_class": "lede",
			                    "__text": "문재인 정부의 통계조작 의혹을 감사 중인 감사원이 이달 초 황덕순 전 청와대 일자리수석을 불러 조사한 것으로 확인됐다. 황 전  …"
			                },
			                {
			                    "_class": "writing",
			                    "__text": "중앙일보"
			                },
			                {
			                    "_class": "date is_new",
			                    "__text": "4분전"
			                }
			            ]
			        }
			    }
			}
            
            
            */
			
		}

	};
	
}

var insertDataToNewsWidget = (json) => {
// 	console.log("이제 넣을 타이밍~~ ", json)
	console.log("뉴스데이터 넣기")
	var newsWidget = document.querySelector('div[data-dashname="뉴스"]');
	var newsContent = newsWidget.querySelector(".newsContent");
	
	var ContentHTML = "";
	ContentHTML += `<h4 class="apple5 text-dark">정치 분야 상위 뉴스</h4>`
	for(let item of json){
// 		ContentHTML += `<div class="row" onclick="location.href='\${item.newsLink}'"> `
// 		ContentHTML += `<div class="row" onclick="OpenWin_variety('\${item.newsLink}','정치뉴스','450px', '500px', '461px', '153px)"> `
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
	newsContent.innerHTML = ContentHTML
	
	
	/*
	{
	    "newsTitle": "'아이가 행복한 의정부 실현'…市, 아동학대 예방에 총력",
	    "newsLink": "https://n.news.naver.com/mnews/article/018/0005413097?sid=100",
	    "newsImg": "https://imgnews.pstatic.net/image/origin/018/2023/01/27/5413097.jpg?type=ofullfill106_72",
	    "newsMin": "1분전"
	    "newsFrom" : "동아일보"
}
	
	*/
}
//------------------------- 뉴스 끝 --------------------
//------------------------- 팀별 출퇴근현황 시작 --------------------
var getMemStatus = () => {
	console.log("야 이거 출퇴근이다 ..?")
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", "/getMemStatus", true);
// 	xhr.setRequestHeader(header, token);
// 	xhr.send();
// 	xhr.onreadystatechange=()=>{
// 		if(xhr.status == 200 && xhr.readyState == 4){
// 					console.log("여기는 팀별 출퇴근 현황이야")
// 					console.log(xhr.responseText)
// 		}
		
// 	}
};
//------------------------- 팀별 출퇴근현황 끝 --------------------


getNews();				// 뉴스 (달러function 안에 넣으면 안됨 ㅠ ㅠ )
// 	getMemStatus();
$(function() {
	//console.log("todo 보여주기 시작")
// 	toDofunc();			// 오늘의 할일
// 	getRequested();		// 결재할 것
// 	getMemStatus();

});

// $(document).ready(function(){
// 	toDofunc();			// 오늘의 할일
// 	getRequested();		// 결재할 것
// 	function getMemStatus() {
// 		console.log("야 이거 출퇴근이다 ..?")
// 	};
// 	getMemStatus();
// });


</script>
<style>

.slide-top {
	        animation: slide-top 0.9s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes slide-top {
  0% {
            transform: translateY(130px);
  }
  100% {
            transform: translateY(0);
  }
}
@keyframes slide-top {
  0% {
            transform: translateY(130px);
  }
  100% {
            transform: translateY(0);
  }
}

.slide-bottom {
	        animation: slide-bottom 0.9s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes slide-bottom {
  0% {
            transform: translateY(0px);
  }
  100% {
            transform: translateY(160px);
  }
}
@keyframes slide-bottom {
  0% {
            transform: translateY(0px);
  }
  100% {
            transform: translateY(160px);
  }
}


.widget{
	background: rgba(255,255,255,0.5); 
}

.DashDelBtn{
	width: 30px !important;
	height: 30px;
 	border-radius: 50%;
 	background-color: rgba(255,255,255);
 	border : none;
 	position: absolute;
 	top: -10px;
 	left : -10px;
 	opacity: 0.9;
} 	

.fadein{
	animation: fadein 0.9s;
}


@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 0.9;
    }
}

.fadeout{
	animation: fadeout 0.9s;
}


@keyframes fadeout {
    from {
        opacity: 1;
    }
    to {
        opacity: 0;
    }
}

.hide{
	display: none;
}



.duldul {animation: move 0.3s cubic-bezier(0.250, 0.460, 0.450, 0.940) both infinite;}
.shakshak {animation: rotate 0.35s cubic-bezier(0.250, 0.460, 0.450, 0.940) both infinite;}

@keyframes move {
  0% {transform: rotate(0);}
  25% {transform: translate(0.7px);}
  50% {transform: translate(0px);}
  75% {transform: translate(-1px);}
  100% {transform: translate(0px);}
}

@keyframes rotate {
  0% {transform: rotate(0deg);}
  25% {transform: rotate(-1deg);}
  50% {transform: rotate(0deg);}
  75% {transform: rotate(0.9deg);}
  100% {transform: rotate(0);}
}



</style>
