<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 	<h1>문서 관리</h1> -->

<c:set var="mydoc" value="${mydoc}"/>
<c:set var="filelist" value="${fileList }"/>
<div class="row mt-1">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="card-title">
					<h5 class="apple4 page-title text-dark "
						style="font-size: 26px; letter-spacing: 2px;">My Doc</h5>
				</div>
				<div class="row mb-2">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<div class="text-sm-right">
							<!-- 							<button type="button" class="btn btn-light mb-2 mr-1">Import</button> -->
							<!-- Full width modal -->
							<button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#full-width-modal">Upload</button>
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
						</div>
					</div>
					<!-- end col-->
				</div>
				<div class="row">
				</div>
				<table class="alternative-page-datatable table mb-0">
					<thead>
						<tr>
							<th class="apple4" scope="col">#</th>
							<th class="apple2" scope="col">북마크</th>
							<th class="apple2" scope="col">문서번호</th>
							<th class="apple2" scope="col">부서번호</th>
							<th class="apple2" scope="col">파일이름</th>
							<th class="apple2" scope="col">저장이름</th>
							<th class="apple2" scope="col">파일크기</th>
							<th class="apple2" scope="col">저장경로</th>
							<th class="apple2" scope="col">파일종류</th>
							<th class="apple2" scope="col">작성일</th>
							<th class="apple2" scope="col">작성자</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${filelist }" var="doc" varStatus="stat">
<%-- 						<c:forEach items="${mydoc }" var="doc"> --%>
							<tr>
								<th class="apple4 text-dark" scope="row">${stat.index } </th>
								<td class="apple4 text-dark"><a href="/workfit/document/mydocList">${doc.myDocCode}</a></td>
								<td class="apple4 text-dark">${doc.myDocPath}</td>
								<td class="apple4 text-dark">${doc.myDocSize }</td>
								<td class="apple4 text-dark">${doc.myDocType }</td>
								<td class="apple4 text-dark"></td>
								<td class="apple4 text-dark"></td>
								<td class="apple4 text-dark"></td>
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
	
                                            
<div id="modal" class="modal fade" tabindex="-1" role="dialog" style="width: 1000px">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<!-- <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" /> -->
<script type="text/javascript">
	$(".modal-content").load("/workfit/document/insertDoc/myDoc");
	
</script>