<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<script type="text/javascript">
      google.charts.load('current', {packages:["orgchart"]});
      google.charts.setOnLoadCallback(drawChart);
		
      var deptList = JSON.parse('${deptData}');
      
      console.log(deptList);
      
      function drawChart() {
    	var rowsToAdd = [];  
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Name');
        data.addColumn('string', 'Manager');
        data.addColumn('string', 'ToolTip');

        // For each orgchart box, provide the name, manager, and tooltip to show.
        var deptCodeAndName = {};
        for(let i = 0; i < deptList.length; i++){
        	var dept = deptList[i];
        	deptCodeAndName[dept.deptCode] = dept.deptName;
        	
        	
        	if(deptList[i].deptDirect == null){
        		rowsToAdd.push([dept.deptName,'','']);	
        	}else{
        		rowsToAdd.push([dept.deptName,deptCodeAndName[dept.deptDirect],'']);	
        		
        	}
        	
        	
        
        }
        
        
        data.addRows(rowsToAdd);

        // Create the chart.
        var chart = new google.visualization.OrgChart(document.getElementById('byhContainer'));
        // Draw the chart, setting the allowHtml option to true for the tooltips.
        chart.draw(data, {'allowHtml':true});
      }
   </script>
   
<div id="byhContainer">
<%-- 	<img src="${pageContext.request.contextPath }/resources/uploads/profileImages/지윤.png"><br/> --%>
<!-- 	<i style="font-size : 30px;" class="dripicons-mail"></i><span class="apple4 text-dark text-left" style="font-size:18px;">&nbsp;a001@adsad.com</span><br/>    -->
<!-- 	<i style="font-size : 30px;" class="dripicons-phone"></i><span class="apple4 text-dark text-left" style="font-size:18px;">&nbsp;010-1234-5678</span><br/> -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:25px;">기본정보</span> -->
<!-- 	<div style="height : 1px; background-color : gray;"></div> -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:18px;">이름 : 배영호</span><br/>  -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:18px;">영어 이름 : Bae</span><br/>  -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:18px;">생일 : 1997-05-02</span><br/>  -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:18px;">입사일 : 2023-2-20</span><br/>  -->
	
<!-- 	<span class="apple4 text-dark text-left" style="font-size:25px;">자기소개</span><br/>  -->
<!-- 	<div style="height : 1px; background-color : gray;"></div> -->
<!-- 	<span class="apple4 text-dark text-left" style="font-size:18px;">자기소개 글</span>  -->
	

	
</div>
