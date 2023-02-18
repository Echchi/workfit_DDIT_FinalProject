<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
hr{
	border: 0;
	height : 1.5px;
	background-color: #dbdee0;
	
}
</style>
<script>


function formatBytes(bytes, decimals = 2) {
    if (bytes === 0) return '0 Bytes';      // 숫자 형식까지 완벽하게 0 이면 0 Bytes

    const k = 1024;                     // 2의 10승, 용량 별 단위 구간.
    const dm = decimals < 0 ? 0 : decimals;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}

$(function(){
	
	// el로 받아온 파일의 사이즈 값들을 자바스크립트 함수를 통해 값을 포맷팅하고 해당 값을 다큐먼트를 로딩하고 나서 알맞은 태그를 찾아 자바스크립트 변수로 대입해주는 방식이라면?? 
	var mailAttachFileList = '${mailAttachFileJsonString}';
	
	if(mailAttachFileList != ''){
		var mailFileArr = JSON.parse(mailAttachFileList);
		
		for(el of mailFileArr){
			var formattedByte = formatBytes(el.emailAttachSize);
			
			$("#"+el.emailAttachCode).text(formattedByte);
			
		}
		
		
		
		
	}
	
})

</script>
<%-- <c:out value="${memData }"></c:out> --%>
<%-- <c:out value="${mailData }"></c:out> --%>
<%-- <c:out value="${mailTargetDatas }"></c:out> --%>
<div class='row mt-2'>
	<div class='col-12'>
		<div class='card mr-2 workfitCardBg'>
			<div class='card-body p-4'>
				<!--            <div class='card-title'> -->
				
				<!--       ////       -->
				<div class='card workfitCardBg'>
					<div class='card-body p-4'>
						<!-- ---월내 있던 내용 시작 !!!!! -->
						<c:if test="${mailListFlag eq 'sendList'}">
							<c:set var="mailFlag" value="sended"></c:set>
						</c:if>
		
						<c:if test="${mailListFlag eq 'receiveList'}">
							<c:set var="mailFlag" value="received"></c:set>
						</c:if>
		
						<c:if test="${mailListFlag eq 'importantList'}">
							<c:set var="mailFlag" value="important"></c:set>
						</c:if>
		
						<c:if test="${mailListFlag eq 'tempList'}">
							<c:set var="mailFlag" value="temp"></c:set>
						</c:if>
		
						<c:if test="${mailListFlag eq 'trashList'}">
							<c:set var="mailFlag" value="trash"></c:set>
						</c:if>
		
						<div class="row justify-content-between ml-1 mr-1">
							<div>
								<h5 id="headTitle" class='apple4 page-title text-dark'
									style='font-size: 45px; letter-spacing: 2px; display: inline-block;'>
									${mailData.emailTitle }</h5>
							</div>
							<div class="mb-3">
								<%--                   <a href="/workfit/mail/mailDetail?memId=${mailData.memId }&emailCode=${mailData.emailCode }&mailListFlag=replyMail" class="btn btn-secondary mr-2"><i class="mdi mdi-reply mr-1"></i>답장하기</a> --%>
								<a
									href="/workfit/mail/mailDetail?memId=${mailData.memId }&emailCode=${mailData.emailCode }&mailListFlag=replyMail"
									class="btn mr-2" style="font-size: 17px; color: white; background-color:  #5F7CBB"><i
									class="mdi mdi-reply mr-1"></i>답장하기
								</a>
								<a href="/workfit/mail/sendedMailView?mailFlag=${mailFlag }" style="font-size: 17px;"
									class="btn btn-light">목록으로 <i class="mdi mdi-forward ml-1"></i>
								</a>
							</div>

						</div>
						<div class="media mb-3 mt-3 ml-2">
							<c:if test="${empty memData.memProfileUrl }">
								<div class="rounded-circle text-center mr-2" 
									style="margin: auto; font-size: 22px; line-height: 45px; width : 37px; height: 45px; 
											box-shadow: 0px 0px 7px #1a1818db; background-color : #ededed; ">
									${fn:substring(memData.memName,0,1) }
								</div>
							</c:if>
							<c:if test="${!empty memData.memProfileUrl  }">
								<img class="d-flex mr-2 rounded-circle"
									style="box-shadow: 0px 0px 7px #1a1818db;"
									src="${pageContext.request.contextPath }${memData.memProfileUrl}"
									alt="placeholder image" height="45" width="45">
							</c:if>
							<div class="media-body">
								<%--                       <small class="float-right apple-3" style="padding-right : 26px;"><fmt:formatDate value="${mailData.emailDate }" pattern="yyyy.MM.dd. HH:mm"/></small> --%>
								<p class="float-right apple3"
									style="font-size: 19px; padding-right: 26px;">
									<fmt:formatDate value="${mailData.emailDate }"
										pattern="yyyy.MM.dd. HH:mm" />
								</p>
								<h6 class="m-0 apple5 text-dark" style="font-size : 23px">${memData.memName}</h6>
								<small class="apple3" style="font-size: 20px;">${memData.memEmail }</small>
							</div>
						</div>
						<table class="ml-2 apple4" style="font-size: 16px">
							<c:if test="${mailListFlag eq 'sendList'}">
								<tr>
									<td>수신자</td>
									
									<td class="apple4 text-dark"><c:forEach
											items="${receiverList}" var="receiver" varStatus="loop">

											<c:if test="${loop.first }">&nbsp;&nbsp;&nbsp;</c:if>${receiver.memName }(${receiver.memEmail })<c:if
												test="${!loop.last }">,</c:if>&nbsp;
	                  	  		</c:forEach></td>
									
								</tr>
							</c:if>						
						
							<c:if test="${not empty refererList }">
								<tr>
									<td>참조자</td>

									<td class="apple4 text-dark"><c:forEach
											items="${refererList}" var="referer" varStatus="loop">

											<c:if test="${loop.first }">&nbsp;&nbsp;&nbsp;</c:if>${referer.memName }(${referer.memEmail })<c:if
												test="${!loop.last }">,</c:if>&nbsp;
	                  	  		</c:forEach></td>
								</tr>
							</c:if>


							<c:if test="${not empty hiderefererList }">
								<tr>
									<td>숨은 참조자</td>
									<td class="apple4 text-dark"><c:forEach
											items="${hiderefererList}" var="hidereferer"
											varStatus="loop2">
											<c:if test="${loop2.first }">&nbsp;&nbsp;&nbsp;</c:if>${hidereferer.memName }(${hidereferer.memEmail })<c:if
												test="${!loop2.last }">,</c:if>&nbsp;
		                  	  	</c:forEach></td>
								</tr>
							</c:if>
						</table>
						<hr>
						<!-- ---원래 있던 내용 끝 !  !!!!! 영호야 내가카드 넣었어.... 그리고 중간에 ul li 주석들 지움 ! -->
						<div class="apple3 text-dark mt-5 mb-5 ml-2" style="font-size: 19px;">
							${mailData.emailContent }
						</div>
						<hr>
						<c:if test="${not empty mailAttachFile}">
							<h5 class="mb-3 apple3 text-dark" style="font-size: 20px;">첨부파일</h5>

							<div class="row">
								<c:forEach items="${mailAttachFile }" var="mailFile">
									<div class="col-xl-4 apple4 text-dark" style="font-size: 17px">
										<div class="card mb-1 shadow-none border">
											<div class="p-2">
												<div class="row align-items-center">
													<div class="col-auto">
														<div class="avatar-sm">
															<c:choose>
																<c:when
																	test="${fn:split(mailFile.emailAttachName,'.')[1] eq 'pdf' }">
																	<img
																		src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/pdf.svg">
																	<%--                                       			<img src="http://${mailFile.emailAttachPath }" alt="errorOcurred"> --%>
																</c:when>
																<c:when
																	test="${fn:split(mailFile.emailAttachName,'.')[1] eq 'xlsx' }">
																	<img
																		src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/xls.svg">
																</c:when>
																<c:when
																	test="${fn:split(mailFile.emailAttachName,'.')[1] eq 'jpg' or fn:split(mailFile.emailAttachName,'.')[1] eq 'png'}">
																	<img width="48" height="48"
																		src="/workfit/mail/showImgFile/${mailFile.emailAttachCode}" />
																</c:when>
																<c:otherwise>
																	<img
																		src="https://coderthemes.com/highdmin/layouts/assets/images/file_icons/doc.svg">
																</c:otherwise>
															</c:choose>

															<%--                                       	  <c:if test="${fn:split(mailFile.emailAttachName,'.')[1] eq 'pdf' }"> --%>

															<%--                                       	  </c:if>	 --%>

															<!--                                           <span class="avatar-title bg-primary-lighten text-primary rounded"> -->
															<!--                                               .ZIP -->
															<!--                                           </span> -->
														</div>
													</div>
													<div class="col pl-0">
														<a
															href="/workfit/mail/downFile/${mailFile.emailAttachCode }"
															class="font-weight-bold text-dark">${mailFile.emailAttachName }</a>
														<%--                                       <fmt:formatNumber value="${mailFile.emailAttachSize / 1024 / 1024}" pattern="#.##"/>MB --%>
														<p class="mb-0 text-muted" id="${mailFile.emailAttachCode }"></p>
													</div>

													<div class="col-auto">
														<!-- Button -->
														<a
															href="/workfit/mail/downFile/${mailFile.emailAttachCode }"
															class="btn btn-link btn-lg text-muted"> <i
															class="dripicons-download"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end col -->
									<!-- end row-->
								</c:forEach>
							</div>
				</c:if>
			</div>
		</div>

			</div>
		</div>
	</div>
</div>



