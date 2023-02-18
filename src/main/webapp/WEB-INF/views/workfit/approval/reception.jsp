<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="docList" value="${approvalDoc }"></c:set>
 <div class='row mt-2'>                                                                                                 
  <div class='col-12'>                                                                                                  
     <div class='workfitCardBg card mr-2'>                                                                                                 
        <div class='card-body p-4'> 
        	<div class='card p-3' style=" border-radius: 0.7rem;"> 
                     <h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>${title }</h5>
                                                                                                
  
				<hr class="ml-2 mr-2 mt-1 mb-1">
	           		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
	           			<span class="badge badge-warning badge-pill">TIP</span><br>
	           			<c:if test="${title eq '결재대기'}">
		           			내가 결재해야 할 문서들입니다<br>
		           			항목 선택을 통해 상세보기를 할 수 있으며 승인 및 반려 처리를 할 수 있습니다<br>
	           			</c:if>
	           			<c:if test="${title eq '결재진행'}">
		           			내가 결재해야 할 문서들입니다<br>
		           			항목 선택을 통해 상세보기를 할 수 있으며 승인 및 반려 처리를 할 수 있습니다<br>
	           			</c:if>
	           			<c:if test="${title eq '결재완료'}">
		           			결재가 완료된 문서들입니다<br>
		           			항목 선택을 통해 상세보기를 할 수 있으며 결재선 및 의견을 확인할 수 있습니다<br>
	           			</c:if>
	           			<c:if test="${title eq '결재참조'}">
		           			내가 참조된 문서들입니다<br>
		           			항목 선택을 통해 상세보기를 할 수 있으며 결재선 및 의견을 확인할 수 있습니다<br>
	           			</c:if>
	           			<c:if test="${title eq '결재취소'}">
		           			내가 결재 취소한 문서들입니다<br>
		           			항목 선택을 통해 상세보기를 할 수 있으며 재기안을 할 수 있습니다<br>
	           			</c:if>
	           		</div>  
	           		
	           		
	           		
	           							
					     <div class="pl-2 pr-2 justify-content-center apple4">
	           					
			           	      <div class="row justify-content-center apple4"> 
				            	<div class="col-2 mr-3 workfitMouse" onclick="cardPush(requestedBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center">
												<i class="mdi mdi-file-document-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">결재대기</h4>
										    	<h6 class="apple5 text-dark" style="font-size: 21px;">${requestedCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            	<div class="col-2 mr-3 workfitMouse" onclick="cardPush(processingBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-edit-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark pl-0" style="font-size: 19px;">결재진행</h4>
										    	<h6 class="apple5 remainDate text-dark" style="font-size: 21px;">${processingCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            	<div class="col-2 mr-3 workfitMouse" onclick="cardPush(processedBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-multiple-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">결재완료</h4>
										    	<h6 class="apple5 usedDate text-dark " style="font-size: 21px;">${processedCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            	
				            	<div class="col-2 mr-3 workfitMouse" onclick="cardPush(referenceBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center">
												<i class="mdi mdi-file-document-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">결재참조</h4>
										    	<h6 class="apple5 text-dark" style="font-size: 21px;">${referenceCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            	<div class="col-2 mr-3 workfitMouse" onclick="cardPush(canceledBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-edit-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark pl-0" style="font-size: 19px;">결재취소</h4>
										    	<h6 class="apple5 remainDate text-dark" style="font-size: 21px;">${cancledCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
			                </div>
					</div>
                                

			</div>








		<div class="card p-4" style=" border-radius: 0.7rem;">
           		
           			<h5 class='apple4 page-title text-dark pl-2 pt-2 mb-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>${title }</h5>
			   
	 				<c:if test="${'결재대기' eq title}"> 
	 						<button class="btn apple4 ml-3 mr-1 mb-2 workfitBtn workfitMouse" style="z-index:999; padding-top: 5px; padding-bottom:5px;font-size:15px;position:absolute; top:100px; left:30px;" id="appCheckedAll">일괄결재</button>
	 				</c:if> 


				<table id="datatable-buttons" class='table text-center dt-responsive nowrap w-100'>                                                        
              <thead>                                                                                                   
                 <tr class="apple3 text-dark text-center" style="font-size:19px;">                                                                                                   
	                  <th>
						<c:if test="${'결재대기' eq title}">
							<div class="custom-control custom-checkbox custom-checkbox-secondary">
							    <input type="checkbox" class="custom-control-input" id="appThCheck">
							    <label class="custom-control-label" for="appThCheck" style="background-color:#5F7CBB"></label>
							</div>
						</c:if> 
						<c:if test="${'결재대기' ne title}">               
		                 	순번
		                 </c:if>                                     
	                   </th>   
	                    <th>북마크</th>                                                             
	                    <th>문서번호</</th>                                                          
	                    <th>제목</th>                                                              
	                    <th>작성자</th>                                                             
	                    <th>첨부파일</th>                                                            
	                    <th>결재의견</th>                                                            
	                    <th>상신일</th>                                                             
                 </tr>                                                                                                  
             </thead>
				<tbody>
					<c:forEach items="${dataList }" var="doc" varStatus="status">	
					<tr style="font-size:17px;" class="apple4 text-dark">
							<c:set value="${doc.APPROVAL_DOC_CODE }" var="code" />
						   <td class=" apple4 text-dark text-center" scope="row">
								<c:if test="${'결재대기' eq title}">
									<div class="ml-3 custom-control custom-checkbox custom-checkbox-secondary">
									    <input type="checkbox" data-docCode="${code}" class=" custom-control-input appTdChecked" id="appTdCheck${status.count }" >
									    <label class="custom-control-label" for="appTdCheck${status.count }"></label>
									</div>
	 		                 	</c:if>  
			                 	<c:if test="${'결재대기' ne title}">
									<div class="ml-3 apple4 text-dark">${status.count }</div>
								</c:if>
							</td>
							<td id="bookMarkTd" class="text-center apple4 text-dark">
								<c:if test="${doc.BOOKMARK_FLAG eq 0}">
									<button class="bmBtn pr-3 text-dark" style="padding:0; background-color:inherit; border:none;"><i style="font-size:16px;" data-docCode="${code }" data-bk="0" class="mdi mdi-star-outline"></i></button>
								</c:if>
								<c:if test="${doc.BOOKMARK_FLAG eq 1}">
									<button class="bmBtn mr-3 text-dark" style="padding:0; background-color:inherit; border:none;"><i style="font-size:16px;" data-docCode="${code }" data-bk="1" class="mdi mdi-star"></i></button>
								</c:if>
							</td> 
							<td onclick="showdetail('${code }')" class=" workfitMouse text-center apple4 text-dark">${code }</td>
							<td onclick="showdetail('${code }')"  class=" workfitMouse apple4 text-dark text-left">${doc.APPROVAL_TITLE }</td>
							<td onclick="showdetail('${code }')" class="workfitMouse text-center apple4 text-dark">${doc.MEM_NAME }</td>
							<td onclick="showdetail('${code }')" class="workfitMouse text-center apple4 text-dark">${doc.ATTACH_COUNT }개</td>
							<td onclick="showdetail('${code }')"  class="workfitMouse text-center apple4 text-dark">${doc.COMMENT_COUNT }개</td>
							<fmt:formatDate var="StartDate" pattern="YYYY.MM.dd."
								value="${doc.APPROVAL_DATE }" /> 
 							<td class="apple4 text-dark">${StartDate }</td> 
 						</tr>
					</c:forEach>

				</tbody>
			</table>
			</div>
         </div>                                                                                                                       
                                                                                                                                      
         <!-- end card-body-->                                                                                                        
      </div>                                                                                                                          
      <!-- end card-->                                                                                                                
   </div>                                                                                                                             
    <!-- end col -->                                                                                                                    
</div>
                                                                                                                                
<button id="detailModalBtn" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#reqAppDetailModal">Full width Modal</button>                                                                                                                                     
<button id="reqAppDetailModalCommentBtn" style="display : none;" type="button" class="btn btn-secondary" data-toggle="modal" data-target="#reqAppDetailModalComment">Center modal</button>

                                                                                                                                      
 <!-- 전자결재 modal -->        
                                                                                                     
<div id='reqAppDetailModal' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='appvReqModalDetail' aria-hidden='true' >   
    <div class='modal-dialog modal-xl'>                                                                                       
        <div class='approvalDetail modal-content'>                                                                                                   
        </div>                                                                                              
    </div>                                                                                                   
</div>

<!-- 의견 등록 모달 -->

<div class="modal fade" style="z-index: 2000;" id="reqAppDetailModalComment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title apple3" id="myCenterModalLabel">승인</h4>
                <button id="ModalCloseBtn2" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
			<div class="modal-body">
				<textarea class="form-control apple3" id="modalCommentContent" rows="5" style="resize:none;" placeholder="의견을 등록해주세요(선택사항)"></textarea>
			</div>
			<div class='modal-footer'> 
                	<button type="button" id="finalAppBtn" style="background-color:#5F7CBB" class="btn btn-primary apple4">승인</button>
                	<button type="button" class="btn btn-light apple4"  data-dismiss="modal">닫기</button>
           	</div>
		</div>
    </div>
</div>

<!-- 반려 등록 모달 -->

<div class="modal fade" style="z-index: 2000;" id="reqAppDetailModalRejComment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title apple3" id="myCenterModalLabel">반려</h4>
                <button id="ModalCloseBtn3" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
			<div class="modal-body">
<!-- 				<div class="form-group"> -->
					<textarea class="form-control apple3" id="modalRejCommentContent" rows="5" style="resize:none;" placeholder="반려사유를 등록해주세요(선택사항)"></textarea>
<!-- 				</div> -->
			</div>
			<div class='modal-footer'> 
                	<button type="button" class="btn btn-light apple4" data-dismiss="modal">닫기</button>
                	<button type="button" id="rejAppBtn" style="background-color:#5F7CBB" class="btn btn-primary apple4">반려</button>
           	</div>
		</div>
    </div>
</div>

<!-- 참조인 추가 모달 -->

<div class="modal fade" id="addRefModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title apple3" id="myCenterModalLabel">참조자 추가</h4>
                <button id="ModalCloseBtn3" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
			<div class="modal-body">
				<div class="form-group">
					<div class="form-group">
						<label for="simpleinput" class="apple3">직원 검색</label> 
						<input type="text" id="refInput" autocomplete="off" list ="memList" class="apple3 custom-select custom-select-sm" placeholder="직원 이름/사원번호를 검색해주세요">
						<datalist id="memList">
						</datalist>
					</div>
					<div class="apple3 row" id="addingList"></div>
					<div class="apple3 row" id="warning">
<!-- 						<p class="apple3 ml-3">이미 추가된 사원입니다</p> -->
<!-- 						<p>참조자는 최대 일곱명까지 가능합니다</p> -->
					</div>
				</div>
			</div>
			<div class='modal-footer'>
				<button type="button" class="btn btn-light apple4"
					data-dismiss="modal">취소</button>
				<button type="button" data-docCode="${doc.approvalDocCode }" id="addRefBtn" class="btn btn-primary apple4">확인</button>
			</div>
		</div>
    </div>
</div>


<!-- 첨부파일 추가 모달 -->

<div class="modal fade" id="addAttachModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content shadow-lg">
			<div class="modal-header">
				<h4 class="modal-title apple3" id="myCenterModalLabel">파일첨부</h4>
				<button id="ModalCloseBtn3" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div>
					<form class="dropzone" id="dropzone-file"
						enctype="multipart/form-data" method="POST">
						<div class="dz-message needsclick">
							Drop files here or click to upload <span class="note needsclick">(클릭
								또는 드래그&드랍으로 업로드할 수 있습니다.)</span>
						</div>
						<!--  당연하지만 multiple -->
						<div class="fallback">
							<input name="file" type="file" multiple>
						</div>
					</form>
				</div>
				<div id="list"></div>
				<button id="test" onclick="get()">test</button>
				<!-- 				<div class="dropzone" id="my-dropzone"></div> -->
				<button id="sss">Upload</button>
				
<script type="text/javascript">

// const addAttachModalId = document.querySelector("#addAttachModalId");	// 첨부파일 추가 버튼
// var docCode = addAttachModalId.dataset.doccode	// 첨부파일 해당 문서 번호

// 			Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
// // 			var dropzone = new Dropzone("div.dropzone", {
// 			var dropzone = new Dropzone(
// 					"#dropzone-file",
// 					{
// 						url : "/workfit/approval/req/upload",
// 						method : "post",
// 						dictResponseError : 'Error uploading file!',
// 						headers : {
// 							// 요청 보낼때 헤더 설정
// 							'X-CSRF-TOKEN' : $("#csrf_token").val()
// 						},
// 						addRemoveLinks : true, //업로드 후 삭제 버튼 
// 						autoProcessQueue : false, //파일 추가하자마자 서버로 전송할 것인가?(기본값 false로 진행)
// 						// 반드시 아래의 processQueue 메서드를 진행해주어야 실제 서버로 전송한다...
						
// 						clickable : true, // 클릭 가능 여부
// 						autoQueue : true, // 드래그 드랍 후 바로 서버로 전송
// 						createImageThumbnails : true, //파일 업로드 썸네일 생성 (css적인 측면이 있음.)
// 						thumbnailHeight : 120, // Upload icon size
// 						thumbnailWidth : 120, // Upload icon size
	
// 						maxFiles : 5, // 업로드 파일수
// 						maxFilesize : 100, // 최대업로드용량 : 100MB -> web.xml에서 multipart 부분도 수정해줘야한다.
// 						paramName : 'file', // 서버에서 사용할 formdata 이름 설정 (default는 file... img 등.)
// 						parallelUploads : 1, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
// 						uploadMultiple : false, // 다중업로드 기능
// 						timeout : 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
	
// 						addRemoveLinks : true, // 업로드 후 파일 삭제버튼 표시 여부
// 						dictRemoveFile : '삭제', // 삭제버튼 표시 텍스트
// 						//     acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', 
						
// 						init : function() {
// 							// 최초 dropzone 설정시 init을 통해 호출
// 							console.log('최초 실행');
// 							let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)
// 							console.log(myDropzone.getQueuedFiles());
// 							console.log(myDropzone.getUploadingFiles());
// 							// 서버에 제출 submit 버튼 이벤트 등록
// 							document.querySelector('#sss').addEventListener('click',
// 									function() {
// 												console.log('업로드');
// 												console.log(myDropzone.getAcceptedFiles());
// 												console.log(myDropzone.getQueuedFiles());
// 												console.log(myDropzone.getUploadingFiles());
// 												// 거부된 파일이 있다면
// 												if (myDropzone.getRejectedFiles().length > 0) {
// 													let files = myDropzone.getRejectedFiles();
// 													console.log('거부된 파일이 있습니다.',files);
// 													return;
// 												}
// 												myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
// 											});
	
// 							// 파일이 업로드되면 실행
// 							this.on('addedFile',function(file) {
// 								// 중복된 파일의 제거
// 								console.log('업로드?')
// 								if (this.files.length) {
// 									// -1 to exclude current file
// 									var hasFile = false;
// 									for (var i = 0; i < this.files.length - 1; i++) {
// 										if (this.files[i].name === file.name
// 												&& this.files[i].size === file.size
// 												&& this.files[i].lastModifiedDate
// 														.toString() === file.lastModifiedDate
// 														.toString()) {
// 											hasFile = true;
// 											this.removeFile(file);
// 										}
// 									}
// 									if (!hasFile) {
// 										addedFiles.push(file);
// 									}
// 										} else {
// 											addedFiles.push(file);
// 										}
// 									});
	
// 							// 업로드한 파일을 서버에 요청하는 동안 호출 실행
// 							this.on('sending', function(file, xhr, formData) {
// 								console.log('보내는중');
// // 								console.log(docCode);
// 							});
// 	//					     accept:function(file,done){
// 	//				         //validation을 여기서 설정하면 된다.
// 	//				         //설정이 끝나고 꼭 done()함수를 호출해야 서버로 전송한다. 
// 	//				         done(); 
// 	//				     },
// 	//				     init:function(){
// 	//				         this.on('success',function(file,responseText){
// 	//				             //서버로 파일이 전송되면 실행되는 함수이다.
// 	//				             //obj 객체를 확인해보면 서버에 전송된 후 response 값을 확인할 수 있다.
// 	//				         })
// 	//				     }
							
// 							// 서버로 파일이 성공적으로 전송되면 실행
// 							this.on('success', function(file, responseText) {
// 								console.log('성공');
// // 								var obj = JSON.parse(responseText);
// // 								console.log(responseText);
// 							});
// 							this.on("drop", function(e) {
// 								console.log("짜증나");
// 							});
// 							// 업로드 에러 처리
// 							this.on('error', function(file, errorMessage) {
// 								alert(errorMessage);
// 							});
							
// 						},
// 					});

			
</script>

			</div>
			<div class='modal-footer'>
				<button type="button" class="btn btn-light apple4"
					data-dismiss="modal">취소</button>
				<button type="button" data-docCode="${doc.approvalDocCode }"
					id="addAttachBtn" class="btn btn-primary apple4">확인</button>
			</div>
		</div>
	</div>
</div>
<style>


/* 페이징 */

.page-item.active .page-link{
	background-color: #5F7CBB;

}
.dataTables_filter{
	font-family: 'apple3';
}


#datatable-buttons > tbody > tr:hover {
       background-color: #e7ecf1;
       cursor: pointer;
   }
   

</style>





<script>

	const headTitle = $("#headTitle");
	const finalAppBtn = document.querySelector("#finalAppBtn");
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	var jsonData = {};	// 문서번호 + 참조자 배열 전달할 제이슨 객체
	var addingRefList = [];	// 참조자 아이디 넣을 배열
	var addingRefFullList = [];	// 참조자 이름(아이디)배열
	var memList = document.querySelector("#memList");		// 참조자 리스트 버튼
	var refInput = document.querySelector("#refInput");		// 참조자 입력 버튼
	const addRefBtn = document.querySelector("#addRefBtn");	// 참조자 추가 버튼
	const delRefBtn = document.querySelector("#delRefBtn");	// 참조자 삭제 버튼
	const warning = document.querySelector("#warning");		// 경고문구
	const appCheckedAll = document.querySelector("#appCheckedAll");		// 일괄승인버튼
	var appTdCheckedList = document.querySelectorAll(".appTdChecked");	// 체크박스 리스트
	var appCheckedAllList = [];	// 디비로 넘기기 위한 체크된 문서번호들
	const appThCheck = document.querySelector("#appThCheck");	// 일괄 '체크'박스
	
	// 카드 누르면 해당 페이지로 이동하는 함수
	function cardPush(fancyYjyJje){
		fancyYjyJje.click();
	}

	function appThCheckHandler(event){
		console.log(event);
		if(event.target.checked){
			for(item of appTdCheckedList){
				console.log("체크박스 리스트 체크 됐는지 여부 가져오기",item.checked);
				item.checked = true;
			}
		}else{
			for(item of appTdCheckedList){
				console.log("체크박스 리스트 체크 됐는지 여부 가져오기",item.checked);
				item.checked = false;
			}
			
		}
	}

	if(appThCheck){
		appThCheck.addEventListener("change",appThCheckHandler);
	}




	// 일괄 승인
	function appCheckedAllHandler(){
		console.log("일괄승인하려고?");
		console.log("체크박스 리스트",appTdCheckedList);
		
			
			for (let elem of appTdCheckedList) {
				console.log(elem.checked); 
				if(elem.checked == true){
					console.log("체크박스 문서번호",elem.dataset.doccode);
					appCheckedAllList.push(elem.dataset.doccode);
					console.log("체크된 문서번호들",appCheckedAllList);
				}
	  		} // 체크된 문서번호 넘기기 위한 배열 만들기 끝
	  		
				// 아작스로 승인처리 
				var xhr = new XMLHttpRequest();
				xhr.open("post","/workfit/approval/appCheckedAll",true);
				xhr.setRequestHeader('Content-Type', 'application/json');
				xhr.setRequestHeader(header, token);
				xhr.send(JSON.stringify(appCheckedAllList));
				xhr.onreadystatechange=()=>{
					if(xhr.status==200 && xhr.readyState == 4){
						var data = xhr.responseText;
						console.log(data);
						
						
						$("#reqAppDetailModal").hide();
						
						
						var backdrops = document.querySelectorAll(".modal-backdrop")
							for(var item of backdrops){
								item.remove();
							}
						
						toastr.success( '<h4 style="font-size:17px;" class="apple4">승인완료</h4>');
						
			            setTimeout(() => {
						        location.href="/workfit/approval/reception/requested";
			            	}, 1500)
					}
				}	// 아작스 끝
			
	}
	
	if(appCheckedAll){
		appCheckedAll.addEventListener("click", appCheckedAllHandler);
	}
	
	
	
	function closeModal(){
		$("#reqAppDetailModal").modal('hide');
		 location.href=location.href;
	}
	
	
	// 북마크
	const bookMarkTd = document.querySelector("#bookMarkTd");	// 북마크 표기될 td
	let bmBtns = document.querySelectorAll(".bmBtn");		// 북마크 버튼
	
	
	// 북마크에 추가하는 함수
	function chkBookmark(event){
		console.log("북마크에 추가하는 함수");
		// <button id="chkBMBtn" style="padding:0; background-color:inherit; border:none;"><i style="font-size:16px;" class="mdi mdi-star"></i></button>
		var starIcon = event.target; 
		var bmBtnFlag = event.target.dataset.bk;
		var docCode = event.target.dataset.doccode;
		if(bmBtnFlag == "0"){
			console.log(" 북마크하려고 하는구나!");
			console.log(event.target);
			console.log("문서번호",event.target.dataset.doccode);
			// console.log("북마크 체크 이전",bmBtnFlag);
			starIcon.classList.remove("mdi-star-outline");
			starIcon.classList.add("mdi-star");
			event.target.dataset.bk = "1";
			console.log("북마크 체크 이후",event.target.dataset.bk);
			console.log("북마크 체크 이후에 값 ",event.target);
			
			// 아작스로 디비 북마크 테이블에 값 추가
			var xhr = new XMLHttpRequest();
			xhr.open("GET","/workfit/approval/insertBookMark?docCode="+docCode,true);
			xhr.setRequestHeader(header, token);
			xhr.send();
			xhr.onreadystatechange=()=>{
				if(xhr.status==200 && xhr.readyState == 4){
					var data = xhr.responseText;
					console.log(data);
				}
			}
			
			
			
		}else{
			console.log(" 북마크 취소하려고 하는구나!");
			console.log(event.target);
			console.log("북마크 취소 이전",event.target.dataset.bk);
			event.target.classList.remove("mdi-star");
			event.target.classList.add("mdi-star-outline");
			event.target.dataset.bk = "0";
			console.log("북마크 취소 이후",event.target.dataset.bk);
			
			
			// 아작스로 디비 북마크 테이블에 값 삭제
			var xhr = new XMLHttpRequest();
			xhr.open("GET","/workfit/approval/deleteBookMark?docCode="+docCode,true);
			xhr.setRequestHeader(header, token);
			xhr.send();
			xhr.onreadystatechange=()=>{
				if(xhr.status==200 && xhr.readyState == 4){
					var data = xhr.responseText;
					console.log(data);
				}
			}
			
			
			
			
			
		}
	}
	
	
	// 전자결재 상세보기
	function showdetail(pthis) {

// 		var DocCode = pthis.children[2].innerHTML;
// 		console.log("디테일 확인 용 문서코드 ", DocCode);
		console.log("디테일 확인 용 문서코드 ", pthis);
		console.log("디테일 확인 용 상태 값 ", "${status}");
		$(".approvalDetail").load(
				"/workfit/approval/details/" + pthis + "/${status}",null,()=>{
					bmBtns = document.querySelectorAll(".bmBtn");
					bmBtns.forEach((bmBtn) => {bmBtn.addEventListener('click', chkBookmark)});
				});
		$("#detailModalBtn").click();
	}
	
	
	
	
	bmBtns.forEach((bmBtn) => {bmBtn.addEventListener('click', chkBookmark)});
	

	// 참조인 DB저장
	addRefBtn.onclick=(event)=>{
		console.log(event)
		console.log("이건 나오나 참조인 추가 a태그",addRef)
		console.log("제발 나와줘 문서번호!",addRef.dataset.doccode)
		console.log(JSON.stringify(addingRefList));
		jsonData.docCode = addRef.dataset.doccode
		jsonData.addingRefList = addingRefList
		console.log(jsonData);
		
		// 참조인 리스트 비우기
		addingList.innerHTML = "";
		// 혹시 모를 알람 비우기
		warning.innerHTML = "";
		// 모달 끄기
		 $('#addRefModal').modal('hide');
		
		// 아작스로 보내기 
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/workfit/approval/addAppvRefMem",true);
		xhr.setRequestHeader('Content-Type', 'application/json');
		xhr.setRequestHeader(header, token);		
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var data =  xhr.response;
				console.log(data);
// 				alert(data);
				for(let mem of addingRefFullList){
					var refMemDiv = document.createElement("div");
					refMemDiv.classList.add("apple2","ml-3","mr-2");
					refMemDiv.innerText = mem;
					addRefListDiv.appendChild(refMemDiv);
					console.log("참조인 DB저장 후 div append : ",mem);
				}
				addingRefFullList = [];
				refInput.value="";
			}
		}
		xhr.send(JSON.stringify(jsonData));
	}
	
	
	

	
	// 참조인 삭제
	function delRef(event){
		var delP = event.target.parentElement;
		console.log("삭제 클릭 이벤트",delP);
		console.log("삭제 클릭 아이디",delP.id);
		
		addingRefList = addingRefList.filter((item)=> item != delP.id)
		console.log("삭제 배열",addingRefList);
		delP.remove();
// 	    const li = event.target.parentElement;
// 	    List = List.filter((item)=>li.id != item.id);
// 	    li.remove();
	}
	
	
	// 참조인 추가
	refInput.onchange=(event)=>{
// 		console.log(event);
		console.log("선택된 사원",refInput.value.substr(0,refInput.value.indexOf("(")));
		console.log(refInput.value);
		addingRefFullList.push(refInput.value);
		var nameValue = refInput.value.substr(0,refInput.value.indexOf("("))
		var idValue = refInput.value.substring(refInput.value.indexOf("(")+1,refInput.value.length-1);
		console.log("선택된 사원 아이디",idValue);
// 		중복값 체크
//		값이 있으면 경고문구 띄우기
		if(addingRefList.includes(idValue)){
			warning.innerHTML = `<p class="apple3 ml-3">이미 추가된 사원입니다</p>`;
		}else{
			warning.innerHTML="";
	//		배열에 넣기
			addingRefList.push(idValue);
	// 		p태그 만들기
			var temp = document.createElement("p");
			temp.classList.add("text-muted"); 
			temp.classList.add("apple3"); 
			temp.classList.add("ml-3");
			temp.setAttribute("id",idValue)
			//		삭제 버튼 만들기
			temp.innerHTML = nameValue;
			var delbtn = document.createElement("button");
			delbtn.setAttribute("id","delRefBtn");
			delbtn.setAttribute("type","button");
			delbtn.classList.add("close");
			delbtn.setAttribute("value","X");
			delbtn.innerText="x";
			delbtn.addEventListener("click",delRef)
			temp.append(delbtn);
			
			// console.log("버튼",delbtn);
			console.log("p태그",temp)
			console.log("참조인 배열",addingRefList)
			
			// addingList에 넣기 
			addingList.append(temp)
			
		}
	}
	

	// 사원 리스트 출력 함수
	function showAddAppReqList(){
		console.log("사원 리스트 출력 (참조자 선택) 문서번호",addRef.dataset.doccode)
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/workfit/approval/getAppvRefMem?docCode="+addRef.dataset.doccode);
		xhr.responseType='json'
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				//alert("안녕");
				var data =  xhr.response;
				console.log(data)
// 				console.log(memList[0])
				var opStr =  "";
				for(mem of data){
					opStr += "<option data-selectedId='"+mem.memId+"' value='"+mem.memName
					opStr += " ("+mem.memId+ ")'>"
					opStr += "</option>"
				}
// 				console.log(opStr)
				memList.innerHTML = opStr;
				
			}

		}
		xhr.send();		
	}
	
	
	// 사원 리스트 출력 (참조자 선택)
	refInput.onfocus=()=>showAddAppReqList();

	// 승인
	finalAppBtn.onclick=()=>{
		console.log("승인 버튼 눌림!",commentDocCode);
		
	    var comment={
	        docCode:commentDocCode,
	        content:$("#modalCommentContent").val(),
	        id:"${memId}"
	    }
	    
	    $.ajax({
	        type:"post",
	        url:"/workfit/approval/appApproval",
	        data:JSON.stringify(comment),    // 편지 봉투 안에 json 형식에 맞는 문자열을 보내겠다 알아서 해석하걸아
	        contentType:"application/json; charset=utf-8",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
	        dataType:"text",
	        success:function(rslt){
	            console.log("결과..................! : " + rslt)
				
	            $("#modalCommentContent").val("");
				$("#reqAppDetailModalComment").hide();
				$("#reqAppDetailModal").hide();
				
				
				var backdrops = document.querySelectorAll(".modal-backdrop")
					for(var item of backdrops){
						item.remove();
					}
				
				toastr.success( '<h4 style="font-size:17px;" class="apple4">승인완료</h4>');
				
	            setTimeout(() => {
				        location.href="/workfit/approval/reception/requested";
	            	}, 1500)
			    
	        }
	    })	
	
	
	}	

	rejAppBtn.onclick=()=>{
			console.log("반려 버튼 눌림!",commentDocCode);
		

		
			
		
	    var comment={
	        docCode:commentDocCode,
	        content:$("#modalRejCommentContent").val(),
	        id:"${memId}"
	    }
		
	    $.ajax({
	        type:"post",
	        url:"/workfit/approval/appReject",
	        data:JSON.stringify(comment),    // 편지 봉투 안에 json 형식에 맞는 문자열을 보내겠다 알아서 해석하걸아
	        contentType:"application/json; charset=utf-8",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
	        dataType:"text",
	        success:function(rslt){
	            console.log("결과..................! : " + rslt)
	            
	            
				
	            $("#modalRejCommentContent").val("");
	            
				$("#reqAppDetailModalRejComment").hide();
				$("#reqAppDetailModal").hide();
				
				
				var backdrops = document.querySelectorAll(".modal-backdrop")
					for(var item of backdrops){
						item.remove();
					}
	            
			    
				toastr.error( '<h4 style="font-size:17px;" class="apple4">반려완료</h4>');
				
	            setTimeout(() => {
			        location.href="/workfit/approval/reception/requested";
            	}, 1500)
				
			    
	        }
	    })	
	}
	
	
	
		
	$(function(){
		
			// 데이터 테이블 
			$.fn.dataTable.ext.errMode = 'none';
			$("#example").dataTable().fnDestroy();
			var lang_kor = {
				"search" : "검색 : ",
		        "paginate" : {
		            "first" : "첫 페이지",
		            "last" : "마지막 페이지",
		            "next" : "<i class='dripicons-chevron-right'></i>",
		            "previous" : "<i class='dripicons-chevron-left'></i>"
		        },
			};
			
			
			
			$('#datatable-buttons').DataTable({
				destroy : false,
				info : false,
				lengthChange : false,
				language : lang_kor
			});
			
			$('.dataTables_paginate').addClass('pagination-rounded');

		
		
	
			var alarmDocCode = '${alarmDocCode}';
			
				console.log('알람코드 확인1'+alarmDocCode);
			if(alarmDocCode == ''){
				console.log('알람코드 확인'+alarmDocCode);
			}
			
			if(alarmDocCode != ''){ 
				console.log('알람코드 확인(if문 안)'+alarmDocCode);
				showdetail(alarmDocCode);
				
			}
			
			$('#reqAppDetailModalComment').on('show.bs.modal', function (event) {
				$('.modal-backdrop').last().css("z-index", "1500");	
			})
			
			$('#reqAppDetailModalRejComment').on('show.bs.modal', function (event) {
				$('.modal-backdrop').last().css("z-index", "1500");	
			})
			
			
			
		});
	
// 	var byhelement = [...$("td")].find((ele) => {
// 		return $(ele).text() == 'TEST26'
// 	})
	
// 	console.log(byhelement);
// 	byhelement.click;
// 	$("#detailModalBtn").click();
// 		$(".approvalDetail").load(
// 				"/workfit/approval/details/" + "TEST26" + "/${status}",null,()=>{
// 					bmBtns = document.querySelectorAll(".bmBtn");
// 					bmBtns.forEach((bmBtn) => {bmBtn.addEventListener('click', chkBookmark)});
// 				});

	
</script>