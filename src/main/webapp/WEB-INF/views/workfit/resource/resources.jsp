<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
/* 드롭다운 메뉴 스타일 */
#dropdownMenuButton {
	border: 1px solid grey;
	color: black;
	font-size: 18px;
}

.table th, .table td {
    vertical-align : middle;
    border-bottom: 1.5px solid #dbdee0 !important;
    border-top: 1.5px solid #dbdee0 !important;
}
.table tr:hover{
  	background-color: #e7ecf1;  
}

canvas{
	width : 1000px !important;
}
</style>
<div class='row mt-2'>
	<div class='col-12'>
		<div class='card mr-2 workfitCardBg'>
			<div class='card-body p-4'>
				<div class='card p-3' style="border-radius: 0.7rem;">
					<div class='card-title ml-3'>
						<h5 id="headTitle" class='apple4 page-title text-dark p-2 headerTitle'                                                                  
	                 		style='font-size: 31px; letter-spacing: 2px;'>예약관리</h5>
	                 	<hr class="ml-3 mr-3 mt-1 mb-1">
						<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
		           			예약은 회사 비품 및 회의실 등을 예약할 수 있는 공간입니다<br>
		           			비품 현황 및 자원을 조회 및 관리할 수 있습니다
	           			</div>
	           			<!-- 카드 추가  -->
			           	<div class="row break mt-4 ml-2 mr-3 apple3"> 
			            	<div class="col pr-1">
								<div class="card" style="background-color: rgba(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row">
										<div class="col-5 text-center mt-3">
											<i class="mdi mdi-teach text-dark" style="font-size: 50px"></i>
										</div>
										<div class="col-7" onclick="fn_showChart(this)">
										
										<div class="row justify-content-between">	
									    	<h4 class="text-dark" style="display : inline-block;">현재 이용 가능한</h4>
<!-- 									    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
									    	<button type="button" style="display : inline-block; width :50px;" tabindex="0" class="btn" data-toggle="popover" data-trigger="hover" title="" data-content="클릭시 차트를 통해 당월 이용현황을 조회하실 수 있습니다." data-original-title="Tip">
    											<i style="font-size : 25px;" class="mdi mdi-information-outline"></i>
											</button>
										</div>
											
									    	<span class="text-dark apple6 mt-2"style="font-size: 25px">회의실 수</span>
									    	<h6 class="apple5 text-dark" style="font-size: 25px;">19<span style="font-size: 15px"> 개</span></h6>
									    	
<!-- 									    	<div style="display : inline-block;" class="row pb-2"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											</div> -->
										</div>
								  	</div>
								</div>
			            	</div>
			            	<div class="col pr-1">
								<div class="card" style="background-color: rgba(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row">
										<div class="col-5 text-center mt-3">
											<i class="mdi mdi-car-hatchback text-dark" style="font-size: 50px"></i>
										</div>
										<div class="col-7" onclick="fn_showChart(this)">
									    	<div class="row justify-content-between">	
										    	<h4 class="text-dark" style="display : inline-block;">현재 이용 가능한</h4>
	<!-- 									    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
										    	<button type="button" style="display : inline-block; width :50px;" tabindex="0" class="btn" data-toggle="popover" data-trigger="hover" title="" data-content="클릭시 차트를 통해 당월 이용현황을 조회하실 수 있습니다." data-original-title="Tip">
	    											<i style="font-size : 25px;" class="mdi mdi-information-outline"></i>
												</button>
											</div>
											
									    	<span class="text-dark apple6 mt-2" style="font-size: 25px;">차량 수</span>
									    	<h6 class="apple5 text-dark" style="font-size: 25px;">6<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
			            	<div class="col pr-1">
								<div class="card" style="background-color: rgba(255,255,255); box-shadow: 1px 1px 5px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row">
										<div class="col-5 text-center mt-3">
											<i class="mdi mdi-tablet-ipad text-dark" style="font-size: 50px"></i>
										</div>
										<div class="col-7" onclick="fn_showChart(this)">
											<div class="row justify-content-between">	
										    	<h4 class="text-dark" style="display : inline-block;">현재 이용 가능한</h4>
	<!-- 									    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
										    	<button type="button" style="display : inline-block; width :50px;" tabindex="0" class="btn" data-toggle="popover" data-trigger="hover" title="" data-content="클릭시 차트를 통해 당월 이용현황을 조회하실 수 있습니다." data-original-title="Tip">
	    											<i style="font-size : 25px;" class="mdi mdi-information-outline"></i>
												</button>
											</div>
									    	<span class="text-dark apple6 mt-2"style="font-size: 25px">전자기기 수</span>
									    	<h6 class="apple5 text-dark" style="font-size: 25px;">10<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
		                </div>      
	           			<!-- 카드 추가  끝 -->
					</div>
				</div>
				<div class='card p-4' style="border-radius: 0.7rem;">
					<div class='card-title ml-3'>
						<h5 id="headTitle" class='apple4 page-title text-dark p-2 headerTitle'                                                                  
	                 		style='font-size: 31px; letter-spacing: 2px;'>${type }</h5>
					</div>
					<div class="row ml-3 mr-3 apple4" id="resources">
						<div class="col-4 mb-4 pt-2">
							<!--  종류별 선택하는 dropdown 출력하는 부분 -->
							<div class="dropdown show apple3" style="font-size: 18px">
								<button class="btn dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="true">전체</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
									style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);"
									x-placement="bottom-start">
									<a class="dropdown-item" href="javascript:void(0);" style="font-size: 18px;"
										onclick="showTypeList('')">전체</a>
									<c:forEach var="type" items="${resourceType }">
										<a class="dropdown-item" href="javascript:void(0);" style="font-size: 18px"
											onclick="showTypeList('${type}')">${type }</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!--  해당 자원들 출력하기  -->
					<div class="col-12 text-center">
					<!-- ----------------------------   데이터 테이블 시작 -------------------------------- -->
					
					
					
					<table id="datatable-buttons" class="apple3 table dt-responsive nowrap w-100 text-center listTbl" name="dTbl">
						<thead>
							<tr style="vertical-align: middle; font-size: 19px;" class="text-dark">
								<th class='apple5' scope='col'>종류</th>
								<th class='apple5' scope='col'>이름</th>
								<th class='apple5' scope='col'>위치</th>
								<c:if test="${type eq '전체조회' || type eq '자원관리' }">
									<th class='apple5' scope='col'>기타</th>
								</c:if>
								<c:if test="${type eq '회의실' }">
									<th class='apple5' scope='col'>비품</th>
								</c:if>
								<c:if test="${type eq '차량' }">
									<th class='apple5' scope='col'>차량번호</th>
								</c:if>
								<th class='apple5' scope='col'>예약</th>
							</tr>
						</thead>
						<tbody id="listTbody" class="apple3 text-dark" style="font-size:17px;">
							<c:forEach var="res" items="${resources }">
								<tr>
									<td>${res.resourceType }</td>
									<td>${res.resourceName }</td>
									<td>${res.resourcePlace }</td>
									<c:if test="${ empty res.fixtures}">
										<td> - </td>
									</c:if>
									<c:if test="${type eq '회의실'}">
										<td>
											<c:forEach items="${res.fixtures }" var="fix">
												<c:choose>
													<c:when test="${fix.fixtureName eq '책상' }">
														<i class="mdi mdi-table-chair text-dark"></i>
													</c:when>
													<c:when test="${fix.fixtureName eq '의자' }">
														<i class="mdi mdi-chair-rolling text-dark"></i>
													</c:when>
													<c:when test="${fix.fixtureName eq '빔프로젝터' }">
														<i class="mdi mdi-camcorder text-dark"></i>
													</c:when>
													<c:when test="${fix.fixtureName eq '화이트보드' }">
														<i class="mdi mdi-monitor text-dark"></i>
													</c:when>
													<c:when test="${fix.fixtureName eq '소화기' }">
														<i class="mdi mdi-fire-extinguisher text-dark"></i>
													</c:when>
												</c:choose>
											</c:forEach>
										</td>
									</c:if>
									<c:if test="${type eq '차량' }">
										<td>${res.fixtures[0].fixtureName }</td>
									</c:if>
									<c:if test="${type eq '전체조회' || type eq '자원관리' }">
										<td>
											<c:choose>
												<c:when test="${res.resourceType eq '회의실' || res.resourceType eq '미디어룸' ||
															res.resourceType eq '창작실' || res.resourceType eq '미팅룸' }"> 
													<c:forEach items="${res.fixtures }" var="fix">
														<c:choose>
															<c:when test="${fix.fixtureName eq '책상' }">
																<i class="mdi mdi-table-chair text-dark"></i>
															</c:when>
															<c:when test="${fix.fixtureName eq '의자' }">
																<i class="mdi mdi-chair-rolling text-dark"></i>
															</c:when>
															<c:when test="${fix.fixtureName eq '빔프로젝터' }">
																<i class="mdi mdi-camcorder text-dark"></i>
															</c:when>
															<c:when test="${fix.fixtureName eq '화이트보드' }">
																<i class="mdi mdi-monitor text-dark"></i>
															</c:when>
															<c:when test="${fix.fixtureName eq '소화기' }">
																<i class="mdi mdi-fire-extinguisher text-dark"></i>
															</c:when>
														</c:choose>
													</c:forEach>
												</c:when>
												<c:when test="${empty res.fixtures[0].fixtureName  }">
													 - 
												</c:when>
												
												<c:otherwise>
													${res.fixtures[0].fixtureName }
												</c:otherwise>
											</c:choose>
										</td>
									</c:if>
									<td><button class="apple4 pl-3 pr-3 pt-1 pb-1 workfitBtn showDetail" style="font-size: 17px;"
											id="${res.resourceCode}">예약</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>					
					
					
					<!-- ----------------------------   데이터 테이블 끝 -------------------------------- -->
					</div>
				</div>
			</div>
			<!-- end of content-header -->
		</div>
	</div>
</div>

<!-- <div class='apple3 row mt-1'>                                                                                                          -->
<!-- 	<div class='col-12'>                                                                                                           -->
<!-- 		<div class='card mr-2 workfitCardBg'>                                                                                                          -->
<!-- 	       	<div class='card-body p-4'>     -->
	       	
<!-- 	       		<div class='card p-3' style=" border-radius: 0.7rem;">  -->
<!-- 	             	<h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>전자결재 통계</h5>                                                        -->
							
<!-- 	           		<hr class="ml-2 mr-2 mt-1 mb-1"> -->
<!-- 	           		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;"> -->
<!-- 	           			<span class="badge badge-warning badge-pill">TIP</span><br> -->
<!-- 	           			자주쓰는 문서, 등등을 확인할 수 있습니다 !   -->
<!-- 	           		</div> -->
<!-- 	           		<div class="pl-3 pr-3" style="border: 1.2px solid lightgrey"></div>	    -->
<!-- 	           		<div class="pl-3 pr-3"> -->
	           		
<!-- 		       			 자주쓰는 문서 통계 -->
<!-- 		       			<div id="freDocChart"></div> -->
<!-- 		       			 결재완료까지 평균 소요 일수 -->
<!-- 		       			<div id="approvalEndDay"></div> -->
<!-- 	           		</div>    	                                                                                              -->
<!-- 	       		</div> -->
<!-- 	       	</div> -->
<!-- 	    </div>	 -->
<!-- 	</div> -->
<!-- </div>  -->




<!--  상세페이지 모달 -->
<div id="detail-modal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<form action="" class="pl-3 pr-3 singUpRes">
				<div class="modal-header">
					<div class="text-center mt-2">
						<!-- 상세 자원 이름 -->
						<h1 class="apple4 text-dark text-left ml-3 mt-2"
							id="resourceTitle" style="font-size: 25px;"></h1>
						<h1 class="apple4 text-grey text-left ml-3"
							style="font-size: 20px;"></h1>
					</div>
				</div>
				<div class="modal-body apple3 text-dark">
					<div class="row">
						<!--  왼쪽 자원 상세 정보 -->
						<div class="col-6 mt-3">
							<div style="height: 300px;">
								<img alt="자원 정보 사진입니다" id="resourceImg" src=""
									style="object-fit: cover; width: 100%; height: 100%">
							</div>
							<div class="infos mt-4" style="height: 200px;">
								<div class='card shadow'>
									<div class='card-body'>
										<div class='card-title'>
											<table class='table mb-0'
												style="color: black; font-size: 17px;">
												<tr>
													<td>비품정보</td>
													<td></td>
												</tr>
												<tr>
													<td>위치</td>
													<td></td>
												</tr>
												<tr>
													<td>설명</td>
													<td></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 오른쪽 캘린더 출력 -->
						<div class="col-6">
							<!--  캘린더 출력 -->
							<div id="calendar" style="height: 600px"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 상세정보 모달 끝 -->

<!-- 신청하는 모달 -->
<div id="insert-modal" class="modal fade apple3" tabindex="-1"
	role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true"
	style="z-index: 2000;">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<form class="pl-3 pr-3" id="insertEventFrm">
				<input type="hidden" name="resourceCode" id="resourceCode" value="">
				<div class="modal-header">
					<h4 class="modal-title apple6 text-dark mt-2"
						id="standard-modalLabel"
						style="font-weight: bolder; font-size: 25px">예약하기</h4>
					<button type="button" class="close modal-title" data-dismiss="modal"
						style="font-weight: bolder; font-size: 25px"
						aria-hidden="true">×</button>
				</div>
				<div class="modal-body apple4" style="font-size : 19px;">
					<div class="form-group">
						<label for="insertDate" class="text-dark">날짜</label>
						<div id="insertDate"></div>
					</div>
					<div class="form-group" id="time">
						<label for="reservationStarttime" class="text-dark">예약시간</label>
						<div class="row">
							<div class="col-2">
								<input class="form-control" type="text" name="startHour"
									placeholder="00" style="display: inline-block;">
							</div>
							<div class="pl-0 pr-0">
								<span class="apple4 text-dark" style= "vertical-align: -webkit-baseline-middle;"> : </span>
							</div>
							<div class="col-2">
								<input class="form-control" type="text" name="startMin"
									placeholder="00" style="display: inline-block;">
							</div>
							<div class="pl-0 pr-0">
								<span class="apple4 text-dark" style= "vertical-align: -webkit-baseline-middle;"> ~ </span>
							</div>
							<div class="col-2">
								<input class="form-control" type="text" name="endHour"
									placeholder="00" style="display: inline-block;">
							</div>
							<div class="pl-0 pr-0">
								<span class="apple4 text-dark" style= "vertical-align: -webkit-baseline-middle;"> : </span>
							</div>
							<div class="col-2">
								<input class="form-control" type="text" name="endMin"
									placeholder="00" style="display: inline-block;">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="reservationMem" class="text-dark">예약자</label> <input
							class="form-control" type="text" id="reservationMem"
							name="reservationMem" required="required" value="">
					</div>
					<div class="form-group">
						<label for="reservationWhy" class="text-dark">예약 내용</label> <input
							class="form-control" type="text" required id="reservationWhy"
							name="reservationWhy">
					</div>
					<div class="form-group">
						<label for="memSecpass" class="text-dark">2차 비밀번호</label> <input class="form-control"
							type="password" required id="memSecpass" name="memSecpass">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn newEventBtn" style="background-color: #5F7CBB; color: white; font-size: 17px;"
						id="${memId}">예약</button>
					<button type="button" class="btn btn-light" style="font-size: 17px;" data-dismiss="modal">닫기</button>
				</div>
				<sec:csrfInput />
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 신청하는 모달 끝 -->

<!--  삭제하는 모달 -->
<div class="modal fade apple4" id="delete-modal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 2000">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myCenterModalLabel">예약취소하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
            	<form>
            		<div class="form-group">
                        <label for="secPassword">2차 비밀번호</label>
                        <input class="form-control" type="password" required id="secPassword" placeholder="2차 비밀번호를 입력해주세요">
                    </div>
                    <sec:csrfInput/>
            	</form>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-danger cancelEventBtn">예약 취소</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--  삭제하는 모달 끝-->









<!--  차트1 모달 -->
<div id="chart1-modal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
		
			<div class="modal-header">
				<h2 class="apple3">당월 회의실 이용현황</h2>
				</div>
				<div class="modal-body apple3 text-dark">
					<div class="row">
						<div class="col-6 mt-3">
						<div class="row offset-9" style="width : 600px;">
							<h2 class="apple3">평균 이용건수 <span id="chart1Avg" style="color : red;"></span>회</h2>
						</div>
							<div class="row ml-5">
								<div id="chart-area"></div>
							</div>
							<div class="row pl-9" style="width : 1000px; padding-left : 300px;">
								<h3 class="apple3">회의실 <span style="color : blue;">'창작실401'</span>가 <span style="color : red;">30</span>건으로 이용률이 가장 활발합니다.</h3>
								<h3 class="apple3">회의실 <span style="color : blue;">'미팅룸407'</span>가 <span style="color : red;">6</span>건으로 이용률이 가장 저조합니다.</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
				</div>
		</div>
	</div>
</div>
<!-- 차트1 모달 끝 -->
<!--  차트2 모달 -->
<div id="chart2-modal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
		
			<div class="modal-header">
				<h2 class="apple3">당월 전자기기 이용현황</h2>
				</div>
				<div class="modal-body apple3 text-dark">
					<div class="row">
						<div class="col-6 mt-3">
						<div class="row offset-9" style="width : 600px;">
							<h2>평균 이용건수 <span id="chart2Avg" style="color : red;"></span>회</h2>
						</div>
							<div class="row ml-5">
								<div id="chart2-area" style="width : 1000px;"></div>
							</div>
							<div class="row pl-9" style="width : 1000px; padding-left : 300px;">
								<h3>전자기기 <span style="color : blue;">'아이패드프로5220'</span>가 <span style="color : red;">56</span>건으로 이용률이 가장 활발합니다.</h3>
								<h3>전자기기 <span style="color : blue;">'아이폰13218'</span>가 <span style="color : red;">5</span>건으로 이용률이 가장 저조합니다.</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
				</div>
		</div>
	</div>
</div>
<!-- 차트2 모달 끝 -->
<!--  차트3 모달 -->
<div id="chart3-modal" class="modal fade" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
		
			<div class="modal-header">
				<h2 class="apple3">당월 차량 이용현황</h2>
				</div>
				<div class="modal-body apple3 text-dark">
					<div class="row">
						<div class="col-6 mt-3">
							<div class="row offset-9" style="width : 600px;">
								<h2>평균 이용건수 <span id="chart3Avg" style="color : red;"></span>회</h2>
							</div>
							<div class="row ml-5">
								<div id="chart3-area"></div>
							</div>
							<div class="row pl-9" style="width : 1000px; padding-left : 300px;">
								<h3>차량 <span style="color : blue;">'트럭212'</span>가 <span style="color : red;">56</span>건으로 이용률이 가장 활발합니다.</h3>
								<h3>차량 <span style="color : blue;">'승용차208'</span>가 <span style="color : red;">3</span>건으로 이용률이 가장 저조합니다.</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-dismiss="modal">닫기</button>
				</div>
		</div>
	</div>
</div>
<!-- 차트3 모달 끝 -->




<!--  ------------------------------------------------풀캘린더 관련 스크립트  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<!-- 호버시 내용 관련 스크립트 -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<script>

var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
let leftArrow = document.querySelector(".dripicons-chevron-left");
let rightArrow = document.querySelector(".dripicons-chevron-right");
let dateHeader = document.querySelector("#dateHeader");

// 분류별 버튼
let dropBtn = document.querySelector("#dropdownMenuButton");
// 분류별 내용 리스트
let dropList = document.querySelectorAll(".dropdown-item");
// 리스트 출력하는 tbody
let listTbody = document.querySelector("#listTbody");

// 상세페이지 버튼에 이벤트 주기
var detailEvent = () => {
	var detailBtns = document.querySelectorAll(".showDetail");
	for (let detailBtn of detailBtns) {
		detailBtn.addEventListener("click", function(e) {
			console.log("내이름은 정종은 탐정이죠 ㅋㅋㄹㅃㅃ");
			var resourceId = e.target.id;	// 자원 코드
			
			var jsonText = showDetail(resourceId);		// 해당 단일 자원 json 가져오는 함수
// 			console.log("json 단건 문자열", jsonText)
			insertDetailModal(JSON.parse(jsonText));	// 상세 모달에 데이터 넣
			
			$('#detail-modal').on('shown.bs.modal', function(e) {
				// 모달이 클라이언트에게 보여주는 순간 캘린더 그리기!
				openCalendar();
			}).modal('show');
			// 상세페이지 모달 띄우기
		})// end of eventListener
	}// end of for
}

// 해당 소분류 리스트 가져오는 메소드
var showTypeList = (type) => {
	console.log("소분류 ?", type);
	if(type != null && type.trim().length != 0){
		console.log("if문 들어옴???",type)
		dropBtn.innerHTML= type;
	}else{
		type = "all";
	}
	
	var headerTitle = document.querySelector(".headerTitle").innerHTML;
	console.log("종류 !!!", header)
	var code = "";
	switch (headerTitle){
	  case '회의실' :
		  code = 'R'
	    break; 
	  case '차량' : 
		  code = 'C'
	    break; 
	  case '전자기기' : 
		  code = 'D'
	    break; 
	}
	var jsonData = {};
	jsonData.code = code;
	jsonData.type = type;
	console.log("보낼데이터", jsonData)
	console.log("헤더", header)
	console.log("토큰", token)
	var typeAjax = new XMLHttpRequest();
	typeAjax.open("post", "/workfit/resource/typeList", true );
	typeAjax.onreadystatechange = () => {
		if(typeAjax.readyState == 4 && typeAjax.status == 200){
			
			var jsonText = JSON.parse(typeAjax.responseText);
			console.log(jsonText);
			var text = "";
			for(let i = 0; i< jsonText.length ; i++){
				text += "<tr>";
				text += `	<td>\${jsonText[i].resourceType}</td>`;
				text += `	<td>\${jsonText[i].resourceName}</td>`;
				text += `	<td>\${jsonText[i].resourcePlace}</td>`;
				text += `	<td>`;
				for(let j = 0 ; j < jsonText[i].fixtures.length ; j++){
					console.log(jsonText[i].fixtures[j].fixtureName);
					if(!jsonText[i].fixtures[j].fixtureName){
						text += " - "
					}else{
						var rrType = jsonText[i].resourceType;
						if(rrType == "회의실" || rrType == "미디어룸" || rrType == "창작실" || rrType == "미팅룸"){
							switch (jsonText[i].fixtures[j].fixtureName) {
							case "책상":
								text += '<i class="mdi mdi-table-chair text-dark"></i>'
								break;
							case "의자":
								text += '<i class="mdi mdi-chair-rolling text-dark"></i>'
								break;
							case "빔프로젝터":
								text += '<i class="mdi mdi-camcorder text-dark"></i>'
								break;
							case "화이트보드":
								text += '<i class="mdi mdi-monitor text-dark"></i>'
								break;
							case "소화기":
								text += '<i class="mdi mdi-fire-extinguisher text-dark"></i>'
								break;

							default:
								break;
							}
						}else{
							text += `\${jsonText[i].fixtures[j].fixtureName }`;
						}
					}
				}
				text += `	</td>`;
				text += `	<td><button class="apple5 pl-3 pr-3 pt-1 pb-1 workfitBtn showDetail" id="\${jsonText[i].resourceCode}" style="font-size: 17px" >예약</button></td>`;
				text += "</tr>";
			};
			listTbody.innerHTML = text;
		};
		// 새롭게 들어간 이벤트 등록하기!!!!!!
		detailEvent();
	};
	typeAjax.setRequestHeader(header, token);
	typeAjax.setRequestHeader('Content-Type', 'application/json;');
	typeAjax.send(JSON.stringify(jsonData));
};
// ---------------------------------------------------------------
// 단건 정보 가져오는 메소드
var showDetail = (resourceId) =>{
	console.log("showDetail 아이디", resourceId)
	var jsonResult;	
	var xhr = new XMLHttpRequest();
	xhr.open("post", '/workfit/resource/detail', false);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			jsonResult = xhr.responseText;
		};
	};
	xhr.setRequestHeader(header, token);
	xhr.send(resourceId);
	
	return jsonResult;
}
// ---------------------------------------------------------------
// 모달에 가져온 데이터 넣는 메소드
var detailTitle = document.querySelector("#resourceTitle");
var resourceImg = document.querySelector("#resourceImg");
var resCodeInput = document.querySelector('#resourceCode');
var infoDiv = document.querySelector(".infos");
var insertDetailModal = (json) => {
	console.log("모달 값 넣기", json)
	// 자원 title 값 넣기
	detailTitle.innerHTML = json.resourceName;
	
	// 이미지 경로 넣기
	resourceImg.src = json.resourceImg;

	// 비품 정보 넣기
	var fixtureInfo = "";
	console.log("비품 정보 길이...? ", json.fixtures)
	for(let info of json.fixtures){
		console.log("모달에 넣을 비품 정보 !!!!!! : ", info)
		// 비품명
		if(info.fixtureName){
			fixtureInfo += info.fixtureName + "&nbsp;&nbsp;";		
		}else{
			fixtureInfo = " - "
		}
	}
		
	console.log("비품정보", fixtureInfo);
	
	infoDiv.querySelectorAll("td")[1].innerHTML = fixtureInfo;
	
	// 자원 위치 넣기
	infoDiv.querySelectorAll("td")[3].innerHTML = json.resourcePlace;
	
	// 자원 설명 넣기
	infoDiv.querySelectorAll("td")[5].innerHTML = json.resourceInfo;
	
	resCodeInput.value = json.resourceCode;
	
}
// ----------------------------모달에 가져온 데이터 넣는 메소드 끝

// 캘린더 시간 선택하면 모달에 해당 정보 입력하는 메소드
var dateDiv = document.querySelector("#insertDate");
var timeInput = document.querySelector("#time").querySelectorAll("input");
let startTimeDayjs = dayjs();
let endTimeDayjs = dayjs();
var newEventModal = (arg) => {
	// "2023-01-12T12:00:00+09:00"
	startTimeDayjs = dayjs(arg.startStr);
	endTimeDayjs = dayjs(arg.endStr);

	var date = startTimeDayjs.format("YYYY년 MM월 DD일 (ddd)");
	dateDiv.innerHTML = date;

	// ~~시 ~~~분 - ~~시 ~~분
	timeInput[0].value = startTimeDayjs.get("h");	
	timeInput[1].value = startTimeDayjs.format("mm");	
	timeInput[2].value = endTimeDayjs.get("h");	
	timeInput[3].value = endTimeDayjs.format("mm");
}; 

var newEventBtn = document.querySelector('.newEventBtn');
var formData;

// 예약 모달 확인 버튼 누르면 실행되는 함수
newEventBtn.addEventListener('click', function() {
	var insertFrm = document.querySelector('#insertEventFrm');
	
	//	모달에 input[type="hidden"] 으로 넣어놓은 자원 코드 값 가져오기	
	var resCodeInput = document.querySelector('#resourceCode').value;
	formData = new FormData(insertFrm);
	var startHour = formData.get('startHour');
	var startMin = formData.get('startMin');
	var endHour = formData.get('endHour');
	var endMin = formData.get('endMin');
	formData.delete('startHour');
	formData.delete('startMin');
	formData.delete('endHour');
	formData.delete('endMin');
	
	
	console.log("set 하기 전", startTimeDayjs);
	var newStart = startTimeDayjs.set("h", startHour).set("m", startMin);
	var newEnd = endTimeDayjs.set("h", endHour).set("m", endMin);
	formData.append("reservationStarttime", newStart.format('YYYY/MM/DD HH:mm:ss'));
	formData.append("reservationEndtime", newEnd.format('YYYY/MM/DD HH:mm:ss'));
	formData.append("resourceCode", resCodeInput);	// 찾아서 넣어주기
	formData.append("memId", newEventBtn.id);
	
	console.log("시작" , newStart);	// 시작 시간
	console.log("종료 ", newEnd);	// 시작 시간
	
	
	// 1. 캘린더에 있는 이벤트들 시간 정보 가져와서 겹치면 db이벤트 넣지 못하도록 검증하기
	var events = calendar.getEvents();
// 	console.log(events);
	
// 	var newDate = dayjs(endTime);
// 	console.log("뉴데이트입니다 : ", newDate.format())
	var eventFlag = false;
	for(let ev of events){
		console.log("캘린더 이벤트들 : ", ev);
		if( newStart.isBetween(ev.startStr, ev.endStr) ||		// 시작 날짜가 기존에 있는 이벤트와 겹칠 경우
			newEnd.isBetween(ev.startStr, ev.endStr) ||		// 종료 날짜가 기존에 있는 이벤트와 겹칠 경우
			(newStart.isSameOrBefore(ev.startStr) && 			// 시작 종료 시간이 기존 이벤트를 덮을 경우
			 newEnd.isSameOrAfter(ev.endStr)		
			)	
		){
			eventFlag = true;
		}
	}
	if(!eventFlag){
		console.log("안겹침")
		// db에 이벤트 넣기 (ajaxs) 
		var eventCode = newEventInsert(formData);
			// db에 이번트 넣은 후 캘린더에 새 이벤트 넣기 
		var	eventTitle = formData.get("reservationMem");
		var	eventStart = formData.get("reservationStarttime");
		var eventEnd = formData.get("reservationEndtime");
		var eventMemo = formData.get("reservationWhy");
		console.log("이벤트 넣을 데이터 ", eventTitle, eventStart, eventEnd, eventMemo)
		calendar.addEvent({
			title: formData.get("reservationMem"),
			start : dayjs(formData.get("reservationStarttime")).format(),
			end : dayjs(formData.get("reservationEndtime")).format(),
			memo : formData.get("reservationWhy"),
			eventCode : eventCode,
			allDay: false
		});
	}else{
		toastr.error( '<h4 style="font-size:17px;" class="apple4">이미 예약된 시간입니다</h4>');
	}
	
	
})

// db에 이벤트 넣는 함수
var newEventInsert = (formData) => {
	
	var returnVal = "";
// 	아작스 시작
	var xhr = new XMLHttpRequest();
	xhr.open("post", "/workfit/resource/insertNewEvent", false);
	console.log("헤더", header)
	console.log("토큰", token)
	xhr.onreadystatechange = () => {
		console.log("잘 오니??")
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			if(xhr.responseText != 'FAILED'){
				returnVal = xhr.responseText;
				$('#insert-modal').modal("hide");
	    		// calendarAddEvent();
// 				calandarEventsfromDB();
			}
		}
	}
	xhr.setRequestHeader(header, token);
	xhr.send(formData);
	
	
	return returnVal;
};


// 캘린더에 데이터 넣는 함수 !!!
var calandarEventsfromDB = () => {
	var eventJsonArr = [];
	$.ajax({
		url : "/workfit/resource/getAllReservation",
		data : {
			'memId' : newEventBtn.id,
			'resourceCode' : resCodeInput.value
		},
		type : 'post',
		dataType : 'json',
		async: false,		// 동기 방식으로 넘어가기
	    beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(result){
			console.log("디비에서 바로 온정보 : ", result);
			// 1번 문제 for문 돌릴때 객체 한번 선언하면 뒤집어 씀 !! 
			// 2번 문제 vo에서포맷 잘못 설정하면 14시가 2시로 되어서 캘린더에 출력 안댐 ㅠ 
			for(let one of result){
				var jsonEvent = {}
				jsonEvent.title = one.reservationMem;
				jsonEvent.start = dayjs(one.reservationStarttime).format();
				jsonEvent.end = dayjs(one.reservationEndtime).format();
				jsonEvent.allDay = false;
				jsonEvent.memo = one.reservationWhy; 
				jsonEvent.eventCode = one.reservationCode;
				eventJsonArr.push(jsonEvent);
			}
			
			console.log("디비에서  json : ", eventJsonArr);
			
		}
		                     
	})
	
	console.log("리턴 전 값 ", eventJsonArr)
	
	return eventJsonArr;
};
// ----------일정 변경하는 함수 
var eventModify = (info) => {
	if(!confirm("일정 변경하시겠습니까? ")){
		return false;
	}
	console.log("변경된 일정 !! ", info.event.startStr)
	console.log("해당 일정 코드 ", info.event.extendedProps.eventCode)
	
	// 일정 변경되는 정보 넣을 json
	var modifyJson = {};
	modifyJson.reservationCode = info.event.extendedProps.eventCode;
	modifyJson.reservationStarttime = info.event.start;
	modifyJson.reservationEndtime = info.event.end;
	
	console.log("보낼 json 데이터 : ", modifyJson)
	
	var xhr = new XMLHttpRequest();
	xhr.open("post", "/workfit/resource/eventModify", true);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
		}
	}
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(modifyJson));
};

var eventDelete = (info) => {
	
	var secPass = document.querySelector('#secPassword');
	var deleteJson = {};
	// 삭제할 일정 코드
	var eventCode = info.event.extendedProps.eventCode;
	deleteJson.reservationCode = eventCode;
	deleteJson.memSecpass = secPass.value;
	
	console.log(deleteJson)
	
	var xhr = new XMLHttpRequest();
	xhr.open("post", "/workfit/resource/eventDelete", true);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			if(xhr.responseText == "OK"){
// 				$('#delete-modal').modal('hide');
				toastr.success( '<h4 style="font-size:17px;" class="apple4">예약취소 완료</h4>');
				location.href= location.href;
				
			};
		};
	};
	xhr.setRequestHeader(header, token);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(deleteJson));
	
};

// --------------------------- 캘린더 출력하기
// 캘린더 여는 함수
var calendarEl = document.getElementById('calendar');
var calendar;
var openCalendar = () => {
	calendar = new FullCalendar.Calendar(calendarEl, {
   	 	initialView: 'timeGrid', 	// 보여줄 형태
     	duration: { 				// 3일 보여줌ㄴ
     		days: 3,
     	},	
     	allDaySlot : false,				// 종일 안보여주기
     	slotDuration : '01:00:00',		// 1시간 단위
 		slotMinTime : '09:00:00',		// 보여줄 시작 시간
 		slotMaxTime : '21:00:00',		// 보여줄 마지막 시간
     	nowIndicator: true, 			// 현재 시간 마크
		locale: 'ko', 					// 한국어 설정
		businessHours: {				// 사용 가능 시간 설정
			  daysOfWeek: [ 1, 2, 3, 4, 5 ], // 월 - 금
			  startTime: '08:00', 			// 9시부터
			  endTime: '18:00', 
		},
    	contentHeight: 550,			// 캘린더 내부 길이 조정
    	expandRows : true,			// 캘린더 시간 행 길이에 꽉 채우기
    	editable : true,	
    	selectable : true,			// 캘린더 선택 가능 
    	selectMirror : true,		// 캘린더 드래그 설정 가능
    	events : function( info, successCallback, failureCallback ) { 
    		var successJSON = calandarEventsfromDB();
    		console.log("캘린더 함수 json : ", successJSON)
    		successCallback(successJSON);
    		
    	},
    	select : function(arg){		// 해당 날짜 선택하면 실행되는 함수
    		console.log(arg);
    		newEventModal(arg);		// 모달에 값 넣기
    		$('#insert-modal').modal("show");	// 모달 띄우기
    		$('.modal-backdrop').last().css("z-index", "1500");		// 두번째 모달 백드롭 zindex 수정
    	},
    	// 일정 변경하는 함수
    	eventDrop : function(info){
    		console.log("드래그 이벤트", info)
    		// 일정 변경하기
    		eventModify(info);
		},
		// 일정 삭제하는 이벤트
		eventClick : function(arg){
			// 2차 확인 모달 띄우기
			$('#delete-modal').on('shown.bs.modal', function(e) {
				// 띄울때 버튼에 onclick 이벤트 주기
				var cancelEventBtn = document.querySelector('.cancelEventBtn');
				cancelEventBtn.onclick = () => {eventDelete(arg)};
			}).modal('show');
    		$('.modal-backdrop').last().css("z-index", "1500");		// 두번째 모달 백드롭 zindex 수정
		},
   	});
   	calendar.updateSize();
   	calendar.render();	
};

$(function(){
	
	// 데이터 테이블 변경 시작 ! 
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
		
		
	
	// 상세보기 버튼에 이벤트 주는함수
	detailEvent();
	
	
	
	
	
	// 여기부터 차트 띄우는 로직 
	const average = arr => arr.reduce((p, c) => p + c, 0) / arr.length;
	var data1 = [11, 21, 22, 25, 6, 30, 19,8,12,20];
	var data2 = [31, 41, 22, 25, 56, 31, 19,18,22,5];
	var data3 = [11, 41, 3, 25, 56, 31];
	
// 	console.log("뭐임?"+average(data1));
	
	$("#chart1Avg").text(average(data1).toFixed(1));
	$("#chart2Avg").text(average(data2).toFixed(1));
	$("#chart3Avg").text(average(data3).toFixed(1));
	
	//토스트 유아이 차트 그리기 시작 
	var el = document.getElementById('chart-area');
		var data = {
			  categories: ['미디어룸403', '미디어룸404', '미디어룸405', '미팅룸406', '미팅룸407', '창작실401', '창작실402','회의실300','회의실301','회의실302'],
			  series: [
			    {
			      name: '',
			      data: data1,
			      colorByCategories: true
			    }
			  ]
			}
      var options = {
        chart: { title: '', width: 900, height: 400 },
      	legend: {
      		visible : false,
      	},
	};

      var chart1 = toastui.Chart.columnChart({ el, data, options });
      window.byhChart1 = chart1;
	var el = document.getElementById('chart2-area');
		var data = {
			  categories: ['삼성노트북215', '삼성노트북214', '삼성노트북216', '아이패드프로2223', '아이패드프로5220', '아이패드프로3222', '아이패드프로4221','아이폰13219','아이폰13217','아이폰13218'],
			  series: [
			    {
			      name: '',
			      data: data2,
			      colorByCategories: true
			    }
			  ]
			}
      var options = {
        chart: { title: '', width: 900, height: 400 },
      	legend: {
      		visible : false,
      	},
	};

      var chart2 = toastui.Chart.columnChart({ el, data, options });
      window.byhChart2 = chart2;
	var el = document.getElementById('chart3-area');
		var data = {
			  categories: ['SUV210', 'SUV211', '승용차208', '승용차209', '트럭212', '트럭213'],
			  series: [
			    {
			      name: '',
			      data: data3,
			      colorByCategories: true
			    }
			  ]
			}
      var options = {
        chart: { title: '', width: 900, height: 400 },
      	legend: {
      		visible : false,
      	},
	};

      var chart3 = toastui.Chart.columnChart({ el, data, options });
      window.byhChart3 = chart3;
//       window.byhChart = chart;
	// 차트 그리기 끝...
});




function fn_showChart(a){ // 차트가 들어있는 모달을 띄워준다 
	// 상세페이지 버튼에 이벤트 주기
	
	if($(a).children("span").text().includes("회의실")){
		var selectedChartModal = "chart1-modal";
	}
	if($(a).children("span").text().includes("전자기기")){
		var selectedChartModal = "chart2-modal";
// 		window.byhChart.el = document.getElementById("chart2-area");
// 		window.byhChart.update();
		console.log(window.byhChart2);
	}
	if($(a).children("span").text().includes("차량")){
		var selectedChartModal = "chart3-modal";
	}
	
	
	var detailEvent = () => {
				// 여기서 모달 헤더의 h2태그 텍스트, categories	배열, 데이터 속성만 세팅해주면 된다! 
				
				$('#'+selectedChartModal).modal('show');
				// 상세페이지 모달 띄우기
	}
	detailEvent();
	
}


</script>

