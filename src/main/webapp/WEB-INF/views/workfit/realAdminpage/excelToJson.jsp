<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

var resData = "";

function fn_upload(){
	var form = $("#uploadFile")[0];
	var formData = new FormData(form);
	
	console.log(formData);
	
	$.ajax({
        url : '/excelReader.do',
        type : 'POST',
        data : formData,
        contentType : false,
        processData : false,
        success : function(res){
        	console.log(res);
        	resData = res;
        	
        	draw_chart();
        }
    })
    
}

function draw_chart(){
	var parsedData = JSON.parse(resData); 
	console.log("파싱된 제이슨 데이터 : "+parsedData[0].name);
	
	var lblArr = [];
	var dataArr = [];
	const ctx = document.getElementById('myChart');
	
	for(let i = 0; i < parsedData.length; i++){
		lblArr.push(parsedData[i].name);
		dataArr.push(parsedData[i].age); 
		
	}
	
    const byhChart1 = new Chart(ctx, {
      type: 'bar', // bar, line, pie, doughnut, radar...   
      data: {
        labels: lblArr,
        datasets: [{
          label: '# of Votes',
          data: dataArr,
          borderWidth: 1
        },
        ]
      },
      // 외우지 말고 구글검색해서 필요한 거 필요할 때마다 찾아서 설정 
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
    
    
    const ctx2 = document.getElementById('myChart2');
    const byhChart2 = new Chart(ctx2, {
      type: 'doughnut', // bar, line, pie, doughnut, radar...   
      data: {
        labels: lblArr,
        datasets: [{
          label: '# of Votes',
          data: dataArr,
          borderWidth: 1
        },
        ]
      },
      // 외우지 말고 구글검색해서 필요한 거 필요할 때마다 찾아서 설정 
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
	
}

</script>

<body>
	<form id="uploadFile">
		<input type="file" name="file" onchange="fn_upload()">
	</form>
	
	<div style="width:500px; height : 500px;">
        <canvas id="myChart"></canvas>   <!-- 차트 그릴 위치 -->
    </div>
	<div style="width:500px; height : 500px;">
        <canvas id="myChart2"></canvas>   <!-- 차트 그릴 위치 -->
    </div>
    	
</body>
</html>