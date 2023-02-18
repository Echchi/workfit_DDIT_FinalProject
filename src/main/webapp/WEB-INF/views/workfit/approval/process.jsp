<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:set var="title" value="결재할 것"/>
	<c:if test="${status eq 'processed' }">
		<c:set var="title" value="결재 완료"/>
	</c:if>
	<c:if test="${status eq 'canceled' }">
		<c:set var="title" value="결재 취소"/>
	</c:if>
	<c:if test="${status eq 'circulation' }">
		<c:set var="title" value="결재 참조"/>
	</c:if>

<div class="row mt-1">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">

					<h5 class="apple4 page-title text-dark "
						style="font-size: 26px; letter-spacing: 2px;">${title }</h5>
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
						<c:forEach items="${approvalDoc }" var="doc">
							<tr onclick="location.href='http://www.naver.com'" style="cursor:hand;">
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


<!-- Full width modal -->
<button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#full-width-modal">Full width Modal</button>
<div id="full-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="fullWidthModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full-width">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="fullWidthModalLabel">Modal Heading</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->