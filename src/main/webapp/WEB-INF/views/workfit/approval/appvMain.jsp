<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class='row mt-1'>                                                                                                 
  <div class='col-12'>                                                                                                  
     <div class='card'>                                                                                                 
        <div class='card-body pl-5 pr-5'>
        	 <div class="justify-content-center apple4">
           					<!-- 상신 -->
           					<div class="apple6 text-dark pl-3" style="font-size: 23px;">상신</div>
		           	       <div class="row apple4"> 
			            	<div class="col-4 pr-1">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center">
											<i class="mdi mdi-file-document-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark" style="font-size: 17px;">결재대기</h4>
									    	<h6 class="apple5 text-dark" style="font-size: 21px;">${count }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
			            	<div class="col-4 pr-1">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center pl-0 pr-0">
											<i class="mdi mdi-file-document-edit-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark pl-0" style="font-size: 17px;">결재진행</h4>
									    	<h6 class="apple5 remainDate text-dark" style="font-size: 21px;">${12 - useDate }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
			            	<div class="col-4 pr-2">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center pl-0 pr-0">
											<i class="mdi mdi-file-document-multiple-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark" style="font-size: 17px;">결재완료</h4>
									    	<h6 class="apple5 usedDate text-dark" style="font-size: 21px;">${useDate }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
					</div>
					
					<!-- 수신 -->
			        <div class="apple6 text-dark pl-3 mt-5" style="font-size: 23px;">수신</div>
					<div class="row">
			            	<div class="col-4 pr-1">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center">
											<i class="mdi mdi-file-document-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark" style="font-size: 17px;">결재대기</h4>
									    	<h6 class="apple5 text-dark" style="font-size: 21px;">${count }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
			            	<div class="col-4 pr-1">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center pl-0 pr-0">
											<i class="mdi mdi-file-document-edit-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark pl-0" style="font-size: 17px;">결재진행</h4>
									    	<h6 class="apple5 remainDate text-dark" style="font-size: 21px;">${12 - useDate }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
			            		<div class="col-4 pr-2">
								<div class="card" style="background-color: rgb(255,255,255); box-shadow: 1px 1px 10px #9f9e9e; border-radius: 0.7rem">
									<div class="card-body row" >
										<div class="col-4 text-center pl-0 pr-0">
											<i class="mdi mdi-file-document-multiple-outline text-dark" style="font-size: 27px"></i>
										</div>
										<div class="col-8">
									    	<h4 class="text-dark" style="font-size: 17px;">결재완료</h4>
									    	<h6 class="apple5 usedDate text-dark" style="font-size: 21px;">${useDate }<span style="font-size: 15px"> 개</span></h6>
										</div>
								  	</div>
								</div>
			            	</div>
		                </div>
					
					
					
					</div>
					
					
				</div>
        </div>
     </div>
  </div>
 </div>