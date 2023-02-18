<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<style>

	table {
    	table-layout: fixed;
    	border-collapse: separate;
	}
	.byhNode{
/* 		width : 100px;  */
/* 		height : 60px; */
/* 		text-align: center;  */
/*     	vertical-align: middle;  */
/* 	    font-family: arial,helvetica;  */
/* 	    cursor: default;  */
/* 	    border: 2px solid #b5d9ea;  */
/* 	    -moz-border-radius: 5px;  */
/* 	    -webkit-border-radius: 5px;  */
/* 	    -webkit-box-shadow: rgb(0 0 0 / 50%) 3px 3px 3px;  */
/* 	    -moz-box-shadow: rgba(0, 0, 0, 0.5) 3px 3px 3px;  */
/* 	    background-color: #edf7ff;  */
/* 	    background: -webkit-gradient(linear, left top, left bottom, from(#edf7ff), to(#cde7ee));  */

/*         border: 15px solid rgb(163, 151, 198); */
 		margin: 0 auto;
        width: 200px;
        height: 200px;
        border: 25px solid transparent;
        border-radius: 50%;
        background-image: linear-gradient(#fff, #fff), 
    	linear-gradient(to right, #005C97, #363795);
   	    background-origin: border-box;
  		background-clip: content-box, border-box;
 		font-size : 30px;
	}

	.selectedByhNode{
/* 		border: 2px solid #e3ca4b; */
/* 	    background-color: #fff7ae; */
/* 	    background: -webkit-gradient(linear, left top, left bottom, from(#fff7ae), to(#eee79e)); */
	}
	
</style>
<script type="text/javascript">




	  function fn_yhClick(a){
		  console.log($(a).parent().attr("id"));
	  }
	


	  
	  function makeDropDownStr(idVal){
		  
		  
		  if(idVal.startsWith('dep')){
			  return '<div class="dropdown float-right"><a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-horizontal"></i></a><div id="'+idVal.substr(3)+'" class="dropdown-menu dropdown-menu-right"><a href="javascript:void(0);" class="dropdown-item">그룹 리더/담당자 변경</a><a href="javascript:void(0);" class="dropdown-item">그룹 이름 변경</a> <a onclick="fn_yhClick(this)" class="dropdown-item">하위 그룹 추가</a><a onclick="fn_yhClick(this)" class="dropdown-item">그룹 삭제</a></div> </div>';
			  
		  }else if(idVal.startsWith('emp')){
			  return '<div class="dropdown float-right"><a href="#" class="dropdown-toggle arrow-none card-drop" data-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-dots-horizontal"></i></a><div id="'+idVal.substr(3)+'" class="dropdown-menu dropdown-menu-right"><a href="javascript:void(0);" class="dropdown-item">직원 추가</a><a onclick="fn_yhClick(this)" class="dropdown-item">직원 퇴사</a></div> </div>';
			  
		  }
		  
	  }



	  $(function(){
		  google.charts.load('current', {packages:["orgchart"]});
	      google.charts.setOnLoadCallback(drawChart);
			
	      var deptList = JSON.parse('${deptData}');
//	       console.log(JSON.stringify(deptList));
//	       var memList = JSON.parse('${memData}');
//	       console.log(JSON.stringify(memList));
	      
	      
	      function drawChart() {
	    	  
	    	var rowsToAdd = [[{'v':'워크핏', 'f':'<span class="apple3">대덕상사</span>'
	       },'', 'The President']];  
	        var data = new google.visualization.DataTable();
	        data.addColumn('string', 'Name');
	        data.addColumn('string', 'Manager');
	        data.addColumn('string', 'ToolTip');

	        // For each orgchart box, provide the name, manager, and tooltip to show.

	        // 부서리스트에 대한 노드들을 먼저 rowsToAdd에 집어넣음
	        var deptCodeAndName = {};
	        var lv2Nodes = [];
	        var lv2NodesAndChildInfo = {};   // 해당 맵에는 A부서 : [A부서-1, A부서-2] 등 이런식으로 데이터가 매핑되있을 것임 
	        for(let i = 0; i < deptList.length; i++){
	        	var dept = deptList[i];
	        	deptCodeAndName[dept.deptCode] = dept.deptName;
	        	
	        	
	        	if(dept.deptName == '미배정'){
	        		continue;
	        	}
	        	
	        	if(deptList[i].deptDirect == null){
	        		rowsToAdd.push([{'v' : dept.deptName, 'f' : '<span class="apple3">'+dept.deptName+'</span>'},'워크핏','']);
	        		lv2Nodes.push(dept.deptCode);
	        	}else{
	        		
	        		// 말단 노드들은 묶어서 한번에 f 에다가 태그로 잘 만들어서 집어넣어주면 되지 않을까?? 
	        		if(lv2Nodes.includes(dept.deptDirect)){ // 여기 if문에 들어간다는 것은 말단 노드라는 말임 
	        			if(lv2NodesAndChildInfo[dept.deptDirect] == '' || lv2NodesAndChildInfo[dept.deptDirect] == null){      // 이미 매핑된 정보가 없으면(해당 키값에 배열이 이미 존재하면)
		        			lv2NodesAndChildInfo[dept.deptDirect] = [dept.deptName];
	        			}else{
	        				lv2NodesAndChildInfo[dept.deptDirect].push(dept.deptName);
	        			}
	        			
	        		}else{
		        		rowsToAdd.push([{'v' : dept.deptName, 'f' : dept.deptName},deptCodeAndName[dept.deptDirect],'']);	
	        			
	        		}
	        		
	        		
	        	}
	        	
	        	
	        	
	        
	        } // 부서 for문 끝 
	        
	        var colorList = ["linear-gradient(to right, #0082c8, #667db6);","linear-gradient(to right, #2c3e50, #3498db);","linear-gradient(to right, #00bf8f, #001510);","linear-gradient(to right, #6A9113, #141517);","linear-gradient(to right, #DCE35B, #45B649);"]; // 1~5번째 row들에 대한 컬러들을 매칭시켜주는 자료형 
	        
	        var cntForLoop = 0;
	        for(el of Object.keys(lv2NodesAndChildInfo)){
	        	
//	         	console.log("key값 확인좀 하자"+el);
//	         	console.log("value값 확인좀 하자"+lv2NodesAndChildInfo[el]);

// 	        	margin: 0 auto;
// 		        width: 200px;
// 		        height: 200px;
// 		        border: 25px solid transparent;
// 		        border-radius: 50%;
// 		        background-image: linear-gradient(#fff, #fff), 
// 		    	linear-gradient(to right, red 0%,  orange 100%);
// 		   	    background-origin: border-box;
// 		  		background-clip: content-box, border-box;
	        	
	        	var color = colorList[cntForLoop];
	        	
				var fString = '';
				for(val of lv2NodesAndChildInfo[el]){
					
					fString += '<span class="apple3 text-dark" style="display : inline-block; padding : 3px; border: 3px solid transparent; border-radius : 20px; background-image: linear-gradient(#fff, #fff),'+ color +' background-origin: border-box; background-clip: content-box, border-box; margin-bottom : 0px; font-size : 25px;">';
					fString += '<span style="padding : 15px;">'+val+'</span>';
					fString += '</span>';
					if(val != lv2NodesAndChildInfo[el][lv2NodesAndChildInfo[el].length-1]){ // 마지막 번째 노드면은 작대기가 없도록 한다   
						fString += '<div class="row ml-5" style="margin-left: 93px !important;"><div style="border-left: 1px solid #1E90FF; height: 30px;"></div></div>';
					}
					
//	 				console.log("value값"+val);
				}
				fString += '</span>';
						
				
				if(lv2NodesAndChildInfo[el].length == 1){
					fString += '<br/>';
					fString += '<br/>';
					fString += '<br/>';
				}
				
				
	        	rowsToAdd.push([{'v' : deptCodeAndName[el]+"child", 'f' : fString},deptCodeAndName[el],'']);
	        	
	        	cntForLoop += 1; 
	        }

	        
	        // 멤버리스트에 대한 노드들을 리스트에 집어넣는 for문 
//	         for(let i = 0; i < memList.length; i++){
//	         	var mem = memList[i];
	        	
//	         	rowsToAdd.push([{'v' : mem.memName, 'f' : '<img width="50" height="50" src="'+mem.memProfileUrl+'">'+makeDropDownStr('emp'+mem.memId)+"<br>"+mem.memName},deptCodeAndName[mem.deptFk],''])
	        	
//	         } // for문 끝... 
	        
	        
	        data.addRows(rowsToAdd);
	        
// 	    	margin: 0 auto;
// 	        width: 200px;
// 	        height: 200px;
// 	        border: 25px solid transparent;
// 	        border-radius: 50%;
// 	        background-image: linear-gradient(#fff, #fff), 
// 	    	linear-gradient(to right, red 0%,  orange 100%);
// 	   	    background-origin: border-box;
// 	  		background-clip: content-box, border-box;
			
	        data.setRowProperty(1, 'style', 'margin: 0 auto; width: 200px; height: 200px; border: 25px solid transparent; border-radius: 50%; background-image: linear-gradient(#fff, #fff),'+colorList[0]+' background-origin: border-box; background-clip: content-box, border-box;');
	        data.setRowProperty(2, 'style', 'margin: 0 auto; width: 200px; height: 200px; border: 25px solid transparent; border-radius: 50%; background-image: linear-gradient(#fff, #fff),'+colorList[1]+' background-origin: border-box; background-clip: content-box, border-box;');
	        data.setRowProperty(3, 'style', 'margin: 0 auto; width: 200px; height: 200px; border: 25px solid transparent; border-radius: 50%; background-image: linear-gradient(#fff, #fff),'+colorList[2]+' background-origin: border-box; background-clip: content-box, border-box;');
	        data.setRowProperty(4, 'style', 'margin: 0 auto; width: 200px; height: 200px; border: 25px solid transparent; border-radius: 50%; background-image: linear-gradient(#fff, #fff),'+colorList[3]+' background-origin: border-box; background-clip: content-box, border-box;');
	        data.setRowProperty(5, 'style', 'margin: 0 auto; width: 200px; height: 200px; border: 25px solid transparent; border-radius: 50%; background-image: linear-gradient(#fff, #fff),'+colorList[4]+' background-origin: border-box; background-clip: content-box, border-box;');

	        
	        
	        
	        data.setRowProperty(6, 'style', 'border: none;  background : none; width : auto; height : auto;');
	        data.setRowProperty(7, 'style', 'border: none;  background : none; width : auto; height : auto;');
	        data.setRowProperty(8, 'style', 'border: none;  background : none; width : auto; height : auto;');
	        data.setRowProperty(9, 'style', 'border: none;  background : none; width : auto; height : auto;');
	        data.setRowProperty(10, 'style','border: none;  background : none; width : auto; height : auto;');
	        
	        
	        
	        // Create the chart.
	        var chart = new google.visualization.OrgChart(document.getElementById('byhContainer'));
	        // Draw the chart, setting the allowHtml option to true for the tooltips.
	        chart.draw(data, {'allowHtml':true,
	        				  'allowCollapse' : false, 	
	        				  'nodeClass' : 'byhNode', 
	         				  'selectedNodeClass' : 'selectedByhNode',
	        				  'size' : 'large'
	        				  
	        });
	        
	        // 아래와 같이 이벤트를 먹여줄 수도 있음 
// 	        document.querySelector(".byhNode").addEventListener("click",function(event){
// 	        	console.log("선택했어?");
	        	
// 	        })
	        
	        
	        [...$(".byhNode")].map((ele)=>{
	        	ele.addEventListener("click",function(event){
	        		var clickedNode = event.target;
	        		
	        		
// 	        		console.log('클릭한 녀석 텍스트좀 보자'+$(clickedNode).text());
	        		fn_closeAnyOpened();
	        		
	        		
	        		
	        		
	        		var filteredNode = [...$("ul[id='codeList'] li")].filter((e)=>{
        				
        				if($(e).find("div").length != 0){
							if($(e).attr("id").substr(0,3) == 'dep'){
								
								console.log("해당 안되??");
								
								return $(e).text().includes($(clickedNode).text());
							}
							
						}
        				
        			});
	        		
	        		
	        		
	        		
	        		console.log("필터링된 녀석들 확인"+filteredNode);
	        		
	        		
	        		filteredNode.map((e2)=>{
	        			
	        			$(e2).children("div").click();
	        			
// 	        			console.log($(e2).text());
	        			if($(clickedNode).text().trim() == $(e2).children("span").text().trim()){
// 	        				console.log("여기 들어오나요?");
	        				$(e2).children("span").click();
	        			}
	        			
	        		})
	        		
	        		
// 	        		[...$("ul[id='codeList'] li")].find((ele2)=>{
// 					var nodeListTree = $("ul[id='codeList'] li");
// 					for(let i = 0; i < nodeListTree.length; i++){
// 						var ele2 = nodeListTree[i];
// 	        			console.log("텍스트좀 볼게요"+$(ele2).children("span").text());
	        			
	        			
	        			
	        			
	        			
// 	        			if($(ele2).text().includes($(clickedNode).text())){
// 	        				$(ele2).children("div").click();
// 		        			if($(ele2).children("span").text().trim() == $(clickedNode).text().trim()){
// 		        				alert("같아요");
// 								console.log(ele2);
// 								console.log($(ele2).children("div"));
// 								$(ele2).children("div").click();
// 		        				break;
// 		        			}
// 	        			}
	        			
// 					}
// 	        		})
	        	})
	        	
	        })
	        
	      }
	      
	      
	      
	  }) // $(function(){}) 끝...		

//     	  console.log("td확인좀"+$("td"));
//     	  console.log("확인좀"+$("#개발부child"));
//     	  console.log($("span"));
      
      
      
 		$(document).ready(function(){
 			
 			
 			console.log("byhNode확인"+$(".byhNode"));
 			console.log("byhNode확인"+$("td"));
 			
 			[...$(".byhNode")].map((ele)=>{
 				console.log("여기 들어와?");
 				console.log(ele);
 				
 			});
 			
 			[...$("td")].map((ele)=>{
 				console.log("여기 들어와?");
 				console.log(ele);
 				
 			});
 			
 		})
    	
    	  
    	  
    	  
      
      
      
//    border-radius:0.85rem !important; 
// 		background-color:rgba(255,255,255,0.85) !important;
      
   </script>
<div class='row mt-2'>                                                                                                 
	  <div class='col-12'> 
		 <div class='card mr-2 workfitCardBg' style="height : 2000px;">                                                                                              
	        <div class='card-body p-4'>  
	        	<div class='card p-3' style="border-radius: 0.7rem;">
					<h5 class="apple4 page-title text-dark pl-3 pt-2" style="margin-bottom:0px; 	font-size: 31px; letter-spacing: 2px;">인사/조직도</h5>
					<hr class="ml-3 mr-3 mt-1 mb-1">
					<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size:19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
	           			인사/조직도에서는 회사의 조직도를 확인할 수 있습니다  <br>
	           			좌측의 검색 및 선택을 통해 부서원들의 정보를 살펴볼 수 있습니다  	           			
           			</div>
	           	</div>
<!-- 	           	<div class='card p-4' style="border-radius: 0.7rem; display : none;"> -->
					<div id="byhContainer1" style="display : none;"></div>
<!-- 					<img width="1000" height="800" src="/resources/uploads/organization/organization3.jpg"> -->
<!-- 				</div> -->
				
	           	<div class='card p-4' style="border-radius: 0.7rem;">
					<div id="byhContainer" style="display : ;"></div>
			</div>
		</div>
	</div>
</div>
</div>
