<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 	<h1>부서 문서</h1> -->

</html>
<c:set var="docList" value="${approvalDoc }"></c:set>
<c:set var="appvMapCC" value="${appvMapCC }"></c:set>
<c:set var="appvMapAT" value="${appvMapAT }"></c:set>
<c:set var="appvMapStart" value="${appvMapStart }"></c:set>

<div class="row mt-1">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="apple4 page-title text-dark "
						style="font-size: 26px; letter-spacing: 2px;">Dept Doc</h5>
				</div>
				<div class="row mb-2">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<div class="text-sm-right">
							<!-- 							<button type="button" class="btn btn-light mb-2 mr-1">Import</button> -->
							<button type="button" class="btn btn-light mb-2">Export</button>
						</div>
					</div>
					<!-- end col-->
				</div>
				<div class="row">
				<!-- 테이블을 넣어보자 -->
				</div>
				<table class="alternative-page-datatable table mb-0">
					<thead>
						<tr>
							<th class="apple4" scope="col">#</th>
							<th class="apple2" scope="col">북마크</th>
							<th class="apple2" scope="col">문서번호</</th>
							<th class="apple2" scope="col">제목</th>
							<th class="apple2" scope="col">작성자</th>
							<th class="apple2" scope="col">첨부파일</th>
							<th class="apple2" scope="col">결재의견</th>
							<th class="apple2" scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${docList }" var="doc">
							<tr>
								<th class="apple4 text-dark" scope="row">1</th>
								<td class="apple4 text-dark">${doc.approvalBookmark }</td>
								<td class="apple4 text-dark">${doc.approvalDocCode }</td>
								<c:set value="${doc.approvalDocCode }" var="code" />
								<td class="apple4 text-dark">${doc.approvalDocTitle }</td>
								<td class="apple4 text-dark">${appvMapStart[code].memId }</td>
								<td class="apple4 text-dark">${appvMapAT[code] }개</td>
								<td class="apple4 text-dark">${appvMapCC[code] }개</td>
								<fmt:formatDate var="StartDate" pattern="YYYY.MM.dd"
									value="${appvMapStart[code].approvalDate }" />
								<td class="apple4 text-dark">${StartDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<!-- end card-body-->
		</div>
		<!-- end card-->
	</div>
	<!-- end col -->
</div>

