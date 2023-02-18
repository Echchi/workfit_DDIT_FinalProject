<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<!-- --------------------------------퍼스트 모달(결재 문서 종류 선택)---------------------------------------------------------- -->
<!-- Large modal -->
<div class="apple3 modal fade" id="bs-example-modal-lg" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="apple4 modal-title text-dark" id="myLargeModalLabel" style="font-size:19px;">
					양식 선택 <i style="cursor:pointer; font-size:25px;" class="dripicons-plus"></i>
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<!-- 아코디언 삽입 -->
				<div class="apple5 accordion text-dark" id="accordionExample">

					<!-- 문서종류 뿌리기 -->
					<c:forEach var="type" items="${templateMap }" varStatus="status">
						<div class="card mb-0">
							<div class="card-header" id="headingOne">
								<h5 class="m-0">
									<a class="apple5 custom-accordion-title d-block pt-2 pb-2 workfitMouse"
										data-toggle="collapse" href="#${type.key}"
										aria-expanded="true" aria-controls="collapseOne" style="font-size:17px;">${type.key}</a>
								</h5>
							</div>
							<c:set var="templateTitleList" value="${type.value }" />
							<c:forEach var="templateTitleList" items="${templateTitleList}">
								<div id="${type.key}" class="apple5 collapse"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="apple5 card-body">
										<button id="btnForHover" type="button" id="showFormBtn"
											onclick="showForm(this)"
											class="apple5 btn btn-block text-left workfitMouse"
											style="text-align: left; font-size:17px;"">
											${templateTitleList.approvalTemplateTitle}</button>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>

					<!-- 문서종류 뿌리기-->

				</div>
				<!-- 아코디언 삽입  끝-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- --------------------------------퍼스트 모달(결재 문서 종류 선택)끝---------------------------------------------------------- -->

<!---------------------- 세컨드 모달(결재 문서 작성)------------------------------ -->
<!-- Scrollable modal -->
<div class="apple3 modal fade" id="scrollable-modal" tabindex="-1"
	role="dialog" aria-labelledby="scrollableModalTitle" aria-hidden="true">
	<div
		class="modal-dialog modal-full-width modal-dialog-scrollable second-modal"
		role="document">
		<div class="modal-content">
			<div class="modal-header pt-3 pb-2 pl-2">
				<h4 class="apple4 modal-title text-dark pl-2" style="font-size:31px;" id="scrollableModalTitle">결재 상신</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body p-4">

				<!-- 결재 문서 구성 -->
				<form id="submitForm" enctype="multipart/form-data">
					<!--내 정보 -->
					<input type="text" name="myName" id="myName" value="${myInfo.memName}" style="display: none;">
					<input type="text" name="myId" id="myId" value="${myInfo.memId}" style="display: none;">
					<input type="text" name="myGrade" id="myGrade" value="${myInfo.approvalMemGrade}" style="display: none;">
					<!--내 정보 -->
					<div class="row pl-2 pr-2 pt-2 mr-2 ml-2" style=" background-color:  #f9f9f9" >
							<p class="apple5 text-dark pr-1" style="font-size:15px;">보존연한</p>

							<select style="font-size:15px;height:23px;" class="mr-4">
								<option value="1">1년</option>
								<option value="3">3년</option>
								<option value="5">5년</option>
								<option value="10">10년</option>
							</select>
							
							<p class="apple5 text-dark pr-1" style="font-size:15px;">결재유형</p>
							<select id="approvalType" name="approvalType" style="font-size:15px;height:23px;" class="mr-4">
								<option value="1">일반</option>
								<option value="2">전결</option>
								<option value="3">긴급</option>
							</select>
							<p class="apple5 text-dark pr-1" style="font-size:15px;">공개범위</p>
							<select id="approvalScope" name="approvalScope" style="font-size:15px;height:23px;" class="mr-4">
								<option value="1">팀</option>
								<option value="2">부서</option>
								<option value="3">회사</option>
							</select>
					</div>
					<div class="p-2">
							<label for="docCode" class="apple3 text-dark"style="font-size:21px;">문서번호</label>
							<input class="apple3 text-dark p-1" style="font-size:19px;width: 100%;" type="text" id="docCode" name="docCode" value="자동입력" disabled> 
							<br><br> 
							<label class="apple3 text-dark" for="docTitle"style="font-size:21px;">문서제목</label>
							<input class="form-control" type="text" id="docTitle" class="p-1" name="docTitle" value="양식제목" style="width: 100%; font-size:17px;"> 
							<input type="text" id="approvalTemplateCode" name="approvalTemplateCode" value="" style="display: none;">
							<!-- 에디터 -->
							<div class="form-group mt-2">
								<button type="button" onclick="fillCK()">양식내용 넣기</button>
								<textarea id="reportForm" name="reportForm" class="form-control" rows="14" style="width:100%;">
		                        </textarea>
							</div>
							<!-- 에디터 -->
		
							<!-- 파일업로드 -->
		
							<!-- 파일업로드 -->
		
							<div class="filebox" >
								<input class="upload-name" value="첨부파일" placeholder="첨부파일">
								<label for="attachFile" class="mt-1">파일찾기</label> 
								<input type="file" id="attachFile" multiple name="attachFile">
							</div>
		
							<!-- <input type="file" multiple name="attachFile" id="attachFile" value="">-->
							<div class="row" id="attachDiv"></div> 
							<!-- 파일 업로드 끝 -->
		
							<!--이게 원본-->
							<!-- <input type="file" multiple name="attachFile" id="attachFile" value=""> -->
							<!--이게 원본-->
		
							<!-- <div id="fakeDropZone" onclick="pushFileInput()">여기를 클릭하세요</div> -->
							<!-- <div class="dz-message needsclick dropzone" id="myAwesomeDropzone" 
								data-plugin="dropzone" data-previews-container="#file-previews"	data-upload-preview-template="#uploadPreviewTemplate" 
								onclick="pushFileInput()">
								<i class="h1 text-muted dripicons-cloud-upload"></i>
								<h3>Drop files here or click to upload.</h3>
								<span class="text-muted font-13">(This is just a demo dropzone. Selected files are
								<strong>not</strong> actually uploaded.)</span>
							</div> -->
					
					
					</div>
					<!-- 파일 업로드 끝 -->


					<!-- 결재선 지정 -->

					<div>
						<h5 class="apple3 mt-2 ml-1 text-dark" style="font-size:21px;">결재선</h5>
						<table class="table mb-0 apple3 text-dark text-center">
							<thead>
								<tr style="font-size:19px;">
									<th scope="col">순서</th>
									<th scope="col">타입</th>
									<th scope="col">직급</th>
									<th scope="col">이름</th>
								</tr>
							</thead>
							<tbody id="approver">
								<tr style="font-size:17px;">
									<td colspan="4" class="workfitMouse text-center text-dark" id="approvalBtn" readonly data-toggle="modal" data-target="#full-width-modal-lg-third" data-dismiss="modal">
										<p style="font-size:19px;" class="apple4 m-2">결재자 선택</p>
									</td>
								</tr>
							</tbody>
						</table>
						<div readonly data-toggle="modal" data-target="#full-width-modal-lg-third" data-dismiss="modal" class="pt-3 ml-1 apple3 text-dark">
							<div  style="border-bottom:1px solid #f0f3f8; border-top:1px solid #f0f3f8" class="mb-2 pt-2 pb-2">
								<h5 class="apple3 text-dark" style="font-size:21px;">참조</h5>
							</div>	
							<div id="reference">
								<div id="referBtn" class="workfitMouse text-dark text-center apple3" readonly data-toggle="modal" data-target="#full-width-modal-lg-third" data-dismiss="modal">
									<p style="font-size:19px;" class="apple4 m-2 mt-3">참조자 선택</p>
								</div>
								<!-- <input type="text" id="referBtn" value="참조자가 없습니다." readonly data-toggle="modal" data-target="#full-width-modal-lg-third" data-dismiss="modal"> -->
							</div>
						</div>
					</div>

					<!-- 결재선 지정 끝-->
					<div class="apple3 modal-footer mt-5">
						<button type="button" class="btn btn-secondary apple4" style ="font-size:19px;" onclick="tempSave()">임시저장</button>
						<input type="button" value="상신" class="apple4 btn " style ="font-size:19px; color:white; background-color:#5F7CBB;" data-toggle="modal" data-target="#reqAppDetailModalComment" data-dismiss="modal">
						<input type="button" value="닫기" class="apple4 btn btn-light" style="font-size:19px;" data-dismiss="modal">
					</div>
					<sec:csrfInput/> 
				</form>
				
				</div>
			</div>
			<!-- 결재 문서 구성 -->
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
<!-- /.modal -->

<!---------------------- 세컨드 모달(결재 문서 작성)끝------------------------------ -->


<!---------------------- 써드 모달(결재선 지정)------------------------------ -->

<!-- Full width modal -->
<div id="full-width-modal-lg-third" class="apple3 modal fade" tabindex="-1"
	role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-full-width third-modal modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title text-dark" id="fullWidthModalLabel" style="font-size:31px;">결재선 지정</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div class="row pr-3 pl-3 justify-content-center">
					<!--  조직도 트리 적용 -->
					<div class="col-4 m-1" style="border: 2px solid #f0f3f8; border-radius:8px;  height: 600px; overflow : auto;">
						<!-- 결재선 검색  부분-->
<!-- 					<div id="codeList" class="filetree treeview"></div> -->
							
						<!-- 사원 검색하는 태그 시작 -->
						<div class="form-group  ml-3 mt-4 ">
						    <div class="input-group">
						        <input id="byhMemSearchInput" type="text" class="form-control col-8" placeholder="사원명 입력">
						        <div class="input-group-append">
						            <button id="byhTreeSearch" class="btn btn-dark" type="button" onclick="fn_byhSearchTree()">검색</button>
						        </div>
					    	</div>
						</div>
						<!-- 사원 검색하는 태그 끝 -->
						
						<!-- 조직도가 시작되는 UL태그 시작 -->
						<ul style="margin: 14px" id="codeList" class="filetree treeview workfitMouse"></ul> 
						<!-- 조직도가 시작되는 UL태그 끝 -->
					</div>
					
					<!--  조직도 트리 적용 끝-->
					
					<!--  가운데 -->
					<div class="col-1 ml-3 mr-5 align-self-center">
						<div class="align-self-center">
							<!-- 사이버튼 부분 -->
							<div class=" mt-1 ">
								<button type="button" class="btn btn-outline-primary" onclick="addAppLine(this)">결재 &gt;</button>				
							</div>
							<div class=" mt-1 ">
								<button type="button" class="btn btn-outline-primary" onclick="addAppLine(this)">합의 &gt;</button>				
							</div>
							<div class=" mt-1 ">
								<button type="button" class="btn btn-outline-primary" onclick="addReferenceLine()">참조 &gt;</button>				
								<div>
							</div>
							<!-- 사이버튼 부분 끝-->
							</div>
						</div>
					</div>
					<!--  가운데 끝 -->
					<!--  오른쪽 -->
					<div class="col-4" style="border: 2px solid #f0f3f8;  border-radius:8px; height: 600px;">
						<div class="row" style="height: 400px;">
							<table id="appLineTable" class="table  table-centered mb-0 text-dark apple3" style="height: 130px; width: 100%;">
								<thead class="text-center" style="font-size:17px;">
									<tr>
										<th>순서</th>
										<th>타입</th>
										<th>직급</th>
										<th>결재자</th>
										<th class="text-center">삭제</th>
									</tr>
								</thead>	
								<tbody id="appLineBody" class="text-dark text-center" style="font-size:17px;">
									<tr>
										<td colspan="5" id="appLineChk"><p class="text-dark apple4 text-center m-2" style="font-size:19px;">결재자가 없습니다</p></td>
									</tr>
								</tbody>						
							</table>
						</div>
						<div id="referDiv" class="ml-2 text-dark" >
							<div class="row apple6 pt-2 pb-2" id="referDivMark1" style="font-size: 20px; border-top:1px solid #f0f3f8" >참조</div>
							<div class="row justify-content-center" id="referDivMark2"><p class="text-dark apple4 text-center m-2" style="font-size:19px;">참조자가 없습니다</p></div>
						</div>
					</div>
				</div>
				<!-- 결재선 검색  부분 끝-->
				<!-- 결재선 표시 부분  -->

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-toggle="modal" style="background-color:#5F7CBB" data-target="#scrollable-modal" data-dismiss="modal" onclick="insertPerson()">확인</button>
				<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!---------------------- 써드 모달(결재선 지정)끝------------------------------------------------------------>
<!----------------------포스 모달(결재 의견 작성 및 제출)----------------------------------------------------->

<div id="standard-modal" class="apple3 modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog fourth-modal">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">결재 의견 작성</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <textarea rows="10" cols="10" title="결재의견" id="appCommentsadas" name="appCommentdsad">
				</textarea>
            </div>
            <div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="submitReport()">확인</button>
                <button type="button" class="btn btn-light" data-toggle="modal" data-target="#scrollable-modal" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal --> 

<!--  진짜 -->

<div class="modal fade" style="z-index: 2000;" id="reqAppDetailModalComment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h4 class="modal-title apple3" id="myCenterModalLabel">결재 의견 작성</h4>
                <button id="ModalCloseBtn2" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
			<div class="modal-body">
				<textarea class="form-control apple3" id="appComment" name="appComment" rows="5" style="resize:none;" placeholder="의견을 등록해주세요(선택사항)"></textarea>
			</div>
			<div class='modal-footer'> 
				<button type="button" id="finalAppBtn" style="background-color:#5F7CBB" onclick="submitReport()" class="btn btn-primary apple4">상신</button>
				<button type="button" class="btn btn-light apple4"  data-dismiss="modal">닫기</button>
           	</div>
		</div>
    </div>
</div>

<!----------------------포스 모달(결재 의견 작성 및 제출)끝----------------------------------->
<!-----------------------------삡스 모달(임시저장 모달) ------------------------------------>

<div id="fill-success-modal" class="apple3 modal fade" tabindex="-1" role="dialog" aria-labelledby="fill-success-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-filled bg-success">
            <div class="modal-header">
                <h4 class="modal-title" id="fill-success-modalLabel">임시 저장</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                ...???
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn btn-primary"  style="background-color:#5F7CBB">확인</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-----------------------------삡스 모달(임시저장 모달) 끝------------------------------------>
<!---------------------식스 모달(상신 문서 디테일 띄우기 창)----------------------------------------------------->

<!-- Scrollable modal -->
<div class="apple3 modal fade" id="scrollable-modal2" tabindex="-1" role="dialog" aria-labelledby="scrollableModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content" id="appvreportDetail">
            <div class="modal-header">
                <h4 class="apple5 modal-title text-dark" id="reportDetailTitle"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
			<!--------------------------------------------모달 바디 시작-------------------------------------------------------------------->
            <div class="modal-body">
				<div class="card p-3">
					
						<div class="row justify-content-between pl-4 pr-4">
						<span class="apple3 text-dark" style="font-size:19px;" id="sTagDocCode"></span>
						<span class="apple3 text-dark" style="font-size:19px;" id="sTagDate"></span>
					</div>
					
					<div class="card-body">
						<div class="card-title mb-5">
							<h4 class="apple5 modal-title text-dark mb-2" id="hTagTitle" style="font-size:31px;">${DocCode }</h4>
							<div class='row mb-2 mt-1'>
								<div class='col-sm-4'>
									<button type="button" class="btn btn-outline-dark">문서복사</button>
									<button type="button" class="btn btn-outline-dark" id="appvDetailPrint">문서출력</button>
								</div>
							</div>
						</div>
						<div class="card-text  mb-5">
							<h4 class="apple4 text-dark ml-2" style="font-size:21px;">결재선</h4>
							<table class='alternative-page-datatable table mb-0 ml-2'>
								<thead>
									<tr style="font-size:19px;">
										<th class='apple2 text-dark text-center' scope='col'>순서</th>
										<th class='apple2 text-dark text-center' scope='col'>직급</th>
										<th class='apple2 text-dark text-center' scope='col'>이름</th>
										<th class='apple2 text-dark text-center' scope='col'>구분</th>
										<th class='apple2 text-dark text-center' scope='col'>결재상태</th>
										<th class='apple2 text-dark text-center' scope='col'>일시</th>
									</tr>
								</thead>
								<!-- 결재 라인 표현-->
								<tbody id="tbodyAppLine">
								</tbody>
								<!-- 결재 라인 표현-->
							</table>
							<div class="card-body  mt-3 mb-5" style="background-color:  #F1F4F5;">
							<div class='row mb-2'>
								<div class='col-sm-4'>
									<h4 class="apple3 text-dark ml-2" style="font-size:21px;">참조</h4>
								</div>
								<div class='col-sm-8 '>
									<div class="text-sm-right" style="font-size:19px;"> 
										<a id="addRef" data-DocCode="${DocCode }" data-toggle="modal" data-target="#addRefModal" class="apple4" href="#">+ 참조자</a>
									</div>
								</div>
							</div>
								<div id="addRefListDiv" class="row"  style="font-size:19px;">
									<!--참조자라인 표현-->
									
									<!--참조자라인 표현-->
								</div>
							</div>
						</div>
						<div class="card-text  mb-5">
							<!--content 표시-->
							<div class="text-center" id="divAppContent">컨텐트 표시</div>
							<!--content 표시-->
						</div>
		
						<div class="card-text  mb-5">
							<div class='row mb-2'>
								<div class='col-sm-4'>
									<h4 class="apple4 text-dark ml-2"  style="font-size:21px;">관련문서</h4>
								</div>
								<div class='col-sm-8 '  style="font-size:19px;">
									<div class="text-sm-right">
										<a id="addAttachModalId" data-DocCode="" data-toggle="modal" data-target="#addAttachModal" class="apple4" href="#">+ 첨부파일</a>
									</div>
								</div>
							</div>
							<table class='alternative-page-datatable table mb-0'>
								<thead>
									<tr style="font-size:19px;">
										<th class='apple2 text-dark' scope='col'>파일명</th>
										<th class='apple2 text-dark' scope='col'>파일</th>
									</tr>
								</thead>
								<tbody id="tbodyAttach">
									<!--파일 첨부 다운로드-->
									
									<!--파일 첨부 다운로드-->
								</tbody>
							</table>
						</div>
						<div class="card-text">
							<h4 class="apple4 text-dark ml-2" style="font-size:21px;">의견</h4>
							<table class='alternative-page-datatable table mb-0' style="font-size:15px;">
								<thead>
									<tr style="font-size:19px;">
										<th class='apple2 text-dark' scope='col'>작성자</th>
										<th class='apple2 text-dark text-center' scope='col' style="width:70%;">내용</th>
										<th class='apple2 text-dark' scope='col'>일시</th>
									</tr>
								</thead>
								<tbody id="tbodyComment">
									<!--결재 의겨라인-->
									
									<!--결재 의겨라인-->
								</tbody>
							</table>
		
						</div>
		
					</div>
					<!--  card body 끝 -->
				</div>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-light" style="color:white;background-color:#5F7CBB">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!---------------------식스 모달(상신 문서 디테일 띄우기 창) 끝-------------------------------------------------->
<!-----------------------리스트 테이블 -------------------------------------------------->

<!-- 데이터 테이블 있는 페이지 레이아웃 -->  
<div class='apple3 row mt-2'>                                                                                                         
	<div class='col-12'>                                                                                                          
		<div class='card mr-2 workfitCardBg'>                                                                                                         
	       	<div class='card-body p-4'>                                                                                                 
	       		<div class='card p-3' style=" border-radius: 0.7rem;"> 
	       			                                                                                            
              		<h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>전자결재함</h5>                                                       
						<button type="button" class="btn btn-light apple6 ml-3 mr-1 pl-3 pr-3 workfitMouse" 
							style="color:white; z-index:999; background-color:#5F7CBB;  padding-top: 5px; padding-bottom:5px; font-size:18px; position:absolute; top:37px; right:50px;"
							data-toggle="modal" data-target="#bs-example-modal-lg">
							기안</button>
							
	           		<hr class="ml-2 mr-2 mt-1 mb-1">
	           		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
	           			<span class="badge badge-warning badge-pill">TIP</span><br>
	           			상위 결재자에게 결재를 받아야 할 서류를 업로드하는 공간입니다<br>
	           			템플릿 설정, 결재선 지정을 통해 상신할 수 있으며 임시저장 및 바로 상신이 가능합니다
	           		</div>
					<!-- 카드 -->
<!-- 					<div class="row pl-2 pr-2"> -->
					
					
					
					     <div class="pl-2 pr-2 justify-content-center apple4">
	           					
			           	       <div class="text-dark pl-3 mb-2 row"> 
			           	       		<div class="apple7 mr-4 pb-1" style="font-size:23px;width: 700px;border-bottom:3px solid #323a46;">나의 상신</div>
			           	       		<div class="apple7 pb-1" style="font-size:23px;width: 713px;border-bottom:3px solid #323a46;">나의 수신</div>
			           	       	</div>			            	
			           	       <div class="row apple4">
				            	<div class="col-2 pr-1">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center">
												<i class="mdi mdi-file-document-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">진행중</h4>
										    	<h6 class="apple5 text-dark" style="font-size: 21px;">${ingAppvCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            	<div class="col-2 pr-1">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-edit-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark pl-0" style="font-size: 19px;">승인완료</h4>
										    	<h6 class="apple5 remainDate text-dark" style="font-size: 21px;">${acceptAppvCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
				            		<div class="col-2 pr-2">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-multiple-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">반려</h4>
										    	<h6 class="apple5 usedDate text-dark" style="font-size: 21px;">${rejectAppvCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>
			           	       	
			           	       
			           	       
			           	       
				            	<div class="col-2 pr-1 workfitMouse" onclick="cardPush(requestedBtn)">
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
				            	<div class="col-2 pr-1 workfitMouse" onclick="cardPush(processingBtn)">
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
				            	<div class="col-2 pr-2 workfitMouse" onclick="cardPush(processedBtn)">
									<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
										<div class="card-body row" >
											<div class="col-4 text-center pl-0 pr-0">
												<i class="mdi mdi-file-document-multiple-outline text-dark" style="font-size: 42px"></i>
											</div>
											<div class="col-8">
										    	<h4 class="text-dark" style="font-size: 19px;">결재완료</h4>
										    	<h6 class="apple5 usedDate text-dark" style="font-size: 21px;">${processedCnt }<span style="font-size: 21px"> 건</span></h6>
											</div>
									  	</div>
									</div>
				            	</div>

			                </div>
					</div>

				</div>	
					
           		<div class="card p-4" style=" border-radius: 0.7rem;">
           		
           			<h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>나의 진행</h5>

					<!-- <table id="" class="apple2 table dt-responsive nowrap w-100" name="dTbl"> -->
					<table id="datatable-buttons" class="apple3 table dt-responsive nowrap w-100 text-center listTbl" name="dTbl">
					<!-- class=" apple table table-striped dt-responsive nowrap w-100"> -->
						<thead>
							<tr class="apple3 text-dark text-center" style="font-size:19px;">
								<th>순번</th>
								<th>종류</th>
								<th>문서번호</th>
								<th>제목</th>
								<th>상태</th>
								<th>참조자</th>
								<th>첨부파일</th>
								<th>결재의견</th>
								<th>상신일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reportListInfo }" var="doc" varStatus="index">
								<tr  style="cursor: pointer; font-size:17px;" onclick="showDeatail(this)" class="${doc['APPROVALDOCCODE']} apple4 text-dark" >
								<input type="text" value="${doc['APPROVALDOCCODE']}" id="showCode" style="display: none;"/>
<%-- 									<c:set value="${doc.approvalDocCode }" var="code"/> --%>
									<td>${index.count }</td>
<%-- 									<c:if test="${doc['BOOKMARK']  eq 0}"> --%>
<!-- 										<td><i style="font-size:16px;" data-doccode="TEST272" data-bk="1" class="mdi mdi-star-outline"></i></td> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${doc['BOOKMARK']  eq 1}"> --%>
<!-- 										<td><i style="font-size:16px;" data-doccode="TEST272" data-bk="1" class="mdi mdi-star"></i></td> -->
<%-- 									</c:if> --%>
									<c:if test="${doc['APPROVALTYPE'] eq 0}">
										<td>긴급</td>
									</c:if>
									<c:if test="${doc['APPROVALTYPE'] eq 1}">
										<td>일반</td>
									</c:if>
									<c:if test="${doc['APPROVALTYPE'] eq 2}">
										<td>전결</td>
									</c:if>
										<td>${doc['APPROVALDOCCODE'] }</td>
										<td class="text-left">${doc['APPROVALDOCTITLE']}</td>
									<c:if test="${doc['APPROVALDOCSTATUS'] eq 1}">
										<td>진행중</td>
									</c:if>
									<c:if test="${doc['APPROVALDOCSTATUS'] eq 2}">
<%-- 									<c:if test="${doc['APPROVALDOCSTATUS'] eq '2'.charAt(0)}"> --%>
										<td>승인</td>
									</c:if>
									<c:if test="${doc['APPROVALDOCSTATUS'] eq 3}">
										<td>반려</td>
									</c:if>
									<c:if test="${doc['APPROVALDOCSTATUS'] eq 4}">
										<td>취소</td>
									</c:if>
									<td>${doc['REFERENCCNT']} 명</td>
									<td>${doc['ATTACHCNT']} 개</td>
									<td>${doc['COMMENTCNT']} 명</td>
									<td>${doc['APPROVALDATE'] }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>                                                                                                               
		</div>
	</div>
</div>

<div class='apple3 row mt-1'>                                                                                                         
	<div class='col-12'>                                                                                                          
		<div class='card mr-2 workfitCardBg'>                                                                                                         
	       	<div class='card-body p-4'>    
	       	
	       		<div class='card p-3' style=" border-radius: 0.7rem;"> 
	             	<h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>전자결재 통계</h5>                                                       
							
	           		<hr class="ml-2 mr-2 mt-1 mb-1">
	           		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
	           			<span class="badge badge-warning badge-pill">TIP</span><br>
	           			인사부 1팀의 전자결재 현황을 확인해보세요. 
	           		</div>
	           		<div class="ml-3 mr-3 mb-3 mt-1" style="border: 1.2px solid lightgrey"></div>	   
	           		<div class="pl-3 pr-3 row mt-3" style="justify-content: space-evenly;">
	           		
		       			<!--  자주쓰는 문서 통계 -->
		       			<div style="width: 500px">
						  <canvas id="freDocChart"></canvas>
						</div>
		       			<!--  결재완료까지 평균 소요 일수-->
		       			<div style="width: 500px">
						  <canvas id="endReportDay" height="700" width="800"></canvas>
						</div>
	           		</div>    	                                                                                             
	       		</div>
	       	</div>
	    </div>	
	</div>
</div>    	
<!---------------------------------리스트 테이블 끝-------------------------------------------------->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.7/dayjs.min.js" integrity="sha512-hcV6DX35BKgiTiWYrJgPbu3FxS6CsCjKgmrsPRpUPkXWbvPiKxvSVSdhWX0yXcPctOI2FJ4WP6N1zH+17B/sAA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/html2canvas/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
<script>
	// 통계용 스크립트 시작 -----------------------------------------------
	
	// -------------------------------------------------------------- 두번쩨 차트 시작 
	const firstDiv = document.getElementById('freDocChart');
	Chart.defaults.font.size = 20;
	Chart.defaults.font.family = 'apple3';
	
	  new Chart(firstDiv, {
	    type: 'radar',
	    data: {
		  labels: ['근태', '지출', '인사', '기안'],
		  datasets: [{
		    label: '종류별 상신 수',
		    data: [50, 48, 40, 42],
		    fill: true,
		    backgroundColor: 'rgba(54, 162, 235, 0.2)',
		    borderColor: 'rgb(54, 162, 235)',
		    pointBackgroundColor: 'rgb(54, 162, 235)',
		    pointBorderColor: '#fff',
		    pointHoverBackgroundColor: '#fff',
		    pointHoverBorderColor: 'rgb(54, 162, 235)'
		  }]
	    },
	    options: {
	        elements: {
	          line: {
	            borderWidth: 3
	          }
	        },
	        plugins: {
	            title: {
	                display: true,
	                text: '자주 사용한 문서 종류',
	                position: 'top',
	                align : 'center',
	                fullSize : true,
	                font : {
	                        size: 31,
	                        family : 'apple3',
	                        color : 'black'
	                },
					padding: {
				          bottom: 20
				    }	                
	            },
	            legend: {
	                position: 'bottom',
	                labels: {
	                    font: {
	                        size: 17,
	                        family : 'apple3'
	                    }
	                }
	            },
	        },
		    scales: {
		        r: {
		            angleLines: {
		                display: false
		            },
		            suggestedMin: 20,
		            suggestedMax: 60,
    		        pointLabels: {
	    		          font: {
	    		            size: 21,
	    		            family:'apple3',
	    		          }
	    		        }
		        }
		    }
	    },
	  });
  	
	
	// -------------------------------------------------------------- 두번쩨 차트 끝  
	// -------------------------------------------------------------- 두번쩨 차트 시작 
  const secondDiv = document.getElementById('endReportDay');

  new Chart(secondDiv, {
	  type: 'bar',
	  data:{
		  labels: ['조현수', '박형기', '배영호', '양지윤', '정종은'],
		  datasets: [
		    {
		      label: '승인',
		      data: [50, 40, 20, 50, 45],
		      backgroundColor: '#0fa9ff',
		    },
		    {
		      label: '반려',
		      data: [7, 10, 5, 14, 5],
		      backgroundColor: '#ff5b5b',
		    },
		    ]
	  },  
	  options: {
	    plugins: {
	    	title: {
                display: true,
                text: '전자결재 승인/반려 건 수',
                position: 'top',
                align : 'center',
                fullSize : true,
                font : {
                        size: 31,
                        family : 'apple3',
                        color : 'black'
                },
				padding: {
			          bottom: 10
			    }
            },
            legend: {
                position: 'bottom',
                labels: {
                    font: {
                        size: 17,
                        family : 'apple3'
                    }
                }
            }
	    },
	    responsive: true,
	    scales: {
	      x: {
	        stacked: true,
	      },
	      y: {
	        stacked: true
	      }
	    }
	  }
});
  
  
    // ----------------------  두번째 차트 끝 
	
	// 통계용 스크립트 끝  -----------------------------------------------
	
	
	$(function(){
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
		
		console.log("dt있는지?:", $.fn.dataTable.isDataTable('#datatable-buttons'));
		
		$('#datatable-buttons').DataTable({
			destroy : false,
			info : false,
			lengthChange : false,
			"pagingType": "simple_numbers",
			language : lang_kor
		});

		$('.dataTables_paginate').addClass('pagination-rounded');
		
		
	});
	
// 	var appvDetailPrint = document.querySelector("#appvDetailPrint");
	function appvDetailPrintHandler(){
	    window.scrollTo(0, 0);
		console.log("프린트 눌림")
	    html2canvas($('#appvreportDetail')[0]).then(
	          function(canvas) {

	             var myImg = canvas.toDataURL("image/jpg");
	             // html 파트를 canvas로 변환, url(base64)로 변환 저장.

//	              console.log(myImg);
	             // A4 크기 : 210 x 270 (비율 상 : 1.414)
	             var pageheight = pageheight * 1.414;
	             var pagewidth = 210;
	             //          var pagewidth = 210;
	             //          var pageheight = 190;
	             var imgWidth = pagewidth;
	             //          var imgHeight = canvas.height * imgWidth / canvas.width;

	             var imgHeight = canvas.height * imgWidth / canvas.width;
	             // canvas.height : 실제 화면에 투사되는 html의 태그 의 높이, 너비.
	             // Ex. 윈도우 창의 크기나 콘솔로 인해 출력되는 부분이 좁아지면 같이 좁아짐.
	             // 전체 화면이면 해상도의 크기가 출력된다고 이해하면 편함.

	             // 1080 * imgWidth / 1920
	             // 출력된 Canvas의 비율을 구해서 높이를 구하는 식.
	             var heightLeft = imgHeight;

	             //          var imgHeight = pageheight *1.414 -10; 
	             console.log("canvas.height :", canvas.height)
	             console.log("canvas.width :", canvas.width)
	             console.log("pagewidth :", pagewidth)
	             console.log("pageheight :", pageheight)
	             console.log("imgWidth :", imgWidth)
	             console.log("imgHeight :", imgHeight)
	             console.log("heightLeft :", heightLeft)
	             //          var doc = new jsPDF("l", "mm", "a4");
	             var doc = new jsPDF({
	                // jsPDF 객체 생성()
	                // args[0] "p" or "l" => 각 세로, 가로의 pdf문서 파일 방향설정.
	                // args[1] "mm",
	                orientation : 'p',
	                unit : 'mm',
	                format : 'a4',
	                putOnlyUsedFonts : true,
	                floatPrecision : 16
	             // or "smart", default is 16
	             });
	                
	             //          console.log("doc.unit : ", doc[0].value);
	             // 한 페이지 이상일 경우 루프 돌면서 출력
	             while (heightLeft >= 0) {
	                position = heightLeft - imgHeight;
	                //            doc.addImage(myImg, "jpg", 0, position, imgWidth, imgHeight);
	                //            doc.addImage(myImg, "jpg", 0, position, imgWidth, pageheight);
	                //            doc.addImage(myImg, "jpg", 0, position, imgHeight, imgWidth);
	                doc.addImage(myImg, "jpg", 0, position, imgWidth, imgHeight);
	                // doc.addImage(이미지파일, 
	                // 확장자<png,jpg...>
	                // 출력 위치 : 왼쪽 상단기준 0,0 [x,y]
	                // 이미지 너비 
	                // 이미지 높이
	                heightLeft -= pageheight;
	                if (heightLeft > 0) {
	                   doc.addPage();
	                }
	                console.log("position :", position)
	                
	             }
	             doc.save("${DocCode }.pdf");
		});

	}
	appvDetailPrint.addEventListener("click", appvDetailPrintHandler);
	//변수 선언

    var header = '${_csrf.headerName}';
    var token = '${_csrf.token}';
    var showFormBtn = document.querySelector("#showFormBtn");   //
    var textareaData = document.querySelector("#textareaData");   //
    var docTitle = document.querySelector("#docTitle");         // 상신 모달 상 문서 제목
    var approvalTemplateCode = document.querySelector("#approvalTemplateCode");
    const submitForm = document.querySelector("#submitForm");
    const attachFile = document.querySelector("#attachFile");
	var referDiv = document.querySelector("#referDiv");
	var referDivMark1 = document.querySelector("#referDivMark1");
	var referDivMark2 = document.querySelector("#referDivMark2");
	var reference = document.querySelector("#reference");
	
	// 카드 누르면 해당 페이지로 이동하는 함수
	function cardPush(fancyYjyJje){
		fancyYjyJje.click();
	}
	
	//써드 모달 안의 결재선 테이블
	var appLineTable = document.querySelector("#appLineTable");

	//써드 모달 안의 결재선 들어가는 티바디
    var appLineBody = document.querySelector("#appLineBody");
	//세컨드 모달 안의 결재선에 들어가는 티바디
    var approver = document.querySelector("#approver");

	$("#attachFile").on('change',function(){
		console.log("작동하니?");
		var fileName = []
		fileName = document.querySelector("#attachFile").files;
		console.log("파일네임:",fileName);
		let realFile = fileName[0].name;
		console.log("realFile:",realFile);

		let spanTag = document.createElement("span");
		let hTag = document.createElement("h5");
		let divTag = document.createElement("div");
		
		hTag.className = 'apple';
		hTag.innerHTML ="첨부파일";
		divTag.className = 'col-12';
		divTag.id = 'attachFileDiv';
		spanTag.innerHTML = `\${realFile}  <i class="mdi mdi-delete" onclick="deleteAttach(this)"></i>`;

		divTag.append(spanTag);
		// attachDiv.append(hTag);
		attachDiv.append(divTag);
		
	});

	// input file 누르기 메소드
	function pushFileInput() {
		const fileInput = document.querySelector("#attachFile");
		fileInput.click();	
	}
	
	// 상세보기 페이지 띄우기
	function showDeatail(pthis){
		//문서코드번호
		console.log("상세보기 띄우기 콘솔:",pthis.getAttribute('class'));
		console.log("상세보기 띄우기 콘솔:",pthis.classList);
		let data = pthis.classList[0];
		console.log("상세보기 전송할 data:",data);


		let xhr = new XMLHttpRequest();
		xhr.open('post',"/workfit/approval/showReportDetail", true);
		xhr.setRequestHeader(header,token);
		xhr.send(data);
		xhr.onreadystatechange = function(){
			if(xhr.status == 200 && xhr.readyState == 4 ){
				let rslt = JSON.parse(xhr.responseText);
				console.log("데이터 전송 성공 여부", rslt);
				let approvalDocVO= rslt.approvalDocVO; 
				let approvalList = rslt.approvalList;
				let appRefList = rslt.appRefList;
				let appAttachList = rslt.appAttachList;
				
				let reportDetailTitle = document.querySelector('#reportDetailTitle');
				reportDetailTitle.innerHTML = `문서번호 : \${approvalDocVO.approvalDocCode}`;
				
				//문서 제목 넣기
				let hTagTitle = document.querySelector('#hTagTitle');
				hTagTitle.innerText = approvalDocVO.approvalDocTitle;

				//문서 번호 넣기
				let sTagDocCode = document.querySelector('#sTagDocCode');
				sTagDocCode.innerText = `문서번호 : \${approvalDocVO.approvalDocCode}`

				//문서 (작성일/작성자) / 결재라인 넣기 (순서 이름  타입 결재상태)
				let sTagWriter = document.querySelector('#sTagWriter');
				let sTagDate = document.querySelector('#sTagDate');
				let tbodyAppLine = document.querySelector('#tbodyAppLine');
				while (tbodyAppLine.hasChildNodes()){
					tbodyAppLine.removeChild( tbodyAppLine.firstChild );       
				}
				for(i of approvalList){
					let approvalDate;
					if(i.approvalDate != null){
						approvalDate  = dayjs(i.approvalDate).format("YYYY.MM.DD.");
					}else{
						approvalDate = "미결재";
					}

					//작성자/ 작성일 넣기
					if(i.approvalFlag == "1"){
						console.log("approvalDate",approvalDate);
// 						sTagWriter.innerText = `작성자 : \${i.memName}`;
						sTagDate.innerText = `작성일 : \${approvalDate}`;
					}
					//결재 라인 넣기
					let trTag = document.createElement("tr");
					let tdTag_index = document.createElement("td");
					let tdTag_grade = document.createElement("td");
					let tdTag_name = document.createElement("td");
					let tdTag_type = document.createElement("td");
					let tdTag_status = document.createElement("td");
					let tdTag_date = document.createElement("td");
					
					trTag.setAttribute('style','font-size:19px;');
					
					
					tdTag_index.setAttribute('class','apple4 text-dark text-center');
					tdTag_grade.setAttribute('class','apple4 text-dark text-center');
					tdTag_name.setAttribute('class','apple4 text-dark text-center');
					tdTag_type.setAttribute('class','apple4 text-dark text-center');
					tdTag_status.setAttribute('class','apple4 text-dark text-center');
					tdTag_date.setAttribute('class','apple4 text-dark text-center');

					tdTag_index.innerText = i.approvalFlag;
					tdTag_grade.innerText = i.approvalMemGrade;
					tdTag_name.innerText = i.memName;	
					tdTag_type.innerText = i.agreementStatus;
					switch (i.approvalStatus) {
						case 0 : tdTag_status.innerText = "대기"; break;
						case 1 : tdTag_status.innerText = "승인"; break;
						case 2 : tdTag_status.innerText = "반려"; break;
						case 3 : tdTag_status.innerText = "취소"; break;
						default : tdTag_status.innerText = "대기"; break;
					}
					tdTag_date.innerText = approvalDate;

					trTag.append(tdTag_index);
					trTag.append(tdTag_grade);
					trTag.append(tdTag_name);
					trTag.append(tdTag_type);
					trTag.append(tdTag_status);
					trTag.append(tdTag_date);

					//승인 상태라면 tr 색 변경
					if(tdTag_status.innerText == '승인'){
						trTag.setAttribute('style','background-color: #F1F4F5; font-size:19px;');
					}

					if(tdTag_status.innerText == '반려'){
						trTag.setAttribute('style','background-color: #fc694533; font-size:19px;');
					}
					
					tbodyAppLine.append(trTag);
				}
					

				//참조자 넣기
				while (addRefListDiv.hasChildNodes()){
					addRefListDiv.removeChild( addRefListDiv.firstChild );       
				}
				for(i of appRefList){
					let divTag = document.createElement("div");
					divTag.setAttribute("class","apple4 ml-3 mr-2 text-dark");
					divTag.setAttribute("style","font-size:19px;");
					divTag.innerText = `\${i.memName}`;
					addRefListDiv.append(divTag);
				}

				//결재 내용 넣기
				let divAppContent = document.querySelector("#divAppContent");
				console.log("approvalDocVO.approvalContent:확인", approvalDocVO.approvalContent);
				divAppContent.innerHTML = approvalDocVO.approvalContent;
				// divAppContent.approvalDocVO.approvalContent;

				//결재 의견 넣기 작성자 내용
				let tbodyComment = document.querySelector("#tbodyComment");
				while (tbodyComment.hasChildNodes()){
					tbodyComment.removeChild( tbodyComment.firstChild );       
				}
				for(i of approvalList){
					if(i.approvalComment != null){
						let trTag = document.createElement("tr");
						let tdTag_name = document.createElement("td");
						let tdTag_comment = document.createElement("td");
						let tdTag_commentDate = document.createElement("td");

						trTag.setAttribute("style","font-size:19px;");
						tdTag_comment.className = "apple4 text-dark text-center";
						tdTag_name.className = "apple4 text-dark";
						tdTag_commentDate.className = "apple4 text-dark";
						console.log("i.approvalComment 태그 지운후 : ", i.approvalComment.trim());
						tdTag_name.innerText = i.memName;
						tdTag_comment.innerText = i.approvalComment.trim();
						
						var date = dayjs(i.approvalDate);
						
						tdTag_commentDate.innerText = date.format("YYYY.MM.DD HH:mm");
						trTag.append(tdTag_name);
						trTag.append(tdTag_comment);
						trTag.append(tdTag_commentDate);
						tbodyComment.append(trTag);
					}

				} 

				//첨부파일 다운로드
				let tbodyAttach = document.querySelector("#tbodyAttach");
				while (tbodyAttach.hasChildNodes()){
					tbodyAttach.removeChild( tbodyAttach.firstChild );       
				}
				for(i of appAttachList){
					let trTag = document.createElement('tr');
					let tdTag_fileName = document.createElement('td');
					let tdTag_file = document.createElement('td');
					let aTag = document.createElement('a');


					tdTag_file.className="apple4 text-dark";
					tdTag_file.setAttribute("style","font-size:17px;");
					tdTag_fileName.className="apple4 text-dark";
					tdTag_fileName.setAttribute("style","font-size:17px;");
					aTag.href = `/workfit/approval/get/\${i.approvalAttachCode}`;
					// aTag.download = `\${i.approvalAttachSavepath}/`;
					console.log("aTag.href=" + aTag.href);
// 					aTag.download = "Y:\\upload";
// 					console.log("aTag.download:,",aTag.download);
					aTag.innerHTML= "파일 다운로드"	

					tdTag_fileName.innerText = i.approvalAttachName;
					tdTag_file.append(aTag);
					trTag.append(tdTag_fileName);
					trTag.append(tdTag_file);

					tbodyAttach.append(trTag);
				}
				
				// 	<tr>
				// 		<td class='apple4 text-dark'>${appatt.approvalAttachName }</td>
				// 		<td class='apple4 text-dark'><a href="${appatt.approvalSavepath }" ></a></td>
				// 		<td class='apple4 text-dark'>
				// 			<a	href="${appatt.approvalAttachSavepath }" download="${approvalDoc.approvalDocTitle } 관련문서_(${index.count })">${appatt.approvalAttachSavepath }</a>
				// 		</td>
				// 	</tr>




				$("#scrollable-modal2").modal("show");




			}
		}



	}



	//임시저장 function
	function tempSave(){
		let approvalContent = CKEDITOR.instances.reportForm.getData();
		var tempData = new FormData(submitForm);
		
		//임시 approavalDocVO 
		var tempApprovalDocVO = {};
		tempApprovalDocVO.approvalTemplateCode = approvalTemplateCode.value;
		tempApprovalDocVO.approvalType = document.querySelector("#approvalType").value;
		tempApprovalDocVO.approvalDocTitle = docTitle.value;
		tempApprovalDocVO.approvalContent = approvalContent;
		tempApprovalDocVO.approvalScope = document.querySelector("#approvalScope").value;

		
		// 임시List<approvalVO>
		var tempApprovalList = [];
		var tempMyInfo = {};
		tempMyInfo.memId = document.querySelector("#myId").value;
		tempMyInfo.approvalFlag = '1';
		tempMyInfo.approvalComment = appComment.value;
		tempMyInfo.approvalMemGrade = document.querySelector("#myGrade").value;	//변경 필요
		tempMyInfo.agreementStatus = "결재";
		tempMyInfo.memName = document.querySelector("#myName").value;
		tempApprovalList.push(tempMyInfo);
		

		if(document.getElementById('approvalBtn')){
			var approvalVO= {
				}
		}else{//결재자가 있다면
			for(let i of approver.children){
				var approvalVO= {
					'memId':i.classList[0],
					'approvalFlag': i.children[0].innerText*1 +1,
					'agreementStatus': i.children[1].innerText,
					'approvalMemGrade': i.children[2].innerText,
					'memName':i.children[3].innerText
				}
				tempApprovalList.push(approvalVO);
			}
		}
		

		//임시 첨부파일 데이터 생성		
		let tempFiles = attachFile.files;
		for(let i = 0; i< tempFiles.length ; i++){
			console.log("임시저장파일이 들어가긴해?:", tempFiles[i]);
			tempData.append("uploadFiles", tempFiles[i]);
			// 자동으로 배열로 들어가게 됨!!
		}
		
		
		//결재 참조 데이터 생성
		var tempReferenceList = [];
		if(document.getElementById('referBtn')){
			var referenceVO = {
				};
		}else{
			for(let i of reference.children){
				var referenceVO = {
					memId : i.classList[0]
				};
				tempReferenceList.push(referenceVO);
			}
		}


		tempData.append("tempApprovalDocVO", JSON.stringify(tempApprovalDocVO));
		tempData.append("tempApprovalList", JSON.stringify(tempApprovalList));
		tempData.append("tempReferenceList", JSON.stringify(tempReferenceList));

		console.log("시큐리티 header:", header, token);
		$.ajax({
			url:"/workfit/approval/saveReport",
			method:"POST",
			data: tempData,
			cache:false,
			contentType:false,
			processData:false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(rslt){
				$("#scrollable-modal").modal("hide"); 
				toastr.success( '<h4 style="font-size:17px;" class="apple4">임시저장 성공</h4>');
				setTimeout(() => window.location.reload(), 1500);
			}
		}) 
		
		/* //////김진호
		const headers = {
			 header: token
		}
		
		axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
		// axios.defaults.headers.common[header] = token;
		axios
		  .post("/workfit/approval/tempApprovalDoc", tempApprovalDocVO) //첫번째 비동기
		  .then((res) => {
			  	//첫번째가 끝나면
			  	var tempDocCode = res.data
				alert(tempDocCode)
			
			  axios
				.post("/workfit/approval/tempApproval", 
				{tempApprovalList : JSON.stringify(tempApprovalList),
				 tempDocCode: tempDocCode
				}) 
				.then((res) => {
					//두번째 끝나면
					  console.log("두번째:",res.data);
					
					axios
					  .post("/workfit/approval/tempApprovalDoc", tempApprovalDocVO)
					  .then((res) => {
						  console.log(res.data);
					  })
				});
		  });  */
		
		
	}


	//결재 상신 최종 처리 fucntion
	function submitReport(){

		let formData = new FormData(submitForm);

		let approvalContent = CKEDITOR.instances.reportForm.getData();
		let appComment = document.querySelector("#appComment");
		formData.append("approvalContent", JSON.stringify(approvalContent));//ck에디터 내용 추가
		
		
		//approvalDoc 테이블 데이터 생성
		var approvalDocVO = {};

		approvalDocVO.approvalTemplateCode = approvalTemplateCode.value;
		approvalDocVO.approvalType = document.querySelector("#approvalType").value;
		approvalDocVO.approvalDocTitle = docTitle.value;
		approvalDocVO.approvalContent = approvalContent;
		approvalDocVO.approvalScope = document.querySelector("#approvalScope").value;

		formData.append("approvalDocVO", JSON.stringify(approvalDocVO));
		
		//approval테이블 데이터 생성
		var approvalList1 = [];
		var myInfo = {};
		myInfo.memId = document.querySelector("#myId").value;
		myInfo.approvalFlag = '1';
		console.log("appComment:", appComment);
		let writtenAppComment = document.querySelector('#appComment');
		
		console.log("널체크전:", writtenAppComment);
		console.log("널체크전:", writtenAppComment.value);
		
		
		if(writtenAppComment.value == "" || writtenAppComment.value == null){
			myInfo.approvalComment = null;
			console.log("코멘트가 널이야");
		}else{
			myInfo.approvalComment = writtenAppComment.value;
			console.log("코멘트가 널이 아니야");
		}
		
		console.log("널값확인:", myInfo.approvalComment);
		myInfo.approvalMemGrade = document.querySelector("#myGrade").value;	//변경 필요
		myInfo.agreementStatus = "결재";
		myInfo.memName = document.querySelector("#myName").value;
		approvalList1.push(myInfo);
		
		console.log("approver.children.length:",approver.children.length);
		if(!document.getElementById('approvalBtn')){
			
			for(let i of approver.children){
				// console.log("결재라인 확인 하기:",i);s
				// console.log("결재라인 확인 하기0:",i.children[0].innerText);
				// console.log("결재라인 확인 하기0+1:",i.children[0].innerText*1 + 1);
				// console.log("결재라인 확인 하기1:",i.children[1].innerText);
				// console.log("결재라인 확인 하기2:",i.children[2].innerText);
				// console.log("결재라인 확인 하기3:",i.children[3].innerText);
				// console.log("결재라인 확인 하기:",i.getAttribute('class'));
				var approvalVO= {
					// 'memId':i.getAttribute('class'),
					'memId':i.classList[0],
					'approvalFlag': i.children[0].innerText*1 +1,
					'agreementStatus': i.children[1].innerText,
					'approvalMemGrade': i.children[2].innerText,
					'memName':i.children[3].innerText
				}
				approvalList1.push(approvalVO);
			}
		}
		console.log("현수 컨트롤러에 들어오는 값:", approvalList1);
		formData.append("approvalList", JSON.stringify(approvalList1));
		//approval테이블 데이터 생성 끝

		
		//첨부파일 데이터 생성		
		let files = attachFile.files;
		for(let i = 0; i< files.length ; i++){
			console.log("파일이 들어가긴해?:", files[i]);
			formData.append("uploadFiles", files[i]);
			// 자동으로 배열로 들어가게 됨!!
		}
		
		
		//결재 참조 데이터 생성
		var referenceList1 = [];
		for(let i of reference.children){
			
			if(i.classList[0] == 'apple4'){
				var referenceVO = {
					// memId : i.getAttribute('class') 
					memId : null
				};
			}else{
				var referenceVO = {
					// memId : i.getAttribute('class') 
					memId : i.classList[0]
				};
			}
			referenceList1.push(referenceVO);
		}

		formData.append("referenceList", JSON.stringify(referenceList1));

		
		/* 
		for (var key of formData.keys()) {
			console.log("폼데이터 키확인!!:",key);
		}
							
		for (var value of formData.values()) {
			console.log("폼데이터 벨류  확인!!:",value);
		} 
		*/


		$.ajax({
			method:"post",
			url:"/workfit/approval/uploadReport",
			data:formData,
			cache:false,
			contentType:false,
			processData:false,
			async : false,
			beforeSend : function(xhr) {
            	xhr.setRequestHeader(header, token);
         	},
			success:function(rslt){
// 				alert(rslt);
// 				window.location.reload();
				console.log("rslt.docCode:",rslt.docCode);
// 				console.log("rslt.docCode 파싱:",JSON.parse(rslt).docCode);

				window.currDocCode = rslt.docCode;
			}
		})//ajax종료
		
		
		// 에이잭스로 결제 라인 번호가 2번인 녀석한테 결재 요청이 들어왔다는 알림을 보내고 
		// DB에 해당 알림에 대한 데이터를 저장해놓은다 
		console.log("영호에게 들어가는 데이터", approvalList1);
		 $.ajax({
				type : "post",
				url : "/workfit/notification/payrequest",
				data : {"docCode" : window.currDocCode,"approvalVO" : [approvalList1[0],approvalList1[1]]},
				beforeSend : function(xhr) {
	            	xhr.setRequestHeader(header, token);
	         	},
				success : function(res){
					$("#reqAppDetailModalComment").modal("hide"); 
					toastr.success( '<h4 style="font-size:17px;" class="apple4">상신 완료</h4>');

					setTimeout(() => window.location.reload(), 900);
					
				}
			});
		


	}	


    // 세컨드 모달 안에 결재 라인/참조라인 넣는 함수
	function insertPerson(){

		var indexText;
		var typeText;
		var rankText;
		var nameText;
		var idText;
		
		console.log("결재 첫번째 tr 값:  ", appLineBody.children);
		//티바디 안의 태그 일단 삭제하기
		console.log("결재 라인 개수  ", appLineBody.children.length);
		
		if(!document.getElementById('appLineChk')){
		// if(appLineBody.children.length > 0){
			while (approver.hasChildNodes()){
				approver.removeChild( approver.firstChild );       
			}

			for(let i of appLineBody.children){
				// console.log("appLineBody 하위 요소",i.children[3].innerText);
				// console.log("appLineBody 하위 요소 여기 보시오",i.innerHTML);
				// console.log("appLineBody 하위 요소 여기 보시오2",i.children[3].getAttribute("class").substring(3));
				// console.log("순번:",i.innerText.split('	',5)[0]);
				// console.log("타입:",i.innerText.split('	',5)[1]);
				// console.log("직급:",i.innerText.split('	',5)[2]);
				// console.log("이름:",i.innerText.split('	',5)[3]);

				indexText = i.innerText.split('	',5)[0];
				typeText = i.innerText.split('	',5)[1];
				rankText = i.innerText.split('	',5)[2];
				nameText = i.innerText.split('	',5)[3];
				idText = i.children[3].getAttribute("class").substring(3);

				var trTag = document.createElement("tr");
				var tdTag_index = document.createElement("td");
				var tdTag_type = document.createElement("td");
				var tdTag_rank = document.createElement("td");
				var tdTag_name = document.createElement("td");

				trTag.setAttribute('readonly','readonly');
				trTag.setAttribute('data-toggle','modal');
				trTag.setAttribute('data-target','#full-width-modal-lg-third');
				trTag.setAttribute('data-dismiss','modal');
				// trTag.setAttribute('class',idText);	//클래스의 사원 아이디 부여
				trTag.setAttribute('class', idText + ' apple3 text-dark');	
				trTag.setAttribute('style','font-size:19px;');	
				
				
				tdTag_index.setAttribute('scope','row')
				tdTag_index.innerText = indexText;
				tdTag_type.innerText = typeText;
				tdTag_rank.innerText = rankText;
				tdTag_name.innerText = nameText;

				trTag.append(tdTag_index);
				trTag.append(tdTag_type);
				trTag.append(tdTag_rank);
				trTag.append(tdTag_name);

				approver.append(trTag);
			}
		}

		if(document.getElementById('appLineChk')){
			console.log("approver.children",approver.children);	
			
			while (approver.hasChildNodes()){
				approver.removeChild( approver.firstChild );       
			}

			let rTag = document.createElement('tr');
			let dTag = document.createElement('td');
			
				
			dTag.setAttribute('colspan','4');
			dTag.setAttribute('readonly','readonly');
			dTag.setAttribute('data-toggle','modal');
			dTag.setAttribute('data-target','#full-width-modal-lg-third');
			dTag.setAttribute('data-dismiss','modal');
			dTag.setAttribute('style','font-size:19px;');
			dTag.setAttribute('class','apple4 m-2 workfitMouse');
			dTag.innerText = "결재자가 없습니다"
			dTag.id="approvalBtn";

			rTag.append(dTag);
			approver.append(rTag);
		}
			
		

		// console.log("참조 하위 요소", referDiv.children);
		// console.log("참조 하위 요소 innerText", referDiv.children[0].innerText);
		// console.log("참조 하위 요소 innerHtml", referDiv.children[0].innerHTML);
		console.log("referDiv.children: ", referDiv.children);
		console.log("참조자 개수", referDiv.children.length);
		if(referDiv.querySelectorAll('div').length < 2){
			while(reference.hasChildNodes()){
				reference.removeChild(reference.firstChild);       
			}
			for(let i of referDiv.children){
				var spanTag = document.createElement("span");
				spanTag.innerHTML = `<a href="javascript: void(0);" class="btn btn-sm btn-light text-dark" style="font-size:19px;">\${i.innerText} </a>`;
				// i.innerText + "  ";
				console.log("span태그 class에 들어갈 id 값: " , i.getAttribute('class').substring(3));
				// spanTag.setAttribute("class", i.getAttribute('class').substring(3));	// 사원 아이디 클래스에 부여하기
				let id = i.getAttribute('class').substring(3);
				spanTag.className = `\${id} mt-1 mr-1`;
				reference.append(spanTag);
			}
			reference.firstChild.remove();
		}else{
			while(reference.hasChildNodes()){
				reference.removeChild(reference.firstChild);       
			}
			let divTag = document.createElement("div");
			divTag.innerText = "참조자가 없습니다";
			divTag.setAttribute("readonly","readonly");
			divTag.setAttribute("data-toggle","modal");
			divTag.setAttribute("data-target","#full-width-modal-lg-third");
			divTag.setAttribute("data-dismiss","modal");
			divTag.setAttribute('style','font-size:19px;');
			divTag.setAttribute('class','apple4 m-2 text-center workfitMouse');
			divTag.id = "referBtn";
			reference.append(divTag);
		}
		

	}

	// 참조 라인 삭제 버튼
	function deleteReferLine(pthis){
		console.log("deleteReferLine pthis:", pthis);
		console.log("deleteReferLine pthis의 부모요소:", pthis.parentElement);
		pthis.parentElement.remove();
		let spanCnt = referDiv.children.length;
		console.log("deleteReferLine:",spanCnt);
		if(spanCnt == 1){
			let divTag = document.createElement('div');
			divTag.className = "row";
			divTag.id = "referDivMark2"
			divTag.innerText = "참조자가 없습니다";
			referDiv.append(divTag);
		}

	}



	// 결재 라인 삭제 버튼 메서드
	function deleteAppLine(pthis){
		console.log("속성을 구해보자 ", pthis.parentElement.getAttribute);
		console.log("부모요소는?:", pthis.parentElement);
		console.log("부모부모요소는?:", pthis.parentElement.parentElement);
		pthis.parentElement.parentElement.remove();
		let trCnt = appLineBody.children.length;
		console.log("첫번째 티알 구하기:", appLineBody.children[0]);
		for (let i = 0; i < trCnt; i++) {
			appLineBody.children[i].children[0].innerHTML = i+1; 
		}

		if(trCnt ==0 ){
			let trTag = document.createElement('tr');
			let tdTag = document.createElement('td');

			trTag.setAttribute("style", "height:70px;");
			tdTag.setAttribute("colspan", "5");
			tdTag.id = 'appLineChk';
			tdTag.innerText = "결재자가 없습니다";
			trTag.append(tdTag);
			appLineBody.append(trTag);

		}
	}



	//써드 모달 참조 라인 추가 메소드
	function addReferenceLine(){
		var referId = $(click_history[0]).parent().attr("id");
		var referName = click_history[0].innerText.split(' ',1);
    	var referRank = click_history[0].innerText.split(' ',2)[1];
		var referSpanTag = document.createElement("span");
		referSpanTag.innerHTML = `<a href="javascript: void(0);" class="apple3 btn btn-sm btn-light mr-1 mt-1" style="font-size:17px;" onclick="deleteReferLine(this)">\${referRank} : \${referName}&nbsp;<i class="mdi mdi-delete mr-2"></i>`;
		// referSpanTag.innerHTML = `\${referRank} : \${referName}&nbsp;<a href="javascript: void(0);" class="action-icon" onclick="deleteReferLine(this)"><i class="mdi mdi-delete"></i>&nbsp;&nbsp;&nbsp;`;
		referSpanTag.setAttribute("class", referId);
		if(document.getElementById("referDivMark2")){
			console.log('referDiv.children:' , referDiv.children);
			referDiv.children[1].remove();
		}	

		referDivMark1.after(referSpanTag);

	}


    // 써드 모달 결재 라인에 추가하는 메소드
    function addAppLine(pthis){
    	
		//영호 조직도에서 가져온 값
    	var appId = $(click_history[0]).parent().attr("id");
    	var name = click_history[0].innerText.split(' ',1);
    	var rank = click_history[0].innerText.split(' ',2)[1];
		console.log("아이디 확인:", appId);
		console.log("이름 확인:", name);
		console.log("직급확인:", rank);
// 		console.log("클릭이벤트 확인 li의 텍스트 확인 :", $(click_history[0]).parent().text());
		
		if(document.getElementById('appLineChk')){
			console.log("결재자라인 있느지 체크")
			console.log("appLineBody.firstChild: " , appLineBody.firstChild);
			console.log("appLineBody.children[0]: " , appLineBody.children[0]);
			appLineBody.children[0].remove();
		}

		var addAppLinetrTag = document.createElement("tr")
		var indexTdTag = document.createElement("td")
		var tpyeTdTag = document.createElement("td")
		var memNameTdTag = document.createElement("td")
		var rankTdTag = document.createElement("td")
		var deleteTdTag = document.createElement("td")
		let trCnt = appLineBody.children.length;
		
		//순번
		indexTdTag.innerHTML= trCnt+1;
		indexTdTag.setAttribute('class','table-user')
		// indexTdTag.setAttribute('heigt','50px');
		indexTdTag.setAttribute('style','height:50px table-layout:fixed;');
		//결재유형(결재 vs 합의)
		tpyeTdTag.innerHTML = pthis.innerText.substring(0,2);
		//이름
		memNameTdTag.innerHTML = name;
		memNameTdTag.setAttribute("class",appId);
		
		//직급
		rankTdTag.innerHTML = rank;

		//삭제
		deleteTdTag.setAttribute("class","table-action text-center");
		deleteTdTag.innerHTML = '<a href="javascript: void(0);" class="action-icon" onclick="deleteAppLine(this)"> <i class="mdi mdi-delete"></i></a>'
		
		//요소 추가해주기
		addAppLinetrTag.append(indexTdTag);
		addAppLinetrTag.append(tpyeTdTag);
		addAppLinetrTag.append(rankTdTag);
		addAppLinetrTag.append(memNameTdTag);
		addAppLinetrTag.append(deleteTdTag);
		appLineTable.setAttribute('style','height:50px;');
		appLineBody.append(addAppLinetrTag);
			
			
			
    }
    
	//에디터 불러오기
   	window.onload = function() {
		   let ck = CKEDITOR.replace('reportForm');
		   CKEDITOR.editorConfig = function(config) {
   
			config.extraPlugins = 'autogrow'
		   };		
		
   	}

   	//first 모달 띄우기(template 목록)
   	function showForm(pthis) {
      	$("#bs-example-modal-lg").modal("hide");

      	var templateTitle = pthis.innerHTML.trim();
      	template = {
        "templateTitle" : templateTitle
      	}
      	console.log(templateTitle);
      	console.log(template);
      	$.ajax({
        	method : "post",
         	url : "/workfit/approval/getTemplate",
         	data : JSON.stringify(template),
         	contentType : "application/json;charset=utf-8",
         	dataType : "json",
         	beforeSend : function(xhr) {
            	xhr.setRequestHeader(header, token);
         	},
         	success : function(rslt) {
            	console.log(rslt);
            	console.log("제발 코드로 와라",rslt,approvalTemplateCode);
				$("#scrollable-modal").modal("show");
				docTitle.setAttribute("value", rslt.approvalTemplateTitle);
				approvalTemplateCode.setAttribute("value", rslt.approvalTemplateCode);
				CKEDITOR.instances.reportForm.setData(rslt.approvalTemplateContent);
        	}
      	})// ajax 종료

   	}//showForm() 종료
   
   	//양식내용 채우기 버튼이벤트
   	function fillCK(){
   		console.log("눌림?");
   		let ckContent = `
			<table cellspacing="0" style="border-collapse:collapse; width:100%">
	   		   <thead>
	   		      <tr>
	   		         <th colspan="8" style="border-color:inherit; text-align:center; vertical-align:top">
	   		         <h1>물품구매요청서</h1>
	   		         </th>
	   		      </tr>
	   		   </thead>
	   		   <tbody>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>요청일자</h3></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:top"><h4>&nbsp;2023&nbsp; 년&nbsp; 02월&nbsp; 14일</h4></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>구매기한</h3></td>
	   		         <td colspan="3" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:top"><h4>&nbsp;2023&nbsp; 년&nbsp; 02월 17일</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>요청부서</h3></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:top"><h4>&nbsp;인사부 1팀</h4></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>요청자</h3></td>
	   		         <td colspan="3" style="border-color:inherit; border-style:solid; border-width:1px; text-align:right; vertical-align:top"><h4>조현수(인)</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>건&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 명</h3></td>
	   		         <td colspan="6" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:top"><h4>&nbsp;2023년 DDIT 야유회 물품 신청</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>합계금액</h4></td>
	   		         <td colspan="6" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:top"><h4>&nbsp;일금 원정 (￦ ), 세액별도</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>No</h3></td>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>품목명</h3></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>규격</h3></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>수량</h3></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>단가</h3></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>금액</h3></td>
	   		         <td style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h3>수요처 (용도)</h3></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; height:30px;vertical-align:center"><h4>1</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>단체 운동복</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>프리 사이즈</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>50</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>50,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>2,500,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>행사</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>2</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>일회용기</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>소</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>70</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>300</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>21,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>3</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>족구용 그물망</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>-</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>1</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>80,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>80,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:top"><h4>족구용</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>4</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>축구공</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>-</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>2</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>50,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>100,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>축구,족구용</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>5</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>가스버너</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>-</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>12</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>27,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>294,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>6</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>전골 냄비</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>32cm형</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>12</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>16,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>192,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>7</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>종이컵</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>178ml 1,000개</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>1</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>13,500</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>13,500</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>8</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>야외 테이블</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>원형</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>15</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>30,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>450,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식, 행사</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>9</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>전골 밀키트</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>1kg</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>20</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>16,900</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>339,800</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>10</h4></td>
	   		         <td colspan="2" style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>맥주</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>12개입 1박스</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>10</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>29,900</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>299,000</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>취식</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>합계</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>&nbsp;</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>&nbsp;</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>&nbsp;</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>&nbsp;</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>4,289,300</h4></td>
	   		         <td style="border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>&nbsp;</h4></td>
	   		      </tr>
	   		      <tr>
	   		         <td colspan="2" style="background-color:#efefef; border-color:inherit; border-style:solid; border-width:1px; text-align:center; vertical-align:center"><h4>비고</h4></td>
	   		         <td colspan="6" style="border-color:inherit; border-style:solid; border-width:1px; text-align:left; vertical-align:center"><h4>&nbsp; &nbsp; &nbsp;단체 운동복은 사이즈 조사가 필요합니다</h4></td>
	   		      </tr>
	   		   </tbody>
	   		</table>
		   			`;
			CKEDITOR.instances.reportForm.setData(ckContent);
   	}
				   
   	

   	function openThirdModal(){
      	$("#a").modal("show"); 
   	}
   

   	//---------------------------영호꺼--------------------------------------------------------------------------------------------------------------------------------------------//
   	$(function() {
		
		$.ajax({
			type : 'get',
			url : '/workfit/getTreeData',
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
					
//						var codeLvl = e.codeLvl;
					
					// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
					var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><i class="dripicons-folder" style="font-size : 18px;"></i><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><i class="dripicons-user" style="font-size : 18px;"></i><span onclick="oneclick(this)" style="font-size : 18px;">'+codeNm+'</span></li>';
					
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
							          li = "<ul style='display : none;'>" + li + "</ul>";
										
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
	                		
	                		console.log("더블클릭 했어?");
		        	
		        	
	            		}) // 더블클릭에 대한 이벤트 설정 끝 
	            		
	    				
	        		
	        	} // for문 끝 
	        	
				
	        	
	        	// 우클릭에 대한 이벤트 로직  + 부모 li의 폴더를 하나씩 지워주는 로직도 추가 + 파일 li의 i태그를 지워주는 로직도 추가 
            	var Contextmenu = !function() {
        			
        			
        			var allLi = $("ul[id='codeList'] li");
        			
        			for(let i = 0; i < allLi.length; i++){
        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
							// 모든 li요소들 중 파일인 녀석들만 우클릭 시 원하는 메뉴가 나오도록 설정함    
							
							// li요소들 중에 i태그(폴더 그림)을 지워준다.. 
							$(allLi[i]).find(".dripicons-folder").remove();
							$(allLi[i]).find("img").css("display","none");
							
        					
        				}else{  // 여기서 폴더를 한 개씩 제거 해주는 작업을 해준다 
        					$(allLi[i]).children("img")[0].remove();
        					$(allLi[i]).children(".dripicons-user").remove();
        					
        				}
        			}
        			
        			
        			
        		}();  // var Contextmenu 끝 
	        	


				
        		
        		
        		
			} // success  
			
			

			
				
			
		}) // ajax 끝 
		
		

		
		
    		
    		
	}); // $(function(){}) 끝 

	
	
	
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
			$(a).attr("class", "hitarea collapsable-hitarea")
			return;
		}

		if($(a).attr("class") == "hitarea collapsable-hitarea"){
			
			$(a).attr("class", "hitarea expandable-hitarea")
			return;
		}
		
		
		
		// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
		if($(a).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
			$(a).parent().attr("class","closed collapsable lastCollapsable");
			return;
		}
		
		if($(a).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
			$(a).parent().attr("class","closed expandable lastExpandable");
			return;
			
			
		}
		
		
	}
	
	
	// window 객체로 선언함 
	click_history = []; 
	
	function oneclick(a){
		
		click_history.push(a); 	
		
		if(click_history.length == 1){
//				$(a).css("background-color","green");
			$(a).addClass('clickMember');
			
		}else{
			
			for(let i = 0; i < click_history.length - 1; i++){
				$(click_history[i]).removeClass('clickMember');
			}

			for(let i = 0; i < click_history.length - 1; i++){
				click_history.shift();
			}
			
			$(a).addClass('clickMember');
//				$(a).add("background-color","green");
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
//			$(result).children("span").click();
		
		result2 = [...$("ul[id='codeList'] li")].filter(element => {
//				if($(element).find(result).length != 0){

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
		
		
//			if(!folderOpenFlag){
			
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
//			}
		
		
	}		
			
//----------------------------------------영호꺼 끝---------------------------------------------------------//
</script>

<style>
.second-modal {
	width: 70%;
}

.third-modal {
	width: 70%;
}

.fourth-modal{
	top:200px;
}

/* 조직도에서 클릭 시 색상을 입혀주는 클래스 시작 */
	.clickMember{
					color: #464646;
/*   				    background-color: #35b8e0; */
   				    border-color: #35b8e0;
   				    font-weight : bold;
   				    font-size : 23px !important;
				}
/* 조직도에서 클릭 시 색상을 입혀주는 클래스 끝 */


.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.listTbl tr:hover{
	background-color: #e7ecf1;    

}

.listTbl th, .listTbl td{
	border-bottom: 1px solid #dbdee0 !important;
}

#btnForHover:hover{
	background-color: #e7ecf1;  
}

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