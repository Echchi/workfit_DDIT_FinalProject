<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class='row mt-2' style='background-color : none; border : none;'>                                                                                                 
  <div class='col-12' style='background-color : transparent;'>                                                                                                         
		<div class='card mr-2 workfitCardBg' style='background-color : rgba(255,255,255,0.85) !important; border : none;'>                                                                                              
        <div class='card-body p-4'> 
        	<div class="row mb-2 justify-content-between" style="padding-left : 0px;"> 
        	<h5 id="headTitle" class='apple4 page-title text-dark'                                                                 
                		 style='font-size: 27px; letter-spacing: 2px; display : inline-block; margin-left: 15px;'>
        	<i class="mdi mdi-email-edit-outline" style="font-size : 27px;"></i>
                		 메일 작성</h5> 
				<div id="byhButtons" style="padding-top : 10px; padding-right: 10px;">
					<button type="button" class="btn btn-rounded apple3" id="byh_mail_submitBtn" style="background-color :  #5F7CBB; color : white;">보내기</button>
					<button type="button" class="btn btn-rounded apple3 text-dark" style="border: 1px solid black;"onclick="fn_tempSaveClickProcess(this)">임시저장</button>
					<button type="button" class="btn btn-rounded apple3 text-dark" style="border: 1px solid black;" id="importantMail" onclick="fn_importantMailClickProcess(this)">중요메일</button>
					<span id="tempSaveDate"></span>
				</div>
			</div>
<!-- 				<div style="border : 1px solid gray; margin-top : 5px; margin-bottom : 5px;"></div> -->
				<div>
					<form action="" id="mailForm">
						<div style="width : auto;"class="form-group row">
							<label style="width : 100px; font-size: 20px; padding-left: 17px;" for="colFormLabel" class="col-sm-1 col-form-label apple3 text-dark">수신자</label>
							<div style="width : 1000px;" class="col-sm-10">
							
								<div id="divHelper1" style="position : relative; display : inline-block; border-bottom : 0.5px solid gray;">
									<div id="divText1" tabindex="0" onfocus="fn_whenfocused(this)" style="display : inline-block; width : 800px; height : 32px; outline : none; font-size:17px;" onInput="fn_divInput(this)" class="text-dark" contenteditable>
										
										<!-- 임시보관함에서 메일을 클릭했을 때 -->
										<c:if test="${modifyFlag eq 'yes'}">
											
											<c:forEach var="receiver" items="${receiverList}">
												<div contenteditable="false" tabindex="-1" class="pr-2 pl-2"
													style="display: inline-block; background-color: rgb(98 146 250 / 43%); border-radius: 10px; width: auto; height: 30px; text-align: center; padding: 3px; margin-right: 3px;">
														<p spellcheck="false" style="display : inline-block;" id="a02" class="apple3 text-dark">${receiver.memEmail}
															<button id="delRefBtn" class="apple3 text-dark" type="button" class="close" value="X" onclick="fn_delMem()"
																style="background-color: transparent; border: none;">x</button>
														</p>
													</div>
											</c:forEach>
										</c:if>
										
										<!-- 조직도에서 우클릭으로 메일보내기를 클릭했을 때 -->
										<c:if test="${not empty mailReceiver }">
												<div contenteditable="false" tabindex="-1"  class="pr-2 pl-2" 
												style="display: inline-block; background-color: rgb(98 146 250 / 43%); border-radius: 10px; width: auto; height: 30px; text-align: center; padding: 3px; margin-right: 3px;">
													<p spellcheck="false" style="display : inline-block;" id="${mailReceiver.memId }" class="apple3 text-dark">${mailReceiver.memEmail}
														<input type="hidden" value="${mailReceiver.memJobGrade }"/>
														<button id="delRefBtn" class="apple3 text-dark" type="button" class="close" value="X" onclick="fn_delMem()"
														style="background-color: transparent; border: none;">x</button>
													</p>
												</div>
										</c:if>
										
										<!-- 답장하기 클릭 했을 때 -->
										<c:if test="${replyFlag eq 'yes'}">
												<div contenteditable="false" tabindex="-1"  class="pr-2 pl-2"
												style="display: inline-block; background-color: rgb(98 146 250 / 43%); border-radius: 10px; width: auto; height: 30px; text-align: center; padding: 3px; margin-right: 3px;">
													<p spellcheck="false" style="display : inline-block;" id="a02" class="apple3 text-dark">${memData.memEmail}
														<button id="delRefBtn" class="apple3 text-dark" type="button" class="close" value="X" onclick="fn_delMem()"
														style="background-color: transparent; border: none;">x</button>
													</p>
												</div>
				 						</c:if>
									</div>
										
				<!-- 					<div id="memStorage1" style="z-index : 1002; background-color : white; display : none; width: 200px; height : 200px; overflow : auto; text-align : left; border : 1px solid black; position : absolute; top : 29px; left : 0px;"> -->
				<!-- 						<p spellcheck="false" style="display : inline-block;" class="text-muted apple-3 ml-3" id="a001" onclick="fn_insertMem(this)">조현수1 <i style="display : none;" class="dripicons-pencil"></i><button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem()">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a002">조현수2<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a003">조현수3<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a004">조현수4<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a005">조현수5<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a006">조현수6<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a007">조현수7<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 					</div> -->
						
								</div>
								
								<c:if test="${replyFlag ne 'yes'}">
								<button 
									style="display : inline-block; font-size: 18px; background-color :  #5F7CBB; color : white;" type="button" 
									class="btn btn-rounded apple3" onclick="fn_showTree()">검색</button>
								<button style="display : inline-block; font-size: 18px; background-color :  #5F7CBB; color : white;"
									 type="button" class="btn btn-rounded apple3" onclick="auto()">자동입력</button>
								</c:if>
							</div>
						</div>
						
						<c:if test="${replyFlag ne 'yes'}">
						<div class="form-group row">
							<label style="width : 100px; font-size: 20px; padding-left: 17px;" for="colFormLabel" class="col-sm-1 col-form-label apple3 text-dark">참조자</label>
							
									<div style="width : 1000px;" class="col-sm-10">
							
								<div id="divHelper2" style="position : relative; display : inline-block; border-bottom : 0.5px solid gray;">
									<div id="divText2" tabindex="0" onfocus="fn_whenfocused(this)" style="display : inline-block; width : 800px; height : 32px; outline : none; font-size:17px;" class="text-dark" contenteditable>
											<c:if test="${modifyFlag eq 'yes'}">
											
											<c:forEach var="referer" items="${refererList}">
												<div contenteditable="false" tabindex="-1"  class="pr-2 pl-2"  
													style="display: inline-block; background-color : rgb(98 146 250 / 43%); border-radius: 10px; width: auto; height: 30px; text-align: center; padding: 3px; margin-right: 3px;">
													<p spellcheck="false" style="display : inline-block;" id="a02" class="apple3 text-dark">${referer.memEmail}
														<button id="delRefBtn" class="apple3 text-dark" type="button" class="close" value="X" onclick="fn_delMem()"
														style="background-color: transparent; border: none;">x</button>
													</p>
												</div>
											</c:forEach>
											
											</c:if>
										
									</div>
										
				<!-- 					<div id="memStorage2" style="z-index : 1002; background-color : white; display : none; width: 200px; height : 200px; overflow : auto; text-align : left; border : 1px solid black; position : absolute; top : 29px; left : 0px;"> -->
				<!-- 						<p spellcheck="false" style="display : inline-block;" class="text-muted apple-3 ml-3" id="a001" onclick="fn_insertMem(this)">조현수1<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem()">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a002">조현수2<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a003">조현수3<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a004">조현수4<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a005">조현수5<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a006">조현수6<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a007">조현수7<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 					</div> -->
						
								</div>
								
								
							</div>
						</div>
						
						
						
						
						
						<div class="form-group row">
							<label style="width : 100px; font-size: 20px; padding-left: 17px;" for="colFormLabel" class="col-sm-1 col-form-label apple3 text-dark">숨은 참조자</label>
							
											<div style="width : 1000px;" class="col-sm-10">
							
								<div id="divHelper3" style="position : relative; display : inline-block; border-bottom : 0.5px solid gray;">
									<div id="divText3" tabindex="0" onfocus="fn_whenfocused(this)" style="display : inline-block; width : 800px; height : 32px; outline : none; font-size:17px;" class="text-dark" contenteditable>
										<c:if test="${modifyFlag eq 'yes'}">
											
											<c:forEach var="hidereferer" items="${hiderefererList}">
												<div contenteditable="false" tabindex="-1"  class="pr-2 pl-2 text-dark"
												style="display: inline-block;  background-color: rgb(98 146 250 / 43%); border-radius: 10px; width: auto; height: 30px; text-align: center; font-size:17px; padding: 3px; margin-right: 3px;">
													<p spellcheck="false" style="display : inline-block;" id="a02" class="apple3 text-dark">${hidereferer.memEmail}
														<button id="delRefBtn" class="apple3 text-dark" type="button" class="close" value="X" onclick="fn_delMem()"
														style="background-color: transparent; border: none;">x</button>
													</p>
												</div>
											</c:forEach>
											
										
										
											</c:if>
									</div>
										
				<!-- 					<div id="memStorage3" style="z-index : 1002; background-color : white; display : none; width: 200px; height : 200px; overflow : auto; text-align : left; border : 1px solid black; position : absolute; top : 29px; left : 0px;"> -->
				<!-- 						<p spellcheck="false" style="display : inline-block;" class="text-muted apple-3 ml-3" id="a001" onclick="fn_insertMem(this)">조현수1<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem()">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a002">조현수2<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a003">조현수3<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a004">조현수4<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a005">조현수5<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a006">조현수6<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 						<p style="display : inline-block;" class="text-muted apple-3 ml-3" id="a007">조현수7<button id="delRefBtn" type="button" class="close" value="X">x</button></p><br/> -->
				<!-- 					</div> -->
						
								</div>
								
								
							</div>
							
							
							
						</div>
						
						</c:if>
						
						<div class="form-group row">
							<label style="width : 100px; font-size: 20px; padding-left: 17px;" for="colFormLabel" class="col-sm-1 col-form-label apple3 text-dark">제목</label>
							
													<div style="width : 1000px;" class="col-sm-10">
							
								<div id="divHelper4" style="position : relative; display : inline-block; width : 800px; border-bottom : 0.5px solid gray;">
									<div id="divText4" tabindex="0" onfocus="fn_whenfocused(this)" style="display : inline-block; width : 800px; height : 32px; outline : none; font-size:17px;" class="text-dark" contenteditable>
										<c:if test="${modifyFlag eq 'yes'}">
												${mailData.emailTitle }
											</c:if>
											
										<c:if test="${replyFlag eq 'yes'}">
												[회신]${mailData.emailTitle }
										</c:if>
									</div>
										
								</div>
								
								
							</div>
							
						</div>
						
						<div class="form-group" >
						    <label for="example-textarea" class="apple3 text-dark pl-1" style="font-size: 20px;">내용</label>
						    <div class="form-group">
										<textarea id="reportForm" name="reportForm" class="form-control workfitCardBg" rows="14">
											<c:if test="${modifyFlag eq 'yes'}">
												${mailData.emailContent }
											</c:if>
											
											<c:if test="${replyFlag eq 'yes'}">
												<br/>
												----------------- 이전 메시지 ----------------- <br/>
												<span style="font-weight : bold;">발신자 :</span> ${memData.memName }(${memData.memEmail })<br/>
												<span style="font-weight : bold;">수신자 :</span> ${loginMember.memName }(${loginMember.memEmail})<br/>
												<span style="font-weight : bold;">수신날짜 :</span> <fmt:formatDate value="${mailData.emailDate }" pattern="yyyy-MM-dd HH:mm"/><br/>
												${mailData.emailContent }
											</c:if>
											                    
				                        </textarea>
							</div>
						</div>
						<sec:csrfInput />
					</form>
					
					
					
					
					
					
					<!-- File Upload -->
				<!-- 	<form action="/" method="post" class="dropzone" id="myAwesomeDropzone" data-plugin="dropzone" data-previews-container="#file-previews" -->
				<!--     data-upload-preview-template="#uploadPreviewTemplate" enctype="multipart/form-data"> -->
					<form id="insertForm" method="post"	action="/workfit/mail/insertFile" enctype="multipart/form-data" class="dropzone" style="border: 2px none #dee2e6" id="myAwesomeDropzone">
						<input id="hiddenMailCode" type="hidden" name="mailCode" value=""/>
							    
				<!-- 	    <span> 첨부 파일 </span> -->
				
				<!-- 	<div class="dropzone" id="myAwesomeDropzone"></div> -->
						<div class="dz-message needsclick"
							data-upload-preview-template="#uploadPreviewTemplate">
							<i class="h1 text-muted dripicons-cloud-upload"></i>
							<h3>첨부할 파일을 올려주세요.</h3>
							<span class="text-muted font-13">(파일은 <strong>최대 5개</strong>까지 올리실 수 있습니다.)
							</span>
						</div>
						<!-- Preview -->
						<div class="dropzone-previews mt-3" id="file-previews"></div>
					
						<!-- File Upload -->
						<div class="fallback">
							<!-- 추가 파일 네임 -->
							<input type="file" name="emFile" multiple />
						</div>
						
						
					<!-- 	<button type="button" id="upload">upload</button> -->
					<!-- 	<div id='txttest'>sdgsdgs</div> -->
					
					
						<!-- file preview template -->
						<div class="d-none" id="uploadPreviewTemplate">
							<div class="card mt-1 mb-0 shadow-none border">
								<div class="p-2">
									<div class="row align-items-center">
										<div class="col-auto">
											<img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light"
												alt="">
										</div>
										<div class="col pl-0">
											<a href="javascript:void(0);" class="text-muted font-weight-bold"
												data-dz-name></a>
											<p class="mb-0" data-dz-size></p>
										</div>
										<div class="col-auto">	Button <a href="" class="btn btn-link btn-lg text-muted"
												data-dz-remove> <i class="dripicons-cross"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<sec:csrfInput />
					</form>
					
					<!-- Preview -->
				<!-- 	<div class="dropzone-previews mt-3" id="file-previews"></div> -->
					
					<!-- file preview template -->
				<!-- 	<div class="d-none" id="uploadPreviewTemplate"> -->
				<!-- 	    <div class="card mt-1 mb-0 shadow-none border"> -->
				<!-- 	        <div class="p-2"> -->
				<!-- 	            <div class="row align-items-center"> -->
				<!-- 	                <div class="col-auto"> -->
				<!-- 	                    <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt=""> -->
				<!-- 	                </div> -->
				<!-- 	                <div class="col pl-0"> -->
				<!-- 	                    <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name></a> -->
				<!-- 	                    <p class="mb-0" data-dz-size></p> -->
				<!-- 	                </div> -->
				<!-- 	                <div class="col-auto"> -->
				<!-- 	                    Button -->
				<!-- 	                    <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove> -->
				<!-- 	                        <i class="dripicons-cross"></i> -->
				<!-- 	                    </a> -->
				<!-- 	                </div> -->
				<!-- 	            </div> -->
				<!-- 	        </div> -->
				<!-- 	    </div> -->
				<!-- 	</div> -->
					
				
				
				</div>
			</div>
		</div>
	</div>
</div>



<div id="hidedDivText1" style="display : none;"></div>
<div id="hidedDivText2" style="display : none;"></div>
<div id="hidedDivText3" style="display : none;"></div>


<!-- SWEET ALERT를 위한 CDN코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	var auto = () => {
		var jjeMailTitle = document.querySelector('#divText4');	// 메일 제목 
		jjeMailTitle.innerText = "[야유회 업무] 야유회 포스터 자료 공유합니다."
		
		let jjeMailContent = "<h3>인사부 1팀 팀장 조현수입니다.</h3>"
				+ "<h3>이번달 21일일부터 22일에 있을 야유회 관련 포스터 완성되어 첨부합니다.</h3>"
				+ "<h3>배영호 사원 첨부된 포스터 출력해서 회사 게시판에 좀 붙여주세요.</h3>"
				+ "<h3>그리고 프린트기 위치는 양지윤 사원에게 물어보면 되겠습니다.</h3>"
				+ "<h3>궁금한 사항 있으면 연락주세요&nbsp;</h1>";

		CKEDITOR.instances.reportForm.setData(jjeMailContent);	
	
	}

	function fn_showTree(){
		
		//---------------------------- 모달로 바꿔야됨 --------------------------------------- 
		var mailReceiverInfo = '${mailReceiverJsonString}';
		console.log("수신자 제이슨 스트링 확인좀"+mailReceiverInfo);
// 		console.log(JSON.parse(mailReceiverInfo).memName);
		
		
		if(mailReceiverInfo != ''){
			var mailReceiverObj = JSON.parse(mailReceiverInfo);
			
			
// 			hidedDivText1태그에다가 어팬드 시켜놓음
// 			var divTag = '<div class="apple3" style="display : inline-block;"><span>'+mailReceiverObj.memName+' '+mailReceiverObj.memJobGrade+'</span><span id="'+mailReceiverObj.memId+'" class="memberMail">'+mailReceiverObj.memEmail+'</span><button id="btn'+mailReceiverObj.memId+'" type="button" class="close" value="X">x</button><br></div>';
// 			$("#hidedDivText1").append(divTag);
			
			var openUrl = "/workfit/mail/memSearch?memId="+mailReceiverObj.memId;
		}else{
			var openUrl = "/workfit/mail/memSearch";
		}
		
		let openWin = window.open(openUrl, '_blank', 'width=1500, height=900, screenX=461, screenY=153,location=no, status=yes,  scrollbars=no')
// 		let openWin = window.open(openUrl,"child","width=900, height=900, resizable = no, scrollbars = no");
// 		openWin.document.getElementById("cInput").value = "전달하고자 하는 값";

// 		console.log(openWin.document.getElementById("inp_memName"));
// 		openWin.document.getElementById("inp_memName").value = mailReceiverObj.memName;
// 		openWin.document.getElementById("inp_memMail").value = mailReceiverObj.memEmail;
// 		openWin.document.getElementById("inp_memJobGrade").value = mailReceiverObj.memJobGrade;
		
	}
	
	function fn_divInput(a){
		
	}
	
	
	
	
	function fn_whenfocused(a){
		$(a).parent().css("border-bottom","1px solid black");
		
		
		$(a.nextElementSibling).css("display", "inline-block");
		
	}
	
	function fn_whenblurred(){
		
// 		$("#memStorage").css("display", "none");

		$("#memStorage1").css("display", "none");
		$("#memStorage2").css("display", "none");
		$("#memStorage3").css("display", "none");
// 		$("#divHelper1").css("border-bottom","none");
// 		$("#divHelper2").css("border-bottom","none");
// 		$("#divHelper3").css("border-bottom","none");
	}
	
	
	
	function fn_insertMem(a){
		console.log(a);
		
		var divTag = document.createElement("div");
		$(divTag).attr("contenteditable","false");
		$(divTag).attr("tabindex","-1");
		$(divTag).css({"display":"inline-block", "background-color" : "rgb(98 146 250 / 43%)", "border-radius" : "10px", "width" : "auto", "height" : "30px", "text-align" : "center","padding": "3px", "margin-right": "3px"});
		
		
// 		// 연필 이미지 태그 생성 후 append
// 		var iTag = document.createElement("i");
// 		iTag.setAttribute("class","dripicons-pencil") 
// 		$(divTag).append(iTag);
		
		var clonedNode = a.cloneNode(true);
		clonedNode.removeAttribute("onclick");		
		clonedNode.removeAttribute("class");		
		$(clonedNode).children("i").css("display","inline-block");
		$(divTag).append(clonedNode);
		
		 
		 $(a).parent().prev().append(divTag);
		
		
		$(a).parent().css("display", "none");
		
// 		$(a).parent().prev().append(' | ');
		
	}
	
	Dropzone.autoDiscover = false;
	$(function(){
		// ============== 우클릭해서 받은 아이디가 있을 경우 이를 하이드 디브 텍스트 태그에 넣어주는 로직 시작... =====
		var mailReceiverInfo = '${mailReceiverJsonString}';
		console.log("수신자 제이슨 스트링 확인좀"+mailReceiverInfo);
// 		console.log(JSON.parse(mailReceiverInfo).memName);
		
		
		if(mailReceiverInfo != ''){
			var mailReceiverObj = JSON.parse(mailReceiverInfo);
			
			
// 			hidedDivText1태그에다가 어팬드 시켜놓음
			var divTag = '<div class="apple3" style="display : inline-block;"><span>'+mailReceiverObj.memName+' '+mailReceiverObj.memJobGrade+'</span><span id="'+mailReceiverObj.memId+'" class="memberMail">'+mailReceiverObj.memEmail+'</span><button id="btn'+mailReceiverObj.memId+'" type="button" class="close" value="X">x</button><br></div>';
			$("#hidedDivText1").append(divTag);
			
		}
		// ============== 우클릭해서 받은 아이디가 있을 경우 이를 하이드 디브 텍스트 태그에 넣어주는 로직 끝... =====
		
		// 에디터 불러오기 
		CKEDITOR.replace('reportForm');
		
		// 내용물 가져오기   
// 		let approvalContent = CKEDITOR.instances.reportForm.getData();
		
		window.clickDivHistory = '';
		
		document.querySelector("body").addEventListener("click", function(e) {
			console.log(e.target)
		    if(!(e.target.id == 'divText1' || e.target.id == 'divText2' || e.target.id == 'divText3')) {
				console.log("???")
				
		    	fn_whenblurred();
		    	console.log();
		    }else{
				if(window.clickDivHistory != ''){
					if(window.clickDivHistory != e.target){
						console.log("여길 왜 들어가 자꾸");
						window.clickDivHistory.nextElementSibling.style.display = "none";
					}
				}
				
		    	
		    	window.clickDivHistory = e.target; 
		    	
		    }
		    
		})
		
		
		
		
		// ---------------------파일 업로드 처리 로직 시작----------------------------
			
		var dropzone = new Dropzone(
				"form.dropzone",{
					headers : {
						// 요청 보낼때 헤더 설정
						'X-CSRF-TOKEN' : $("#csrf_token").val()
					},
					addRemoveLinks : true, //업로드 후 삭제 버튼 
					autoProcessQueue : false, //파일 추가하자마자 서버로 전송할 것인가?(기본값 false로 진행)
					// 반드시 아래의 processQueue 메서드를 진행해주어야 실제 서버로 전송한다...

					clickable : true, // 클릭 가능 여부
					autoQueue : true, // 드래그 드랍 후 바로 서버로 전송
					createImageThumbnails : true, //파일 업로드 썸네일 생성 (css적인 측면이 있음.)
					thumbnailHeight : 120, // Upload icon size
					thumbnailWidth : 120, // Upload icon size

					maxFiles : 5, // 업로드 파일수
					maxFilesize : 100, // 최대업로드용량 : 100MB -> web.xml에서 multipart 부분도 수정해줘야한다.
					paramName : 'file', // 서버에서 사용할 formdata 이름 설정 (default는 file... img 등.)
					parallelUploads : 5, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
					uploadMultiple : true, // 다중업로드 기능
					timeout : 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자

					addRemoveLinks : true, // 업로드 후 파일 삭제버튼 표시 여부
					dictRemoveFile : '삭제', // 삭제버튼 표시 텍스트
					// 		acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', 

					init : function() {
						// 최초 dropzone 설정시 init을 통해 호출
						let myDropzone = this;
						console.log('최초 실행');
						// -------------------------------------------
						//     		console.log(myDropzone.getQueuedFiles());
						// 			console.log(myDropzone.getAcceptedFiles());
						// 			console.log(myDropzone.getUploadingFiles());
						// -------------------------------------------
// 						$('#switch1').change(function(e) {
// 							console.log(e.target.checked);
// 							if (e.target.checked == true) {
// 								console.log("아아아");
// 								test.val('y');
// 							}
// 							if (e.target.checked == false) {
// 								console.log("노노노노");
// 								test.val('n');
// 							}
// 							console.log(document.querySelector('#test'));
// 						})

						document.querySelector("#byh_mail_submitBtn").addEventListener("click",function(e, file) {
											e.preventDefault();
											e.stopPropagation();
											
											if (myDropzone.getQueuedFiles().length > 0) {
												window.isFileExist = true;
// 												alert("파일 이 드러왔따...!" + myDropzone.getQueuedFiles().length);

												// 파일 이외의 데이터에 대한 전송 함수 
												var myMailCode = fn_submitMail();
												
												
												$("#hiddenMailCode").attr("value",myMailCode);
												
												console.log("영호의 메일코드 확인!#!@#!@#!@"+myMailCode);
												// 여기서 alert한번 해주고 1~2초 뒤 페이지 이동 
												setTimeout(function(){myDropzone.processQueue();
												},1500); 
												
												
												
// 												alert("파일 들어잇음!");
												
												
												
												
												return;
											}
											
											window.isFileExist = false;
// 											alert('그냥 일반 입력이닷!');
											// 일반 입력일 경우 파일을 제외한 내용만 submit되도록 하기 
											fn_submitMail();
// 											$("#insertForm").submit();
										})

						// 			document.querySelector('#upload').addEventListener('click',function(e) {
						// 				e.preventDefault();
						// 				console.log('업로드');
						// 				console.log("acceptFile",myDropzone.getAcceptedFiles());
						// 				console.log("queued",myDropzone.getQueuedFiles());
						// 				console.log("uploadFIle",myDropzone.getUploadingFiles());
						// 				// 거부된 파일이 있다면
						// 				if (myDropzone.getRejectedFiles().length > 0) {
						// 					let files = myDropzone.getRejectedFiles();
						// 					console.log('거부된 파일이 있습니다.', files);
						// 					return;
						// 				}
						// 				myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
						// 			});

						this.on('addedFile',function(files) {
											// 중복된 파일의 제거
											console.log('업로드?', this);
											console.log('업로드?', file);
											alert(JSON.stringify(file));

											if (this.files.length) {
												// -1 to exclude current file
												var hasFile = false;
												for (var i = 0; i < this.files.length - 1; i++) {
													if (this.files[i].name === file.name&& this.files[i].size === file.size&& this.files[i].lastModifiedDate.toString() === file.lastModifiedDate.toString()) {
														hasFile = true;
														this.removeFile(file);
														console.log("중복됐다!");
													}
												}
												if (!hasFile) {
													addedFiles.push(file);
												}
											} else {
												addedFiles.push(file);
											}
										});

						// 업로드한 파일을 서버에 요청하는 동안 호출 실행
						this.on('sending', function(file, xhr, formData) {
							console.log('보내는중');
						});
						this.on("queuecomplete", function(file) {
							// 			        document.location.href = "./cardnews.html" //업로드가 완료되었다면 이전 화면으로 이동
							console.log('큐 완료...');
// 							location.href = "./";
						});
						this.on('success', function(file, responseText) {
							console.log('성공');

							// 				console.log("responseText",responseText);
							// 				console.log("responseText.success",responseText.success);
							// 				console.log("responseText.response",responseText.response);
							// 				var success = responseText.success;

							// submit 성공했을 때의 로직 
// 							if (success == "success") {
// 								console.log("첨부 성공");
// 								location.href = "/workfit/board/notice";
// 								successValue.val('success');
// 							}
							// 					console.log("successs값",successValue.val);
							var cnt = 0;

							// 				txttest.html("성공해싸다다다핟하닫핟핟ㅎㄷ");
							// 				let str = '';
							// 				str += responseText[0].boardAttachCode;
							// 				str += `이건 테스트인것이다.\${responseText[0].boardAttachName}이다`;

							// 				txttest.html(str);
							// 				var obj = JSON.parse(responseText);
							// 				console.log(obj);
							
							location.href = "/workfit/mail/sendedMailView?mailFlag=sended";
						});
						this.on("drop", function(e) {
							console.log("짜증나");
						});
						// 업로드 에러 처리
						this.on('error', function(file, errorMessage) {
							alert(errorMessage);
						});

						this.on("successmultiple", function(files,serverResponse) {
							// 				showInformationDialog(files, serverResponse);
							console.log("successmultiple", "전송 성공");
							// 				console.log("successmultiple",serverResponse);
						});
					},
				//     		accept:function(file,done){
				//     			console.log("accept?");
				//     			done();
				//     		},

				});
		// ---------------------파일 업로드 처리 로직 끝----------------------------
		
		
		
		
	}) // $(function(){}) 끝...

	
// 	window.tempCheck = false;
	window.importantCheck = false;
	
	// 임시 저장 버튼을 누를 때마다 DB에 가서 데이터를 insert 또는 업데이트를 해줘야 함 
	// 여기서 나 임시저장이야~ 하는 flag를 주면 될 듯 
	
	window.tempCnt = 0;
	function fn_tempSaveClickProcess(a){
		// 임시저장입니다~ 하는 alert를 띄우고 
		swal("임시저장됐습니다", "You clicked the button!", "success");
		
		
		// 사원 검색 버튼 옆에다가 임시 저장한 일자를 기록
		var spanTag = document.getElementById("tempSaveDate");
		
		let today = new Date();
		var tempSaveDate = "<span>임시저장 "+today.toLocaleString()+"</span>";
		
		$(spanTag).html(tempSaveDate);
		
		
		var mailForm = document.getElementById("mailForm");
		
		
		var mailFormData = new FormData(mailForm);
		
		
		
		
		var receiverIdList = [...$("#divText1").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})
		
		var referIdList = [...$("#divText2").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})

		var hideReferIdList = [...$("#divText3").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})
		
		
		
		
		// 수신자 / 참조자 / 숨은 참조자 
		mailFormData.append("receiverIdList",JSON.stringify(receiverIdList));
		mailFormData.append("referIdList",JSON.stringify(referIdList));
		mailFormData.append("hideReferIdList",JSON.stringify(hideReferIdList));
		
		// 메일 제목 / 내용 / 임시저장여부 / 중요메일 체크 여부 
		mailFormData.append("tempCnt",window.tempCnt);
		mailFormData.append("mailTitle",$("#divText4").text());
		
		console.log('내용물 확인',CKEDITOR.instances.reportForm.getData());
		
		mailFormData.append("mailContent",CKEDITOR.instances.reportForm.getData());
		mailFormData.append("isTempSave","true");
		mailFormData.append("isImportant",window.importantCheck+"");

		
		
		
		for(let key of mailFormData.keys()){
			console.log(key)
		}
		
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		
		$.ajax({
			url : "/workfit/mail/sendmail",
			method : "post",
			data : mailFormData,
			cache:false,
			contentType:false,
			processData:false,
			beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    },
			success : function(res){
				window.tempCnt += 1;
				window.location.reload();
			}
		});
		
		 
		
	}
	
	function fn_importantMailClickProcess(a){
		
		
		
		if(!window.importantCheck){
			swal("중요메일로 지정하셨습니다", "You clicked the button!", "info");
			$(a).css({"color" : "#fff", "background-color" : "#323a46", "border-color" : "#323a46"});
			window.importantCheck = true;
		}else{
			$(a).css({"color" : "#323a46", "background-color" : "transparent", "border-color" : "#323a46"});
			window.importantCheck = false;
			
		}
		
		
	}
	
	function fn_submitMail(){
		
		var mailForm = document.getElementById("mailForm");
		
		
		var mailFormData = new FormData(mailForm);
		
		
		var receiverIdList = [...$("#divText1").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})
		
		var referIdList = [...$("#divText2").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})

		var hideReferIdList = [...$("#divText3").find("p")].map((ele)=>{
			return {"memId" : $(ele).attr("id"), "memEmail" : $(ele).text()};
		})
		
		
		// 수신자 / 참조자 / 숨은 참조자 
		mailFormData.append("receiverIdList",JSON.stringify(receiverIdList));
		mailFormData.append("referIdList",JSON.stringify(referIdList));
		mailFormData.append("hideReferIdList",JSON.stringify(hideReferIdList));
		
		// 메일 제목 / 내용 / 임시저장여부 / 중요메일 체크 여부 
		mailFormData.append("mailTitle",$("#divText4").text());
		mailFormData.append("mailContent",CKEDITOR.instances.reportForm.getData());
		mailFormData.append("isTempSave","false");
		mailFormData.append("isImportant",window.importantCheck+"");

		
		var modifyFlag = '${modifyFlag}';
		
		if(modifyFlag == 'yes'){
			mailFormData.append("isUpdate","yes");
			
		}
		
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		
		$.ajax({
			url : "/workfit/mail/sendmail",
			method : "post",
			data : mailFormData,
			async : false,
			cache:false,
			contentType:false,
			processData:false,
			dataType : "text",
			beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    },
			success : function(res){
				swal({
				  icon: 'success',
			      title: '메일이 성공적으로 전송되었습니다',
			      showCancelButton: false,
			      showConfirmButton: false
				})

// 				window.location.reload();
				// 파일 폼 전송 (파일이 있을 경우 파일폼도 전송하기)
				if(window.isFileExist){
					
					// 여기서 res가 insert된 메일의 메일코드 이므로 이 코드를 파일폼(insertForm)의 input type hidden의 파라미터로 넘겨주는 식으로 서버에 보내준다 
					console.log("메일코드 잘 찍히니??"+res);
					
					window.currMailCode = res;
					
// 					var ipTag = "<input type='hidden' name='mailCode' value='"+res+"'/>";
// 					$("#insertForm").append(ipTag);

// 					$("#hiddenMailCode").attr("value",res);
// 					console.log("input 태그 value값 확인"+$("#hiddenMailCode").attr("value"));
// 					$("#insertForm").submit();
					
				}else{ // 파일 없이 그냥 보냈을 때 
						
						setTimeout(function(){
							location.href = "/workfit/mail/sendedMailView?mailFlag=sended";
						},1500); 
						
				}
				
				
				
				
			}
		});
		
		
		return window.currMailCode;
		
	}
	
	
</script>

