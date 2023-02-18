<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="container">
	<div class="row row-cols-2 mt-5" id="simple-dragula" data-plugin="dragula">
			<div class="card shadow-lg mt-3 col-6 ml-3 mr-1" style="border-radius: 27px;">
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"><i class="dripicons-broadcast text-dark mr-2"></i> 오늘의 알림</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h4 class="apple5 text-dark text-center">어쩌구 저쩌구 블라블라</h4>
						</div>
				</div>
			</div>
			<div class="card shadow-lg mt-3 col-5 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3" onclick="location.href='/workfit/adminpage/commuteView'">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class=" dripicons-enter text-dark mr-2"></i> 출 · 퇴근</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h3 class="apple6 text-dark text-center">  
								<span style="font-size : 10px; display : inline;" id="commuteStartClock"></span><br/>
								<!-- -------------------퇴근 시간 스팬 태그 추가함 1.27---------------- -->
								<span style="font-size : 10px; display : inline;" id="commuteEndClock"></span><br/>
								<!-- -------------------퇴근 시간 스팬 태그 추가함 1.27---------------- -->
								<span id="byhCommuteTimeAlarming">근무 시간 HH : mm : ss</span>
								
								
							</h3>
							<div class="d-flex justify-content-center mt-3">
								<button type="button" id="commuteStartBtn" class="apple5 btn btn-secondary btn-rounded">출근</button>
								<button type="button" id="commuteEndBtn" class="apple5 btn btn-secondary btn-rounded ml-4">퇴근</button>
							</div>
						</div>
				</div>
			</div>
			<div class="card shadow-lg mt-3 col-5 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3">
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-volume-medium text-dark mr-2"></i> 공지사항</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;">
							<h4 class="apple5 text-dark text-center">어쩌구 저쩌구 블라블라</h4>
						</div>
				</div>
			</div>
			<div id="toDoList" data-toggle="modal" data-target="#toDoListModal" class="card shadow-lg mt-3 col-6 ml-3 mr-1" style="border-radius: 27px; backdrop-filter: blur(10px);">
				<div class="card-body p-3">						
						<h5 class="apple4 text-dark text-left" style="font-size:17px;"> <i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일</h5>
						<div class="card-body p-3" style="border-radius: 20px; background-color:#f8f9fc;" id="mainTodoList">
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
<style>

#insertTodo{
	background-color:inherit;
	border: none;
	border-bottom: 1px solid black;
	width: 300px;
}

#insertTodo:focus{
	outline:none;
}

</style>
<!-- todoList 모달창 -->

<div id="toDoListModal"  class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 27px;">
            <div class="modal-header pl-4 pr-4" >
                <h4 class="modal-title apple4 text-dark" id="standard-modalLabel"><i class="dripicons-document-edit text-dark mr-2"></i> 오늘의 할 일</h4>
                <div class="d-flex text-align-start">
                	<h6 class="modal-title apple4 text-dark ml-1"  id="toDoListTime"></h6>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
				<div class="card-body p-3 text-center"style="border-radius: 20px; background-color: inherit;">
					<div class="mb-4">
						<input class="apple5 text-dark"type="text" id="insertTodo" placeholder="당신의 오늘 할 일은 무엇인가요?">
					</div>
					<div id="insertTodoList">
					</div>
				</div>
			</div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



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
	
	
	

// 출근 인증이 성공했을 때 실시간 시계가 나타나도록  하는 자바스크립트 함수 로직 
$(function(){
	// 출퇴근 로직 작성 (이벤트 버블링 현상 막기 위한 코드) 시작 ===============2.3 
	$("#commuteEndBtn").on("click",function(e){
		e.stopPropagation();
		
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
			    
			 // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
			    clearInterval(window.intervalId);
				// 퇴근 시간 찍어주기 
				var currTime = document.querySelector("#byhCommuteTimeAlarming").innerText;
				$("#commuteEndClock").text("퇴근시각 "+currTime);
			 // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
			    
			    
			    
			    // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
			    var header = '${_csrf.headerName}';
				var token =  '${_csrf.token}';
				
				 $.ajax({
							type : "post",
							url : "/otp/commuteEnd",
							data : JSON.stringify({anything : "anything"}),
							contentType : "application/json; charset=utf-8",
							beforeSend: function(xhr) {
					            xhr.setRequestHeader(header, token);
					    	},
							success : function(res){
								console.log("퇴근 성공 했는지 확인 ");
								
								
							}
						});
			    // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
			   
			    
			    
			  } else {
			    swal("Your imaginary file is safe!");
			  }
			});
		
		
	})
	
	$("#commuteStartBtn").on("click",function(e){
		e.stopPropagation();
		
		var startBtn = $("#commuteStart");
		
		var commuteFlag = '${commuteFlag}';
		if(commuteFlag == 'commuteSuccess'){
			swal("이미 출근처리 됐습니다!", "You clicked the button!", "info");
			return;
		}
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		$.ajax({
			type : "post",
			url : "/otp/generate",
			data : JSON.stringify({"memId" : "qodudgh85"}), // 여기서 qodudgh85라는 memId는 로그인 처리 후 세션에서 꺼내오거나 Spring Security에서 꺼내오면 된다.
			contentType : "application/json; charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			success : function(res){
				console.log(res);
				console.log(res.url); 
				
				window.encodedKey = res.encodedKey;
				
				var tagsStr = "<img src='"+res.url+"'>";
				tagsStr += "<span id='pleaseInsertNum'>인증번호를 입력해주세요</span><input style='width : 250px;' type='text' id='simpleinput' class='form-control'>";
				tagsStr += "<button type='button' class='btn btn-dark btn-rounded' onclick='fn_verify()''>인증하기</button>";
				
//	 			var imgTag = document.createElement("img");
//	 			imgTag.src = res.url; 
	             
	             
				$(document.getElementById("comStartContent")).html(tagsStr);
				
			
			}
		});
		
		startBtn.click();
		
	})
	// 출퇴근 로직 작성 (이벤트 버블링 현상 막기 위한 코드) 끝 ===============2.3 
	
	
	
	
	const clock = document.querySelector("#byhCommuteTimeAlarming");
		
	var byhCommuteFlag = '${commuteFlag}';
	var sessionCommuteFlag = '<%= (String)session.getAttribute("commuteState")%>';	
	
	// ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
	console.log(sessionCommuteFlag);
	
	if(sessionCommuteFlag == "end"){
		var sessionCommuteTime = '<%= session.getAttribute("commuteStartClock")%>';	
		$("#commuteStartClock").text("출근시각 "+sessionCommuteTime);
		// 퇴근 시간도 세션에서 가져와서 찍어준다 
		var sessionCommuteEndTime = '<%= session.getAttribute("commuteEndClock")%>';
		$("#commuteEndClock").text("퇴근시각 "+ sessionCommuteEndTime);
		clock.innerText = sessionCommuteEndTime;
		
	}else if(byhCommuteFlag=='commuteSuccess'||sessionCommuteFlag == 'success'){
		var sessionCommuteTime = '<%= session.getAttribute("commuteStartClock")%>';	
		
		$("#commuteStartClock").text("출근시각 "+sessionCommuteTime);
	
		getClock(); //맨처음에 한번 실행
		window.intervalId = setInterval(getClock, 1000); //1초 주기로 새로실행
	// ----------------------- 퇴근 처리 위한 로직 작성 끝 1.27 ---------------------------------
		
	}
	
		
	
	// 실시간 시계 함수 
	function getClock(){
		  const d = new Date();
		  const h = String(d.getHours()).padStart(2,"0");
		  const m = String(d.getMinutes()).padStart(2,"0");
		  const s = String(d.getSeconds()).padStart(2,"0");
// 		  clock.innerText = `${h}:${m}:${s}`;
		  clock.innerText = h + ':'+m+':'+s;	
	}
})
	
	
	
	


function fn_commuteStart(){
// 	var startBtn = $("#commuteStart");
	
// 	var commuteFlag = '${commuteFlag}';
// 	if(commuteFlag == 'commuteSuccess'){
// 		swal("이미 출근처리 됐습니다!", "You clicked the button!", "info");
// 		return;
// 	}
// 	var header = '${_csrf.headerName}';
// 	var token =  '${_csrf.token}';
// 	$.ajax({
// 		type : "post",
// 		url : "/otp/generate",
// 		data : JSON.stringify({"memId" : "qodudgh85"}), // 여기서 qodudgh85라는 memId는 로그인 처리 후 세션에서 꺼내오거나 Spring Security에서 꺼내오면 된다.
// 		contentType : "application/json; charset=utf-8",
// 		beforeSend: function(xhr) {
//             xhr.setRequestHeader(header, token);
//     	},
// 		success : function(res){
// 			console.log(res);
// 			console.log(res.url); 
			
// 			window.encodedKey = res.encodedKey;
			
// 			var tagsStr = "<img src='"+res.url+"'>";
// 			tagsStr += "<span id='pleaseInsertNum'>인증번호를 입력해주세요</span><input style='width : 250px;' type='text' id='simpleinput' class='form-control'>";
// 			tagsStr += "<button type='button' class='btn btn-dark btn-rounded' onclick='fn_verify()''>인증하기</button>";
			
// // 			var imgTag = document.createElement("img");
// // 			imgTag.src = res.url; 
             
             
// 			$(document.getElementById("comStartContent")).html(tagsStr);
			
		
// 		}
// 	});
	
// 	startBtn.click();

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
			console.log(res); 
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
		    
		 // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
		    clearInterval(window.intervalId);
			// 퇴근 시간 찍어주기 
			var currTime = document.querySelector("#byhCommuteTimeAlarming").innerText;
			$("#commuteEndClock").text("퇴근시각 "+currTime);
		 // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
		    
		    
		    
		    // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
		    var header = '${_csrf.headerName}';
			var token =  '${_csrf.token}';
			
			 $.ajax({
						type : "post",
						url : "/otp/commuteEnd",
						data : JSON.stringify({anything : "anything"}),
						contentType : "application/json; charset=utf-8",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						success : function(res){
							console.log("퇴근 성공 했는지 확인 ");
							
							
						}
					});
		    // ----------------------- 퇴근 처리 위한 로직 작성 시작 1.27 ---------------------------------
		   
		    
		    
		  } else {
		    swal("Your imaginary file is safe!");
		  }
		});

}

// 오늘의 할 일
var insertTodo = document.querySelector("#insertTodo");
var insertTodoList = document.querySelector("#insertTodoList");
var toDoListTime = document.querySelector("#toDoListTime");
let today = new Date();   
var mainTodoList = document.querySelector("#mainTodoList");

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
			console.log(item);
			var str ="";
			str +=`<div class="ml-3"><h4 class="apple5 text-dark text-left ml-3" data-memoid= "\${item.todayCode}" id="\${item.todayCode}"><input type="checkbox" style="accent-color:#6c757d" class="mr-3"> \${item.todayContent}<button onclick="deleteToDo(this)" class="ml-3" style="background-color: inherit; border: none;">x</button></h4></div>`;
			insertTodoList.innerHTML += str;
			mainTodoList.innerHTML += str;
			
		}
	}
}





function deleteToDo(e){
	var todayCode;
	console.log("e",e);
	console.log("파라미터 종류",Object.prototype.toString.call(e))
	if(Object.prototype.toString.call(e).slice(8, -1) == 'HTMLButtonElement'){
		console.log("디비에서 나와서 만들어진 버튼")
		console.log("deleteToDo target id",e.parentElement.id);
		todayCode = e.parentElement.id
		var delTargets = document.querySelectorAll("h4[data-memoId='"+todayCode+"']");
		for(var item of delTargets){
			item.parentElement.remove();
		}
		
	}else{
		console.log("새로 맨든 버튼")
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
			console.log(xhr.responseText);
		}

	};


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
        	console.log(h4);
        	
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
					console.log(xhr.responseText);
				}
			}

        }
}); 



</script>

