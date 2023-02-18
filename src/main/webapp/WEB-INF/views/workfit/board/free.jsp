<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="apple3 row mt-2">
	<div class="col-12">
		<div class="card mr-2 workfitCardBg commonCard">
			<div class="card-body p-4">
				<div class='card p-3' style="border-radius: 0.7rem;">
					<h5 class="apple4 page-title text-dark pl-3 pt-2" style="margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;">자유 게시판</h5>
					<hr class="ml-3 mr-3">
           			<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
						<span class="badge badge-warning badge-pill">TIP</span><br>
		           			자유게시판이란, 자유로운 주제로 글을 작성할 수 있는 게시판입니다.<br>
           			</div>
           			
	           	</div>
           	<div class='card p-4' style="border-radius: 0.7rem;">
           	<div class="apple3 card-tools m-3 d-flex justify-content-end" >
					<div class="pl-1 text-dark">
						<button class="apple3 ml-3 mr-1 pl-3 pr-3 workfitBtn" style="z-index:999; padding-top: 9px; padding-bottom:9px;font-size:19px;position:absolute;"onclick="location.href='/workfit/board/insert/free'">글쓰기</button>
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
				</div>
<!-- 				<h1>자유 게시판</h1> -->
				<c:set value="${postList}" var= "postList" />
				<table class="table text-dark table-hover table-centered mb-0">
					<thead>
						<tr class="apple3 text-dark text-center" style="font-size:19px;">
							<th class="apple4" scope="col" width="10%">순번</th>
<!-- 							<th class="apple2" scope="col">문서번호</</th> -->
<!-- 							<th class="apple2" scope="col">부서번호</</th> -->
<!-- 							<th class="apple2" scope="col">고유코드(Test)</th> -->
							<th class="apple2" scope="col" col="width=800px" style="text-align: center;" >제목</th>
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
								<tr style="cursor:pointer;font-size:17px;">
									<th class="apple4 text-dark text-center" style="border-right: 1px solid #fff" scope="row" width="3%">${status.index+1 }</th>
<%-- 									<td class="apple4 text-dark"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }&boardType=free">${post.postCode }</a></td> --%>
<%-- 									<td class="apple4 text-dark"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }">${post.postCode }</a></td> --%>
<%-- 									<td class="apple4 text-dark">${post.boardCode }</td> --%>
									<td class="apple4 text-dark tableTitle"><a href="/workfit/board/freeBoard/detail?postCode=${post.postCode }&boardType=free"></a>${post.postTitle }</td>
									<td class="apple4 text-dark text-center">${post.memName }</td>
<%-- 									<td class="apple4 text-dark">${post.postTitle }</td> --%>
<%-- 									<td class="apple4 text-dark">${post.postContent }</td> --%>
									<td class="apple4 text-dark text-center">${post.postHit }</td>
									<fmt:formatDate var="postDate" pattern="YYYY-MM-dd" value="${post.postModDate }" />
<%-- 									<td class="apple4 text-dark">${postDate }</td> --%>
									<td class="apple4 text-dark text-center">${postDate }</td>
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
<script>
var trData =document.querySelectorAll('table tbody tr');
trData.forEach(trData => {
	trData.addEventListener('click',function(evt){
//			console.log(evt.target,this.children[1].children[0].href);
		location.href = this.children[1].children[0].href;
	})
});

</script>
