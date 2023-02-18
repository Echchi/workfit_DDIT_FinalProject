<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="apple3 row mt-2">
	<div class="col-12">
		<div class="card mr-2 workfitCardBg commonCard">
			<div class="card-body p-4">
				<div class='card p-3' style="border-radius: 0.7rem;">
					<h5 class="apple4 page-title text-dark pl-3 pt-2" style="margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;">이달의 사원</h5>
					<hr class="ml-3 mr-3">
					<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
	           			이달의 사원이란, 매 달 직원들에게 추천받은 사람 중 <br>
	           			가장 많은 수를 득표한 직원을 게시하는 곳입니다.
           			</div>
	           	</div>
           	<div class='card p-4' style="border-radius: 0.7rem;">

				<div class="row mb-2">
					<div class="col-sm-4"></div>
				</div>
				<div class="row ml-3 mr-3">
				<!-- 테이블을 넣어보자 -->
				</div>
<!-- 				<h1>자유 게시판</h1> -->
				<c:set value="${postList}" var= "postList" />
				<table class="table table-hover table-centered mb-0">
					<thead>
						<tr>
							<th class="apple4" scope="col">#</th>
<!-- 							<th class="apple2" scope="col">문서번호</</th> -->
<!-- 							<th class="apple2" scope="col">부서번호</</th> -->
<!-- 							<th class="apple2" scope="col">고유코드(Test)</th> -->
							<th class="apple2" scope="col">글 제목</th>
							<th class="apple2" scope="col">작성자</th>
<!-- 							<th class="apple2" scope="col">글 내용</th> -->
							<th class="apple2" scope="col">조회 수</th>
<!-- 							<th class="apple2" scope="col">작성일</th> -->
							<th class="apple2" scope="col">수정일</th>
<!-- 							<th class="apple2" scope="col">파일이름</th> -->
<!-- 							<th class="apple2" scope="col">북마크</th> -->
						</tr>
					</thead>
					<tbody>
<%-- 						<c:forEach items="${freqDocList }" var="doc"> --%>
						<c:if test="${empty postList }">
							<td colspan="10">게시판이 존재하지 않습니다.</td>
						</c:if>
						<c:if test="${not empty postList}">
							<c:forEach items="${postList }" var="post" varStatus="status">
								<tr style="cursor:pointer">
									<th class="apple4 text-dark" scope="row">${status.index +1 }</th>
<%-- 									<td class="apple4 text-dark"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }&boardType=free">${post.postCode }</a></td> --%>
<%-- 									<td class="apple4 text-dark"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }">${post.postCode }</a></td> --%>
<%-- 									<td class="apple4 text-dark">${post.boardCode }</td> --%>
									<td class="apple4 text-dark tableTitle"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }&boardType=free"></a>${post.postTitle }</td>
									<td class="apple4 text-dark">${post.memName }</td>
<%-- 									<td class="apple4 text-dark">${post.postTitle }</td> --%>
<%-- 									<td class="apple4 text-dark">${post.postContent }</td> --%>
									<td class="apple4 text-dark">${post.postHit }</td>
									<fmt:formatDate var="postDate" pattern="YYYY-MM-dd" value="${post.postModDate }" />
<%-- 									<td class="apple4 text-dark">${postDate }</td> --%>
									<td class="apple4 text-dark">${postDate }</td>
<%-- 									<td class="apple4 text-dark">${post.boardAttachs[status.index].boardAttachName }</td> --%>
<%-- 									<td class="apple4 text-dark">${post.postPopup}</td> --%>
	<!-- 								<th class="apple4 text-dark" scope="row">1</th> -->
	<%-- 								<td class="apple4 text-dark">${doc.freqDocCode }</td> --%>
	<%-- 								<td class="apple4 text-dark">${doc.docCode }</td> --%>
	<%-- 								<td class="apple4 text-dark">${doc.myDocCode }</td> --%>
	<%-- 								<td class="apple4 text-dark">${doc.deptDocCode}</td> --%>
	<%-- 								<td class="apple4 text-dark">${doc.freqDocBookmark}</td> --%>
									<td class="apple4 text-dark"></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
<!-- 				<button><a href="/workfit/board/insert/free"> 등록 </a></button> -->
			</div>
			
			<!-- end card-body-->
		</div>
		<!-- end card-->
	</div>
	<!-- end col -->
</div>