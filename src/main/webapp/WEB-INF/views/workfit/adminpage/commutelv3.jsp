<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	var chartView = function(year, month){
	
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';

	$.ajax({
		type : "post",
		url : "/workfit/adminpage/lv3Data",
		data : JSON.stringify({"year" : year,"month" : month}),
		contentType : "application/json; charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
		},
		success : function(res){
			console.log(res);
			
			var avgWorkTimeArr = res.avgWorkTimeList; 
			var avgWorkHistoryArr = res.avgWorkHistoryList; 
			var deptArr = res.deptList; 
			
			var data1Name = [];
			var data2Name = [];
			var data1Map = {};
			var data2Map = {};
			//  avgWorkTimeArr의 모든 부서명을 따로 리스트에 담자
			for(let i = 0; i < avgWorkTimeArr.length; i++){
				var deptName = avgWorkTimeArr[i].deptName;
				data1Name.push(deptName);
				data1Map[deptName] = i;
			}

			//  avgWorkHistoryArr의 모든 부서명을 따로 리스트에 담자
			for(let i = 0; i < avgWorkHistoryArr.length; i++){
				var deptName = avgWorkHistoryArr[i].deptName;
				data2Name.push(deptName);
				data2Map[deptName] = i;
			}
			
			
			var labels = [];
			var data1 = [];
			var data2 = [];
			for(let i = 0; i < deptArr.length; i++){
				var deptName = deptArr[i].deptName
				labels.push(deptName);
				
				if(data1Name.includes(deptName)){
					var idx = data1Map[deptName];
					data1.push(avgWorkTimeArr[idx].avgWorkTime);
				}else{
					data1.push(0);				
				}

				if(data2Name.includes(deptName)){
					var idx = data2Map[deptName];
					data2.push(avgWorkHistoryArr[idx].avgWorkHistory);
				}else{
					data2.push(0);				
				}
				
				
			}
			
			
			console.log("data1리스트"+data1);
			console.log("data2리스트"+data2);
			console.log("data1Name리스트"+data1Name);
			console.log("data2Name리스트"+data2Name);
			console.log("data1Map"+JSON.stringify(data1Map));
			console.log("data2Map"+JSON.stringify(data2Map));
			
			var colorArr = [];
			for(let i = 0; i < labels.length; i++){
				colorArr.push(randomBrightColor());
			}
			
			console.log(colorArr);
			 // setup 
		    var data = {
		      labels: labels,
		      datasets: [{
		        label: '평균 근로시간',
		        data: data1,
		        backgroundColor:colorArr,
		        borderColor: colorArr,
		        borderWidth: 1,
		        yAxisID : 'dollars',
		        order : 2
		      },{
			        label: '평균 근속연수',
			        data: data2,
			        backgroundColor: [
			          'rgba(0, 0, 0, 0.2)'
			        ],
			        borderColor: [
			          'rgba(0, 0, 0, 1)'
			        ],
			        type : 'line',
			        yAxisID : 'quantity',
			        order : 1
			      }]
		    };

		    // config 
		    var config = {
		      type: 'bar',
		      data,
		      options: {
		        scales: {
		        	dollars: {
		            beginAtZero: true,
		            type : 'linear',
		            position : 'left',
		            grid: {
		            	display : false
		            }
		          },
		          quantity: {
		            beginAtZero: true,
		            type : 'linear',
		            position : 'right',
		            
		          }
		        }
		      }
		    };

		    // render init block
		    if(window.chartDrawCheck){
			    window.myChart = new Chart(
			      document.getElementById('myChart'),
			      config
			    ); 
			    
			    window.chartDrawCheck = false;
		    }
			
		    window.myChart.data.datasets[0].data = data1;
		    window.myChart.data.datasets[1].data = data2;
			window.myChart.update();
		} // success 콜백함수 끝 
	});
	
	}
	
window.onload = function(){
	
	
	window.byhYear = "2022";
	window.byhMonth = "12";
	window.chartDrawCheck = true;
	
	chartView(window.byhYear,window.byhMonth);
	
	
	// 밝은 색상들을 랜덤으로 뽑아주는 함수 
	
	
}

let randomBrightColor = () => {
	  let color_r = Math.floor(Math.random() * 127 + 128);
	  let color_g = Math.floor(Math.random() * 127 + 128);
	  let color_b = Math.floor(Math.random() * 127 + 128);
	  let color_a = Math.floor(Math.random() * 127 + 128);
	  return 'rgba('+color_r+','+color_g+','+color_b+','+color_a+')';
}




function previousMonth(){
	
//		console.log($("#dayInfo").text().substr(0,4));
// 	var year = $("#dayInfo").text().substr(0,4);
// 	var month = $("#dayInfo").text().substr(6,2);
	
	if(window.byhMonth == 1){
		window.byhYear -= 1;
		window.byhMonth = 12;
	}else{
		
		if(window.byhMonth <= 10){
			window.byhMonth = "0"+(window.byhMonth - 1);
		}else{
			window.byhMonth = window.byhMonth - 1;
		}
	}
	
	
	console.log("previous함수 안 year"+window.byhYear);
	console.log("previous함수 안 month"+window.byhMonth);
	$("#DateAnnounce").text(window.byhYear+"년 "+window.byhMonth+"월");
	chartView(window.byhYear,window.byhMonth);
}

function nextMonth(){
	
// 	var year = $("#dayInfo").text().substr(0,4);
// 	var month = $("#dayInfo").text().substr(6,2);
	
	
	
	if(window.byhMonth == 12){
		window.byhYear = parseInt(window.byhYear)+1;
		window.byhMonth = '01';
	}else{
		if(window.byhMonth < 9){
			window.byhMonth = "0"+(parseInt(window.byhMonth) + 1);
		}else{
			window.byhMonth = parseInt(window.byhMonth) + 1;
		}		
		
	}
	
//		console.log(year);
//		console.log(month);
	
	$("#DateAnnounce").text(window.byhYear+"년 "+window.byhMonth+"월");
	chartView(window.byhYear,window.byhMonth);
}

	
	
// 	var barChartData = {        
// 	        labels: labels,
// 	        datasets: [{
// 	            label: '근로시간',
// 	            backgroundColor: "#1E90FF",
// 	            data: data1
// 	        }, {
// 	            label: '초과근로시간',
// 	            backgroundColor: "#F7464A",
// 	            data: data2
// 	        }]
// 	    };
// 	 window.onload = function() {
		 
		 
// 	    var ctx = $('#chart').get(0).getContext("2d"); 
// 	    window.theChart = new Chart(ctx, {
// 	         type: 'bar',
// 	         data: barChartData,
// 	         options: {
	            
// 	         }
// 	 });
	    
	    
	    
// 	}







// 	var header = '${_csrf.headerName}';
// 	var token =  '${_csrf.token}';
// 	$.ajax({
// 		type : "post",
// 		url : "/workfit/adminpage/lv3Data",
// 		beforeSend: function(xhr) {
//             xhr.setRequestHeader(header, token);
// 		},
		
// 		success : function(res){
// 			console.log(res); 
			
// 			var tblStr = "<table id='datatable-buttons' class='table table-striped dt-responsive nowrap w-100'>"; 
			
// 			for(let i = 0; i < res.length; i++){
// 				tblStr += "<tr>";
				
// 				tblStr += "<td>"+res[i].deptName+"</td>";
// 				tblStr += "<td>"+res[i].memJobGrade+"</td>";
// 				tblStr += "<td>"+res[i].memName+"</td>";
// 				tblStr += "<td>"+res[i].workDate.substr(0,10)+"</td>";
// 				tblStr += "<td>"+res[i].workStart+"</td>";
// 				tblStr += "<td>"+res[i].workEnd+"</td>";
// 				tblStr += "<td>"+res[i].workTime+"</td>";
// 				tblStr += "</tr>";
// 			}
// 			tblStr += "</table>"
			
// 			$("#myAdminWorkTable").html(tblStr);
// 		}
// 	});



	

</script>

<body>
	
	<h2>근태관리 페이지</h2>
	
	<div>
		<i class='dripicons-chevron-left' onclick='previousMonth()'></i>
		<h2 style="display : inline-block;" id="DateAnnounce">2022년 12월</h2>
		<i class='dripicons-chevron-right' onclick='nextMonth()'></i>	
	</div>
	 <div class="chartMenu">
    </div>
    <div class="chartCard">
      <div class="chartBox">
        <canvas id="myChart"></canvas>
      </div>
    </div>
	
		
	<table id="datatable-buttons" class="table table-striped dt-responsive nowrap w-100">
    <thead>
        <tr>
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