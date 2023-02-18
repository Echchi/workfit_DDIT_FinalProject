<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:csrfInput/>
	<input type="hidden" id="statusFlag" value=""/>
	<div class="digibot-sc-launcher " tabindex="0" dir="ltr" style="background-color: transparent; box-shadow: none; border-radius: 0%;">
		<img class="digibot-sc-open-icon" id="chatbotMain" src="/resources\assets\images\ico-messenger.png" title="Workfit 챗봇입니다""
			aria-label="Workfit 챗봇입니다" style="transition-property: none;position: fixed;top: 82%;left: 92%;display: none;">
	</div>


<div class="modal fade" id="scrollable-modal" tabindex="-1" role="dialog" aria-labelledby="scrollableModalTitle" aria-hidden="true">
	<div class="modal-dialog  modal-right  role="document" style="top:40%;width: 60%;height:60%;border-radius: 3.2em;">
		<div class="modal-content" style="height:100%;border-radius: 3.2em;">
			<div class="modal-header modal-colored-header bg-dark" style="border-radius: 2.5em">
				<h3 class="apple-4 modal-title" id="scrollableModalTitle">ChatBot</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					  <div class="col-lg-6 col-lg-12 order-lg-2 order-xl-1">
                                <div class="card">
                                    <div class="card-body"  data-simplebar data-simplebar-primary style="width: 480px;border-radius: 2.25em;max-height: 450px;">
                                        <ul class="conversation-list" id="conversation">
                                            <li class="clearfix">
                                                <div class="chat-avatar">
                                                    <img src="/resources/assets/images/chatbot/WorkFit.gif" class="rounded"/>
                                                    <i class='chatTime'></i>
                                                </div>
                                                <div class="conversation-text">
                                                    <div class="ctext-wrap">
                                                        <i class="apple4">Workfit Chatbot</i>
                                                        <p>
                                                            WorkFit 챗봇을 사용해주셔서 감사합니다!<br/>
                                                           	잠시만 기다려주시면 <b>담당 챗봇 정보</b>를 불러오겠습니다.
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="conversation-actions dropdown">
                                                    <button class="btn btn-sm btn-link" data-toggle="dropdown"
                                                        aria-expanded="false"><i class='uil uil-ellipsis-v'></i></button>

                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Copy Message</a>
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Delete</a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="clearfix">
                                                <div class="chat-avatar">
                                                    <img src="/resources/assets/images/logo-light.png" class="rounded" alt="Shreyu N" />
                                                    <i class='chatTime'></i>
                                                </div>
                                                <div class="conversation-text">
                                                    <div class="ctext-wrap">
                                                        <i>Hyper</i>
                                                        <p>
                                                           	안녕하세요! Hyper 채팅봇입니다. 무엇을 도와드릴까요?
                                                        </p>
		                                                <div class="card">
		                                                	<div class="row">
		                                                		<div class="col-12" style="background-color: blue;border-radius-top : 0.8rem;">
		                                                			ssss
		                                                		</div>
		                                                			<button class="workfitBtn">111111
		                                                		<div class="col-12" style="background-color: red;">
		                                                		</div>
		                                                		</button>
		                                                	</div>
		                                                </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div> 
                                    <!-- end card-body -->
<!-- 									<button type="button" onclick="getChat();console.log(this)" class="btn btn-success chat-send btn-block"><i class='uil uil-message'>챗봇 시작..</i></button> -->
									<button type="button" id="chatbotStart" class="btn btn-success chat-send btn-block"><i class='uil uil-message'>챗봇 시작..</i></button>
                                </div> <!-- end card -->
                            </div>
					
					
					
					
					
					
				</div>
				<sec:csrfInput/> 
<!-- 				</form> -->
			</div>
			<!-- 결재 문서 구성 -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
<script>
	var chatbotMain = document.querySelector('#chatbotMain');
	var chatbotId = document.querySelector('#chatbotId');
	var chatDialog = document.querySelector('#chatDialog');
	var conversation = document.querySelector('#conversation');
	var chatbotStart = document.querySelector('#chatbotStart');
	
	var levelCnt = 1;
	var chatbotStatus = 'n';
	var statusFlag = document.querySelector('#statusFlag');
	var chatTime = document.querySelector('.chatTime');
	
	
	// ==================================================================
	// ================= Button Listener Event ==========================
	// ==================================================================
	
	
	
	chatbotMain.addEventListener('click',function(){
// 		console.log("챗봇 시작하기 버튼 누름 :::",this);
// 		getChat();
		$("#scrollable-modal").modal("show");
	})
	chatbotStart.addEventListener('click',function(){
		console.log("챗봇 시작하기 버튼 누름 :::",this);
		getChat();
		this.remove();
	})
	
	
	
		
	
	// ==================================================================
	// =====================    Function Set   ==========================
	// ==================================================================
	
	
		
	const getChat = function(data1,data2){
		console.log("chat 정보 가져오기..");
		console.log("들어오는 숫자 값 : ",data1);
		console.log("들어오는 숫자 값2 : ",data2);
		console.log("levelCnt : ",levelCnt);
		var xhr = new XMLHttpRequest();
		
		
		if(data1 !=null && data2 != null){
			xhr.open("GET","/workfit/chatbot/get/"+data1+"/"+data2,true);
		}else if(data1 != null && data2 == '0'){
			let preValue =document.querySelector('#preValue').value;
			console.log('최종값일 때 가정한 콘솔데스');
			xhr.open("GET","/workfit/chatbot/get/"+data1+"/"+data2+"?preValue="+preValue,true);
		}
		else{
			console.log("data가 없음::: 초기값");
			xhr.open("GET","/workfit/chatbot/get/none/1",true);
		}
		
		
		
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				levelCnt++;
				console.log('통신 후 Cnt가 올랐는가?',levelCnt);
// 				console.log('Response Text',xhr.responseText);
				let code = '';
				var nowTime = dayjs().format('HH:mm');
				var chatbotInfo = JSON.parse(xhr.responseText);
				console.log(chatbotInfo);
// 				console.log(nowTime);
				chatTime.innerText = nowTime;
// 				chatTime.innerText = nowTime.format('HH:mm');
				if(levelCnt == 1){
					
				
					code+=`		<li class="clearfix">                                                        ` ;
			        code+=`       <div class="chat-avatar">                                                  ` ;
			        code+=`           <img src="/resources/assets/images/logo-light.png" class="rounded"/>   ` ;
			        code+=`           <i>\${nowTime}</i>                                                           ` ;
			        code+=`       </div>                                                                     ` ;
			        code+=`       <div class="conversation-text">                                            ` ;
			        code+=`           <div class="ctext-wrap">                                               ` ;
			        code+=`               <i class="apple4">Workfit Chatbot</i>                              ` ;
			        code+=`               <p>                                                                ` ;
			        code+=`                   WorkFit 챗봇을 사용해주셔서 감사합니다!<br/>                      ` ;
			        code+=`                   잠시만 기다려주시면 <b>담당 챗봇 정보</b>를 불러오겠습니다.   		 ` ;
			        code+=`               </p>                                                               ` ;
			        code+=`           </div>                                                                 ` ;
			        code+=`       </div>                                                                     ` ;
			        code+=`       <div class="conversation-actions dropdown">                                ` ;
			        code+=`           <button class="btn btn-sm btn-link" data-toggle="dropdown"             ` ;
			        code+=`               aria-expanded="false"><i class='uil uil-ellipsis-v'></i></button>  ` ;
			        code+=`                                                                                  ` ;
			        code+=`           <div class="dropdown-menu dropdown-menu-right">                        ` ;
			        code+=`               <a class="dropdown-item" href="#">Copy Message</a>                 ` ;
			        code+=`               <a class="dropdown-item" href="#">Edit</a>                         ` ;
			        code+=`               <a class="dropdown-item" href="#">Delete</a>                       ` ;
			        code+=`           </div>                                                                 ` ;
			        code+=`      	 </div>                                                                  ` ;
			        code+=`  		 </li>	                                                                 ` ;
			        
				}
					code+=` <li class="clearfix odd">                                                         `;  
					code+=` <div class="chat-avatar">                                                         `;
					code+=`     <img src="/resources/assets/images/chatbot/WorkFit.gif" class="rounded"/> 	  `;
					code+=`     <i>\${nowTime}</i>                                                                  `;
					code+=` </div>                                                                            `;
					code+=` <div class="conversation-text">                                                   `;
					code+=`     <div class="ctext-wrap">                                                      `;
// 					code+=`         <i>회사 이름..</i>                                                         `;   
					code+=`         <p>                                                                       `;
					code+=`			원하시는 버튼을 클릭하여 주십시오.                                  		  `;                         
					code+=`         </p>                                                                      `;
					code+=`     </div>                                                                        `;
					
				
				
				for(let i in chatbotInfo){
					console.log(chatbotInfo[i].chatbotIdFk);
					let chatUpQuestion = chatbotInfo[i].chatbotUq;
					let chatQuestion = chatbotInfo[i].chatbotQ;
					let chatBotID = chatbotInfo[i].chatbotIdFk;
					let chatAnswer = chatbotInfo[i].chatbotA;
					let endStatus = chatbotInfo[i].endStatus;
					let chatbotFinalValue = chatbotInfo[i].chatbotTitle;
					let chatType = chatbotInfo[i].chatbotType;
					const lastCommonAnswer = (endStatus == 1 && chatType == 0);
					const lastLinkAnswer = (endStatus == 1 && chatType == 1) ;
					const lastInputAnswer = (endStatus == 1 && chatType == 2) ;
					const firstAnswer = (endStatus == 0);
					
// 					console.log(typeof(chatAnswer));
// 					console.log(typeof(chatUpQuestion));
					
// 					if(endStatus == 1){
					if(firstAnswer){
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::chatUpQuestion ::',chatUpQuestion);
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::chatQuestion ::',chatQuestion);
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::chatAnswer ::',chatAnswer);
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::endStatus ::',endStatus);
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::chatType ::',chatType);
						console.log('버튼 ::: 값이 없음에 당시 값들의 상황 확인 ::level ::',levelCnt);
						code += `<button type='button' class='btn btn-primary' onclick='getChat(\${chatQuestion},\${levelCnt})'>\${chatAnswer}  </button>`;
					}
					if(lastCommonAnswer){
						console.log("아아... 이건 .... 마지막 부문이 아무런 형태 없이 답만 제공해주는 경우를 뜻한다.")
						console.log('값이 없음에 당시 값들의 상황 확인 ::chatUpQuestion ::',chatUpQuestion);
						console.log('값이 없음에 당시 값들의 상황 확인 ::chatQuestion ::',chatQuestion);
						console.log('값이 없음에 당시 값들의 상황 확인 ::chatAnswer ::',chatAnswer);
						console.log('값이 없음에 당시 값들의 상황 확인 ::endStatus ::',endStatus);
						console.log('값이 없음에 당시 값들의 상황 확인 ::chatType ::',chatType);
// 						console.log('더 이상의 값은 존재하지 않습니다.');
// 					 	code += `<h5>\${chatAnswer}</h5>`;
// 					 	code += `<button type='button' class='btn btn-primary' onclick='getChat(\${chatQuestion},\${levelCnt})'>\${chatAnswer}  </button>`;
					 	code += `<button type='button' class='btn btn-primary' onclick='getAnswer(\${chatQuestion})'>\${chatAnswer}  </button>`;
// 						let prelevelCnt = levelCnt -1 ;
// 					 	code += `<button  type="button" class='apple5' onclick='getChat(\${chatUpQuestion},\${levelCnt})'>\${chatAnswer}  </button>`;
// 						code += `<input type="hidden" id="preValue" value="\${levelCnt}"/>`;
					}
					if(lastInputAnswer){
// 						let dataAnswer = chatbotInfo[i-1];
// 						console.log("dataAnswer :",dataAnswer);
// 						let lastAnswer = getAnswer(dataAnswer);
// 						console.log("Last Answer : ",lastAnswer);
						let prelevelCnt = levelCnt -1 ;
						console.log("아아... 이건 .... 마지막 부문이 입력 형태를 제공해주는 경우를 뜻한다.");
						code += `<button type="button" class="btn btn-secondary" onclick='getAnswer(\${chatQuestion})'>\${chatAnswer}  </button>`;
// 						code += `<button type="button" class="btn btn-secondary" onclick='getAnswer(\${dataAnswer})'>\${dataAnswer.chatbotA}  </button>`;
// 						code += `<h5>inputAnswer</h5>`;
						
					}
					
					if(lastLinkAnswer){
						console.log("아아... 이건 .... 마지막 부문이 링크를 제공해주는 경우를 뜻한다.");
					 	console.log(":::링크 ",chatbotInfo);
						code += `<button type="button" class="btn btn-success" onclick='getAnswer(\${chatQuestion},\${chatbotInfo})'>\${chatAnswer}  </button>`;
					}
				}
				
				code+=` </div><br/>                                                                            `;
				code+=` <div class="conversation-actions dropdown">                                       `;
				code+=`     <button class="btn btn-sm btn-link" data-toggle="dropdown"                    `;
				code+=`         aria-expanded="false"><i class='uil uil-ellipsis-v'></i></button>         `;
				code+=`                                                                                   `;
				code+=`     <div class="dropdown-menu dropdown-menu-right">                               `;
				code+=`         <a class="dropdown-item" href="#">Copy Message</a>                        `;
				code+=`         <a class="dropdown-item" href="#">Edit</a>                                `;
				code+=`         <a class="dropdown-item" href="#">Delete</a>                              `;
				code+=`     </div>                                                                        `;
				code+=`     </div>                                                                        `;  
				code+=` </li>                                                                             `;
				
// 				conversation.innerHTML = code;
				conversation.insertAdjacentHTML('beforeend',code);
				console.log("this가 무엇인가....?",this);
// 				document.querySelector('.simplebar-content').scrollTo({ left: 0, top: 50, behavior: "smooth" });
			}
		}
		xhr.send();
	}
	
	const getAnswer = function(data){
		var xhr = new XMLHttpRequest();
		
// 		let data = new Object(dataf);
		console.log("getAnswer 함수 data :",data);
		
		let code = '';
// 		let chatUpQuestion = data.chatbotUq;
// 		let chatQuestion = data.chatbotQ;
// 		let chatBotID = data.chatbotIdFk;
// 		let chatAnswer = data.chatbotA;
// 		let endStatus = data.endStatus;
// 		let chatbotFinalValue = data.chatbotTitle;
// 		let chatType = data.chatbotType;
// 		code += `<h5>\${chatbotFinalValue} </h5>`;
		xhr.open("GET","/workfit/chatbot/getAnswer/"+data,true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log(xhr.responseText);
				let answer = JSON.parse(xhr.responseText);
				console.log(answer);
				var nowTime = dayjs().format('HH:mm');
				let answerType = answer.chatbotType;
				let answerValue = answer.chatbotTitle;
				if(answerType == '2'){
					code += `<a href="\${answerValue}">Link </a>`;
				}
				if(answerType == '0'){
					code+=`		<li class="clearfix">                                                        ` ;
			        code+=`       <div class="chat-avatar">                                                  ` ;
			        code+=`           <img src="/resources/assets/images/logo-light.png" class="rounded"/>   ` ;
			        code+=`           <i>\${nowTime}</i>                                                     ` ;
			        code+=`       </div>                                                                     ` ;
			        code+=`       <div class="conversation-text">                                            ` ;
			        code+=`           <div class="ctext-wrap">                                               ` ;
			        code+=`               <i class="apple4">Workfit Chatbot</i>                              ` ;
			        code+=`               <p>                                                                ` ;
			        code+=`                   <b>\${answerValue}</b>   		 ` ;
			        code+=`               </p>                                                               ` ;
			        code+=`           </div>                                                                 ` ;
			        code+=`       </div>                                                                     ` ;
			        code+=`       <div class="conversation-actions dropdown">                                ` ;
			        code+=`           <button class="btn btn-sm btn-link" data-toggle="dropdown"             ` ;
			        code+=`               aria-expanded="false"><i class='uil uil-ellipsis-v'></i></button>  ` ;
			        code+=`                                                                                  ` ;
			        code+=`           <div class="dropdown-menu dropdown-menu-right">                        ` ;
			        code+=`               <a class="dropdown-item" href="#">Copy Message</a>                 ` ;
			        code+=`               <a class="dropdown-item" href="#">Edit</a>                         ` ;
			        code+=`               <a class="dropdown-item" href="#">Delete</a>                       ` ;
			        code+=`           </div>                                                                 ` ;
			        code+=`      	 </div>                                                                  ` ;
			        code+=`  		 </li>	                                                                 ` ;
				}
			}
			conversation.insertAdjacentHTML('beforeend',code);
		}
		xhr.send();
	}
		
	const checkStatus = function(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET","/workfit/chatbot/status",true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
// 				console.log(xhr.responseText);
				let chkValue = JSON.parse(xhr.responseText);
// 				chatbotStatus = chkValue.CHATBOT_STATUS;
				statusFlag.value = chkValue.CHATBOT_STATUS;
				if(statusFlag.value == 'y'){
// 					console.log("채팅봇이 구매된 상태입니다.");
					chatbotMain.style.display='block';
				}else{
// 					console.log("채팅봇이 구매되지 않았습니다.");
					chatbotMain.style.display='none';
				}
			}
		}
		xhr.send();
	}
	
	
	$(function(){
		checkStatus();
	})
</script>
</html>