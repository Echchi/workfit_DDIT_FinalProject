<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 <div class='row mt-2'>                                                                                                 
  <div class='col-12'>                                                                                                  
     <div class='workfitCardBg card mr-2'>                                                                                                 
        <div class='card-body p-4'> 
        	<div class='card p-3' style=" border-radius: 0.7rem;"> 
                     <h5 class='apple4 page-title text-dark pl-3 pt-2' style='margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;'>중요 문서함</h5>
				<hr class="ml-3 mr-3 mt-1 mb-1">
	           		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
	           		<span class="badge badge-warning badge-pill">TIP</span><br>
	           			중요문서함은 북마크한 전자결재 문서를 한 눈에 볼 수 있는 공간입니다<br>
	           			클릭을 통해  북마크 설정 및 삭제 할 수 있습니다
	           		</div>  

			</div>


		<div class="card p-4" style=" border-radius: 0.7rem;">
           		
			<table id="datatable-buttons" class='table text-center dt-responsive nowrap w-100'>                                                        
              <thead>                                                                                                   
                 <tr class="apple3 text-dark text-center" style="font-size:19px;">                                                                                                   
	                  	<th>순번</th>   
	                    <th>북마크</th>                                                             
	                    <th>문서번호</th>                                                          
	                    <th>제목</th>                                                              
	                    <th>작성자</th>                                                             
	                    <th>첨부파일</th>                                                            
	                    <th>결재의견</th>                                                            
	                    <th>상신일</th>                                                          
                 </tr>                                                                                                  
             </thead>
				<tbody>
				
					<c:forEach items="${bookmarkList }" var="doc" varStatus="status">	
					<tr style="font-size:17px;" class="apple4 text-dark">
							<c:set value="${doc.approvalDocCode }" var="code" />
						   <td class=" apple4 text-dark text-center" scope="row">
									<div class="ml-3 apple4 text-dark">${status.count }</div>
							</td>
							<td id="bookMarkTd" class="text-center apple4 text-dark">
								<c:if test="${bookmarkMap[code] eq 0}">
									<button class="bmBtn pr-3 text-dark" style="padding:0; background-color:inherit; border:none;"><i style="font-size:16px;" data-docCode="${code }" data-bk="0" class="mdi mdi-star-outline"></i></button>
								</c:if>
								<c:if test="${bookmarkMap[code] eq 1}">
									<button class="bmBtn pr-3 text-dark" style="padding:0; background-color:inherit; border:none;"><i style="font-size:16px;" data-docCode="${code }" data-bk="1" class="mdi mdi-star"></i></button>
								</c:if>
							</td> 
							<td  class=" workfitMouse text-center apple4 text-dark">${code }</td>
							<td   class=" workfitMouse apple4 text-dark text-left">${doc.approvalDocTitle }</td>
							<td  class="workfitMouse text-center apple4 text-dark">${writerMap[code]}</td>
							<td  class="workfitMouse text-center apple4 text-dark">${attachMap[code] }개</td>
							<td   class="workfitMouse text-center apple4 text-dark">${commentMap[code] }개</td>
 							<td class="apple4 text-dark">${dateMap[code] }</td> 
 						</tr>
					</c:forEach>

				</tbody>
			</table>
			</div>
         </div>                                                                                                                       
                                                                                                                                      
         <!-- end card-body-->                                                                                                        
      </div>                                                                                                                          
      <!-- end card-->                                                                                                                
   </div>                                                                                                                             
    <!-- end col -->                                                                                                                    
</div>
                                                                                                                                
<style>


/* 페이징 */

.page-item.active .page-link{
	background-color: #5F7CBB;

}
.dataTables_filter{
	font-family: 'apple3';
}


#datatable-buttons > tbody > tr:hover {
       background-color: #e7ecf1;
       cursor: pointer;
   }
   

</style>

<script>
		
	$(function(){
		
			// 데이터 테이블 
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
			
			
			
			$('#datatable-buttons').DataTable({
				destroy : false,
				info : false,
				lengthChange : false,
				language : lang_kor
			});
			
			$('.dataTables_paginate').addClass('pagination-rounded');
			
			
			
		});


	
</script>
