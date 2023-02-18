<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
tr:not(#tableHead):hover{
	background : #e7ecf1;
}
.emailTable th, .emailTable td {
    vertical-align : middle;
    border-bottom: 1.5px solid #dbdee0 !important;
    border-top: 1.5px solid #dbdee0 !important;
}
</style>


<script>
	
	function fn_mailDetailView(a){
// 		console.log($(a).find("a").attr("href"));

		

		location.href = $(a).parent().find(".email-subject").attr("href");
	}

	function fn_goMailWriteView(){
		location.href = "/workfit/mail/mailWrite";
	}
	
	function fn_deleteMail(a){
		
// 		if(confirm("삭제하시겠습니까?")){
			
// 			// 삭제를 하고자 하는 메일의 메일코드 
// 			var mailCode = $(a).attr("id");
// 			// 메일플래그 
// 			var mailFlag = '${mailListFlag}';
			
// // 			console.log(mailCode);
// // 			console.log(mailFlag);
			
// 			// DB상에서 메일상태를 삭제 상태로 바꿔주고 
// 			var header = '${_csrf.headerName}';
// 			var token =  '${_csrf.token}';
// 			$.ajax({
// 				url : "/workfit/mail/deleteMail",
// 				type : "post",
// 				data : {emailCode : mailCode, mailFlag : mailFlag},
// 				beforeSend: function(xhr) {
// 		            xhr.setRequestHeader(header, token);
// 				},
// 				success : function(res){
// 					alert("메일이 삭제되었습니다!");
// 					// 비동기적으로 해당 행을 지워주는 로직 작성하기 
// 					$(a).parents("tr").remove();
					
					
					
					
// 				}
				
// 			});
			
// 		}
	}
	
	$(function(){
		
		
		
	    // 데이터 테이블 시작........  ///////////////////////// 
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
        
        console.log("dt있는지?:", $.fn.dataTable.isDataTable('#basic-datatable'));
        
        
        $('#basic-datatable').DataTable({
           destroy : false,
           info : false,
           lengthChange : false,
           language : lang_kor
        });
        
        $('.dataTables_paginate').addClass('pagination-rounded');
		
		// 데이터 테이블 옵션 먹이기 끝........ ----------------------------------------------
		
		
		
		
		
// 		console.log("부모 노드 확인 좀"+$("#basic-datatable_length").parent())
// 		console.log($("#basic-datatable_length").children("label"));
// 		$("#basic-datatable_length").children("label").remove();

		[...$(".trash_mail")].map((ele)=>{
			ele.addEventListener("click",function(e){
				
				e.stopPropagation();
				
				
				
				
// 				< 사라지는 초록색 박스 >
// 				alert("승인완료")
// 				toastr.success( '<h4 style="font-size:17px;" class="apple4">승인완료</h4>');

// 				<사라지는 빨간색 박스>
// 				alert("반려완료")
// 				toastr.error( '<h4 style="font-size:17px;" class="apple4">반려완료</h4>');
				
				
				
				
				
				if(confirm("삭제하시겠습니까?")){
					
					// 삭제를 하고자 하는 메일의 메일코드 
					var mailCode = $(ele).attr("id");
					// 메일플래그 
					var mailFlag = '${mailListFlag}';
					
//		 			console.log(mailCode);
//		 			console.log(mailFlag);
					
					// DB상에서 메일상태를 삭제 상태로 바꿔주고 
					var header = '${_csrf.headerName}';
					var token =  '${_csrf.token}';
					$.ajax({
						url : "/workfit/mail/deleteMail",
						type : "post",
						data : {emailCode : mailCode, mailFlag : mailFlag},
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
						},
						success : function(res){
							alert("메일이 삭제되었습니다!");
							// 비동기적으로 해당 행을 지워주는 로직 작성하기 
							$(ele).parents("tr").remove();
							
							
							
							
						}
						
					});
					
				}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			})
			
		})


	})
	
	function fn_changeStar(a){
		console.log($(a).attr("class"));
		
		var mailFlag = '${mailListFlag}';
		var emailStatus = '';
		if($(a).attr("class").includes("outline")){ // 중요 메일이 아닐 때 ==> 중요 메일로 업데이트 
			$(a).attr("class","mdi mdi-star");
			emailStatus = '2';
		
		}else{
			$(a).attr("class","mdi mdi-star-outline");
			emailStatus = '0';
			
		}
			// 받은 메일함에서 클릭한 경우 + 보낸 메일함에서 클릭한 경우 둘 다 고려 
			var header = '${_csrf.headerName}';
			var token =  '${_csrf.token}';
			$.ajax({
				url : "/workfit/mail/updateImportantMail",
				type : "post",
				data : {emailCode : $(a).attr("id"), mailFlag : mailFlag, emailStatus : emailStatus},
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
				},
				success : function(res){
// 					alert("메일이 삭제되었습니다!");
					// 비동기적으로 해당 행을 지워주는 로직 작성하기 
// 					$(ele).parents("tr").remove();
					
					
					
					
				}
				
			});
	}
</script>

<!-- <button type="button" class="btn btn-primary" onclick="fn_goMailWriteView()">메일작성</button> -->

<!-- <div class="mt-3"> -->
<div class='row mt-2'>                                                                                                 
  <div class='col-12'> 
		<div class="card mr-2 workfitCardBg">
			<div class="card-body p-4">
				<div class='card p-3' style="border-radius: 0.7rem;">
					<div class='card-title'>
					
				
					<c:set var="mailString" value="mail"></c:set>
			
					<c:if test="${mailListFlag eq 'receiveList'}">
	<!-- 					<h5 class="apple4 text-dark mb-3" style="font-size: 27px;">  -->
	<!-- 						<i class="mdi mdi-email-receive-outline text-dark mr-1" style="font-size: 27px;"></i>  -->
	<!-- 							받은 메일함 -->
	<!-- 					</h5> -->
							<h5 id="headTitle" class='apple4 page-title text-dark ml-3'                                                                  
							style='font-size: 31px; letter-spacing: 2px;'>
							<i class="mdi mdi-email-receive-outline text-dark mr-1" style="font-size: 31px;"></i>
							받은 메일함</h5> 

							 <hr class="ml-3 mr-3 mt-1 mb-1">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
			           			<span class="badge badge-warning badge-pill">TIP</span><br>
			           			받은 메일함은 내가 수신한 메일을 확인할 수 있는 공간입니다
		           			</div> 

					</c:if>
			
					<c:if test="${mailListFlag eq 'sendList'}">
	<!-- 					<h5 class="apple4 text-dark mb-3" style="font-size: 27px;">  -->
	<!-- 						<i class="mdi mdi-email-send-outline text-dark mr-1" style="font-size: 27px;"></i>  -->
	<!-- 							보낸 메일함 -->
	<!-- 					</h5> -->
							<h5 id="headTitle" class='apple4 page-title text-dark ml-3'                                                                  
							style='font-size: 31px; letter-spacing: 2px;'>
							<i class="mdi mdi-email-send-outline text-dark mr-1" style="font-size: 31px;"></i>
							보낸 메일함</h5> 
							<hr class="ml-3 mr-3 mt-1 mb-1">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
							<span class="badge badge-warning badge-pill">TIP</span><br>
			           			보낸 메일함에서는 내가 보낸 메일을 확인하고 관리할 수 있습니다
		           			</div> 
					</c:if>
			
					<c:if test="${mailListFlag eq 'importantList'}">
	<!-- 					<h5 class="apple4 text-dark mb-3" style="font-size: 27px;">  -->
	<!-- 						<i class="mdi mdi-email-alert-outline text-dark mr-1" style="font-size: 27px;"></i>  -->
	<!-- 							중요 메일함 -->
	<!-- 					</h5> -->
							<h5 id="headTitle" class='apple4 page-title text-dark ml-3'                                                                  
							style='font-size: 31px; letter-spacing: 2px;'>
							<i class="mdi mdi-email-alert-outline text-dark mr-1" style="font-size: 41px;"></i>
							중요 메일함</h5>

							<hr class="ml-3 mr-3 mt-1 mb-1">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
							<span class="badge badge-warning badge-pill">TIP</span><br>
			           			중요 메일함에서는 중요표시를 관리 및 확인할 수 있습니다
		           			</div> 
						
					</c:if>
			
					<c:if test="${mailListFlag eq 'tempList'}">
	<!-- 					<h5 class="apple4 text-dark mb-3" style="font-size: 27px;">  -->
	<!-- 						<i class="mdi mdi-email-edit-outline text-dark mr-1" style="font-size: 27px;"></i>  -->
	<!-- 							임시 메일함 -->
	<!-- 					</h5> -->
							<h5 id="headTitle" class='apple4 page-title text-dark ml-3'                                                                  
							style='font-size: 31px; letter-spacing: 2px;'>
							<i class="mdi mdi-email-edit-outline text-dark mr-1" style="font-size: 31px;"></i>
							임시 메일함</h5>
							<hr class="ml-3 mr-3 mt- mb-1">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
							<span class="badge badge-warning badge-pill">TIP</span><br>
			           			임시 메일함은 작성 중인 메일을 잠시 보관할 수 있는 공간입니다
		           			</div> 
					</c:if>
			
					<c:if test="${mailListFlag eq 'trashList'}">
	<!-- 					<h5 class="apple4 text-dark mb-3" style="font-size: 27px;">  -->
	<!-- 						<i class="mdi mdi-email-off text-dark mr-1" style="font-size: 27px;"></i>  -->
	<!-- 							휴지통 -->
	<!-- 					</h5> -->
							<h5 id="headTitle" class='apple4 page-title text-dark ml-3'                                                                  
							style='font-size: 31px; letter-spacing: 2px;'>
							<i class="mdi mdi-email-off text-dark mr-1" style="font-size: 31px;"></i>
							휴지통</h5>	 
                		 	<hr class="ml-3 mr-3 mt-1 mb-1">
							<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
			           			<span class="badge badge-warning badge-pill">TIP</span><br>
			           			휴지통에서는 내가 삭제하고 싶은 메일을 보관 및 관리할 수 있습니다
			           			<br>
		           			</div> 
					</c:if>
					
					</div> <!-- 카드 타이틀 닫는 태그 -->
				</div>
				<div class='card p-4' style="border-radius: 0.7rem;">
					<div class="ml-3 mr-3"> <!-- 데이터 테이블 시작 왼쪽 ml-3 오른쪽 mr-3 떼기 -->
						<table id="basic-datatable" class="table dt-responsive nowrap w-100 emailTable">
							<thead>
								<tr id="tableHead" class="text-dark text-center">
									<th class="apple4 text-center" style="font-size:19px; width:50px !important;" >
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input">
											<label class="custom-control-label"></label>
										</div>
									</th>
									<th class="apple4 text-center" style="font-size:19px; color : black !important;">중요메일</th>
									<th class="apple4 text-center" style="font-size:19px; color : black !important;">작성자</th>
									<th class="apple4 text-center" style="font-size:19px; width : 400px; color : #323a46 !important;">제목</th>
									<th class="apple4 text-center" style="font-size:19px; color : #323a46 !important;">작성날짜</th>
									<th class="apple4 text-center" style="font-size:19px; color : #323a46 !important;">삭제</th>
								</tr>
							</thead>
							<tbody style="font-size: 17px;">
				
								<c:forEach items="${mailList }" var="mail" varStatus="loop">
				
				
									<tr style="cursor:pointer;">
										<!-- readStatus를 unread라고 할 수 있을 경우는 ==> emailReadStatus값이 empty이거나 0일 때이다  -->
										<!-- 						<td> -->
										<%-- 						<c:if var="res" test="${empty mail.emailReadStatus or mail.emailReadStatus eq '0'}"> --%>
										<!-- 							<li class="unread"> -->
										<%-- 						</c:if>	 --%>
										<%-- 						<c:if test="${!res }"> --%>
										<!-- 							<li> -->
				
										<%-- 						</c:if> --%>
										<!-- 						</td> -->
				
		<!-- 								<td class="text-center pr-3"> -->
										<td class="text-center apple4 text-dark">
											<div class="email-sender-info">
												<div class="checkbox-wrapper-mail">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="${mailString }${loop.count }"> 
															<label class="custom-control-label" for="${mailString }${loop.count }"></label>
													</div>
												</div>
											</div>
										</td>
				
		<!-- 								<td class="text-center pr-1"> -->
										<td class="text-center apple4 text-dark" style="width : 30px;">
											<c:if var="res2"
												test="${mail.emailStatus eq '2' or mail.receiverEmailStatus eq '2' or mail.receiverEmailStatus eq '3'}">
												<!-- 이메일 중요도여부를 체크할 때 고려해야 할 데이터는 EMAIL테이블의 emailstatus컬럼(2 또는 3) / EMAIL_TARGET테이블의 emailStatus컬럼(2 또는 3)을 확인해야 함 -->
		<!-- 										<span class="star-toggle mdi mdi-star-outline text-warning"></span> -->
												<i style="font-size:16px;" id="${mail.emailCode }" class="mdi mdi-star" onclick="fn_changeStar(this)"></i>
											</c:if> 
											<c:if test="${!res2 }">
		<!-- 										<span class="star-toggle mdi mdi-star-outline"></span> -->
												<i style="font-size:16px;" id="${mail.emailCode }" class="mdi mdi-star-outline" onclick="fn_changeStar(this)"></i>
											</c:if></td>
				
										<td class="text-center apple4 text-dark" style="width : 150px;" onclick="fn_mailDetailView(this)"><span class="email-title">${mail.memName }</span>
										</td>
				
										<td class="text-left apple4 text-dark" style="width : 400px;" onclick="fn_mailDetailView(this)">
		<!-- 									<div class="email-content"> -->
												<a
													href="/workfit/mail/mailDetail?memId=${mail.memId }&emailCode=${mail.emailCode }&mailListFlag=${mailListFlag}"
													class="email-subject text-dark"> <span>${mail.emailTitle }</span>
												</a>
										</td>
										<td class="text-center apple4 text-dark" style="width : 200px;" onclick="fn_mailDetailView(this)">
		<!-- 									<div class="email-date" style="width: 200px;"> -->
												<fmt:formatDate value="${mail.emailDate }"
													pattern="yyyy.MM.dd. HH:mm" />
		<!-- 									</div> -->
		<!-- 									</div> -->
										</td>
				
										<td class="text-center apple4 text-dark" style="width : 150px;">
											<div class="email-action-icons">
												<ul class="list-inline">
				<!-- 									<li class="list-inline-item"><span -->
				<!-- 										style="cursor: pointer;"><i -->
				<!-- 											class="mdi mdi-archive email-action-icons-item"></i></span></li> -->
													<li class="list-inline-item"><span class="trash_mail"
														style="cursor: pointer;" id="${mail.emailCode}"
														onclick="fn_deleteMail(this)"><i
															class="mdi mdi-delete email-action-icons-item" style="font-size : 20px;"></i></span></li>
				<!-- 									<li class="list-inline-item"><span -->
				<!-- 										style="cursor: pointer;"><i -->
				<!-- 											class="mdi mdi-email-open email-action-icons-item"></i></span></li> -->
				<!-- 									<li class="list-inline-item"><span -->
				<!-- 										style="cursor: pointer;"><i -->
				<!-- 											class="mdi mdi-clock email-action-icons-item"></i></span></li> -->
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
				
				
				
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


