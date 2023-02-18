<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>  -->
<script type="text/javascript"> 

var jsonList = '${jsonList}';
jsonList = JSON.parse(jsonList);

var labels = [];
var data1 = [];
var data2 = [];

// 기준 근로시간 
var standardWorkTime = 480;

for(let i = 0; i < jsonList.length; i++){
	
	labels.push(jsonList[i].memName);
	
	var memWorkTime = jsonList[i].workTime
	var overTime = memWorkTime - standardWorkTime;
	if(memWorkTime < standardWorkTime){
		overTime = 0;
	}	
	
	
	data1.push(jsonList[i].workTime);
	data2.push(overTime);
}




var barChartData = {        
        labels: labels,
        datasets: [{
            label: '근로시간',
            backgroundColor: "#1E90FF",
            data: data1
        }, {
            label: '초과근로시간',
            backgroundColor: "#F7464A",
            data: data2
        }]
    };
 window.onload = function() {
	 
	 
    var ctx = $('#chart').get(0).getContext("2d"); 
    window.theChart = new Chart(ctx, {
         type: 'bar',
         data: barChartData,
         options: {
            
         }
 });
    
    
    
}
</script>
</head>
<body>
	<h2>금일 출퇴근 현황(Lv2시점)</h2>
	<canvas id="chart"></canvas> 
	<h2>날짜별 팀원 근무 현황(Lv2시점)</h2>	
	<table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100">
    <thead>
        <tr>
        	<th>체크박스</th>
        	<th>중요도</th>
            <th>부서명</th>
            <th>직급</th>
            <th>사원명</th>
            <th>근무날짜</th>
            <th>출근시각</th>
            <th>퇴근시각</th>
            <th>총근무시간</th>
            <th>지각여부</th>
        </tr>
    </thead>


    <tbody>
    
    <c:forEach var="list" items="${list }">
        <tr>
        	<td>
        		<div class="checkbox-wrapper-mail">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="mail1">
                                    <label class="custom-control-label" for="mail1"></label>
                                </div>
                  </div>
        	</td>
        	<td>
        		<span class="star-toggle mdi mdi-star-outline text-warning"></span>
        	</td>
        	
           	<td>${list.deptName }</td>
            <td>${list.memJobGrade }</td>
            <td>${list.memName }</td>
            <td>${fn:substring(list.workDate,0,11) }</td>
            <td>${list.workStart }</td>
            <td>${list.workEnd }</td>
            <td>${list.workTime }</td>
            <td>${list.lateStatus }</td>
            
        </tr>
    </c:forEach>
        
    </tbody>
</table>

	
	
</body>
</html>