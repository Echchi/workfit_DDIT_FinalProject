<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>

thead tr:hover:not(#nothover) {
    background-color: #fff;
    color: #fff;
  }
</style>
<div class="apple3 row mt-2">
	<div class="col-12">
		<div class="card mr-2 workfitCardBg commonCard">
			<div class="card-body p-4">
				<div class='card p-3' style="border-radius: 0.7rem;">
					<div class="card-title">
						<h5 class="apple4 page-title text-dark pl-3 pt-2" style="margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;">공지사항</h5>
						<hr class="ml-3 mr-3 mt-1 mb-1">
						<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
		           			공지사항은 사내 중요 정보를 공지하는 공간입니다<br>
		           			중요한 게시글은 팝업을 설정하여 확성기 아이콘으로 표시됩니다
	           			</div>
	           			<hr class="ml-3 mr-3">
	           			<div class='card p-3'>
		           			<c:forEach items="${postList }" var="post" varStatus="status">
								<c:if test="${post.postPopup eq 'y'}">
									<c:set value="${post }" var="popup" />	
								</c:if>
							</c:forEach>
							<h3 class="apple4 text-dark"><i class="dripicons-broadcast mr-2"></i>중요 공지</h3>
<!-- 						<span>팝업<i class="dripicons-broadcast"></span> -->
							<table>
		           				<tr style="cursor:pointer;">
		           					<c:choose>
		           						<c:when test="${popup ne null }">
		           							<td></td>
											<td class="apple5 text-dark tableTitle" style="font-size:35px;text-align: center"><a href="/workfit/board/freeBoard/detail?postCode=${popup.postCode }&boardType=notice"></a>${popup.postTitle }</td> 
											<fmt:formatDate var="postpopDate" pattern="YYYY.MM.dd." value="${popup.postDate }" /> 
<%-- 										<td class="apple4 text-dark">${postpopDate }</td>  --%>
<%-- 										<td class="apple4 text-dark">${popup.memName }</td>  --%>
<%-- 										<td class="apple4 text-dark">${popup.postHit }</td>		 --%>
										</c:when>
										<c:otherwise>
											<td class="apple5 text-dark tableTitle" style="font-size:22px;text-align: center">팝업 설정된 공지사항이 존재하지 않습니다.</td>
										</c:otherwise>
		           					</c:choose>
								</tr>
							</table>								
	           			</div>
					</div>
				</div>
				<div class='card p-4' style="border-radius: 0.7rem;">
				<div class="apple3 card-tools m-3 d-flex justify-content-end" >
					<div class="pl-1 text-dark">
						<button class="apple3 ml-3 mr-1 pl-3 pr-3 workfitBtn" style="z-index:999; padding-top: 9px; padding-bottom:9px;font-size:19px;position:absolute;height: 43px;border-radius: 0.3rem;"onclick="location.href='/workfit/board/insert/notice'">글쓰기</button>
					</div>
					<form class="input-group justify-content-end" id="searchForm">
						<input type="hidden" name="page" id="page" value=""/>
						<div class="pr-1"style="width : 120px">
							<select class="form-control" name="searchType"  style="height: 47px;">
								<option value="title" <c:if test="${searchType == 'title' }"><c:out value="selected"/></c:if>>제목</option>
								<option value="writer" <c:if test="${searchType == 'writer' }"><c:out value="selected"/></c:if>>작성자</option>
							</select> 
						</div>
						<div class="pr-2" style="width : 350px">
							<input type="text" name="searchWord" value="${searchWord }" class="apple4 form-control float-right" style="height: 47px;" placeholder="검색어 입력">
						</div>
						<div class="apple4">
							<button type="submit" class="btn btn-light workfitBtn" style="font-size:19px;">검색</button>
						</div>
					</form>
				</div>
				<div class="row mb-2">
					<div class="col-sm-4"></div>
				</div>
				<div class="row ml-3 mr-3">
					<!-- 테이블을 넣어보자 -->
					<c:set value="${postList}" var= "postList" />
					<table class="table text-dark table-centered mb-0">
						<thead id="nothover">
							<tr class="apple3 text-dark text-center" style="font-size:19px;">
								<th class="apple4" scope="col" width="10%">순번</th>
<!-- 								<th class="apple2" scope="col" col="width=10%">문서번호</</th> -->
								<th class="apple2" scope="col" col="width=800px" style="text-align: center;" > 제목</</th>
<!-- 								<th class="apple2" scope="col" col="width=15%">내용</th> -->
<!-- 								<th class="apple2" scope="col" col="width=25%">저장이름</th> -->
<!-- 								<th class="apple2" scope="col" col="width=8%">파일크기</th> -->
<!-- 								<th class="apple2" scope="col" col="width=30%">저장경로</th> -->
								<th class="apple2" scope="col" width="15%" style="text-align: center;">작성일</th>
								<th class="apple2" scope="col" col="width=15%">작성자</th>
								<th class="apple2" scope="col" col="width=5%">조회수</th>
<!-- 								<th class="apple2" scope="col" width="10%">팝업</th> -->
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty postList }">
								<td colspan="10">게시판이 존재하지 않습니다.</td>
							</c:if>
							<c:if test="${not empty postList}">
								<c:set value="0" var="cnt" />
								<c:set value="true" var="flag" />
								
<!-- 								<tr style="cursor:pointer;background-color:#e2ecf1;font-size:17px;"> -->
<!-- 									<td class="apple4 text-dark text-center"><i class="dripicons-broadcast"></i></td>	 -->
<!-- 									<th class="apple4 text-dark"  scope="row" width="3%">중요</th> -->
<%-- 									<td class="apple4 text-dark tableTitle"><a href="/workfit/board/freeBoard/detail?postCode=${popup.postCode }&boardType=notice"></a>${popup.postTitle }</td> --%>
<%-- 									<fmt:formatDate var="postpopDate" pattern="YYYY.MM.dd." value="${popup.postDate }" /> --%>
<%-- 									<td class="apple4 text-dark">${postpopDate }</td> --%>
<%-- 									<td class="apple4 text-dark">${popup.memName }</td> --%>
<%-- 									<td class="apple4 text-dark">${popup.postHit }</td>		 --%>
<!-- 								</tr>															 -->
								<c:forEach items="${postList }" var="post" varStatus="status">
								
									<tr style="cursor:pointer;font-size:17px;" id="noticeTr">
										<th class="apple4 text-dark text-center" style="border-right: 1px solid #fff" scope="row" width="3%">${status.index+1 }</th>
<%-- 										<td class="apple4 text-dark"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }">${post.postCode }</a></td> --%>
<%-- 										<td class="apple4 text-dark">${post.boardAttachs }</td> -	-%>
<%-- 										<td class="apple4 text-dark">${post.postModDate }</td> --%>
<%-- 										<td class="apple4 text-dark">${post.boardCode }</td> --%>
										<td class="apple4 text-dark tableTitle"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }&boardType=notice"></a>${post.postTitle }</td>
<%-- 										<td class="apple4 text-dark">${post.postContent }</td> --%>
<%-- 										<td class="apple4 text-dark">${post.boardAttachs[0].boardAttachName }</td> --%>
										<fmt:formatDate var="postDate" pattern="YYYY.MM.dd." value="${post.postDate }" />
										<td class="apple4 text-dark text-center">${postDate }</td>
										<td class="apple4 text-dark text-center">${post.memName }</td>
										<td class="apple4 text-dark text-center">${post.postHit }</td>
										<c:if test="${post.postPopup eq 'y' }">
											<input type="hidden" id="popupCnt" value="${cnt = cnt + 1}"/>
											<input type="hidden" id="popupChange" value=""/>
										</c:if>
										<c:if test="${post.postPopup eq 'n' }">
											
<!-- 											<td class="apple4 text-dark"></td> -->
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
		</div>				
			</div>
			<!-- end card-body-->
			<!-- Icon Test -->			
<!-- 			<div style="position: absolute; inset: 0px; margin: auto;"><img src="https://cf.channel.io/asset/plugin/images/shadow-body.png" role="presentation" alt="" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" width="48" height="48" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><path fill="#4f5bff" fill-opacity="0.6" d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></svg><img src="https://cf.channel.io/asset/plugin/images/gradient-body.png" role="presentation" alt="" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" width="48" height="48" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><g filter="url(#filter0_i)"><path fill="white" fill-opacity="0.01" d="M24 6C14.0589 6 6 14.0589 6 24C6 33.9411 14.0589 42 24 42C26.5503 42 28.9767 41.4696 31.175 40.5132C32.4937 39.9394 33.9715 39.7362 35.3397 40.1796L39.7048 41.5942C40.8697 41.9717 41.9717 40.8697 41.5942 39.7048L40.1796 35.3397C39.7362 33.9715 39.9394 32.4937 40.5132 31.175C41.4696 28.9767 42 26.5503 42 24C42 14.0589 33.9411 6 24 6Z"></path></g><defs><filter id="filter0_i" x="4" y="2" width="38" height="40" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix><feOffset dx="-2" dy="-4"></feOffset><feGaussianBlur stdDeviation="4"></feGaussianBlur><feComposite in2="hardAlpha" operator="arithmetic" k2="-1" k3="1"></feComposite><feColorMatrix type="matrix" values="0 0 0 0 0.30980392156862746 0 0 0 0 0.3568627450980392 0 0 0 0 1 0 0 0 0.2 0"></feColorMatrix><feBlend mode="normal" in2="shape" result="effect1_innerShadow"></feBlend></filter></defs></svg><svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><g filter="url(#filter0_f)"><path fill="white" fill-opacity="0.15" d="M19.8462 20.1538C19.8462 22.448 19.2404 24.3077 17.4231 24.3077C15.6058 24.3077 15 22.448 15 20.1538C15 17.8597 15.6058 16 17.4231 16C19.2404 16 19.8462 17.8597 19.8462 20.1538Z"></path><path fill="white" fill-opacity="0.15" d="M24.0001 29.8462C21.201 29.8462 19.7599 27.5828 19.3109 25.9843C19.1615 25.4526 19.6016 25.0001 20.1539 25.0001H27.8462C28.3985 25.0001 28.8386 25.4526 28.6893 25.9843C28.2402 27.5828 26.7992 29.8462 24.0001 29.8462Z"></path><path fill="white" fill-opacity="0.15" d="M30.5768 24.3077C32.3941 24.3077 32.9999 22.448 32.9999 20.1538C32.9999 17.8597 32.3941 16 30.5768 16C28.7595 16 28.1537 17.8597 28.1537 20.1538C28.1537 22.448 28.7595 24.3077 30.5768 24.3077Z"></path></g><path fill="#4f5bff" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#17113F" fill-opacity="0.7" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#4f5bff" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#17113F" fill-opacity="0.7" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#4f5bff" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><path fill="#17113F" fill-opacity="0.7" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><defs><filter id="filter0_f" x="13" y="14" width="21.9999" height="17.8462" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="1" result="effect1_foregroundBlur"></feGaussianBlur></filter></defs></svg></div> -->
<!-- 			<img src="https://cf.channel.io/asset/plugin/images/shadow-body.png" role="presentation" alt="" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" width="48" height="48" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"> -->
<!-- 			<svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" foundation="[object Object]" class="InnerIconstyled__Icon-ch-front__sc-197h5bb-0 eIuoMd LauncherIconstyled__Bubble-ch-front__sc-mnslcf-1 dMLQd" color="#4f5bff" defaultopacity="1" hoveredopacity="1" margintop="0" marginright="0" marginbottom="0" marginleft="0" withtheme="false" style="position: absolute;"><g filter="url(#filter0_f)"><path fill="white" fill-opacity="0.15" d="M19.8462 20.1538C19.8462 22.448 19.2404 24.3077 17.4231 24.3077C15.6058 24.3077 15 22.448 15 20.1538C15 17.8597 15.6058 16 17.4231 16C19.2404 16 19.8462 17.8597 19.8462 20.1538Z"></path><path fill="white" fill-opacity="0.15" d="M24.0001 29.8462C21.201 29.8462 19.7599 27.5828 19.3109 25.9843C19.1615 25.4526 19.6016 25.0001 20.1539 25.0001H27.8462C28.3985 25.0001 28.8386 25.4526 28.6893 25.9843C28.2402 27.5828 26.7992 29.8462 24.0001 29.8462Z"></path><path fill="white" fill-opacity="0.15" d="M30.5768 24.3077C32.3941 24.3077 32.9999 22.448 32.9999 20.1538C32.9999 17.8597 32.3941 16 30.5768 16C28.7595 16 28.1537 17.8597 28.1537 20.1538C28.1537 22.448 28.7595 24.3077 30.5768 24.3077Z"></path></g><path fill="#4f5bff" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#17113F" fill-opacity="0.7" d="M19.8462 19.1538C19.8462 21.448 19.2404 23.3077 17.4231 23.3077C15.6058 23.3077 15 21.448 15 19.1538C15 16.8597 15.6058 15 17.4231 15C19.2404 15 19.8462 16.8597 19.8462 19.1538Z"></path><path fill="#4f5bff" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#17113F" fill-opacity="0.7" d="M24.0001 28.8462C21.201 28.8462 19.7599 26.5828 19.3109 24.9843C19.1615 24.4526 19.6016 24.0001 20.1539 24.0001H27.8462C28.3985 24.0001 28.8386 24.4526 28.6893 24.9843C28.2402 26.5828 26.7992 28.8462 24.0001 28.8462Z"></path><path fill="#4f5bff" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><path fill="#17113F" fill-opacity="0.7" d="M30.5768 23.3077C32.3941 23.3077 32.9999 21.448 32.9999 19.1538C32.9999 16.8597 32.3941 15 30.5768 15C28.7595 15 28.1537 16.8597 28.1537 19.1538C28.1537 21.448 28.7595 23.3077 30.5768 23.3077Z"></path><defs><filter id="filter0_f" x="13" y="14" width="21.9999" height="17.8462" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB"><feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood><feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"></feBlend><feGaussianBlur stdDeviation="1" result="effect1_foregroundBlur"></feGaussianBlur></filter></defs></svg> -->
			<!-- Icon Test End -->
		</div>
		<!-- end card-->
	</div>
	<!-- end col -->
</div>


<script>

	var trData =document.querySelectorAll('table tbody tr');
	var popupCnt = document.querySelector('#popupCnt');
	var popupChange = document.querySelector('#popupChange').value;
	console.log(popupCnt);
	
	trData.forEach(trData => {
		trData.addEventListener('click',function(evt){
// 			console.log(evt.target,this.children[1].children[0].href);
			location.href = this.children[1].children[0].href;
		})
	});
	var toggleMainPopup = function(data) {
		  console.log('요건 notice toggle함수!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
		  if(data != null){
			  window.localStorage.removeItem('today');
			  console.log("팝업 갱신");
			  data = 0;
			  console.log("팝업 갱신 후 popupCnt : ",data);
		  }
		  /* 스토리지 제어 함수 정의 */
		  var handleStorage = {
		    // 스토리지에 데이터 쓰기(이름, 만료일)
		    setStorage: function (name, exp) {
		      // 만료 시간 구하기(exp를 ms단위로 변경)
		      var date = new Date();
 		      date = date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);	// 24시간.
// 		      date = date.setTime(date.getTime() + exp * 30 * 1000);		// 30초 테스트용..

		      // 로컬 스토리지에 저장하기
		      // (값을 따로 저장하지 않고 만료 시간을 저장)
		      localStorage.setItem(name, date)
		    },
		    // 스토리지 읽어오기
		    getStorage: function (name) {
		      var now = new Date();
		      now = now.setTime(now.getTime());
		      // 현재 시각과 스토리지에 저장된 시각을 각각 비교하여
		      // 시간이 남아 있으면 true, 아니면 false 리턴
		      return parseInt(localStorage.getItem(name)) > now
		    }
		  };
		  // 쿠키 읽고 화면 보이게
		  if (handleStorage.getStorage("today")) {
		    $(".main_popup").removeClass("on");
		  } else {
		    $(".main_popup").addClass("on");
		  }
		  // 오늘하루 보지 않기 버튼
		  $(".main_popup").on("click", ".btn_today_close", function () {
		    // 로컬 스토리지에 today라는 이름으로 1일(24시간 뒤) 동안 보이지 않게
		    handleStorage.setStorage("today", 1);
		    $(this).parents(".main_popup.on").removeClass("on");
		  });
		  // 일반 닫기 버튼
		  $(".main_popup").on("click", ".btn_close", function () {
		    $(this).parents(".main_popup.on").removeClass("on");
		  });
		}
		$(function(){
// 			console.log("공지 pop",popupCnt);
// 			let popupFlag = popupCnt.value;
// 			let popupIsChanged = document.querySelector('#popupChange');
// 			console.log("플래그 값 :",popupFlag);
// 			console.log("popupChange.value 값 :",popupChange);
// 			console.log("popupIsChanged 값 :",popupIsChanged);
// 			if(popupCnt.value != 0 && popupChange != popupIsChanged.value){
// 				toggleMainPopup(popupCnt);
// 			}
		})
</script>

