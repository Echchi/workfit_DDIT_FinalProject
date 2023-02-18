<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 조직도 트리를 위한 CSS 코드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/demo/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.js" type="text/javascript"></script>

<!-- bundle -->
<script src="/resources/assets/js/vendor.min.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/js/vendor/dragula.min.js"></script>
<script src="/resources/assets/js/ui/component.dragula.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/jquery-treeview-master/jquery.treeview.css" />

<!-- App favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">
<!-- 전자결재 css -->
<link href="/resources/assets/css/vendor/dataTables.bootstrap4.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/css/vendor/responsive.bootstrap4.css"
	rel="stylesheet" type="text/css">
<link href="/resources/assets/css/vendor/buttons.bootstrap4.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="/resources/customCSS/datepickerCSS.css" />
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
	type="text/css" />
<!-- App css -->
<link href="/resources/assets/css/icons.min.css" rel="stylesheet"
	type="text/css">
<link href="/resources/assets/css/app-modern.min.css" rel="stylesheet"
	type="text/css" id="light-style">
<link href="/resources/assets/css/app-modern-dark.min.css"
	rel="stylesheet" type="text/css" id="dark-style" disabled="disabled">
	
<link href="/resources/assets/css/vendor/simplemde.min.css" rel="stylesheet" type="text/css">


<style type="text/css">




#wrap {
	width: 1100px;
	margin: 0px auto; /*가운데 정렬*/
}

#box1 {
	width: 30%;
	height: 758px;
	background-color: transparent;
	border : 1px solid gray;
	border-radius : 10px;
	float: left;
	margin : 2px;
	padding-top : 10px;
}

#box2 {
	width: 40%;
	height: 758px;
	background-color: transparent;
	border : 1px solid gray;
	border-radius : 10px;
	float: left;
	margin : 2px;
	padding : 15px;
}

.box3 {
	width: 28%;
	height: 250px;
	background-color: transparent;
	border : 1px solid gray;
	border-radius : 10px;
	float: left;
	margin : 2px;
	padding : 15px;
}

.box4 {
	width: 28%;
	height: 250px;
	background-color: transparent;
	border : 1px solid gray;
	border-radius : 10px;
	float: left;
	margin : 2px;
	padding : 15px;
}

.box5 {
	width: 28%;
	height: 250px;
	background-color: transparent;
	border : 1px solid gray;
	border-radius : 10px;
	float: left;
	margin : 2px;
	padding : 15px;
}

#box2 span{
	font-size : 20px;
}

.box3 span{
	font-size : 16px;
}
.box4 span{
	font-size : 16px;
}
.box5 span{
	font-size : 16px;
}

/* 조직도 트리에서 각각의 노드들을 클릭했을 때 색상을 입혀주는 클래스 */
.clickMember{
				color: #464646;
/*   				    background-color: #35b8e0; */
   				border-color: #35b8e0;
   				font-weight : bold;
   				font-size : 23px !important;
	}

/* 수신자, 참조자, 숨은 참조자 박스를 클릭할 때마다 적용되는 테두리 CSS */
.boxClicked{
	border : 3px solid brown;
}

.filetree li {
 	padding: 3px 0 3px 16px !important; 
}


.workfitCardBg{
		border-radius:0.85rem !important; 
		background-color:rgba(255,255,255,0.85) !important;
	}
</style>
</head>
<body>
<!-- 	<input type="text" id="inp_memName" value="aa"/> -->
<!-- 	<input type="text" id="inp_memMail" value="bb"/> -->
<!-- 	<input type="text" id="inp_memJobGrade" value="cc"/> -->
	
	
	<div id="wrap">
		<div class='card workfitCardBg mt-2' >                                                                                              
	        <div class='card-body pl-4 pr-4 pt-4'>  			
			
				<div style="overflow : auto;" id="box1">
					<!-- 사원 검색하는 태그 시작 -->
					<div class="form-group">
						<label class="apple4 text-dark" style="font-size: 17px; ">&nbsp;&nbsp;&nbsp;사원 검색</label>
						<div class="input-group pl-2 pr-2">
							<input id="byhMemSearchInput" type="text" class="form-control apple3" placeholder="사원명 입력" aria-label="Recipient's username">
							<div class="input-group-append">
								<button id="byhTreeSearch" class="btn btn-dark apple3" type="button" onclick="fn_byhSearchTree()">검색</button>
							</div>
						</div>
					</div>
				
					<!-- 사원 검색하는 태그 끝 -->
					<ul id="codeList" class="filetree treeview"></ul>
			
				</div>
		
		
				<div id="box2"></div>
		
				<div class="box3" onclick="boxChange(this)">
					<h3 class="apple3 text-dark">수신자</h3>
				</div>
		
				<div class="box4" onclick="boxChange(this)">
					<h3 class="apple3 text-dark">참조자</h3>
				</div>
		
				<div class="box5" onclick="boxChange(this)">
					<h3 class="apple3 text-dark">숨은 참조자</h3>
				</div>
			</div>
			<div class="row col-12 offset-9 pb-3" style="padding-left : 92px;">
				<button type="button" style="clear : both; background-color : #5F7CBB; margin-right : 5px;" class="btn btn-primary apple3" onclick="fn_confirm()">확인</button>
				<button type="button" style="clear : both;" class="btn btn-light apple3" onclick="fn_closeWindow()">취소</button>
			</div>
		</div>
	</div>
	
	

	<script>
	
	// 삭제 버튼 
	function fn_delMem(a){
// 		event.preventDefault();
// 		event.stopPropagation();
		
		$(a).parent().remove();
		
	}
	
	
	$(function() {
		
		$.ajax({
			type : 'get',
			url : '/workfit/getTreeData',
			contentType : 'application/json; charset=utf-8',
			success : function(result){
				
				
				
				$.each(result,function(i,e){
					console.log(e);
					// 사원테이블에서 온 데이터인지, 부서테이블에서 온 데이터인지에 따라서 codeId, parentId가 결정되도록 차별성을 둬야 하므로 아래와 같은 코드를 작성함 
					if(e.deptCode != null){
						var codeId = 'dep'+e.deptCode;
						var codeNm = e.deptName;
						if(e.deptDirect != null){
							var parentId = 'dep'+e.deptDirect;
						}else{
							var parentId = e.deptDirect;
						}
						
					}else{
						var codeId = 'emp'+e.memId;
						var codeNm = e.memName+" "+e.memJobGrade;
						var parentId = 'dep'+e.deptFk;
					}
					
//						var codeLvl = e.codeLvl;
					
					// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
					var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><i class="dripicons-folder" style="font-size : 18px;"></i><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img style="display : none;" width="15" height="14" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><i class="dripicons-user" style="font-size : 18px;"></i><span onclick="oneclick(this)" style="font-size : 18px;">'+codeNm+'</span></li>';
					
					if(parentId == null) { // 부모가 없는 li요소들 
							$("#codeList").append(li);
															
							
					} else {  // 부모가 있는 li요소들은 else문을 들어감 
								
				    var parentLi = $("li[id='"+ parentId +"']");
							    
					var div = '<div onclick=myclick(this) class="hitarea expandable-hitarea"></div>'	
								  
					parentLi.addClass("expandable")
								  
								  // 모든 부모 li요소들은 직계자식으로 div태그를 단 한개씩만 가질 수 있음 (find해서 하나도 찾지 못했다는 것은 해당 태그에 div태그를 append해야함을 의미) 
								  if(parentLi.find("div").length == 0){
									  parentLi.append(div);	
									  
								  }

									// 부모요소의 img자식 태그 중 직계자식img태그만 그 모양을 폴더로 바꿔주면 됨 
								      parentLi.children("img").attr("src","${pageContext.request.contextPath }/resources/jquery-treeview-master/images/folder.gif");
									  parentLi.children("img").css("display","none");	  
								 	
									  
								  // 부모 li요소의 직계자식(ul)  
							      var bUl = parentLi.children("ul");
								

									
							      if(bUl.length == 0) {
							          li = "<ul style='display : none;'>" + li + "</ul>";
										
							          parentLi.append(li);

							      } else {
							    	  
							    	  
									 bUl.append(li);
							      }
						  }
				})
			
				
				
				// 각각의 Ul태그 중 마지막 li요소들만을 배열형태로 가져옴 
				var ulArr = $("ul[id='codeList'] li:last-child");
				for(let i = 0; i < ulArr.length; i++){
					// li요소 안에 div 태그가 하나라도 존재한다면(해당 li요소가 폴더라면) 폴더 밑으로 아무것도 보이지 않게 함 
					if($(ulArr[i]).find("div").length != 0){
						$(ulArr[i]).attr("class","closed expandable lastExpandable");
						$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
													
					}else{
						
						$(ulArr[i]).addClass("last");
						if($(ulArr[i]).attr("id").substr(0,3)=='dep'){
							console.log("if문 안들어오나??");
							ulArr[i].removeChild(ulArr[i].children[1]);
						}
						
					}
					
				}	
				


	        	// li중에서 폴더인 녀석들만 더블클릭 시 열고 접히는 이벤트를 줌 (이때 이벤트 버블링을 막아주는 코드 작성)
	        	var liArr2 = $("ul[id='codeList'] li");
	        	
	        	for(let i = 0; i < liArr2.length; i++){
	            		$(liArr2[i]).on("dblclick",function(e){
	             			e.stopPropagation();
	                		$(liArr2[i]).children("div").click();
		        	
	            		}) // 더블클릭에 대한 이벤트 설정 끝 
	            		
	    				
	        		
	        	} // for문 끝 
	        	
				
	        	
	        	// 부모 li의 폴더를 하나씩 지워주는 로직도 추가 + 파일 li의 i태그를 지워주는 로직도 추가 
            	var Contextmenu = !function() {
        			var id = 'contextmenu';
        			
        			
        			
        			
        			var allLi = $("ul[id='codeList'] li");
        			
        			for(let i = 0; i < allLi.length; i++){
        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
							
							// li요소들 중에 i태그(폴더 그림)을 지워준다.. 
        					$(allLi[i]).find(".dripicons-folder").remove();
        					
        				}else{  // 여기서 폴더를 한 개씩 제거 해주는 작업을 해준다 
        					$(allLi[i]).children("img")[0].remove();
        					$(allLi[i]).children(".dripicons-user").remove();
        					
        				}
        			}
        			
        			
        			
        		}();  // var Contextmenu 끝 
	        	
        		
        		
        		
        		
			} // success  
			
			

			
				
			
		}) // ajax 끝 
		
		

		
		
		var receiverInput = opener.document.getElementById("divText1"); // 수신자 인풋 태그 
		var refererInput = opener.document.getElementById("divText2"); // 참조자 인풋 태그 
		var hideRefererInput = opener.document.getElementById("divText3"); // 숨은 참조자 인풋 태그 
		
		
		var hideReceiverInput = opener.document.getElementById("hidedDivText1");
		var hideRefererInput = opener.document.getElementById("hidedDivText2");
		var hidedHideRefererInput =opener.document.getElementById("hidedDivText3");
		
		
		
		console.log("receiverInput있어?"+receiverInput);
		console.log(receiverInput);
		console.log("$(receiverInput).children(div).length확인"+$(receiverInput).children("div").length);
		
		
		// 부모창에서 이미 입력한 아이디들이 있다면 수신자 / 참조자 / 숨은 참조자 박스에 기존에 있던 아이디들을 기입해줌
		if($(receiverInput).children("div").length != 0){
			
// 			[...$(receiverInput).find("div")].map((ele)=>{
				var present = '${mailReceiver}';
				
				if(present != ''){
					
// 					console.log("물건 들어왔니?");
// 					console.log("물건 확인"+JSON.stringify(present));
// 					var memObj = JSON.parse(present);
// 					<div class="apple3" style="display : inline-block;"><span>사나 팀장</span><span id="NAVERabc008242" class="memberMail">abc008@naver.com</span><button id="btnNAVERabc008242" type="button" class="close" value="X">x</button><br></div>
// 					var divTag = '<p spellcheck="false" style="display : inline-block; margin-bottom : 0px;">'+memObj.memName+' '+memObj.memJobGrade+' '+memObj.memEmail+'<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem()">x</button></p><br/>';
					
// 					var divTag = '<div class="apple3" style="display : inline-block;"><span>'+memObj.memName+' '+memObj.memJobGrade+'</span><span id="'+memObj.memId+'" class="memberMail">'+memObj.memEmail+'</span><button id="btn'+memObj.memId+'" type="button" class="close" value="X">x</button><br></div>';
					
// 					$(".box3").append(divTag);
				}
				
				
				
// 			});
			
			[...$(hideReceiverInput).find("div")].map((element) => {
				var copiedMemNode = element.cloneNode(true);
				$(".box3").append(copiedMemNode);
			
			});
			
		}
		
		// 참조자
		if($(refererInput).children("div").length != 0){
			
				
				[...$(hideRefererInput).find("div")].map((element) => {
					var copiedMemNode = element.cloneNode(true);
					$(".box4").append(copiedMemNode);
				
				});


			
		}
		
		// 숨은 참조자
		if($(hideRefererInput).children("div").length != 0){
			
			[...$(hidedHideRefererInput).find("div")].map((ele)=>{
				var copiedMemNode = ele.cloneNode(true);
				$(".box5").append(copiedMemNode);
			})
			
		}
    		
		
		
    		
	}); // $(function(){}) 끝 

	
	
	
	// 폴더 클릭시 + , - 가 바뀜고 동시에 안의 폴더 및 파일들이 나타나게 하는 함수  
	function myclick(a){
		

		
		var myul = $(a).parent().children("ul");
		if(myul.css("display")=="none"){
			myul.css("display","block");
			
			
		}else{
			myul.css("display","none");
			
			
		}
		
		
		//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
		if($(a).attr("class") == "hitarea expandable-hitarea"){
			$(a).attr("class", "hitarea collapsable-hitarea")
			return;
		}

		if($(a).attr("class") == "hitarea collapsable-hitarea"){
			
			$(a).attr("class", "hitarea expandable-hitarea")
			return;
		}
		
		
		
		// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
		if($(a).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
			$(a).parent().attr("class","closed collapsable lastCollapsable");
			return;
		}
		
		if($(a).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
			$(a).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
			$(a).parent().attr("class","closed expandable lastExpandable");
			return;
			
			
		}
		
		
	}
	
	
	// window 객체로 선언함 
	click_history = []; 
	
	function oneclick(a){
		
// 		click_history.push(a); 	
		
// 		if(click_history.length == 1){
// //				$(a).css("background-color","green");
// 			$(a).addClass('clickMember');
			
// 		}else{
// 			$(click_history[0]).removeClass('clickMember');
// 			click_history.shift();
// 			$(a).addClass('clickMember');
			click_history.push(a); 	
					
					if(click_history.length == 1){
// 						$(a).css("background-color","green");
						$(a).addClass('clickMember');
						
					}else{
						
						for(let i = 0; i < click_history.length - 1; i++){
							$(click_history[i]).removeClass('clickMember');
						}

						for(let i = 0; i < click_history.length - 1; i++){
							click_history.shift();
						}
						
						$(a).addClass('clickMember');
// 						$(a).add("background-color","green");
					}


//				$(a).add("background-color","green");
		
		
		// --------------------클릭 함에 따라 색상을 입혀주는 로직 끝 ---------------------
		// 클릭 시 AJAX로 데이터를 읽어와 화면단에 뿌려주는 로직 클릭한 부서를 포함한 하위부서원들을 모두 계층형으로 정렬된 채 꺼내온다 
				var nodeId = $(a).parent().attr("id").substr(3);
				var flagForClassifyingDeptAndMem = $(a).parent().attr("id").substr(0,3);		
		
		
				var header = '${_csrf.headerName}';
    	    	var token =  '${_csrf.token}';
    	    		$.ajax({
						type : "post",
						url : "/workfit/getDeptAssignedMember",
						data : JSON.stringify({"deptCode" : nodeId, "flagForClassifyingDeptAndMem" : flagForClassifyingDeptAndMem}),
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						success : function(res){
							console.log(res);
							
							
							if(flagForClassifyingDeptAndMem == "dep"){
								var deptAndMems = {};
								var refinedArr = res.map((e) => {
//	 								var name = e.memName;
//	 								var jobGrade = e.memJobGrade;
									var depName = e.deptName;
//	 								var memMail = e.memEmail;
									
									
									if(depName in deptAndMems){
										deptAndMems[depName].push(e);

									}else{
										deptAndMems[depName] = [e]
										
									}
									
								})
								
								// deptAndMems에는 각 부서별 사원들의 데이터가 key(String) - value(List) 형태로 매핑이 되어있을 것임 
								var myStr = '';
								
								for(key of Object.keys(deptAndMems)){
									myStr += '<h2 class="text-dark apple3">'+key+'</h2>';
									
									
									for(val of deptAndMems[key]){
										myStr += '<input type="checkbox" style="accent-color:#5F7CBB;" class="byhInput mr-2" onchange="fn_checkProcess(this)"/>';
										myStr += '<div class="apple3" style="display : inline-block;"><span>'+val.memName+' '+val.memJobGrade+'</span><span id="'+val.memId+'" class="memberMail">'+val.memEmail+'</span></div><br/>';
										
									}
									
								}
								
								$("#box2").html(myStr);
							}else{ // "dep"일 경우 if문 끝...
								var myStr = '';
								res.map((val) => {
									myStr += '<h2>'+val.deptName+'</h2>';
									myStr += '<input type="checkbox" style="accent-color:#5F7CBB;" class="byhInput mr-2" onchange="fn_checkProcess(this)"/>';
									myStr += '<div  class="apple3" style="display : inline-block;"><span>'+val.memName+' '+val.memJobGrade+'</span><span id="'+val.memId+'" class="memberMail">'+val.memEmail+'</span></div><br/>';
								})
								
								$("#box2").html(myStr);
							}
							
							
						} // success 콜백 함수 끝... 
				})
	}
		
	var result2 = [];
	var folderOpenFlag = false;
	function fn_byhSearchTree(){
// 		var memVal = $("#byhMemSearchInput").val();
// 		console.log(memVal);
		
		
// 		var result = [...$("ul[id='codeList'] li:last-child")].find(element => {
// 			if($(element).find("div").length == 0){
// 				if($(element).attr("id").substr(0,3) != 'dep'){
					
// 					return $(element).text().includes(memVal);
// 				}
				
// 			}
							
// 		});
		
// 		$(result).dblclick();
// 		$(result).children("span").click();
		
		
		
// 		console.log(result);
		
		
// 		fn_closeAnyOpened();
// 		result2 = [...$("ul[id='codeList'] li")].filter(element => {
// 			if($(element).find(result).length != 0){
// 				console.log("div클릭하기 전"+$(element).children("div"))
				
				
				
// 				$(element).children("div").click();
// 				return $(element).find(result).length != 0;
// 			}
			
// 		})
							
// 		folderOpenFlag = true;
// 		console.log(result2);
		// 검색할 때마다 시작 부분에 기존에 색칠되있는 녀석들을 다 지워주는 작업이 필요 
		for(el of click_history){
			$(el).removeClass('clickMember');
		}
		
		for(el of click_history){
			click_history.shift();
			
		}
			
	
		var memVal = $("#byhMemSearchInput").val();
		console.log(memVal);
		
		
		var result = [...$("ul[id='codeList'] li")].filter(element => {
			if($(element).find("div").length == 0){
				if($(element).attr("id").substr(0,3) != 'dep'){
					
					
					
					return $(element).text().includes(memVal);
				}
				
			}
							
		});
		
		result.map((element)=>{
					click_history.push($(element).children("span"));
					$(element).children("span").addClass('clickMember');
			
		})
		
		
		
		
		console.log(result);
		
		fn_closeAnyOpened(); // << 폴더를 다 닫아주는 로직인데 얘는 무조건 실행되야 하는거 아님??
		
		$(result).dblclick();
//			$(result).children("span").click();
		
		result2 = [...$("ul[id='codeList'] li")].filter(element => {
//				if($(element).find(result).length != 0){

			for(el of result){
				if($(element).find(el).length != 0){
					
					var checkingDiv = true;
					break;
				}
			}

			if(checkingDiv){

				console.log("div클릭하기 전"+$(element).children("div"))
				
				
				
				$(element).children("div").click();
				return $(element).find(result).length != 0;
			}
			
		})
							
		folderOpenFlag = true;
		console.log(result2);
		
	}
	
	
	function fn_closeAnyOpened(){
		
		var allLiArrForByh = [...$("ul[id='codeList'] li")];
		
		
// 		if(folderOpenFlag){
			
			for(let i = 0; i < allLiArrForByh.length; i++){
						
				if($(allLiArrForByh[i]).children("div").length != 0){
					var elementDiv = $(allLiArrForByh[i]).children("div");
					

				
				
				
					var myul = $(elementDiv).parent().children("ul");
					
					if(myul.css("display") =="block"){
						
						myul.css("display","none");
						
					}
					
					
					//마지막 li태그요소가 아닌 li요소들은 아래와 같은 과정을 거쳐서 +, - 를 전환해야함 
					if($(elementDiv).attr("class") == "hitarea expandable-hitarea"){
						$(elementDiv).attr("class", "hitarea collapsable-hitarea")
					}
			
					if($(elementDiv).attr("class") == "hitarea collapsable-hitarea"){
						
						$(elementDiv).attr("class", "hitarea expandable-hitarea")
					}
					
					
					
					// 각각의 UL태그 중에서 마지막 li태그요소가 마지막 폴더라면 아래와 같은코드를 거치도록 해야함
					if($(elementDiv).attr("class") == "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea"){
						$(elementDiv).attr("class", "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea")
						$(elementDiv).parent().attr("class","closed collapsable lastCollapsable");
					}
					
					if($(elementDiv).attr("class") == "hitarea closed-hitarea collapsable-hitarea lastCollapsable-hitarea"){
						$(elementDiv).attr("class", "hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea")
						$(elementDiv).parent().attr("class","closed expandable lastExpandable");
						
					}
				
				} // div가 존재할 때 if문 끝... 
				
			
			}
			
			folderOpenFlag = false;
// 		}
		
		
	}
	
			
					
			
			
			window.selectedMemNodeArr = [];  // 클릭할 때마다 클릭한 멤버노드들이 담겨지는 곳    
			function fn_checkProcess(a){
				console.log(a.nextElementSibling );
				
// 				console.log(a.checked);
				if(a.checked){ // window.selectedMemNodeArr의 리스트에서 클릭한 멤버노드를 제거시킨다 
					var memDataNode = a.nextElementSibling;
					
					var newMemNode = memDataNode.cloneNode(true)
					
					var btnId = $(a.nextElementSibling).children(".memberMail").attr("id");
					
					
// 					var btnTag = '<button id="btn'+btnId+'" type="button" class="close" value="X" onclick="fn_delMem(this)">x</button>';
					var btnTag = document.createElement("button");
					
					$(btnTag).attr("id","btn"+btnId);
					$(btnTag).attr("type","button");
					$(btnTag).attr("class","close");
					$(btnTag).attr("value","X");
					$(btnTag).text("x");
					
					btnTag.addEventListener("click",function(e){
						e.stopPropagation();
						
						// box2에서 삭제하려는 노드와 매핑된 인풋태그의 체크박스를 다시 해제시키고 삭제
						console.log("btn아이디값 확인"+btnId);
						
						console.log("안 찾아짐??"+$("#box2").find("#"+btnId));
						console.log($("#box2").find("#"+btnId));
						console.log($("#box2").find("#"+btnId).parent().prev());
						
// 						var checkedInputTag = $("#box2").find("#"+btnId).parent().prev();
// 						$(checkedInputTag).prop("checked",false);
// 						$("#box2").find("#"+btnId).parent().prev().checked = false;
						
						$(btnTag).parent().remove();
					})
					
					
					
					$(newMemNode).css("display","inline-block");
					$(newMemNode).append(btnTag);
					$(newMemNode).append('<br/>');
					window.selectedMemNodeArr.push(newMemNode);
					console.log("배열 안 확인"+window.selectedMemNodeArr);
				}else{
					var btnId = $(a.nextElementSibling).children(".memberMail").attr("id");
					
					
					// window.selectedMemNodeArr에서 체크해제한 노드를 제거시킨다 
					
					window.selectedMemNodeArr = window.selectedMemNodeArr.filter((ele)=>{
						
						return $(ele).find("#"+btnId).length == 0;
					});
					
					console.log("배열 안 확인"+window.selectedMemNodeArr);
					
					
					
					
					// 현재 선택된 select box에서 지워준다!!
					// id로 find 해서 그 녀석의 부모를 제거시키면 된다 
// 					$(window.selectedBox).find("#"+btnId).parent().remove();
					
// 					$('#btn'+btnId).click();
					
				}
				
				
			}
			
			var box_click_history = [];
// 			window.selectedBox = document.querySelector(".box3");
// 			$(window.selectedBox).addClass("boxClicked");
// 			box_click_history.push(window.selectedBox);
			function boxChange(a){ // 박스를 클릭했을 시 나타나는 이벤트
				box_click_history.push(a);
				window.selectedBox = a;
				console.log("셀렉트 박스 누군지 확인"+$(window.selectedBox).attr("class"));
				// 먼저 window.selectedBox 안에 있는 노드들을 제거시켜줌   
				if(!$(window.selectedBox).attr("class").includes("box3")){
					
					$(window.selectedBox).find("div").remove();
				}
				
				// 클릭할 때마다 window.selectedMemNodeArr 배열 안에 담긴 녀석들을 append 시켜줌 + window.selectedMemNodeArr 초기화  
				
				for(el of window.selectedMemNodeArr){
					$(window.selectedBox).append(el);
				}
				window.selectedMemNodeArr = [];
				// ---------------------------------------
				
				
				if(box_click_history.length == 1){
					$(a).addClass("boxClicked");
				}else{
					$(box_click_history[0]).removeClass("boxClicked");
// 					$(box_click_history[0]).css("border","1px solid black");
					
					// history배열에서 삭제하기 전에 temp에다가 저장을 해놓음
					window.tempSelectBox = box_click_history[0];
					box_click_history.shift();
					$(a).addClass('boxClicked');
				}
				
				
// 				$(window.selectedBox).css("border","none");
// 				window.selectedBox = a;
// 				$(window.selectedBox).css("border","3px solid brown");
				// 박스를 클릭할 때마다 나타나야 할 이벤트들 
				
				// 우선 클릭 할 때마다 box2의 모든 체크박스들을 해제시킨다  + 체크된 녀석들을 전부 append 시킴   
				[...$(".byhInput")].map((e) => {
					if(e.checked){
						e.checked = false;
					}
					
				})
// 				if(window.tempSelectBox != window.selectedBox){ 
// 				}
			}
			
			
			
			
			
// 			function fn_checkProcess(a){
// 				console.log(a.nextElementSibling );
// 				var memDataNode = a.nextElementSibling;
				
// 				var newMemNode = memDataNode.cloneNode(true)
				
// 				$(window.selectedBox).append(newMemNode);
// 			}
			var receiverInput = opener.document.getElementById("divText1"); // 수신자 인풋 태그 
			var refererInput = opener.document.getElementById("divText2"); // 참조자 인풋 태그 
			var hideRefererInput = opener.document.getElementById("divText3"); // 숨은 참조자 인풋 태그 
			function fn_confirm(){
				// 부모 창의 노드들 내용물 비워주기 시작 ======================
				$(opener.document.getElementById("hidedDivText1")).html('');
				$(opener.document.getElementById("hidedDivText2")).html('');
				$(opener.document.getElementById("hidedDivText3")).html('');
				receiverInput.innerHTML = '';
				refererInput.innerHTML = '';
				hideRefererInput.innerHTML = '';
				// 부모 창의 노드들 내용물 비워주기 끝 ======================
				
				// 수신자 인풋 태그에 메일 집어넣기 + 부모창의 숨은 태그에 노드들을 append 시켜주기 
				for(el of [...$(".box3").find(".memberMail")]){
					console.log(el);
					var divTag = document.createElement("div");
					$(divTag).attr("contenteditable","false");
					$(divTag).attr("tabindex","-1");
					$(divTag).css({"display":"inline-block", "background-color" : "rgb(98 146 250 / 43%)", "border-radius" : "10px", "width" : "auto", "height" : "30px", "text-align" : "center","padding" : "3px", "margin-right" : "3px"});
					var myString = '<p spellcheck="false" style="display : inline-block;" id="'+$(el).attr("id")+'">'+$(el).text()+'<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem(this)">x</button></p>';
					
					$(divTag).append(myString);
					
					$(opener.document.getElementById("hidedDivText1")).append($(el).parent()); // 부모창의 숨겨진 참조 박스에다가 노드들을 집어넣어 놓음 
					
					$(receiverInput).append(divTag);
				}
				
				// 참조자 인풋 태그에 메일 집어넣기 + 부모창의 숨은 태그에 노드들을 append 시켜주기 
				for(el of [...$(".box4").find(".memberMail")]){
					console.log(el);
					var divTag = document.createElement("div");
					$(divTag).attr("contenteditable","false");
					$(divTag).attr("tabindex","-1");
					$(divTag).css({"display":"inline-block", "background-color" : "rgb(98 146 250 / 43%)", "border-radius" : "10px", "width" : "auto", "height" : "30px", "text-align" : "center","padding" : "3px", "margin-right" : "3px"});
					var myString = '<p spellcheck="false" style="display : inline-block;" id="'+$(el).attr("id")+'">'+$(el).text()+'<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem(this)">x</button></p>';
					
					$(divTag).append(myString);
					
					
					$(opener.document.getElementById("hidedDivText2")).append($(el).parent()); // 부모창의 숨겨진 참조 박스에다가 노드들을 집어넣어 놓음 
					
					$(refererInput).append(divTag);
				}
				
				// 숨은 참조자 인풋 태그에 메일 집어넣기 + 부모창의 숨은 태그에 노드들을 append 시켜주기 
				for(el of [...$(".box5").find(".memberMail")]){
					console.log(el);
					var divTag = document.createElement("div");
					$(divTag).attr("contenteditable","false");
					$(divTag).attr("tabindex","-1");
					$(divTag).css({"display":"inline-block", "background-color" : "rgb(98 146 250 / 43%)", "border-radius" : "10px", "width" : "auto", "height" : "30px", "text-align" : "center", "padding" : "3px", "margin-right" : "3px"});
					var myString = '<p spellcheck="false" style="display : inline-block;" id="'+$(el).attr("id")+'">'+$(el).text()+'<button id="delRefBtn" type="button" class="close" value="X" onclick="fn_delMem(this)">x</button></p>';
					
					$(divTag).append(myString);
					
					$(opener.document.getElementById("hidedDivText3")).append($(el).parent()); // 부모창의 숨겨진 참조 박스에다가 노드들을 집어넣어 놓음 
					
					$(hideRefererInput).append(divTag);
				}
				
				
				window.close();
			}
	   		
			
			function fn_closeWindow(){
				window.close();
			}
	   		
	   		</script>

</body>
</html>