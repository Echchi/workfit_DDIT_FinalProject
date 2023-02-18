	$(function() {
			
			$.ajax({
				type : 'get',
				url : '/workfit/getTreeData',
				contentType : 'application/json; charset=utf-8',
				success : function(result){
					
					
					
					$.each(result,function(i,e){
						console.log(e);
						// 사원테이블에서 온 데이터인지, 부서테이블에서 온 데이터인지에 따라서 codeId, parentId가 결정되도록 차별성을 둬야 하므로 아래와 같은 코드를 작성함 
						if(e.empId == null){
							var codeId = e.deptId;
							var codeNm = e.deptName;
							var parentId = e.parentId;
						}else{
							var codeId = e.empId;
							var codeNm = e.empName;
							var parentId = e.deptId;
						}
						
// 						var codeLvl = e.codeLvl;
						var li = '<li onselectstart="return false" ondragstart="return false" id="'+ codeId +'"><img style="display : none;" src="${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"><img width="15" height="14" src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><span onclick="oneclick(this)">'+codeNm+'</span></li>';
						
						// 일단 각각의 노드들이 li태그요소라고 보면 되고, 처음에는 파일로 간주하여 li를 생성하고 이후 해당태그를 부모로 갖는 노드가 나타나면 해당 태그를 파일에서 폴더로 바꿔주는 느낌의 로직? 또는 알고리즘 
						
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
					var ulArr = $("ul li:last-child");
					for(let i = 0; i < ulArr.length; i++){
						
						// li요소 안에 div 태그가 하나라도 존재한다면(해당 li요소가 폴더라면) 폴더 밑으로 아무것도 보이지 않게 함 
						if($(ulArr[i]).find("div").length != 0){
							$(ulArr[i]).attr("class","closed expandable lastExpandable");
							$(ulArr[i]).children("div").attr("class","hitarea closed-hitarea expandable-hitarea lastExpandable-hitarea");
														
						}else{
							$(ulArr[i]).addClass("last");
							
						}
						
					}	
					
					// 모든 li 요소들에 더블클릭 이벤트를 등록함  
// 					var liArr = $("li"); 
					
// 					for(let i = 0; i < liArr.length; i++){
// 						liArr[i].addEventListener("dblclick", function(){
// 							console.log("까꿍");
// 						})
// 					}


		        	// li중에서 폴더인 녀석들만 더블클릭 시 열고 접히는 이벤트를 줌 (이때 이벤트 버블링을 막아주는 코드 작성)
		        	var liArr2 = $("li");
// 		        	console.log("liArr2 check" + liArr2)
		        	
		        	for(let i = 0; i < liArr2.length; i++){
// 		     				console.log("더블클릭 체크"+liArr2[i])
		            		$(liArr2[i]).on("dblclick",function(e){
// 		     				console.log("더블클릭 체크(for문 안)"+liArr2[i])
		             			e.stopPropagation();
		                		$(liArr2[i]).children("div").click();
			        	//  li중 폴더가 아닌 녀석들은 ajax를 통한 데이터 조회가 가능하도록 작성
							if($(liArr2[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
								
								// 파일의 데이터를 가져와서 body에 뿌려주는 ajax 코드 작성   
								
								var mynode = {
									deptId : $(liArr2[i]).attr("id")
								}
								
								$.ajax({
									type : "post",
									url : "/getTreeData",
									data : JSON.stringify(mynode),
									contentType : "application/json; charset=utf-8",
									dataType : "json",
									success : function(res){
// 										console.log(res);

										str = "<h2>"+res.deptId+"</h2>";
										
										$("#mycontent").html(str);
									}
								})
								
							}	
			        	
			        	
		            		}) // 더블클릭에 대한 이벤트 설정 끝 
		            		
// 		            		$(liArr2[i]).on("dragover",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            		})
	
// 		            		$(liArr2[i]).on("drop",function(e){
		            			
// 		            			e.preventDefault(); 
// 		            			e.stopPropagation();
// 		            			console.log("drop확인")
// 		            		})
		    				
		        		
		        	} // for문 끝 
		        	
					
		        	
	            	// 우클릭에 대한 이벤트 로직 
	            	var Contextmenu = !function() {
	        			var id = 'contextmenu';
	        			
	        			
	        			{
	        				var div = document.createElement('div');
	        				div.id = id;
	        				div.style = 'display:none;position:fixed;width:150px; height:200px; background: #fff;box-shadow:1px 1px 5px 0 rgba(0, 0, 0, 0.54)';

	        				var hTag1 = "<h2 class='mymenu' id='message'>쪽지 보내기</h2>";
	        				var hTag2 = "<h2 class='mymenu' id='work'>일감 요청하기</h2>";
	        				var hTag3 = "<h2 class='mymenu' id='compliment'>칭찬하기</h2>";
	        				$(div).append(hTag1);
	        				$(div).append(hTag2);
	        				$(div).append(hTag3);
							
	        				document.body.appendChild(div);
	        			}
	        			var div = document.getElementById(id);
	        			
	        			
	        			var allLi = document.querySelectorAll("li");
	        			
	        			for(let i = 0; i < allLi.length; i++){
	        				if($(allLi[i]).children("img").attr("src") == "${pageContext.request.contextPath }/resources/jquery-treeview-master/images/file.gif"){
								// 모든 li요소들 중 파일인 녀석들만 우클릭 시 원하는 메뉴가 나오도록 설정함    
	        					allLi[i].addEventListener("contextmenu",function(e){
	        						e.preventDefault();
									
	        						emp_idVal = $(allLi[i]).attr("id");
	        						
	        						
	        						
	                				var x = e.pageX + 'px';
	                				var y = e.pageY + 'px';
	                				div.style.display = 'block';
	                				div.style.left = x;
	                				div.style.top = y;
	        						
	        					})
	        					
	        				}
	        			}
	        			
	     					document.addEventListener("click",function(e){
	     						div.style.display = 'none'
	     						
	     					})
	        			
	        			
	        		}()  // var Contextmenu 끝 
	        		
	        		
	        		
	        		// 아래는 모달에 대한 로직들 
//	     			console.log(document.querySelectorAll(".mymenu"));
	            		var hTagArr = document.querySelectorAll(".mymenu")
	            		for(let i = 0; i < hTagArr.length; i++){
	            			hTagArr[i].addEventListener("click",function(){
	            	    		var idVal = $(hTagArr[i]).attr("id"); 
	            				
	            	    		modal = document.getElementById(idVal);
	            	    		console.log("유니크 컨텐트 확인");
	            	    		console.log($(modal).find("#unique_content"))
	            	    		
	            	    		if(idVal == "message"){
	            	    			
	            	    			var empObj = {
	            	    					empId : emp_idVal
	            	    			}
	            	    			
	            	    			$.ajax({
										type : "post",
										url : "/getEmpData",
										data : JSON.stringify(empObj),
										contentType : "application/json; charset=utf-8",
										dataType : "json",
										success : function(res){
//	 										console.log(res);
			            	    		var myStr = "수신메일&nbsp;&nbsp;<input type='text' value='"+res.empName+"' disabled='disabled'/>";
			            	    		$(modal).find("#unique_content").html(myStr);
											
											
										}
									})
	            	    			
	            	    			
	            	    			
	            	    		}
	            	    		
	            	    		closeBtn = modal.querySelector(".close-area")
	            	    		closeBtn.addEventListener("click", e => {
	            		    		modalOff()
	            				}) 	
	            	    		modalOn();
	            			})
	            		}
	        		
	        		
	        		
		        	

					
				} // success  
				
				
 
				
					
				
			}) // ajax 끝 
			
			var mytree = $("#codeList");
			
            mytree.treeview({
                collapsed: true,
                animated: "medium",
                control:"#sidetreecontrol",
                persist: "location",
                dragAndDrop : true
            });
			
			
			
            	mytree.bind("tree.click",function(e) {

					e.preventDefault();
					var selected_node = e.node;  // 선택된 노드

					if ( mytree.tree("isNodeSelected", selected_node) ) {  // 선택된 노드가 이미 선택되어져 있는 상태라면

					mytree.tree("removeFromSelection", selected_node);  // 선택상태를 해제시킴

					} else {  // 선택된 노드가 선택되어져 있지 않은 상태라면

					mytree.tree("addToSelection", selected_node);  // 선택된 노드를 선택상태로 함

					}

					}

					);
			
			



  					
        		  
        	
        		
        		
        		// 여기서 btn-modal은 우클릭 시 나타나는 각각의 메뉴들에 해당하는 태그들의 아이디 값으로 생각하면 좋을 듯
        		// 우클릭 시 나타나는 메뉴들의 각각의 태그에 id값들을 주고 onclick=myfunc(this)로 함수를 넣어준 뒤에 
        		// 아래 함수를 통해서 내가 클릭하고자 하는 모달이 뭔지 정해줄 수 있음
        		
        		
        		function modalOn() {
        		    modal.style.display = "flex"
        		}
        		
        		function isModalOn() {
        		    return modal.style.display === "flex"
        		}
        		
        		function modalOff() {
        		    modal.style.display = "none"
        		}
        		
        		
        		
        		
        		
        		
		}); // $(function(){}) 끝 

		
		console.log("리스트 태그 가져와는지 확인!")
    	console.log($("li"))
    	console.log($("#1"))
		console.log("리스트 태그 가져와는지 확인끝!")
		
		
		
		
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
			
			click_history.push(a); 	
// 			console.log(click_history)
			
			if(click_history.length == 1){
				$(a).css("background-color","green");
				
			}else{
// 				console.log($(click_history[0]))
				$(click_history[0]).css("background-color","transparent");
				click_history.shift();
				$(a).css("background-color","green");
			}
		}
		