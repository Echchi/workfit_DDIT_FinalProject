<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
</style>
<!-- Modal Head (화면 닫기용 X버튼) -->
<div class="modal-header">
    <h5 class="modal-title" id="historyModalLabel">파일 업로드</h5>
    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>
</div>

<input type="hidden" id="insertStatus" value="${docType }" />
<input type="hidden" id="csrf_token" name="${_csrf.parameterName}" value="${_csrf.token}" />

<!-- Modal Part -->
<div class="modal-body">
	<div>
		<form class="dropzone" id="dropzone-file" enctype="multipart/form-data" method="POST">
			<div class="dz-message needsclick">
				Drop files here or click to upload 
				<span class="note needsclick">(클릭 또는 드래그&드랍으로 업로드할 수 있습니다.)</span>
			</div>
			<!--  당연하지만 multiple -->
			<div class="fallback">
				<input name="file" type="file" multiple>	
			</div>
		</form>
	</div>
	<div id="list">	</div>
<!-- 		<button id="test" class="btn btn-success">test</button> -->
	<div class="modal-footer">
	<button id="sss" class="apple5 ml-3 mr-1 pl-3 pr-3 pt-1 pb-1 workfitBtn">업로드</button>
    <button class="apple5 ml-3 mr-1 pl-3 pr-3 pt-1 pb-1 workfitBtn" style="background: black;" type="button" data-dismiss="modal">닫기</button>
</div>

<script type="text/javascript">
		Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
		var insertStatus = document.querySelector('#insertStatus').value;
		$(function(){
// 		var test = $('#test');
		var dropzone = null;
			
		if(insertStatus == 'deptDoc'){
// 			alert('deptDoc Upload!');
			dropzone = new Dropzone("#dropzone-file",
					{
				url : "/workfit/document/uploadDept",
				method : "post",
				dictResponseError : 'Error uploading file!',
				dictDefaultMessage : '기본 파일 문구입니다.',
				dictCancelUpload : '업로드 취소했습니다.',
				dictCancelUploadConfirmation : '정말 취소하시겠습니까?',
				dictRemoveFile : '파일 삭제했습니다.',
				dictRemoveFileConfirmation: null,
				dictFileTooBig : '파일이 너무 큽니다. ',
				params:{
					"docCode" : docCode,
					"docType" : "deptDoc",
				},
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
				maxFilesize : 1000, // 최대업로드용량 : 100MB -> web.xml에서 multipart 부분도 수정해줘야한다.
				paramName : 'file', // 서버에서 사용할 formdata 이름 설정 (default는 file... img 등.)
				parallelUploads : 5, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
				uploadMultiple : false, // 다중업로드 기능
				timeout : 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자

				addRemoveLinks : true, // 업로드 후 파일 삭제버튼 표시 여부
				dictRemoveFile : '삭제', // 삭제버튼 표시 텍스트
				//     acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', 
				
				init : function() {
					// 최초 dropzone 설정시 init을 통해 호출
					console.log('최초 실행');
					console.log("문서 드롭존");
// 					console.log("test : " ,test);
					let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)
					console.log("Accept된 파일 :",myDropzone.getAcceptedFiles());
					// 서버에 제출 submit 버튼 이벤트 등록
// 					document.querySelector('#test').addEventListener('click',function(file){
// 						console.log("remove된 파일 :",myDropzone.removeFile(file));
// 					});
					document.querySelector('#sss').addEventListener('click',function(e) {
						console.log(e.file);
						console.log('업로드');
						console.log("queue된 파일 :",myDropzone.getQueuedFiles());
						console.log(myDropzone.getUploadingFiles());
						console.log("e :", e);
						// 거부된 파일이 있다면
						if (myDropzone.getRejectedFiles().length > 0) {
							alert('거부된 파일 O');
							let files = myDropzone.getRejectedFiles();
							console.log('거부된 파일이 있습니다.',files);
							return;
						}
						myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
					});

						// 파일이 업로드되면 실행
					this.on('addedFile',function(files) {
						// 중복된 파일의 제거
						console.log('업로드 과해...');
						console.log(files);
						if (this.files.length) {
							// -1 to exclude current file
							var hasFile = false;
							for (var i = 0; i < this.files.length - 1; i++) {
								if (this.files[i].name === file.name && this.files[i].size === file.size
									&& this.files[i].lastModifiedDate.toString() === file.lastModifiedDate.toString()) {
									hasFile = true;
									this.removeFile(file);
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
						console.log('file :',file);
						console.log('formData :',formData);
					});
						//					     accept:function(file,done){
						//				         //validation을 여기서 설정하면 된다.
						//				         //설정이 끝나고 꼭 done()함수를 호출해야 서버로 전송한다. 
						//				         done(); 
						//				     },

						// 서버로 파일이 성공적으로 전송되면 실행
						this.on('success', function(file, responseText) {
							console.log('성공');
							console.log("file :",file);
							var ob = responseText;	// JSON으로 파일 정보가 반환됨.
							var obj = JSON.stringify(ob);
							console.log(ob);
							console.log(obj);
							console.log("responseText :",responseText);
							// 							var obj = JSON.parse(responseText);
							// 							console.log(obj);
							for(key in responseText){
								console.log(responseText[key]);
							}
						});
						this.on('complete',function(file){
							toastr.success( '<h4 style="font-size:17px;" class="apple4">업로드 완료</h4>');
							console.log('완료...!');
							this.removeFile(file);
						})
						this.on('queuecomplete',function(e){
							console.log("큐 완료..!");
//								window.location.href="./";
						})
						this.on("drop", function(e) {
							console.log("짜증나");
							console.log("e :",e);
						});
						// 업로드 에러 처리
						this.on('error', function(file, errorMessage) {
							console.log(file);
							console.log(errorMessage);
//								alert(errorMessage);
						});

					},
				});
		}else{
// 			alert('myDoc Upload!');
			dropzone = new Dropzone("#dropzone-file",
					{
				url : "/workfit/document/upload",
				method : "post",
				dictResponseError : 'Error uploading file!',
				dictDefaultMessage : '기본 파일 문구입니다.',
				dictCancelUpload : '업로드 취소했습니다.',
				dictCancelUploadConfirmation : '정말 취소하시겠습니까?',
				dictFileTooBig : '파일이 너무 큽니다. ',
			 	addRemoveLinks: true,						// 삭제 확인 창 Alert 로 설정.
				dictRemoveFile : '파일 삭제했습니다.',		// 문구 확인.
				dictRemoveFileConfirmation: '삭제하시겠습니까?',
				params:{
					"docCode" : docCode,
					"docType" : "myDoc",
				},
				headers : {
					// 요청 보낼때 헤더 설정
					'X-CSRF-TOKEN' : $("#csrf_token").val()
				},
				autoProcessQueue : false, //파일 추가하자마자 서버로 전송할 것인가?(기본값 false로 진행)
				// 반드시 아래의 processQueue 메서드를 진행해주어야 실제 서버로 전송한다...
				
				clickable : true, // 클릭 가능 여부
				autoQueue : true, // 드래그 드랍 후 바로 서버로 전송
				createImageThumbnails : true, //파일 업로드 썸네일 생성 (css적인 측면이 있음.)
				thumbnailHeight : 120, // Upload icon size
				thumbnailWidth : 120, // Upload icon size

				maxFiles : 5, // 업로드 파일수
				maxFilesize : 1000, // 최대업로드용량 : 100MB -> web.xml에서 multipart 부분도 수정해줘야한다.
				paramName : 'file', // 서버에서 사용할 formdata 이름 설정 (default는 file... img 등.)
				parallelUploads : 5, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
				uploadMultiple : false, // 다중업로드 기능
				timeout : 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자

				addRemoveLinks : true, // 업로드 후 파일 삭제버튼 표시 여부
				dictRemoveFile : '삭제', // 삭제버튼 표시 텍스트
				//     acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', 
				
				init : function() {
					// 최초 dropzone 설정시 init을 통해 호출
					console.log('최초 실행');
					console.log("문서 드롭존");
// 					console.log("test : " ,test);
					let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)
					console.log("Accept된 파일 :",myDropzone.getAcceptedFiles());
					// 서버에 제출 submit 버튼 이벤트 등록
// 					document.querySelector('#test').addEventListener('click',function(file){
// 						console.log("remove된 파일 :",myDropzone.removeFile(file));
// 					});
					document.querySelector('#sss').addEventListener('click',function(e) {
						console.log(e.file);
						console.log('업로드');
						console.log("queue된 파일 :",myDropzone.getQueuedFiles());
						console.log(myDropzone.getUploadingFiles());
						console.log("e :", e);
						// 거부된 파일이 있다면
						if (myDropzone.getRejectedFiles().length > 0) {
							alert('거부된 파일 O');
							let files = myDropzone.getRejectedFiles();
							console.log('거부된 파일이 있습니다.',files);
							return;
						}
						myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
					});

						// 파일이 업로드되면 실행
					this.on('addedFile',function(files) {
						// 중복된 파일의 제거
						console.log('업로드 과해...');
						console.log(files);
						if (this.files.length) {
							// -1 to exclude current file
							var hasFile = false;
							for (var i = 0; i < this.files.length - 1; i++) {
								if (this.files[i].name === file.name && this.files[i].size === file.size
									&& this.files[i].lastModifiedDate.toString() === file.lastModifiedDate.toString()) {
									hasFile = true;
									this.removeFile(file);
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
						console.log('file :',file);
						console.log('formData :',formData);
					});
						//					     accept:function(file,done){
						//				         //validation을 여기서 설정하면 된다.
						//				         //설정이 끝나고 꼭 done()함수를 호출해야 서버로 전송한다. 
						//				         done(); 
						//				     },

						// 서버로 파일이 성공적으로 전송되면 실행
						this.on('success', function(file, responseText) {
							console.log('성공');
							console.log("file :",file);
							var ob = responseText;	// JSON으로 파일 정보가 반환됨.
							var obj = JSON.stringify(ob);
							console.log(ob);
							console.log(obj);
							console.log("responseText :",responseText);
							// 							var obj = JSON.parse(responseText);
							// 							console.log(obj);
							for(key in responseText){
								console.log(responseText[key]);
							}
						});
						this.on('complete',function(file){
							console.log('완료...!');
							toastr.success( '<h4 style="font-size:17px;" class="apple4">업로드 완료</h4>');
							this.removeFile(file);
						})
						this.on('queuecomplete',function(e){
							console.log("큐 완료..!");
//								window.location.href="./";
							myDocList();
							coDiskSize();
						})
						this.on("drop", function(e) {
							console.log("짜증나");
							console.log("e :",e);
						});
						// 업로드 에러 처리
						this.on('error', function(file, errorMessage) {
							console.log(file);
							console.log(errorMessage);
//								alert(errorMessage);
						});

					},
				});
		}
		});
	</script>