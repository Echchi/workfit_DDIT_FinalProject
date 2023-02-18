<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <link rel="stylesheet"	href="${pageContext.request.contextPath }/resources/Puppertino/dist/css/newfull.css" /> --%>
<c:set value="${postVO }" var="postVO"/>

<input type="hidden" name="memId" value="${memId}" />
<input type="hidden" name="boardCode" value="${Cd}" />
<input type="hidden" name="boardType" value="${boardType}" />
<input type="hidden" id="test" name="postPopup" value="" />
<div>
	<div class="row mt-2 apple3">
		<div class="col-12">
			<div class="card workfitCardBg">
				<div class="card-body m-3">
						<div class='card p-3' style="border-radius: 0.7rem;">
							<div class="ml-4">
								<h5 id="headTitle" class='apple4 page-title text-dark'
									style='font-size: 45px; letter-spacing: 2px; display: inline-block;text-align:center;'>
									${postVO.postTitle }</h5>
							</div>
<!-- 							<hr/> -->
<!-- 							<div class="row ml-1 mt-1"> -->
<!-- 									<span class="apple3 text-dark member" style="font-size: 19px;"> -->
<%-- 										<span class="apple3 text-dark member">작성자 : </span> ${postVO.memName} --%>
<%-- 									</span>조회 : ${postVO.postHit} --%>
<!-- 							</div> -->
							<div class="row ml-1 ml-4">
								<span class="apple3 text-dark member" style="font-size: 23px;">작성자 : ${postVO.memName}</span>
								<span class="ml-2 text-dark" style="font-size: 23px;">작성일 : <fmt:formatDate value="${postVO.postDate}" pattern="YYYY.MM.dd. HH:mm"/></span>
							</div>
							<br/>
							<hr class="ml-4"/>
							<div class="apple4 mt-3 ml-4" style="font-size: 26px;">${postVO.postContent}</div>
							<div class="m-3 pb-0">
								
								<ul class="col-12 md-1 clearfix" style="margin-left:10px;">
									<c:if test="${not empty postVO.boardAttachs}">
										<h4 class="apple4 text-dark" style="font-size: 23px;">첨부 파일</h4>
										<hr/>
										
										<c:forEach items="${postVO.boardAttachs }" var="boardAttach" varStatus="vs">
												<li style="float: left;margin-left: 10px; font-size:21px;">
												<div class="mailbox-attachment-info">${boardAttach.boardAttachName }	
		<!-- 												<span class="mailbox-attachment-size clearfix mt-1"> -->
														<c:set value="${boardAttach.boardAttachSize }" var="size" />
														<span id="filesize">  ${size}</span> <a href="/workfit/board/freeBoard/get/${boardAttach.boardAttachCode }">
														 <i class="dripicons-download"></i> </a>
		<!-- 													 <i class="dripicons-cloud-download"></i> </a> -->
		<!-- 												</span> -->
												</div>
												</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					<!--  
					<div class="row">
						<div class="form-group col-md-6"style="background-color: #666666">
							<div class="ellipsis text-muted font-12">
								<span itemprop="publisher"> <span class="member">
										<span> &nbsp; 작성자 : </span> ${postVO.memId}
								</span> <i class="fa fa-eye">${postVO.postHit}</i>
								</span>
							</div>
						</div>
						<div class="form-group col-md-6" style="background-color: #222222">
							<div class="apple3 page-title text-white">
								<span class="sp"></span> <span class="pull-right"> <i
									class="fa fa-clock-o"></i> 작성일 : <span>
										${postVO.postDate} </span>
								</span>
							</div>
						</div>
					</div>
					-->
					
						<div class="m-3 d-flex justify-content-end">
							<button type="button"  class="apple4 btn mr-2" style ="font-size:19px; color:white; background-color:#5F7CBB;"  id="updateBtn">수정</button>
							<button type="button" class="apple4 btn btn-light mr-2" style="font-size:19px;" id="delBtn">삭제</button>
							<button type="button" class="apple4 btn btn-secondary apple4 " style ="font-size:19px;" id="listBtn">목록</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="updateForm" method="get" action="/workfit/board/freeBoard/modify">
	<sec:csrfInput/>
	<input type="hidden" name ="postCode" value="${postVO.postCode }">
</form>

<%-- 	<input type="hidden" name ="postCode" value="${postVO}"> --%>


<!-- 	<button id="summernote-edit" class="btn btn-primary btn-sm"> -->
<!-- 		<i class="mdi mdi-pencil mr-1"></i> Edit -->
<!-- 	</button> -->
<!-- 	<button type="submit" id="formBtn" class="btn btn-primary">Submit</button> -->
          
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />        
<script>
var size = document.querySelectorAll('#filesize');
var boardType = document.querySelector('input[name="boardType"]').value;
function formatBytes(bytes, decimals = 2) {
    if (bytes === 0) return '0 Bytes';		// 숫자 형식까지 완벽하게 0 이면 0 Bytes

    const k = 1024;							// 2의 10승, 용량 별 단위 구간.
    const dm = decimals < 0 ? 0 : decimals;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
};
var alert = function(msg, type) {
	swal({
		title : '',
		text : msg,
		type : type,
		timer : 1500,
		customClass : 'sweet-size',
		showConfirmButton : false
	});
}


function Alert() {
	alert('gg', 'success');
}
function Confirm() {
	confirm('', '정말로 삭제하시겠습니까?');
}
$(document).ready(function() {
	var updateForm = $("#updateForm");
	var listBtn = $("#listBtn");
	var updateBtn = $("#updateBtn");
	var delBtn = $("#delBtn");

	
	for(let i in size){
		size[i].innerHTML = formatBytes(size[i].innerHTML);
	}
	
	
	listBtn.on("click", function() {
		location.href = "/workfit/board/list/"+boardType;
	});

	updateBtn.on("click", function() {
		updateForm.submit();
	});

	delBtn.on("click", function() {
// 		swal({
// 			title: '정말로 그렇게 하시겠습니까?',
// 	     	text: "다시 되돌릴 수 없습니다. 신중하세요.",
// 			icon : "warning",
// 			showCancelButton : true,
// 			confirmButtonClass : "btn-danger",
// 			confirmButtonText : "예",
// 			cancelButtonText : "아니오",
// // 			closeOnConfirm : false,
// // 			closeOnCancel : true,
// 		}).then((result) => {
// 			if(result.isConfirmed){
// 				swal(
// 					'삭제가 완료되었습니다.',
// 					'복구할 수 없습니다.',
// 					'success'
// 				)
// 			}
// 		})
		if (confirm("정말로 삭제하시겠습니까?")) {
			updateForm.attr("method", "post");
			updateForm.attr("action", "/workfit/board/freeBoard/delete");
			updateForm.submit();
		} else {
			updateForm.reset();
		}
	});

});
</script>