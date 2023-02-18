<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.workfitNavBg{
	border-radius:0.85rem; 
	background-color:rgba(255,255,255,0.75) !important;

}

</style>

<!--- Sidemenu -->
		<!-- -----------------------전자결재 Sidebar----------------------------- -->
		<c:if test="${menu eq 'approval' }">
			<div class="left-side-menu left-side-menu-detached mt-2 workfitNavBg" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
			<ul class="metismenu side-nav mm-show" style="margin: 0px;">
			<li class="side-nav-item ml-4 mt-4">
				<button type="button" class="btn apple6"  
					style="width:145px; margin-top : 25px; margin-left: 23px; background-color: #5F7CBB; font-size : 20px; color: white;">기안</button>
			</li>
			<li class="side-nav-item ml-4 mt-2">
				<a href="javascript: void(0);" class="side-nav-link mt-0" aria-expanded="false">
					<span class="menu-arrow"></span> 
					<span class="apple6 text-dark" style="font-size: 20px"> 나의 상신함 </span>
				</a>
				<ul style="marin-left: 75px;" class="side-nav-second-level mm-collapse" aria-expanded="false">
					<li><a href="/workfit/approval/report" class="apple5" style="font-size: 18px;" id="requestedBtn">상신완료 </a></li>
					<li><a href="/workfit/approval/reception/canceled" class="apple5" style="font-size: 18px;" id="canceledBtn">결재취소</a></li>
				</ul>
			</li>
			<li class="side-nav-item ml-4">
				<a href="javascript: void(0);" class="side-nav-link mt-0">
					<span class="countAppv badge badge-info badge-pill float-right" style="background-color: #5F7CBB; font-size: 13.5px;"></span> 
					<span class="apple6 text-dark" style="font-size: 20px">나의 수신함</span>
				</a>
				<ul style="marin-left: 75px;" class="side-nav-second-level mm-collapse" aria-expanded="false">
					<li><a href="/workfit/approval/reception/requested" class="apple5" style="font-size: 18px;" id="requestedBtn">결재대기<span class="countAppv badge badge-info badge-pill float-right" style="background-color: #5F7CBB"></span> </a></li>
					<li><a href="/workfit/approval/reception/processing" class="apple5" style="font-size: 18px;" id="processingBtn">결재진행</a></li>
					<li><a href="/workfit/approval/reception/processed" class="apple5" style="font-size: 18px;" id="processedBtn">결재완료</a></li>
					<li><a href="/workfit/approval/reception/reference" class="apple5" style="font-size: 18px;" id="referenceBtn">결재참조</a></li>
				</ul>
			</li>

			<li class="side-nav-item ml-4">
				<a href="/workfit/approval/bookmark" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 중요문서함 </span></a>
			</li>
			<li class="side-nav-item ml-4">
				<a href="/workfit/approval/tempList" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 임시저장함 </span></a>
			</li>
<!-- 			<li class="side-nav-item ml-4"> -->
<!-- 				<a href="#" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 삭제함 </span></a> -->
<!-- 			</li> -->
<!-- 			<li class="side-nav-item ml-4"> -->
<!-- 				<a href="javascript: void(0);" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 환경설정 </span> <span class="menu-arrow"></span></a> -->
<!-- 				<ul class="side-nav-second-level mm-collapse" aria-expanded="false"> -->
<!-- 					<li><a href="#" class="apple5" style="font-size: 15px;">나의 서명</a></li> -->
<!-- 					<li><a href="#" class="apple5" style="font-size: 15px;">위임 설정</a></li> -->
<!-- 				</ul> -->
<!-- 			</li> -->
			</ul>
		</div>
		</c:if>
<!-- End Sidebar -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$(function(){
	var countAppv = document.querySelectorAll(".countAppv");
		
	if(countAppv){
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/workfit/approval/getCountAppv", true);
		xhr.setRequestHeader(header,token);
		xhr.send();
		xhr.onreadystatechange =()=>{
			if(xhr.status == 200 && xhr.readyState == 4){
					let res = xhr.responseText
					console.log("결재할 것", res)
					for(var item of countAppv){
						item.innerText = res;
					}
				}
			}
	}
})


</script>
		<!-- -----------------------mypage Sidebar----------------------------- -->
		<c:if test="${menu eq 'mypage' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
				<li class="side-nav-item ml-4 mt-4">
					<a href="/workfit/mypage/main" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 마이페이지 </span></a>
				</li>
				<li class="side-nav-item ml-4">
					<a href="/workfit/mypage/commute" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 출/퇴근 현황 </span></a>
				</li>
				<li class="side-nav-item ml-4">
					<a href="javascript: void(0);" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 근태관리 </span> <span class="menu-arrow"></span></a>
					<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
						<li><a href="/workfit/mypage/vacation" class="apple5" style="font-size: 15px;">나의 휴가</a></li>
						<li><a href="/workfit/mypage/businessTrip" class="apple5" style="font-size: 15px;">출장 신청</a></li>
						<li><a href="/workfit/mypage/btApprove" class="apple5" style="font-size: 15px;">출장 신청 승인</a></li>
					</ul>
				</li>
				<li class="side-nav-item ml-4">
					<a href="javascript: void(0);" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 증명서 발급 </span> <span class="menu-arrow"></span></a>
					<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
						<li><a href="#" class="apple5" style="font-size: 15px;">나의 서명</a></li>
						<li><a href="#" class="apple5" style="font-size: 15px;">위임 설정</a></li>
					</ul>
				</li>
				</ul>
			</div>
		</c:if>
		
		<!-- -----------------------document Sidebar----------------------------- -->
		<c:if test="${menu eq 'doc' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					
					<li class="side-nav-item ml-4 mt-4 ">
						<button type="button" class="btn" data-toggle="modal" data-target="#full-width-modal" id="uploadModalBtn" 
							style="margin : 25px 25px 25px 20px; background-color: #5F7CBB; font-size : 18px; color: white; width: 145px;"> 파일 업로드 </button>
					</li>

					<li class="side-nav-item ml-4">
						<a href="javascript:myDocList()" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> My 클라우드 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="javascript:deptDocList()" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 부서 클라우드 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="javascript:publicDocList()" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 공용 클라우드 </span></a>
					</li>
					<li>
					</li>
				</ul>
				
				<!-- ------------ 문서관리 내용물 ~~~~~~ -->
				<div class="col-12" style="padding: 20px; font-size: 17px;">
					<div class="card" style=" border-radius: 0.85rem;">
						<div class="card-body text-dark" >				
							<!--  파일 종류 시작 !  -->
							<div class="ml-1 mr-1">
								<div class="d-flex align-items-center pr-1 pl-1" >
									<div class="fm-file-box bg-light-primary text-primary">
										<i class="bx bx-image"></i>
									</div>
									<div class="flex-grow-1 ms-2">
										<h4 class="apple5">이미지</h4>
										<h4 class="apple3" id="imgTotal">0 개</h4>
									</div>
									<div class="flex-grow-2">
										<h6 class="apple5" id="imgTotalSize" style="font-size: 15px;">파일 없음</h6>
									</div>
								</div>
								<div class="d-flex align-items-center mt-2 pr-1 pl-1" >
									<div class="fm-file-box bg-light-success text-success">
										<i class="bx bxs-file-doc"></i>
									</div>
									<div class="flex-grow-1 ms-2">
										<h4 class="apple5">문서</h4>
										<h4 class="apple3" id="docTotal">0 개</h4>
									</div>
									<h6 class="apple5" id="docTotalSize" style="font-size: 15px;">파일 없음</h6>
								</div>
								<div class="d-flex align-items-center mt-2 pr-1 pl-1" >
									<div class="fm-file-box bg-light-danger text-danger">
										<i class="bx bx-video"></i>
									</div>
									<div class="flex-grow-1 ms-2">
										<h4 class="apple5">미디어</h4>
										<h4 class="apple3" id="mediaTotal">0 개</h4>
									</div>
									<h6 class="apple5" id="mediaTotalSize" style="font-size: 15px;">파일 없음</h6>
								</div>
								<div class="d-flex align-items-center mt-2 pr-1 pl-1" >
									<div class="fm-file-box bg-light-warning text-warning">
										<i class="bx bx-image"></i>
									</div>
									<div class="flex-grow-1 ms-2">
										<h4 class="apple5">기타</h4>
										<h4 class="apple3" id="otherTotal">0 개</h4>
									</div>
									<h6 class="apple5" id="otherTotalSize" style="font-size: 15px;">파일 없음</h6>
								</div>
								<div class="d-flex align-items-center mt-2 pr-1 pl-1" >
									<div class="fm-file-box bg-light-info text-info">
										<i class="bx bx-image"></i>
									</div>
									<div class="flex-grow-1 ms-2">
										<h4 class="apple5">파일 총계</h4>
										<h4 class="apple3" id="totalTotal">0 개</h4>
									</div>
									<h6 class="apple5" id="totalTotalSize" style="font-size: 15px;">파일 없음</h6>
								</div>
							
							</div>
							
							<!--  파일 종류 끝  -->
							<!--  뭔가 그래프 -->
							<div class="mt-3 pt-3" style="border-top: 1.5px solid #dbdee0">
								<div class="text-right">
									<p class="mb-0 mt-2 text-right">
										<span class="apple6">사용량 /</span>
										<span class="float-end apple6"> 총 용량</span>
									</p>
									<span class="apple3 text-primary font-weight-bold text-right" id ="usageSize"></span>
									<span class="apple7 float-end text-secondary text-right" id="totalSize"></span>
								</div>
								<div class="progress mt-3" style="height: 15px;">
									<div class="progress-bar" role="progressbar" style="width: 5%" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
									<div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
									<div class="progress-bar bg-danger" role="progressbar"	style="width: 20%" aria-valuenow="20" aria-valuemin="0"	aria-valuemax="100"></div>
									<div class="progress-bar bg-success" role="progressbar"	style="width: 20%" aria-valuenow="20" aria-valuemin="0"	aria-valuemax="100"></div>
			<!-- 								<div class="progress-bar bg-secondary" role="progressbar"	style="width: 20%" aria-valuenow="20" aria-valuemin="0"	aria-valuemax="100"></div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ------------ 문서관리 내용물 ~~~~~~ -->
				
			</div>
			<div class="hr-line-dashed"></div>
			<div class="hr-line-dashed"></div>
				
		<script>
		function formatBytes(bytes, decimals = 2) {
		    if (bytes === 0) return '0 Bytes';		// 숫자 형식까지 완벽하게 0 이면 0 Bytes

		    const k = 1024;							// 2의 10승, 용량 별 단위 구간.
		    const dm = decimals < 0 ? 0 : decimals;
		    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

		    const i = Math.floor(Math.log(bytes) / Math.log(k));

		    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
		};
		var isSubmitted = false;
		$(function(){
// 			coDiskSize();
		})
		var coDiskSize = function(docType){
		
			
// 			alert('is it worked?');
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "/workfit/document/usage", true);
			xhr.setRequestHeader(header,token);
			xhr.send();
			xhr.onreadystatechange = () => {
				if(xhr.status == 200 && xhr.readyState == 4){
					
						let res = xhr.responseText
						let result = JSON.parse(res);
						var coUsage = result.coUsage;
// 						console.log(coUsage);
						totalSize.innerText = formatBytes(coUsage);
				}
				myDiskSize(coUsage,docType);
			};
		}
// 		var myChart = new Chart(context,)
		var myDiskSize = function(data,docType){
// 			if(isSubmitted == true){
// 				return;
// 			}
			console.log("coUsage ::::",data);
			console.log("docType ::::",docType);
			var usageDisk = 0;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "/workfit/document/usageInfo/"+docType, true);
// 			xhr.open("GET", "/workfit/document/usageInfo/"+boardType, true);
			xhr.setRequestHeader(header,token);
			
			xhr.onreadystatechange = () => {
				if(xhr.status == 200 && xhr.readyState == 4){
// 						isSubmitted = true;
						let res = xhr.responseText
						let diskResult = JSON.parse(res);
						
// 						console.log(diskResult);
// 						console.log(diskResult[0].FILETYPE);
						var imgAllSize = 0;
						var imgAllCount = 0;
						var docAllSize = 0;
						var docAllCount = 0;
						var mediaAllSize = 0;
						var mediaAllCount = 0;
						var otherAllSize = 0;
						var otherAllCount = 0;
						for(let item in diskResult){
							var fileType = diskResult[item].FILETYPE;
							var fileSize = diskResult[item].FILETYPESIZE;
							var fileCount = diskResult[item].COUNTFILE;
// 							var fileType = json[item].FILETYPE;


							let imgType = ['image/png','image/jpeg','image/gif','image/jpg','image/jfif'];
							let docType = ['application/pdf','application/haansoftxlsx','ppt','application/octet-stream','text/plain','application/msword','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'];
							let mediaType = ['audio/mpeg','video/mp4','video/webm','video/ogg','video/avi','video/asf'];
							if(imgType.indexOf(fileType) >= 0 ){
								imgAllSize += fileSize;
								imgAllCount += fileCount;
								imgTotal.innerText = imgAllCount + '  개';
								imgTotalSize.innerText = formatBytes(imgAllSize);
							}else if(docType.indexOf(fileType) != -1){
								docAllSize  += fileSize;
								docAllCount  += fileCount;
								docTotal.innerText = docAllCount + '  개';
								docTotalSize.innerText = formatBytes(docAllSize);
							}else if(mediaType.indexOf(fileType) != -1){
								mediaAllSize += fileSize;
								mediaAllCount += fileCount;
								mediaTotal.innerText = mediaAllCount + '  개';
								mediaTotalSize.innerText = formatBytes(mediaAllSize);
							}else if(fileType.indexOf('total') != -1){
								var totalAllSize = fileSize;
								totalTotal.innerText = fileCount + '  개';
								totalTotalSize.innerText = formatBytes(fileSize);
								usageSize.innerText = formatBytes(fileSize) +' /';
							}else{
								otherAllSize += fileSize;
								otherAllCount += fileCount;
								otherTotal.innerText = otherAllCount + '  개';
								otherTotalSize.innerText = formatBytes(otherAllSize);
							}
							usageDisk += fileSize;
// 							console.log(fileType);
						}
// 						console.log("imgTotalSize :",imgAllSize);
// 						console.log("totalAllSize :",totalAllSize);
// 						console.log("mediaAllSize :",mediaAllSize);
// 						console.log("otherAllSize :",otherAllSize);
// 						console.log("파일 총 사이즈 ::: ",fileSize);
// 						let imgPercent = parseInt(imgAllSize/data * 100);
// 						let docPercent = parseInt(docAllSize/data * 100);
// 						let mediaPercent = parseInt(mediaAllSize/data * 100);
// 						let otherPercent = parseInt(otherAllSize/data * 100);
						// 데이터 양이 적어 100배 늘려놓은 상태. 1MB => 100MB , 10MB => 1GB
						let imgPercent = parseInt(imgAllSize/(data/1000) * 100);
						let docPercent = parseInt(docAllSize/(data/1000) * 100);
						let mediaPercent = parseInt(mediaAllSize/(data) * 100);
						let otherPercent = parseInt(otherAllSize/(data/1000) * 100);
// 						console.log("docAllSize :",docAllSize);
// 						console.log("docAllPer :",docPercent);
						if (isNaN(imgPercent)){
							imgPercent = 0;							
						}
						if (isNaN(docPercent)){
							docPercent = 0;							
						}
						if (isNaN(mediaPercent)){
							mediaPercent = 0;							
						}
						if (isNaN(otherPercent)){
							otherPercent = 0;							
						}
						
// 						let imgPercent = parseInt(imgAllSize/data * 100);
						var arrPer = [ imgPercent+'%', docPercent+'%', mediaPercent+'%', otherPercent+'%'];
// 						console.log(arrPer[1]);
						
						document.querySelectorAll('.progress-bar').forEach((rr,index) => {
						    
						    rr.style.width = arrPer[index];
// 						    console.log(arrPer[index]);
						})
// 						document.querySelectorAll('.progress-bar')[0].style.width= `\${imgPercent}%`;
						
// 						console.log(diskResult.coUsage);
// 						totalSize.innerText = formatBytes(json.coUsage);
					}
				};
				xhr.send();
		}
		$('.text-secondary').on('click',function(){
//			usageSize.innerHTML = '40 GB';
//			totalSize.innerHTML = '50 GB';
//			console.log(usageSize);
			myDiskSize();
		})
		</script>
		</c:if>
		<!-- -----------------------Board Sidebar----------------------------- -->
		<c:if test="${menu eq 'board' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					<li class="side-nav-item ml-4 mt-4">
						<a href="/workfit/board/list/notice" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 공지사항 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/board/list/free" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 자유 게시판</span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/board/list/monthly" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 이달의 사원 </span></a>
					</li>
				</ul>
			</div>
		</c:if>
		<!-- -----------------------근태관리 Sidebar----------------------------- -->
		<c:if test="${menu eq 'commuteManage' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important;">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					<li class="side-nav-item ml-4 mt-4">
						<a href="javascript: void(0);" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 근태 및 휴가관리 </span> <span class="menu-arrow"></span></a>
						<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
							<li><a href="/workfit/adminpage/commuteView" class="apple5" style="font-size: 18px;">출/퇴근 </a></li>
							<li><a href="/workfit/mypage/vacation" class="apple5" style="font-size: 18px;">휴가 신청</a></li>
						</ul>
					</li>
					<li class="side-nav-item ml-4">
						<a href="javascript: void(0);" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 출장 관리 </span> <span class="menu-arrow"></span></a>
						<ul class="side-nav-second-level mm-collapse" aria-expanded="false">
							<li><a href="/workfit/mypage/businessTrip" class="apple5" style="font-size: 18px;">출장 명세서</a></li>
							<li><a href="/workfit/mypage/btApprove" class="apple5" style="font-size: 18px;">출장 승인</a></li>
	<!-- 						<li><a href="/workfit/adminpage/groupBy" class="apple5" style="font-size: 15px;">조직별/부서별</a></li> -->
						</ul>
					</li>
				</ul>
			</div>
		</c:if>
		<!-- -----------------------예약 Sidebar----------------------------- -->
		<c:if test="${menu eq 'resource' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					<li class="side-nav-item ml-4 mm-active">
						<a href="javascript: void(0);" class="side-nav-link mt-4" aria-expanded="true">
							<span class="menu-arrow"></span> 
							<span class="apple6 text-dark" style="font-size: 20px"> 예약관리 </span>
						</a>
						<ul class="side-nav-second-level mm-collapse mm-show" aria-expanded="false" style="">
							<li><a href="/workfit/resource/all" class="apple5" style="font-size: 18px;">전체</a></li>
							<li><a href="/workfit/resource/room" class="apple5" style="font-size: 18px;">회의실</a></li>
							<li><a href="/workfit/resource/car" class="apple5" style="font-size: 18px;">차량</a></li>
							<li><a href="/workfit/resource/electgoods" class="apple5" style="font-size: 18px;">전자기기</a></li>
						</ul>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/resource/manage" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 자원관리 </span></a>
					</li>						
				</ul>
			</div>	
		</c:if>
		<!-- -----------------------일정관리 Sidebar----------------------------- -->
		<c:if test="${menu eq 'schedule' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
		          
					<li class="side-nav-item ml-4 mt-4">
						<a href="#" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 개인 캘린더 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="#" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 부서 캘린더 </span></a>
					</li>
				</ul>
			</div>
		</c:if>
		<!-- -----------------------관리자페이지 Sidebar----------------------------- -->
		<c:if test="${menu eq 'admin' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
		          
					<li class="side-nav-item ml-4 mt-4">
						<a href="/workfit/admin/manageUser" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 유저 관리 </span></a>
					</li>
				<c:if test="${myService eq '3' }">
					<li class="side-nav-item ml-4">
						<a href="/workfit/admin/sPage" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 스토리보드 </span></a>
					</li>
				</c:if>
					<li class="side-nav-item ml-4">
						<a href="/workfit/admin/membership" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 20px"> 멤버십 결제 </span></a>
					</li>
				</ul>
			</div>
		</c:if>
		<!-- -----------------------관리자페이지 Sidebar----------------------------- -->
		<!-- -----------------------조직도 Sidebar----------------------------- -->
		<c:if test="${menu eq 'organization'}">
		
			<!-- 조직도에서 사원 클릭할 때 사원명 글씨 색깔 바뀌게 해주는 css -->
			<style>
				.clickMember{
					color: #464646;
/*   				    background-color: #35b8e0; */
   				    border-color: #35b8e0;
   				    font-weight : bold;
   				    font-size : 25px !important;
				}
			</style>
		
			<script>
			
			
				var deptList = JSON.parse('${deptData}');
				console.log("deptList확인"+deptList)
				var deptCodeAndName = {};
				for(let i = 0; i < deptList.length; i++){
			         	var dept = deptList[i];
			         	deptCodeAndName[dept.deptCode] = dept.deptName;
				}
				
				
				$(function() {
					
					$.ajax({
						type : 'get',
						url : '/workfit/getTreeData',
						async : false,
						contentType : 'application/json; charset=utf-8',
						success : function(result){
							
							
							
							$.each(result,function(i,e){
								console.log(e);
								// 사원테이블에서 온 데이터인지, 부서테이블에서 온 데이터인지에 따라서 codeId, parentId가 결정되도록 차별성을 둬야 하므로 아래와 같은 코드를 작성함 
								if(e.deptCode != null){
									var codeId = 'dep'+e.deptCode;
									var codeNm = e.deptName;
									if(e.deptDirect != null){
										var parentId = 'dep'+e.deptDirect;
									}else{
										var parentId = e.deptDirect;
									}
									
								}else{ // member테이블에서 온 데이터인 경우 
									
									if(e.deptFk[e.deptFk.length-1] == 'N'){ // 미배정 member인 경우 
										var codeId = 'non'+e.memId;
										var codeNm = e.memName+" "+e.memJobGrade;
										var parentId = 'dep'+e.deptFk;
										
									}else{
										
										var codeId = 'emp'+e.memId;
										var codeNm = e.memName+" "+e.memJobGrade;
										var parentId = 'dep'+e.deptFk;
									}
									
								}
								
//		 						var codeLvl = e.codeLvl;
								
								// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
   							var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'" style="background-color: inherit !important;"><i class="dripicons-folder" style="font-size : 20px;"></i><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><i class="dripicons-user" style="font-size : 20px;"></i><span onclick="oneclick(this)" style="font-size : 20px;">   '+codeNm+'</span></li>';
								
   							if(parentId == null) { // 부모가 없는 li요소들 
										$("#codeList").append(li);
																		
										
   							} else {  // 부모가 있는 li요소들은 else문을 들어감 
											
   						    var parentLi = $("li[id='"+ parentId +"']");
										    
   							var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
											  
   							parentLi.addClass("expandable")
											  
											  // 모든 부모 li요소들은 직계자식으로 div태그를 단 한개씩만 가질 수 있음 (find해서 하나도 찾지 못했다는 것은 해당 태그에 div태그를 append해야함을 의미) 
											  if(parentLi.find("div").length == 0){
												  parentLi.append(div);	
												  
											  }

												// 부모요소의 img자식 태그 중 직계자식img태그만 그 모양을 폴더로 바꿔주면 됨 
											      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
												  parentLi.children("img").css("display","none");	  
											 	
												  
											  // 부모 li요소의 직계자식(ul)  
										      var bUl = parentLi.children("ul");
											

												
										      if(bUl.length == 0) {
										          li = "<ul style='display : none; background-color: inherit !important;'>" + li + "</ul>";
													
										          parentLi.append(li);

										      } else {
										    	  
										    	  
												 bUl.append(li);
										      }
									  }
							})
						
							
							
							// 각각의 Ul태그 중 마지막 li요소들만을 배열형태로 가져옴 
							var ulArr = $("ul[id='codeList'] li:last-child");
							for(let i = 0; i < ulArr.length; i++){
								// li요소 안에 div 태그가 하나라도 존재한다면(해당 li요소가 폴더라면) 폴더 밑으로 아무것도 보이지 않게 함 
								if($(ulArr[i]).find("div").length != 0){
									$(ulArr[i]).attr("class","closed expandable lastExpandable");
									$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
																
								}else{
									
									$(ulArr[i]).addClass("last");
									if($(ulArr[i]).attr("id").substr(0,3)=='dep'){
										console.log("if문 안들어오나??");
										ulArr[i].removeChild(ulArr[i].children[1]);
									}
									
								}
								
							}	
							


				        	// li중에서 폴더인 녀석들만 더블클릭 시 열고 접히는 이벤트를 줌 (이때 이벤트 버블링을 막아주는 코드 작성)
				        	var liArr2 = $("ul[id='codeList'] li");
				        	
				        	for(let i = 0; i < liArr2.length; i++){
				            		$(liArr2[i]).on("dblclick",function(e){
				             			e.stopPropagation();
				                		$(liArr2[i]).children("div").click();
					        	//  li중 폴더가 아닌 녀석들은 ajax를 통한 데이터 조회가 가능하도록 작성
					        	if($(liArr2[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
					        		
					        		if($(liArr2[i]).attr("id").substr(0,3) == "emp"){
					        			
					        		
										
										// 파일의 데이터를 가져와서 body에 뿌려주는 ajax 코드 작성   
										var memId = $(liArr2[i]).attr("id");
										
										var header = '${_csrf.headerName}';
										var token =  '${_csrf.token}';
									
										$.ajax({
											type : "post",
											url : "/workfit/getMemNodeData",
											async : false,
											data : JSON.stringify({memId : memId.substr(3)}),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											beforeSend: function(xhr) {
									            xhr.setRequestHeader(header, token);
											},
											success : function(res){
												
												str = '<img src="${pageContext.request.contextPath }'+res.memProfileUrl+'"><br/>';
												str += '<i style="font-size : 30px;" class="dripicons-mail"></i><span class="apple4 text-dark text-left" style="font-size:18px;">&nbsp;'+res.memEmail+'</span><br/>';
												str += '<i style="font-size : 30px;" class="dripicons-phone"></i><span class="apple4 text-dark text-left" style="font-size:18px;">&nbsp;'+res.memTel+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:25px;">기본정보</span>';
												str += '<div style="height : 1px; background-color : gray;"></div>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">소속부서 : '+deptCodeAndName[res.deptFk]+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">이름 : '+res.memName+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">영어 이름 : '+res.memEnName+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">생일 : '+res.memBirth+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">입사일 : '+res.memWorkStartDay+'</span><br/>';
												str += '<span class="apple4 text-dark text-left" style="font-size:25px;">자기소개</span><br/>';
												str += '<div style="height : 1px; background-color : gray;"></div>';
												str += '<span class="apple4 text-dark text-left" style="font-size:18px;">'+res.memIntro+'</span>';
												$("#byhContainer1").html(str);
												
												$("#byhContainer1").parent().css("display","block");
											}
										}); // ajax(사원에 대한 정보를 출력 시켜주는) 끝...
										
										
					        			}else if($(liArr2[i]).attr("id").substr(0,3) == "non"){ // if문('emp'인지 확인하는) 끝... else문('non'일 경우) 시작...
					        				
// 											var memId = $(liArr2[i]).attr("id");
											console.log("더블클릭 시 여기들어와?");
										
											var enRollFormTag = $("#nonAssignedMemberEnrollForm");
                                                	
											enRollFormTag.css("display","block");
											var memId = $(liArr2[i]).attr("id");
											enRollFormTag.find("#enrollMemId").val(memId.substr(3));
													
											$("#byhContainer").html(enRollFormTag);
												
					        			
					        			} // else if문 끝...
					        			
					        			
					        			
					        			
									} // if문 끝...	
					        	
					        	
				            		}) // 더블클릭에 대한 이벤트 설정 끝 
				            		
				    				
				        		
				        	} // for문 끝 
				        	
							
				        	
				        	// 우클릭에 대한 이벤트 로직  + 부모 li의 폴더를 하나씩 지워주는 로직도 추가 + 파일 li의 i태그를 지워주는 로직도 추가 
			            	var Contextmenu = !function() {
			        			var id = 'contextmenu';
			        			
			        			
			        			{
			        				
// 			        				var div = document.createElement('div');
// 			        				div.id = id;
// 			        				div.style = 'z-index : 1002; display:none;position:fixed;width:150px; height:200px; background: #fff;box-shadow:1px 1px 5px 0 rgba(0, 0, 0, 0.54)';
									
// 			        				var hTag1 = "<h3 class='mymenu' id='byh_mail'>메일 보내기</h3>";
// 			        				var hTag2 = "<h3 class='mymenu' id='byh_calendar'>일정 조회</h3>";
// 			        				var hTag3 = "<h3 class='mymenu' id='byh_compliment'>칭찬하기</h3>";
// 			        				$(div).append(hTag1);
// 			        				$(div).append(hTag2);
// 			        				$(div).append(hTag3);
// 									<div class='row mt-2'>                                                                                                 
// 									  <div class='col-12'>             
// 									  	<div class='card mr-2 workfitCardBg' >                                                                                              
// 									        <div class='card-body p-4'>   
			        				var div = "<div id='"+id+"' style='z-index : 1002; display : none; position : fixed;' class='heighestParent row mt-2'><div class='col-12'><div class='card mr-2 workfitCardBg'><div class='card-body p-1'>";
			        				div += "<div class='p-1 pl-2 pr-2'>";
			        				div += "<h4 style='cursor : pointer;' class='mymenu apple4 text-dark' id='byh_mail'>메일 보내기</h4>";
			        				div += "<h4 style='cursor : pointer;' class='mymenu apple4 text-dark' id='byh_calendar'>일정 조회</h4>";
			        				div += "<h4 style='cursor : pointer;' class='mymenu apple4 text-dark' id='byh_compliment'>칭찬하기</h4>";
			        				div += "</div>";
			        				div += "</div>";
			        				div += "</div>";
			        				div += "</div>";
			        				div += "</div>";
			        				
			        				$(document.body).append(div);
			        			}
			        			var div = document.getElementById(id);
			        			
			        			
			        			var allLi = $("ul[id='codeList'] li");
			        			
			        			for(let i = 0; i < allLi.length; i++){
			        				
			        				// apple3 폰트 적용 
			        				$(allLi[i]).addClass("apple3");
			        				
			        				
			        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
										// 모든 li요소들 중 파일인 녀석들만 우클릭 시 원하는 메뉴가 나오도록 설정함    
										
										// li요소들 중에 i태그(폴더 그림)을 지워준다.. 
										$(allLi[i]).find(".dripicons-folder").remove();
										$(allLi[i]).find("img").css("display","none");
										
			        					allLi[i].addEventListener("contextmenu",function(e){
			        						e.preventDefault();
											
			        						emp_idVal = $(allLi[i]).attr("id").substr(3);
			        						
			        						div.id = $(e.target).parent().attr("id");
			        						
			        						var y = getAbsoluteTop(e.target) + 'px';
			                				
			        						var x = e.pageX + 'px';
// 			                				var y = e.pageY + 'px';
			                				div.style.display = 'block';
			                				div.style.left = x;
			                				div.style.top = y;
			        						
			        					})
			        					
			        				}else{  // 여기서 폴더를 한 개씩 제거 해주는 작업을 해준다 
			        					$(allLi[i]).children("img")[0].remove();
			        					$(allLi[i]).children(".dripicons-user").remove();
			        					
			        				}
			        			}
			        			
			     					document.addEventListener("click",function(e){
			     						div.style.display = 'none'
			     						
			     					})
			        			
			        			
			        		}();  // var Contextmenu 끝 
				        	
			        		// 우클릭 후 이메일 클릭했을 시 이메일 작성폼으로 보내주기 
			         		[...document.querySelectorAll(".mymenu")].map((ele)=>{
			         			if("byh_mail" == $(ele).attr("id")){
			         				ele.addEventListener("click",function(event){
// 			         					console.log($(event.target).parent().attr("id").substr(3));
										console.log($(event.target))
										var targetId = $(event.target).closest(".heighestParent").attr("id").substr(3);
										
										
			         					location.href = "/workfit/mail/mailWrite?mailReceiverId="+targetId;
			         				})
			         				
			         			}
			         			
			         		});
			        		
			        		
			        		// 아래는 모달에 대한 로직들 
//			     			console.log(document.querySelectorAll(".mymenu"));
// 			            		var hTagArr = document.querySelectorAll(".mymenu")
			            		
			            		
// 			            		for(let i = 0; i < hTagArr.length; i++){
// 			            			hTagArr[i].addEventListener("click",function(){
// 			            	    		var idVal = $(hTagArr[i]).attr("id"); 
			            				
			            	    		
// 			            	    		modal = $("#byhModal");
// 			            	    		modalBtn = $('#'+idVal+'Btn');
										
			            	    		
// 			            	    		if(idVal == "byh_mail"){
// 			            	    			modalFlag = "mail";
			            	    			
// 			            	    		}
			            	    		
// 			            	    		if(idVal == "byh_compliment"){
// 			            	    			modalFlag = "compliment";
			            	    			
// 			            	    		}
// 			            	    			var empObj = {
// 			            	    					memId : emp_idVal
// 			            	    			}
// 			            	    			var header = '${_csrf.headerName}';
// 			            	    			var token =  '${_csrf.token}';
// 			            	    			$.ajax({
// 												type : "post",
// 												url : "/workfit/getMemNodeData",
// 												data : JSON.stringify(empObj),
// 												contentType : "application/json; charset=utf-8",
// 												dataType : "json",
// 												beforeSend: function(xhr) {
// 										            xhr.setRequestHeader(header, token);
// 										    	},
// 												success : function(res){
													
// // 			 										console.log("멤버디테일 데이터 확인"+JSON.stringify(res));
// // 					            	    		var myStr = "수신메일&nbsp;&nbsp;<input type='text' value='"+res.empName+"' disabled='disabled'/>";
// // 					            	    		$(modal).find("#unique_content").html(myStr);
														
// 													if(modalFlag == "mail"){
// 														modal.find("#recipient-name").val(res.memEmail);
// 														modal.find("#exampleModalLabel").text("메일 보내기");
// 														modal.find("#byhMessageLabel").text("내용");
// 														modal.find("#byhRecipientLabel").text("수신 메일");
// 														modal.find("#byhSubmitBtn").text("보내기");
// 													}

// 													if(modalFlag == "compliment"){
// 														modal.find("#recipient-name").val(res.memName + "(" + deptCodeAndName[res.deptFk] + ")");
// 														modal.find("#exampleModalLabel").text("칭찬하기");
// 														modal.find("#byhMessageLabel").text("칭찬 내용");
// 														modal.find("#byhRecipientLabel").text("칭찬 사원");
// 														modal.find("#byhSubmitBtn").text("칭찬등록");
// 													}
													
													

// 													modalBtn.click();
// 												}
// 											})
			            	    			
			            	    			
			            	    		
// 			            			}) // 우클릭 후 클릭에 대한 이벤트 등록 
// 			            		} // for문 끝 


							
			        		
			        		
			        		
						} // success  
						
						
		 
						
							
						
					}) // ajax 끝 
					
					

	        		
					
					openAllNode();	
		        		
				}); // $(function(){}) 끝 

				
				function getAbsoluteTop(element) {
					  
					return element.getBoundingClientRect().top;
				
				}
				
				// 폴더 클릭시 + , - 가 바뀜고 동시에 안의 폴더 및 파일들이 나타나게 하는 함수  
				function myclick(a){
					

					
					var myul = $(a).parent().children("ul");
					if(myul.css("display")=="none"){
						myul.css("display","block");
						
						
					}else{
						myul.css("display","none");
						
						
					}
					
					
					//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
					if($(a).attr("class") == "hitarea expandable-hitarea"){
						$(a).attr("class", "hitarea collapsable-hitarea apple3")
						return;
					}
			
					if($(a).attr("class") == "hitarea collapsable-hitarea"){
						
						$(a).attr("class", "hitarea expandable-hitarea apple3")
						return;
					}
					
					
					
					// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
					if($(a).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
						$(a).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea apple3")
						$(a).parent().attr("class","closed collapsable lastCollapsable apple3");
						return;
					}
					
					if($(a).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
						$(a).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea apple3")
						$(a).parent().attr("class","closed expandable lastExpandable apple3");
						return;
						
						
					}
					
					
				}
				
				
				// window 객체로 선언함 
				click_history = []; 
				
				function oneclick(a){
					
					click_history.push(a); 	
					
					if(click_history.length == 1){
// 						$(a).css("background-color","green");
						$(a).addClass('clickMember');
						
					}else{
						
						for(let i = 0; i < click_history.length - 1; i++){
							$(click_history[i]).removeClass('clickMember');
						}

						for(let i = 0; i < click_history.length - 1; i++){
							click_history.shift();
						}
						
						$(a).addClass('clickMember');
// 						$(a).add("background-color","green");
					}
				}
					
				var result2 = [];
				var folderOpenFlag = false;
				
				function fn_byhSearchTree(){
					
					// 검색할 때마다 시작 부분에 기존에 색칠되있는 녀석들을 다 지워주는 작업이 필요 
					for(el of click_history){
						$(el).removeClass('clickMember');
					}
					
					for(el of click_history){
						click_history.shift();
						
					}
						
				
					var memVal = $("#byhMemSearchInput").val();
					console.log(memVal);
					
					
					var result = [...$("ul[id='codeList'] li")].filter(element => {
						if($(element).find("div").length == 0){
							if($(element).attr("id").substr(0,3) != 'dep'){
								
								
								
								return $(element).text().includes(memVal);
							}
							
						}
										
					});
					
					result.map((element)=>{
								click_history.push($(element).children("span"));
								$(element).children("span").addClass('clickMember');
						
					})
					
					
					
					
					console.log(result);
					
					fn_closeAnyOpened(); // << 폴더를 다 닫아주는 로직인데 얘는 무조건 실행되야 하는거 아님??
					
					$(result).dblclick();
// 					$(result).children("span").click();
					
					result2 = [...$("ul[id='codeList'] li")].filter(element => {
// 						if($(element).find(result).length != 0){
	
						for(el of result){
							if($(element).find(el).length != 0){
								
								var checkingDiv = true;
								break;
							}
						}
	
						if(checkingDiv){
	
							console.log("div클릭하기 전"+$(element).children("div"))
							
							
							
							$(element).children("div").click();
							return $(element).find(result).length != 0;
						}
						
					})
										
					folderOpenFlag = true;
					console.log(result2);
					
				}
				
				
				function fn_closeAnyOpened(){
					
					var allLiArrForByh = [...$("ul[id='codeList'] li")];
					
					
// 					if(!folderOpenFlag){
						
						console.log("폴더 닫는 로직 실행되??");
						for(let i = 0; i < allLiArrForByh.length; i++){
									
							if($(allLiArrForByh[i]).children("div").length != 0){
								var elementDiv = $(allLiArrForByh[i]).children("div");
								
	
							
							
							
								var myul = $(elementDiv).parent().children("ul");
								
								if(myul.css("display") =="block"){
									
									myul.css("display","none");
									
								}
								
								
								//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
								if($(elementDiv).attr("class") == "hitarea expandable-hitarea"){
									$(elementDiv).attr("class", "hitarea collapsable-hitarea")
								}
						
								if($(elementDiv).attr("class") == "hitarea collapsable-hitarea"){
									
									$(elementDiv).attr("class", "hitarea expandable-hitarea")
								}
								
								
								
								// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
								if($(elementDiv).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
									$(elementDiv).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
									$(elementDiv).parent().attr("class","closed collapsable lastCollapsable");
								}
								
								if($(elementDiv).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
									$(elementDiv).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
									$(elementDiv).parent().attr("class","closed expandable lastExpandable");
									
								}
							
							} // div가 존재할 때 if문 끝... 
							
						
						}
						
						folderOpenFlag = false;
// 					}
					
					
				}
				
				function openAllNode(){
					
					[...$("ul[id='codeList'] li")].map((element)=>{
						
						if($(element).children("div").length != 0){
							
							$(element).children("div").click();
						}
					})
				
					
				}
				
			</script>
			
			<!-- 우클릭 후 메일 보내기를 클릭했을 때 나타나는 모달을 띄워주는 버튼 -->
			<button id="byh_mailBtn" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#byhModal" data-whatever=""></button>
			<button id="byh_complimentBtn" style="display : none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#byhModal" data-whatever=""></button>
			<!-- 우클릭 후 클릭했을 때 나타나는 모달 시작-->
			<div class="modal fade" id="byhModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="form-group">
			            <label id="byhRecipientLabel" for="recipient-name" class="col-form-label">Recipient:</label>
			            <input readonly="readonly" type="text" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label id="byhMessageLabel" for="message-text" class="col-form-label">Message:</label>
			            <textarea class="form-control" id="message-text"></textarea>
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button id="close-area" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button id="byhSubmitBtn" type="button" class="btn btn-primary">Send message</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 우클릭 후 클릭했을 때 나타나는 모달 끝 -->
			<div class='row mt-2'>                                                                                                 
 				 <div class='col-12'>    
 				 	<div class='card workfitCardBg' style="height : 2400px; width : 400px;">                                                                                              
       					 <div class='card-body p-4' style="padding-left : 10px;">      
<!-- 							<div class="left-side-menu left-side-menu-detached mm-active mt-2"> -->
<!-- 						<div class='card mr-2 workfitCardBg' style="height : 1924px;">                                                                                               -->
<!-- 	       					 <div class='card-body p-4'>    -->

<!-- 							left-side-menu left-side-menu-detached mm-active -->
							<div class="" style="">
				<!-- 			<div> -->
								<!-- 사원 검색하는 태그 시작 -->
								<div class="form-group  ml-3 mt-4" style="width : 220px;">
								    <div class="input-group" style="width : 315px;">
								        <input id="byhMemSearchInput" type="text" class="form-control col-8" style="font-size: 20px;"placeholder="사원명 입력">
								        <div class="input-group-append">
								            <button id="byhTreeSearch" class="btn btn-dark" type="button" style="font-size: 16px;" onclick="fn_byhSearchTree()">검색</button>
								        </div>
							    	</div>
								</div>
								<!-- 사원 검색하는 태그 끝 -->
								<ul style="margin: 14px;"id="codeList" class="filetree treeview" ></ul> 
												
								<div id="mycontent"></div>
							</div>
							
<!-- 							</div> -->
<!-- 							</div> -->
							
						</div>
					</div>
				</div>
			</div>
			
			
			
		</c:if> 
		<!-- -----------------------조직도 Sidebar 끝----------------------------- -->
		<c:if test="${menu eq 'organizationManage' }">
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					<li class="side-nav-item ml-4 mt-4">
						<a href="/workfit/organizationmanage/organization" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 조직도 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/organizationmanage/memTable" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 직원조회 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="#" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 증명서 </span></a>
					</li>
				</ul>
			</div>
			
		</c:if>
		<!-- ----------------------- 메일 Sidebar 끝----------------------------- -->
		<c:if test="${menu eq 'mail' }">
		
			<div class="left-side-menu left-side-menu-detached mm-active mt-2" style="border-radius:0.85rem; background-color:rgba(255,255,255,0.75) !important">
				<ul class="metismenu side-nav mm-show" style="margin: 0px;">
					
					<li class="side-nav-item ml-4 mt-4 ">
<!-- 					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<button type="button" class="btn apple5" onclick="fn_goMailWriteView()" 
							style="margin : 25px 25px 25px 20px; background-color: #5F7CBB; font-size : 20px; color: white; width: 145px;">메일작성</button>
<!-- 							<button type="button" class="btn btn-primary" onclick="fn_goMailWriteView()">메일작성</button> -->
<!-- 						<a href="/workfit/mail/mailWrite" class="side-nav-link" > <span class="apple6 text-dark" style="font-size: 18px"> 메일작성 </span></a> -->
<!-- 							<span class="apple6 text-dark" style="font-size: 18px"> 메일작성 </span> -->
<!-- 						<a href="" class="side-nav-link"> <span class="apple6 text-dark" style="font-size: 18px"> 받은 메일함 </span></a> -->
					</li>

					<li class="side-nav-item ml-4">
						<a href="/workfit/mail/sendedMailView?mailFlag=received" class="side-nav-link"> 
							<i class="mdi mdi-email-receive-outline text-dark mr-1" style="font-size: 23px;"></i>
							<span class="apple6 text-dark" style="font-size: 20px"> 받은 메일함 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/mail/sendedMailView?mailFlag=sended" class="side-nav-link">
							<i class="mdi mdi-email-send-outline text-dark mr-1" style="font-size: 23px;"></i>
							<span class="apple6 text-dark" style="font-size: 20px"> 보낸 메일함 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/mail/sendedMailView?mailFlag=temp" class="side-nav-link">
							<i class="mdi mdi-email-edit-outline text-dark mr-1" style="font-size: 23px;"></i>
							<span class="apple6 text-dark" style="font-size: 20px"> 임시 메일함 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/mail/sendedMailView?mailFlag=important" class="side-nav-link">
							<i class="mdi mdi-email-alert-outline text-dark mr-1" style="font-size: 23px;"></i>
							<span class="apple6 text-dark" style="font-size: 20px"> 중요 메일함 </span></a>
					</li>
					<li class="side-nav-item ml-4">
						<a href="/workfit/mail/sendedMailView?mailFlag=trash" class="side-nav-link">
							<i class="mdi mdi-delete-outline text-dark mr-1" style="font-size : 23px;" ></i>
							<span class="apple6 text-dark" style="font-size: 20px"> 휴지통 </span></a>
					</li>
				</ul>
			</div>
		
		</c:if>
				
		
		
<div class="clearfix"></div>
<!-- Sidebar -left -->