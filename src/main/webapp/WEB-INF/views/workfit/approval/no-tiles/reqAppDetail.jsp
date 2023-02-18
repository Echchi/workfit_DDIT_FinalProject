<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<div class="modal-content" id="appvDetail4Detail" >
	<div class="modal-header">
		<h4 class="apple5 modal-title text-dark" id="appvReqModalDetail">문서번호 : ${DocCode }</h4>
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
	</div>
	<div class="modal-body">
		<div class="card p-3">
					<div class="row justify-content-between pl-4 pr-4">
						<span class="apple3 text-dark" style="font-size:19px;">문서번호 :   ${DocCode }</span>
						<fmt:formatDate var="StartDate" pattern="YYYY.MM.dd." value="${startVO.approvalDate  }" />
						<span class="apple3 text-dark" style="font-size:19px;">작성일 :   ${StartDate }</span>
					</div>
			<div class="card-body">
				<div class="card-title mb-3 ml-2">
					<h4 class="apple5 modal-title text-dark" style="font-size:31px;">${approvalDoc.approvalDocTitle }</h4>
					<div class='row mb-3 mt-3'>
						<div class='col-sm-4'>
							<button type="button" style="font-size:19px;" class="btn btn-outline-dark">문서복사</button>
							<button type="button" style="font-size:19px;" class="btn btn-outline-dark" id="appvDetailPrint">문서출력</button>
							
						</div>
<%-- 						<c:if test="${status eq 'requested' }"> --%>
<!-- 							<div class='col-sm-4'> -->
<!-- 								<div class='text-sm-left'> -->
<%-- 									<button type='button' class='apple3 btn btn-light mb-2' style="color:white; background-color:#5F7CBB; font-size:19px;" data-DocCode="${DocCode }" data-toggle="modal" data-target="#reqAppDetailModalComment">승인</button> --%>
<%-- 									<button type='button' class='apple3 btn btn-light mb-2' style="font-size:19px;" data-DocCode="${DocCode }" data-toggle="modal" data-target="#reqAppDetailModalRejComment">반려</button> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:if> --%>
					</div>
				</div>
				<div class="card-text  mb-5">
					<h4 class="apple4 text-dark ml-2" style="font-size:21px;">결재선</h4>
					<table class='alternative-page-datatable table mb-0 ml-2'>
						<thead>
							<tr  style="font-size:19px;">
								<th class='apple2 text-dark text-center' scope='col'>순서</th>
								<th class='apple2 text-dark text-center' scope='col'>직급</th>
								<th class='apple2 text-dark text-center' scope='col'>이름</</th>
								<th class='apple2 text-dark text-center' scope='col'>구분</th>                                                             
								<th class='apple2 text-dark text-center' scope='col'>결재상태</th>
								<th class='apple2 text-dark text-center' scope='col'>일시</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${approvalList }" var="approval">
								<tr style="font-size:19px;">
									<td class='apple4 text-dark text-center'>${approval.approvalFlag }</td>
									<td class='apple4 text-dark text-center'>${approval.approvalMemGrade }</td>
									<td class='apple4 text-dark text-center'>${approval.memName }</td>
									<td class='apple4 text-dark text-center'>
										<c:if test="${approval.agreementStatus  eq '합의'}">
												${approval.agreementStatus }
										</c:if> 
										<c:if test="${approval.agreementStatus  eq '협조'}">
												${approval.agreementStatus }
										</c:if>
										<c:if test="${approval.agreementStatus  eq '결재'}">
												${approval.agreementStatus }
										</c:if>
									</td>
									<c:if test="${approval.approvalStatus  eq '0'}">
											<c:set value="대기" var="status2" />
										</c:if>
										<c:if test="${approval.approvalStatus  eq '1'}">
											<c:set value="승인" var="status2" />
										</c:if>
										<c:if test="${approval.approvalStatus  eq '2'}">
											<c:set value="반려" var="status2" />
										</c:if>
										<c:if test="${approval.approvalStatus  eq '3'}">
											<c:set value="취소" var="status2" />
										</c:if>
										<td class='apple4 text-dark checkColor text-center' >${status2 }</td>
										
										<td class='apple4 text-dark text-center'><fmt:formatDate value="${approval.approvalDate}" pattern="YYYY.MM.dd. hh:mm" type="date"/></td>
					
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="card-body  mt-3 mb-5" style="background-color:  #F1F4F5;">
						<div class='row mb-2'>
							<div class='col-sm-4'>
								<h4 class="apple3 text-dark ml-2" style="font-size:21px; ">참조</h4>
							</div>
							<div class='col-sm-8 '>
								<div class="text-sm-right" style="font-size:19px;"> 
								<c:if test="${status eq 'requested'  || status eq 'processed'  || status eq 'canceled' }">
									<a id="addRef" data-DocCode="${DocCode }" data-toggle="modal" data-target="#addRefModal" class="apple4" href="#">+ 참조자</a>
								</c:if>
								</div>
							</div>
						</div>
							<div id="addRefListDiv"class="row"  style="font-size:19px;">
								<c:forEach items="${approvalDoc.approvalReferenceList }" var="ref">
									<div class="apple4 ml-3 mr-2 text-dark" style="font-size:19px;">${ref.memName }</div>
								</c:forEach>
							</div>
					</div>
				</div>
				<div class="card-text  mb-5">
<!-- 					<h4 class="apple4 text-dark ml-2" style="font-size:21px;">내용</h4> -->
					<div class="text-center">${approvalDoc.approvalContent }</div>
				</div>

				<div class="card-text  mb-5">
					<div class='row mb-2'>
						<div class='col-sm-4'>
							<h4 class="apple4 text-dark ml-2" style="font-size:21px;">관련문서</h4>
						</div>
						<div class='col-sm-8 ' style="font-size:19px;">
							<div class="text-sm-right" >
							<c:if test="${status eq 'requested'}">
								<a id="addAttachModalId" data-DocCode="${DocCode }" data-toggle="modal" data-target="#addAttachModal" class="apple4" href="#">+ 첨부파일</a>
							</c:if>
							</div>
						</div>
					</div>
					<table class='alternative-page-datatable table mb-0'>
						<thead>
							<tr style="font-size:19px;">
								<th class='apple2 text-dark' scope='col'>파일명</th>
								<th class='apple2 text-dark' scope='col'>파일</</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty approvalAttachList}">
								<tr class="mt-3">
									<td colspan='2' class=' apple4 text-dark text-center' style="font-size:19px;">첨부된 관련 문서가 없습니다</td>
								</tr>
							</c:if>
							<c:forEach items="${approvalAttachList }" var="appatt" varStatus="index">
								<tr>
									
									<td class='apple4 text-dark' style="font-size:17px;">${appatt.approvalAttachName }</td>
									<%-- 										<td class='apple4 text-dark'><a href="${appatt.approvalSavepath }" ></a></td> --%>
									<td class='apple4 text-dark' style="font-size:17px;"><a
										href="${appatt.approvalAttachSavepath }"
										download="${approvalDoc.approvalDocTitle } 관련문서_(${index.count })">${appatt.approvalAttachSavepath }</a></td>
								</tr>
							</c:forEach>
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
						<tbody>
							<c:if test="${empty approvalList}">
								<tr class="mt-3">
									<td colspan='2' class=' apple4 text-dark text-center'
										style="font-size: 19px;">작성된 의견이 없습니다</td>
								</tr>
							</c:if>


							<c:forEach items="${approvalList }" var="appcc">
								<c:if test="${!empty appcc.approvalComment }">
									<tr style="font-size:19px;">
										<td class='apple4 text-dark'>${appcc.memName }</td>
										<td class='apple4 text-dark text-center'>${appcc.approvalComment }</td>
										<fmt:formatDate var="appccDate" pattern="YYYY.MM.dd." value="${appcc.approvalDate  }" />
										<td class='apple4 text-dark'>${appccDate }</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>
			<!--  card body 끝 -->
		</div>
	</div>
	<div class="modal-footer">
		<c:if test="${status eq 'requested' }">
			<button type='button' class='apple3 btn btn-light mb-2' style="color:white; background-color:#5F7CBB; font-size:19px;" data-DocCode="${DocCode }" data-toggle="modal" data-target="#reqAppDetailModalComment">승인</button>
			<button type='button' class='apple3 btn btn-light mb-2' style="font-size:19px;" data-DocCode="${DocCode }" data-toggle="modal" data-target="#reqAppDetailModalRejComment">반려</button>
		</c:if>
<!-- 		<button type="button" class="btn btn-light apple4" data-dismiss="modal">닫기</button> -->
	</div>
</div>




<script src="/resources/html2canvas/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script>
var commentDocCode = "${DocCode }";		// 의견에 쓰는 닥코드
console.log("check:",commentDocCode);
var addRef = document.querySelector("#addRef");	// 참조자 버튼
var addRefListDiv = document.querySelector("#addRefListDiv");	// 참조자 추가 리스트 띄우는 div
// var appvDetailPrint = document.querySelector("#appvDetailPrint");	// 참조자 추가 리스트 띄우는 div


$(document).ready(function(){
	console.log("winddow.onload 작동해?")
  	var checkColor = document.querySelectorAll(".checkColor");
  	console.log("checkColor:",checkColor);		
  	
  	for(var i of checkColor){
	  	console.log("checkColorParentElement:",i.parentElement);		
// 		i.parentElement.className('apple4 text-dark text-center');
		if(i.innerText == '승인'){
			i.parentElement.setAttribute('style','background-color:  #F1F4F5; font-size:19px;');
		}
	
		if(i.innerText == '반려'){
			i.parentElement.setAttribute('style','background-color: #fc694533; font-size:19px;');
		}
  	}
});

function appvDetailPrintHandler(){
    window.scrollTo(0, 0);
	console.log("프린트 눌림")
	const el = document.getElementById('appvDetail4Detail');
	console.log("ScrollHeight :::",el.scrollHeight);
	el.style.height = el.scrollHeight + 'px'
	console.log("el.scrollHeight : " + el.scrollHeight);
// 	el.style.width = '1800px';
// 	el.style.paddingBottom = '10px';
    html2canvas($('#appvDetail4Detail')[0]).then(
          function(canvas) {

             var myImg = canvas.toDataURL("image/jpg");
             // html 파트를 canvas로 변환, url(base64)로 변환 저장.
			
//              console.log(myImg);
             // A4 크기 : 210 x 270 (비율 상 : 1.414)
             var pagewidth = 210;
             var pageheight = pagewidth * 1.414;
             //          var pagewidth = 210;
             //          var pageheight = 190;
             var imgWidth = pagewidth;
             //          var imgHeight = canvas.height * imgWidth / canvas.width;

//              var imgHeight = canvas.height * imgWidth / canvas.width;
             var imgHeight = canvas.height * imgWidth / canvas.width;
             // canvas.height : 실제 화면에 투사되는 html의 태그 의 높이, 너비.
             // Ex. 윈도우 창의 크기나 콘솔로 인해 출력되는 부분이 좁아지면 같이 좁아짐.
             // 전체 화면이면 해상도의 크기가 출력된다고 이해하면 편함.

             // 1080 * imgWidth / 1920
             // 출력된 Canvas의 비율을 구해서 높이를 구하는 식.
             var heightLeft = imgHeight;

             //          var imgHeight = pageheight *1.414 -10; 
//              console.log("canvas.height :", canvas.height)
//              console.log("canvas.width :", canvas.width)
//              console.log("pagewidth :", pagewidth)
//              console.log("pageheight :", pageheight)
//              console.log("imgWidth :", imgWidth)
//              console.log("imgHeight :", imgHeight)
//              console.log("heightLeft :", heightLeft)
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
                if (heightLeft > 30) {
                   doc.addPage();
                }
                
                console.log("canvas.height :", canvas.height)
                console.log("canvas.width :", canvas.width)
                console.log("pagewidth :", pagewidth)
                console.log("pageheight :", pageheight)
                console.log("imgWidth :", imgWidth)
                console.log("imgHeight :", imgHeight)
                console.log("heightLeft :", heightLeft)
                
                console.log("position :", position)
                
             }
             doc.save("${DocCode }.pdf");
	});
//     appvDetailPrint.style.width = 'auto';
}
appvDetailPrint.addEventListener("click", appvDetailPrintHandler);



</script>

