<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet"	href="${pageContext.request.contextPath }/resources/Puppertino/dist/css/newfull.css" />
<style>
.note-editor.note-frame{
    border: 2px dashed #dee2e6;
}
</style>
<!-- 데이터 확인용  -->
<%-- <c:set value="postVO" var="postVO"/> --%>
<c:set value="Submit" var="name" />
<c:if test="${status eq 'modi' }">
	<c:set value="Edit" var="name" />
</c:if>
<div class="p-shadow-2">
<!-- Form Start -->
<form id="insertForm" method="post"	action="/workfit/board/freeBoard/insert"  enctype="multipart/form-data" class="dropzone" style="border: 2px none #dee2e6" id="myAwesomeDropzone">
	
	<sec:csrfInput />
	<input type="hidden" id="csrf_token" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="memId" value="${memId}" /> 
	<input type="hidden" name="boardCode" value="${Cd}" /> 
	<input type="hidden" id="test" name="postPopup" value='y'/>
	<input type="hidden" name="postCode" value="${postVO.postCode}" />
	<input type="hidden" id="success" name="success" value="${success }" />
	<c:if test="${status eq 'modi' }">
<%-- 		<input type="hidden" name="postCode" value="${postVO.postCode}" /> --%>
	</c:if>
	
	<div class="form-row">
		<div class="form-group col-md-9">
			<input type="text" class="form-control" style="border-left-style: none; border-top-style: none; border-right-style: none;" name="postTitle" id="simpleinput" placeholder="Title" value="${postVO.postTitle}"}>
		</div>
		<br />
		<div class="form-group col-md-3">
			<div>
				<!-- Bool Switch-->

<!-- 					<label class="p-form-switch"> -->
<!-- 					 <input type="checkbox" id="switch1" />  -->
<!-- 					 <span></span> -->
<!-- 					</label>  -->
					<input type="checkbox" id="switch1" checked data-switch="bool" /> 
				<label for="switch1" data-on-label="팝업 O" data-off-label="팝업 X"></label>
<!-- 									<label for="switch1" data-on-label="On" data-off-label="Off"></label> -->
				<button type="button" id="formBtn" class="btn btn-primary"	value="${name }">${name }</button>
			</div>
		</div>
	</div>
	<textarea id="summernote" rows="30" cols="30" name="postContent">${postVO.postContent }</textarea>
	<br/>
	<c:if test="${status eq 'modi' }">
		<div class="card-footer bg-white">
			<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
				<c:if test="${not empty postVO.boardAttachs }">
<%-- 					<input type="hidden" name="boardAttachs" value="${postVO.boardAttachs }"/> --%>
					<c:forEach items="${postVO.boardAttachs }" var="boardAttach" varStatus="vs">
						<li><span class="mailbox-attachment-icon"> 
						</span>
							<div class="mailbox-attachment-info">
<!-- 								<a href="#" class="mailbox-attachment-name"> -->
									${boardAttach.boardAttachCode }
									${boardAttach.boardAttachName }
								<span>${boardAttach.boardAttachSize } KB</span> 
									<c:url value="/freeBoard/get" var="downloadUrl">
									<c:param name="fileNo" value="${boardAttach.postCode }" />
									</c:url> <a href="${downloadUrl }/"+${boardAttach.boardAttachCode }	class="btn btn-default btn-sm float-right"> 
									<i	class="fas fa-download"></i>
								</a>
								</span>
							</div></li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</c:if>
	<span> 첨부 파일 </span>
<!-- 	<div class="dropzone" id="myAwesomeDropzone"></div> -->
	<div class="dz-message needsclick"
		data-upload-preview-template="#uploadPreviewTemplate">
		<i class="h1 text-muted dripicons-cloud-upload"></i>
		<h3>첨부할 파일을 올려주세요</h3>
		<span class="text-muted font-13">(파일은 <strong>최대 5개</strong>까지 올리실 수 있습니다)</span>
	</div>
	<!-- Preview -->
	<div class="dropzone-previews mt-3" id="file-previews"></div>

	<!-- File Upload -->
	<div class="fallback">
		<!-- 추가 파일 네임 -->
		<input type="file" name="poFile" multiple />
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
</form>
<div>


<%-- <button type="button" id="formBtn" class="btn btn-primary"	value="${name }">${name }</button> --%>



<script>
Dropzone.autoDiscover = false;
$(function() {
    // var formBtn = $("#formBtn");
   	CKEDITOR.replace('summernote');
   	
    var formBtn = document.querySelector("#formBtn");
    var upload = $("#upload");
    var txttest = $("#txttest");
	var successValue = $("#success").val;
	var sw = $('#switch1').val;
// 	var sw = $('#switch1').is(':checked');
	var test = $('#test');
	
		var dropzone = new Dropzone(
				"form.dropzone",
				{
					//     	url : "/workfit/board/freeBoard/insert",
					//     	method : "post",
					//     	dictResponseError : 'Error uploading file!',
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
						$('#switch1').change(function(e) {
							console.log(e.target.checked);
							if (e.target.checked == true) {
								console.log("아아아");
								test.val('y');
							}
							if (e.target.checked == false) {
								console.log("노노노노");
								test.val('n');
							}
							console.log(document.querySelector('#test'));
						})

						document
								.querySelector("#formBtn")
								.addEventListener(
										"click",
										function(e, file) {
											e.preventDefault();
											e.stopPropagation();
											if (myDropzone.getQueuedFiles().length > 0) {
												alert("파일 이 드러왔따...!"
														+ myDropzone
																.getQueuedFiles().length);
												myDropzone.processQueue();
												$("#formBtn").submit();
												return;
											}
											alert('그냥 일반 입력이닷!');
											$("#insertForm").submit();
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

						this
								.on(
										'addedFile',
										function(files) {
											// 중복된 파일의 제거
											console.log('업로드?', this);
											console.log('업로드?', file);
											alert(JSON.stringify(file));

											if (this.files.length) {
												// -1 to exclude current file
												var hasFile = false;
												for (var i = 0; i < this.files.length - 1; i++) {
													if (this.files[i].name === file.name
															&& this.files[i].size === file.size
															&& this.files[i].lastModifiedDate
																	.toString() === file.lastModifiedDate
																	.toString()) {
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
							location.href = "./";
						});
						this.on('success', function(file, responseText) {
							console.log('성공');

							// 				console.log("responseText",responseText);
							// 				console.log("responseText.success",responseText.success);
							// 				console.log("responseText.response",responseText.response);
							// 				var success = responseText.success;
							if (success == "success") {
								console.log("첨부 성공");
								location.href = "/workfit/board/notice";
								successValue.val('success');
							}
							// 					console.log("successs값",successValue.val);
							var cnt = 0;

							// 				txttest.html("성공해싸다다다핟하닫핟핟ㅎㄷ");
							// 				let str = '';
							// 				str += responseText[0].boardAttachCode;
							// 				str += `이건 테스트인것이다.\${responseText[0].boardAttachName}이다`;

							// 				txttest.html(str);
							// 				var obj = JSON.parse(responseText);
							// 				console.log(obj);
						});
						this.on("drop", function(e) {
							console.log("짜증나");
						});
						// 업로드 에러 처리
						this.on('error', function(file, errorMessage) {
							alert(errorMessage);
						});

						this.on("successmultiple", function(files,
								serverResponse) {
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
		
		
		
// 		$('#summernote').summernote({
// 			height : 300, // set editor height
// 			minHeight : null, // set minimum height of editor
// 			maxHeight : null, // set maximum height of editor
// 			focus : true
// 		});
		function showInformationDialog(files, objectArray) {

			var responseContent = "";

			for (var i = 0; i < objectArray.length; i++) {

				var infoObject = objectArray[i];

				for ( var infoKey in infoObject) {
					if (infoObject.hasOwnProperty(infoKey)) {
						responseContent = responseContent + " " + infoKey
								+ " -> " + infoObject[infoKey] + "<br>";
					}
				}
				responseContent = responseContent + "<hr>";
			}

		}

		// 	console.log(formBtn.value);
		if (formBtn.value == "Edit") {
			console.log($(this).val());
// 			alert('들어왔다.');
			console.log($("#insertForm"));
			$("#insertForm").attr("action", "/workfit/board/freeBoard/modify");
		}

// 		toggleMainPopup();
	});
</script>