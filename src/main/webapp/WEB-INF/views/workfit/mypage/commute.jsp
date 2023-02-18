<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
canvas{
	border-radius: 0.85rem;
}

th{
	font-size : 25px;
}

td{
	font-size : 20px;
}
</style>
<!-- 반도넛 차트를 위한 CDN 코드 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>  -->
<!-- <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script> -->


<!-- <div id="chart"></div> -->



<!-- <div class="container"></div> -->

<!-- 	<h2 onclick="previousMonth()">이전</h2> -->


<div class='row mt-2'>                                                                                                 
  <div class='col-12'>     
  <div class="row mt-2">
	<div class="col-12">
		<div class='mr-2 card p-3 workfitCardBg'
			style="border-radius: 0.7rem;">
			<div class='card p-3' style="border-radius: 0.7rem;">

				<h5 class='apple4 page-title text-dark pl-3 pt-2'
					style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>출/퇴근 현황</h5>

				 <hr class="ml-3 mr-3 mt-1 mb-1">
				<div class="apple4 pl-3 pr-3 text-dark pb-2"
					style="font-size: 19px;">
					<span class="badge badge-warning badge-pill">TIP</span><br>
                           	 나의 출퇴근 현황을 막대 및 반도넛 형태의 차트로 확인할 수 있습니다.<br>
                             	또한 나의 근태 특이사항을 한눈에 조회할 수 있는 기능을 제공합니다.<br>
				</div>
			</div>
		</div>
  	   <div class='card mr-2 workfitCardBg' >                                                                                              
        <div class='card-body p-4'>    
					<div style="display: block; width: 1000px; text-align: center; margin-left: auto; margin-right: auto;">
						<i style="font-size: 30px; width: 30px; height: 30px;" class='dripicons-chevron-left apple3 text-dark' onclick='previousWeek()'></i>
						<div class="row ml-3 mr-3" style="display : inline-block;">						
							<h2 class="apple3 text-dark" style="display: inline-block;" id="weekAnnounce"></h2>
						</div>
						<i style="font-size: 30px; width: 30px; height: 30px;" class='dripicons-chevron-right apple3 text-dark' onclick='nextWeek()'></i> <br />
						<h2 class="apple3 text-dark" style="display: inline-block;" id="weekWorkingDay"></h2>
					</div>


<!-- 					<div id="youngsChartContainer" style="width : 1000px; height : auto; margin : auto;"> -->
					<div class=' card p-3 workfitCardBg'
						style="border-radius: 0.7rem;">
						<div class='card p-3' style="border-radius: 0.7rem;">
							<div id="youngsChartContainer" class="row"  style="justify-content: space-evenly;">
								<!-- 막대바 차트 캔버스 -->
								<div style="width : 600px; display : inline-block; margin-right : 30px; background-color: white; border-radius : 0.85rem">
									<canvas id="myChart"></canvas>
								</div>
								<!-- 반도넛 차트 캔버스 -->
								<div id="chart-area" style="display : inline-block; width: 30vw; height: 53vh; min-width: 500px; min-height: 300px; border-radius : 0.85rem;"></div>
							</div>
						</div>
					</div>
					<br/>
<!-- 					<br/> -->
	
	
					<div style="width: 1000px; margin: auto; padding-left: 80px; text-align : center;" id="commuteAnnounce">
						<span id="stackedTime" class="apple5" style="color : blue; font-size : 25px;"></span>
						&nbsp;&nbsp;&nbsp;
						<span id="overTime" class="apple5" style="color : red; font-size : 25px;"></span>
						&nbsp;&nbsp;&nbsp;
						<span id="expectedTime" class="apple5" style="font-size : 25px;"></span><br>
					</div>
			</div>
		</div>
	</div>
</div>
	


<!-- <hr /> -->

<div class='row mt-2'>                                                                                                 
  <div class='col-12'>             
  	<div class='card mr-2 workfitCardBg apple3' >                                                                                              
        <div class='card-body p-4'>                                                                                                  
				<div id="workTest"></div>
			</div>
		</div>
	</div>
</div>			
<!-- 	<h2 onclick="nextMonth()">다음</h2> -->


<script type="text/javascript" defer="defer">

$(document).ready(function(){

	window.chartFlag = false;
	
	window.chartSetter = function(totalWorkRatio,weeklyArr,weeklyMemWorkArr){
		
		if(totalWorkRatio >= 1){
			var remainRatio = 0;
			var totalWorkRatio = 1;
		}else{
			var remainRatio = 1 - totalWorkRatio;			
		}
		
		
		// 막대바 차트 데이터 세팅 로직 시작...
		var normalCommuteList = [];
	 	var overCommuteList = [];
	 	var remainCommuteList = [];
//	  	var commuteDateLabels = [];
	 	
	 	var yoilMap = {};
	 	
	 	var actuallyWorkDateList = weeklyMemWorkArr.map((ele) => {
	 		return ele.workDate.substr(5,5).replaceAll('-','/');
	 	});

	 	var weekDateList = weeklyArr.map((ele) => {
	 		yoilMap[ele.days.substr(5,5)] = ele.yoil;
	 		return ele.days.substr(5,5);
	 	});
	 	
	 	
	 	var commuteDateLabels = weekDateList.map((ele) => {
	 		if(actuallyWorkDateList.includes(ele)){
	 			return ele + "("+yoilMap[ele]+")";
	 		}
	 	})
	 	
	 	var allDateLabels = weekDateList.map((ele) => {
	 			return ele.replaceAll("/",".") + "("+yoilMap[ele]+")";
	 	}) // 주차별 날짜 데이터 전부 가져와서 담아놓은 리스트  
	 	
	 	
	 	
	 	
	 	commuteDateLabels = commuteDateLabels.filter((ele)=>{
	 		return ele != undefined;
	 		
	 	}); // 주차별로 회원이 실제로 일한 날짜들만 모여있는 리스트 
	 	
	 	
	 	console.log(commuteDateLabels);

	 	
	 	var mapForMemWorkData = {};
	 	
	 	weeklyMemWorkArr.map((ele)=>{
	 		mapForMemWorkData[ele.workDate.substr(5,5).replaceAll('-','/')] = ele;
	 	});
	 	
	 	console.log(weeklyMemWorkArr);
	 	
	 	for(let i = 0; i < weekDateList.length; i++){
	 		var dateElement = weekDateList[i];
	 		// labels 잡아주기(X축에 표시될 날짜데이터들)
	 		
	 		
	 		var element = mapForMemWorkData[dateElement];
	 		
	 		if(!actuallyWorkDateList.includes(dateElement) || element.workEnd == '-'){
	 			console.log("요게 몇번?");
	 			normalCommuteList.push([0,0]);
	 			overCommuteList.push([0,0]);	
	 			remainCommuteList.push([9,18]);
	 		}else{
	 			var element = mapForMemWorkData[dateElement];
	 			
	 			var endClock = parseInt(element.workEnd.substr(0,2));
	 	 		var startClock = parseInt(element.workStart.substr(0,2));
	 	 		// for문을 한 번씩 돌 때마다 data1,data2,data3에 리스트를 하나씩 append 해준다 생각 
	 			
	 	 		if(element.lateStatus != 'y'){ // 지각인지 아닌지 검사 
	 	 			
	 	 			if(element.workTime <= 540){ // 지각이 아닌 경우 총 근로시간이 9시간을 넘기는지 확인 (9시간을 넘기지 않을 경우)
	 	 					
	 	 					// 총 근로시간이 9시간을 넘기지 못했으므로 잔여근로시간 넣어주기 
	 	 				if(element.workTime == 'NaN'){
		 	 				normalCommuteList.push([0,0]);
		 	 				overCommuteList.push([0,0]);	
		 	 				remainCommuteList.push([9,18]);
	 	 				}else{
		 	 				endClock = 9 + Math.round(element.workTime / 60,0);	
		 	 				normalCommuteList.push([9,endClock]);
		 	 				overCommuteList.push([0,0]);	
		 	 				remainCommuteList.push([endClock,endClock+ (9-Math.round(element.workTime / 60,0))]);
	 	 				}	
	 	 			}else{ // 9시간을 넘기는 경우 
	 	 				// 넘긴 시간 만큼 초과근로 시간 넣기 
	 	 				normalCommuteList.push([9,18]);
	 	 				overCommuteList.push([18,endClock]);	
	 	 				remainCommuteList.push([0,0]);
	 	 			}
	 	 			
	 	 		}else{ // 지각한 경우 
	 	 			
	 	 			if(endClock <= 18){ // 퇴근 시간이 18시를 넘기는지 확인(넘기지 않을 경우)
	 	 				// 잔여근로시간 넣어주기  
	 	 				console.log("endClock검사"+endClock);
	 	 				
	 	 				if(endClock == 'NaN'){
	 	 					
		 	 				normalCommuteList.push([0,0]);
		 	 				overCommuteList.push([0,0]);	
		 	 				remainCommuteList.push([9,18]);
	 	 				}else{
		 	 				normalCommuteList.push([startClock,endClock]);
		 	 				overCommuteList.push([0,0]);	
		 	 				remainCommuteList.push([9,18]);
	 	 				}
	 	 				
	 	 			}else{
	 	 				console.log("endClock검사"+endClock);
						if(endClock == 'NaN'){
	 	 					
		 	 				normalCommuteList.push([0,0]);
		 	 				overCommuteList.push([0,0]);	
		 	 				remainCommuteList.push([9,18]);
	 	 				}else{
		 	 				// 초과근로 시간 넣어주기??   
		 	 				// 그냥 여기다 if문 하나 더 작성하면 끝날 듯    
							if(startClock >= 18){
			 	 				normalCommuteList.push([0,0]);
			 	 				overCommuteList.push([startClock,endClock]);	
			 	 				remainCommuteList.push([9,18]);
							}else{
			 	 				normalCommuteList.push([startClock,18]);
			 	 				overCommuteList.push([18,endClock]);	
			 	 				remainCommuteList.push([9,18]);
								
							}		 	 				
	 	 				}
	 	 				
	 	 			}
	 	 			
	 	 		}
	 		}
	 		
	 		
	 		
	 		
	 	}
		// 막대바 차트 데이터 세팅 로직 끝...
		
		
		
		

// 최초 1회에 한해서만 차트를 생성함 

if(!(window.chartFlag)){
	
	// 게이지 차트 생성 코드 시작 .... 
	
      const el = document.getElementById('chart-area');
      const data = {
//         categories: ['누적 근무시간','잔여 근무시간'],
        series: [
          {
            name: '누적 근무시간',
            data: totalWorkRatio,
          },
          {
            name: '잔여 근무시간',
            data: 1-totalWorkRatio,
          },
        ],
      };
      const options = {
        chart: { title: '                                           나의 근무현황', width: 'auto', height: 'auto'},
    	theme : {
//         chart: { backgroundColor : 'rgba(255,255,255,0.85)'},
        },
        legend : {
        	showCheckbox: false,
        	align : 'top',
        },
        series: {
          radiusRange: {
            inner: '60%',
            outer: '100%',
          },
          angleRange: {
            start: -90,
            end: 90,
          },
          dataLabels: {
            visible: true,
            pieSeriesName: {
              visible: true,
              anchor: 'center',
            },
          },
        },
        plot : {
        	align : 'center',
//         	width : 200,
//         	height : 200,
        }
      };

      window.myChart = toastui.Chart.pieChart({ el, data, options });
 	// 게이지 차트 생성 코드 끝 .... 
	
 	// 막대바 차트 생성 코드 시작....
//  	weeklyArr,weeklyMemWorkArr
 	
 	
 	
 	
 	// 지각이 아니다? ==> 9시부터 총근로시간 나누기 60을 해서 근로시간을 구함 총 근로시간이 9시간을 넘긴다? ==> 9,18로 잡고 초과한 숫자는 초과근로 시간으로 뺌 
 
 			
//  	var normalCommuteList = [];
//  	var overCommuteList = [];
//  	var remainCommuteList = [];
// //  	var commuteDateLabels = [];
 	
//  	var yoilMap = {};
 	
//  	var actuallyWorkDateList = weeklyMemWorkArr.map((ele) => {
//  		return ele.workDate.substr(5,5).replaceAll('-','/');
//  	});

//  	var weekDateList = weeklyArr.map((ele) => {
//  		yoilMap[ele.days.substr(5,5)] = ele.yoil;
//  		return ele.days.substr(5,5);
//  	});
 	
 	
//  	var commuteDateLabels = weekDateList.map((ele) => {
//  		if(actuallyWorkDateList.includes(ele)){
//  			return ele + "("+yoilMap[ele]+")";
//  		}
//  	})
 	
//  	var allDateLabels = weekDateList.map((ele) => {
//  			return ele + "("+yoilMap[ele]+")";
//  	}) // 주차별 날짜 데이터 전부 가져와서 담아놓은 리스트  
 	
 	
 	
 	
//  	commuteDateLabels = commuteDateLabels.filter((ele)=>{
//  		return ele != undefined;
 		
//  	}); // 주차별로 회원이 실제로 일한 날짜들만 모여있는 리스트 
 	
 	
//  	console.log(commuteDateLabels);

 	
//  	var mapForMemWorkData = {};
 	
//  	weeklyMemWorkArr.map((ele)=>{
//  		mapForMemWorkData[ele.workDate.substr(5,5).replaceAll('-','/')] = ele;
//  	});
 	
//  	console.log(weeklyMemWorkArr);
 	
//  	for(let i = 0; i < weekDateList.length; i++){
//  		var dateElement = weekDateList[i];
//  		// labels 잡아주기(X축에 표시될 날짜데이터들)
 		
 		
 		
//  		if(!commuteDateLabels.includes(dateElement)){
//  			remainCommuteList.push([9,18]);
//  		}else{
//  			var element = mapForMemWorkData[dateElement];
 			
//  			var endClock = element.workEnd.substr(0,2);
//  	 		var startClock = element.workStart.substr(0,2);
//  	 		// for문을 한 번씩 돌 때마다 data1,data2,data3에 리스트를 하나씩 append 해준다 생각 
 			
//  	 		if(element.lateStatus != 'y'){ // 지각인지 아닌지 검사 
 	 			
//  	 			if(element.workTime <= 540){ // 지각이 아닌 경우 총 근로시간이 9시간을 넘기는지 확인 (9시간을 넘기지 않을 경우)
 	 					
//  	 					// 총 근로시간이 9시간을 넘기지 못했으므로 잔여근로시간 넣어주기 
 	 					
//  	 				endClock = 9 + Math.round(element.workTime / 60,0);	
//  	 				normalCommuteList.push([9,endClock]);
//  	 				overCommuteList.push([0,0]);	
//  	 				remainCommuteList.push([endClock,endClock+ (9-Math.round(element.workTime / 60,0))]);
//  	 			}else{ // 9시간을 넘기는 경우 
//  	 				// 넘긴 시간 만큼 초과근로 시간 넣기 
//  	 				normalCommuteList.push([9,18]);
//  	 				overCommuteList.push([18,endClock]);	
//  	 				remainCommuteList.push([0,0]);
//  	 			}
 	 			
//  	 		}else{ // 지각한 경우 
 	 			
//  	 			if(endClock <= 18){ // 퇴근 시간이 18시를 넘기는지 확인(넘기지 않을 경우)
//  	 				// 잔여근로시간 넣어주기  
//  	 				normalCommuteList.push([startClock,endClock]);
//  	 				overCommuteList.push([0,0]);	
//  	 				remainCommuteList.push([9,18]);
//  	 			}else{
//  	 				// 초과근로 시간 넣어주기?? 
//  	 				normalCommuteList.push([startClock,18]);
//  	 				overCommuteList.push([18,endClock]);	
//  	 				remainCommuteList.push([9,18]);
//  	 			}
 	 			
//  	 		}
//  		}
 		
 		
 		
 		
//  	}
 	
 	
 	
 	
 	
 	
 	
 	var ctx3 = document.getElementById('myChart');

	  var data1 = {
	          label:'나의 근로시간',
// 	          data:[[9, 18], [11, 18], [9, 16]],
			  data : normalCommuteList,
	          backgroundColor:'rgba(66, 93, 205, 1)',
// 	          borderColor:'#CBCE91',
	          borderWidth:1
	}
	  var data2 = {
	          label:'초과근로시간',
// 	          data:[[18, 20], [0, 0], [0, 0]],
			  data : overCommuteList,
	          backgroundColor:'rgba(217, 61, 58, 1)',
// 	          borderColor:'#CBCE91',
	          borderWidth:1
	}
	  var data3 = {
	          label:'잔여근로시간',
// 	          data:[[0, 0], [9, 11], [16, 18]],
			  data : remainCommuteList,
	          backgroundColor:'rgba(201, 201, 201, 1)',
// 	          borderColor:'#CBCE91',
	          borderWidth:1
	}
	  
// 	const data4 = {
// 	      label:'잔여근로시간',
// 	      data:[[18, 20], [17, 22], [19, 23]],
// 	      backgroundColor:'rgba(203,255,145,255)',
// 	      borderColor:'#CBCE91',
// 	      borderWidth:1
// 	}
	  
	  
	  
	  
	  
	  
	  
	  window.byhBarChart = new Chart(ctx3, {
	    type: 'bar',
	    data: {
// 	      labels: ['2023-01-02', '2023-01-03', '2023-01-04'],
	      labels: allDateLabels,
	      datasets:[
	         data1,
	         data2, 
	         data3, 
	      ]
	    },
	    options: {
	       aspectRatio : 1.2,
	       scales:{
	            x:{ //x축값 누적
	                stacked:true,
//	                tick : {
//		                min : 9,
//						stepSize : 3	                	
//	                }
	                
	            },
	            y:{ //y축값 누적
//	                stacked:true,
	                min : 9,
	                max : 24,
					stepSize : 3	                	
	            }
	            
	        },
	    }
	  });
 	
 		
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
 	// 막대바 차트 생성 코드 끝....
		
} // if문 끝 

	if(window.chartFlag){
		//두번째 부터는 차트를 새로 만드는게 아니라 차트를 업데이터 시켜줘야 한다. 
//			console.log("업데이트문 실행되니?");
		console.log(window.gaugeChart);
// 		window.gaugeChart.setData(11);
// 		window.gaugeChart.data.series[0].data = [Math.round(totalWorkRatio * 100,0)];
// 		window.gaugeChart.update();
	
	
		// 기존 게이지 차트 삭제 
		window.myChart.destroy();
		// 게이지 차트 재생성 시작 ----------------
		const el = document.getElementById('chart-area');
      const data = {
//         categories: ['Browser'],
        series: [
          {
            name: '누적 근로시간',
            data:totalWorkRatio,
          },
          {
            name: '잔여 근로시간',
            data: 1-totalWorkRatio,
          },
        ],
      };
      const options = {
    		  chart: { title: '                                           나의 근무현황', width: 'auto', height: 'auto',},
    	    	theme : {
//     	        chart: { backgroundColor : 'rgba(9, 206, 115, 0.1)'},
    	        },
    	        legend : {
    	        	showCheckbox: false,
    	        	align : 'top',
    	        },
    	        series: {
    	          radiusRange: {
    	            inner: '60%',
    	            outer: '100%',
    	          },
    	          angleRange: {
    	            start: -90,
    	            end: 90,
    	          },
    	          dataLabels: {
    	            visible: true,
    	            pieSeriesName: {
    	              visible: true,
    	              anchor: 'center',
    	            },
    	          },
    	        },
//    	         plot : {
//    	         	width : 200,
//    	         	height : 200,
//    	         }
      };

      window.myChart = toastui.Chart.pieChart({ el, data, options });
	 // 게이지 차트 재생성 끝 ----------------
	
	 
	 // 막대바 차트 재생성 시작 ----------------------
// 	 console.log(window.byhBarChart.data.labels);
	 window.byhBarChart.data.labels = allDateLabels;
	 window.byhBarChart.data.datasets[0].data = normalCommuteList;
	 window.byhBarChart.data.datasets[1].data = overCommuteList;
	 window.byhBarChart.data.datasets[2].data = remainCommuteList;
	 window.byhBarChart.update();
	 // 막대바 차트 재생성 끝 ----------------------
	 
	}


	// 아래에서 초과근로 시간을 구하는데 사용하기 위해 이렇게 선언해놓음 
	window.overCommuteListForDataAnnounce = overCommuteList


	} // window.chartSetter 선언문 끝 
	
	
	
	var today = new Date();
	var t_year = today.getFullYear();
	var t_month = ('0' + (today.getMonth() + 1)).slice(-2);
	var t_day = ('0' + today.getDate()).slice(-2);
	var dateString = t_year + t_month + t_day;
	
	
	
	
	
	const nowDay = new Date().getDate()
	const firstYoil = new Date(new Date().setDate(1)).getDay();
// 	console.log("주차  확인좀"+Math.ceil((nowDay + firstYoil) / 7))
	window.weekDate = t_year + "/" + t_month + "/" + t_day;
	window.weekYear = t_year;
	window.weekMonth = t_month;
	window.weeklyNum = Math.ceil((nowDay + firstYoil) / 7) - 1;
	
	
	tableView("2023/02/01", "2023", "02");
	chartView(window.weekDate, window.weekYear, window.weekMonth, window.weeklyNum);

});


	
	
	// DB와 연동하여 데이터를 가져와 테이블 형식으로 근무기록을 뿌려주는 메소드를 선언함! 
	var tableView = function(date, year, month){
		
		window.year = year;
		window.month = month;
		window.date = date;
		
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		  $.ajax({
				type : "post",
				url : "/workfit/mypage/commuteData",
				data : JSON.stringify({"date" : date, "year" : year, "month" : month}), 
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
				},
				success : function(res){
					
					console.log("SUCESS안은 들어왓겠지?");
					console.log(res);
					
					var dayArray = res.monthlyDays;
					var dayMemArray = res.monthlyMemWork;
					// 지각 / 조퇴 버튼을 클릭 시 조회하게 하기 위한 window변수로의 선언
					window.newDayArray = dayArray;
					window.newDayMemArray = dayMemArray;
					
// 					console.log(dayArray[0]);
					console.log(dayMemArray[0]);
					
//					console.log(dayMemArray[0].workDate.substr(8,2));
//					console.log(dayArray[0].days.substr(8,2));
					
					
					var tblStr = "<table class='table table-centered mb-0'>";
					tblStr += "<tr><th class='text-center apple3' style='width : 400px;'>일자</th><th class='text-center apple3' style='width : 400px;'>총근무시간</th><th class='text-center apple3' style='width : 400px;'>출근시간</th><th class='text-center apple3' style='width : 400px;'>퇴근시간</th><th class='text-center apple3' style='width : 400px;'>비고</th></tr>";
						
					
					
					var today = new Date();
					var t_year = today.getFullYear();
					var t_month = ('0' + (today.getMonth() + 1)).slice(-2);
					var t_day = ('0' + today.getDate()).slice(-2);
					var dateString = t_year + t_month + t_day;
					console.log(dateString)
					
					var cntForMemArr = 0;
					for(var i = 0; i < dayArray.length; i++){
						
						if(cntForMemArr < dayMemArray.length){
							var workData = dayMemArray[cntForMemArr].workDate;
// 							console.log(workData);
// 							console.log(dayArray[i].days.substr(8,2));
							
							
// 							console.log("첫번째" + (workData.substr(0,4)+workData.substr(5,2)+workData.substr(8,2)));
// 							console.log(year);
// 							console.log(month);
// 							console.log("두 번째" + (year+""+month+""+dayArray[i].days.substr(8,2)));
							var myWorkDate = (workData.substr(0,4)+workData.substr(5,2)+workData.substr(8,2))
							var anySpecial = '';
							if( myWorkDate == (year+""+month+""+dayArray[i].days.substr(8,2)) ){
									
								tblStr += "<tr>"; 
								if(dateString == myWorkDate){
									tblStr += "<td class='text-center apple3'>"+dayArray[i].days.replaceAll("/",".")+"("+dayArray[i].yoil+")"+"</td>";
								}else{
									tblStr += "<td class='text-center apple3'>"+dayArray[i].days.replaceAll("/",".")+"("+dayArray[i].yoil+")"+"</td>";
								}
// 								tblStr += "<td>"+dayArray[i].days+"</td>";
// 								tblStr += "<td>"+dayArray[i].yoil+"</td>";
	// 							tblStr += "<td>"+dayMemArray[cntForMemArr].workDate.substr(0,10).replace('-','/')+"</td>";
								if(dayMemArray[cntForMemArr].workTime >= 60){
									var hour = Math.floor(((dayMemArray[cntForMemArr].workTime) / 60),0);
									var min = ((dayMemArray[cntForMemArr].workTime) % 60);
									dayMemArray[cntForMemArr].workTime = hour + "시간 " + min;
								}
	
								tblStr += "<td class='text-center apple3'>"+dayMemArray[cntForMemArr].workTime+"분</td>";
								tblStr += "<td class='text-center apple3'>"+dayMemArray[cntForMemArr].workStart+"</td>";
								tblStr += "<td class='text-center apple3'>"+dayMemArray[cntForMemArr].workEnd+"</td>";
								
								// 비고란에 지각인지 아닌지 확인하는 로직 
								if(dayMemArray[cntForMemArr].lateStatus == 'y'){
									// 정규퇴근 시간이 18시라 가정하고 조퇴인지 아닌지 확인하는 로직을 아래와 같이 작성 
									if(dayMemArray[cntForMemArr].workEnd.substr(0,2) < 18){
										anySpecial = "지각/조퇴";
									}else{
										anySpecial = "지각";
									}
								}else{
									// 정규퇴근 시간이 18시라 가정하고 조퇴인지 아닌지 확인하는 로직을 아래와 같이 작성 
									if(dayMemArray[cntForMemArr].workEnd.substr(0,2) < 18){
										anySpecial = "조퇴";
									}else{
										anySpecial = "-";
										
									}
								}
								
								
								if(anySpecial != '-'){
									tblStr += "<td class='text-center apple3' style='color:red;'>"+anySpecial+"</td>";
								}else{
									tblStr += "<td class='text-center apple3'>"+anySpecial+"</td>";
								}
								
								tblStr += "</tr>"; 
	
								cntForMemArr++;
								continue;
							}
						}
						
						tblStr += "<tr>"; 
						if(dateString == (year+""+month+""+dayArray[i].days.substr(8,2))){
							tblStr += "<td class='text-center apple3'>"+dayArray[i].days.replaceAll("/",".")+"("+dayArray[i].yoil+")"+"</td>";
						}else{
							tblStr += "<td class='text-center apple3'>"+dayArray[i].days.replaceAll("/",".")+"("+dayArray[i].yoil+")"+"</td>";
						}
// 						tblStr += "<td>"+dayArray[i].days+"</td>";
						tblStr += "<td class='text-center apple3'>0분</td>";
						tblStr += "<td class='text-center apple3'> - </td>";
						tblStr += "<td class='text-center apple3'> - </td>";
						tblStr += "<td class='text-center apple3'> - </td>";
						
						
						tblStr += "</tr>"; 
					}
					
										
//					tblStr += "<tr>"; 
//					for(let i = 0; i < dayMemArray.length; i++){
//						tblStr += "<td>"+dayMemArray[i].workDate.substr(0,10).replace('-','/')+"</td>"; 
//						tblStr += ""
//					}

 					var iTag = "<div style='display : block; width : 1000px; text-align : center; margin-left : auto; margin-right : auto;'><i style='font-size : 30px;' class='dripicons-chevron-left apple3 text-dark' onclick='previousMonth()'></i>";
					var hTagForDate = "<div class='row ml-3 mr-3' style='display : inline-block;'><h2 class='apple3 text-dark' style='display : inline-block;' id='dayInfo'>"+year+"년 "+month+"월</h2></div>";
 					iTag += hTagForDate;
					iTag += "<i style='font-size : 30px;' class='dripicons-chevron-right apple3 text-dark' onclick='nextMonth()'></i></div>"
					
					var btnTag = '<div class="row offset-9" style="padding-left : 177px;"><button onclick="fn_specialCommuteSelect()" id="showSpecialCommuteBtn" type="button" class="btn btn-primary workfitBtn apple3" style="font-size: 17px;">지각/조퇴 조회</button></div>';
					
					// 지각/조퇴 조회할 때 참조하게 하기 위해 윈도우 변수로 따로 선언해놓음 
					window.newTblStr = tblStr;
					
					$("#workTest").html(iTag + btnTag + tblStr);
					
					// 지각이나 조퇴와 같은 특이사항이 있는 항목의 row를 다 빨간색으로 바꿔주는 로직 
					[...$("td")].map((ele)=>{
						if($(ele).text().includes('지각') || $(ele).text().includes('조퇴')){
// 							console.log("까꿍");
							$(ele).parent().css("color","red");
						}
						
					})
					
					
				}
			});
		}
	
	
	// DB와 연동하여 데이터를 가져와서 차트 형식으로 뿌려주는 메소드 선언 
	var chartView = function(date, year, month, weekNum){
		var header = '${_csrf.headerName}';
		var token =  '${_csrf.token}';
		$.ajax({
			type : "post",
			url : "/workfit/mypage/weeklyData",
			data : JSON.stringify({"date" : date, "year" : year, "month" : month, "weekNum" : weekNum}), // 여기서 qodudgh85라는 memId는 로그인 처리 후 세션에서 꺼내오거나 Spring Security에서 꺼내오면 된다.
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    },
			success : function(res){
				console.log(res);
				var weeklyArr = res.weeklyDays;
				var weeklyMemWorkArr = res.weeklyMemWork;
				
				var sum = 0;
				for(let i = 0; i < weeklyMemWorkArr.length; i++){
					sum += parseInt(weeklyMemWorkArr[i].workTime);
				}
				console.log("합계 몇 분?"+sum);
				// 여기서 40 * 60은 그룹웨어 관리자가 정해주는 주당 근무시간임 (현재는 40시간으로 설정했다고 가정)
				var totalWorkRatio = sum / (40 * 60);
				
				// 막대바 차트를 그리기 위한 데이터가 같이 파라미터로 전달해줘야 함 (chartSetter에)
				
				
				window.chartSetter(totalWorkRatio,weeklyArr,weeklyMemWorkArr);
				window.chartFlag = true; 
				$("#weekWorkingDay").text(weeklyArr[0].days.replaceAll("/",".")+" ~ "+weeklyArr[weeklyArr.length-1].days.replaceAll("/","."));
				$("#weekAnnounce").text(month+"월 "+weekNum+"주차");
				$("#stackedTime").text("나의 총 근로시간 "+parseInt(sum/60)+"시간"+parseInt((sum % 60))+"분");	
				// 초과 근로 시간 구하는 로직 
				var overCommuteList = window.overCommuteListForDataAnnounce;
				
				var overCommuteTimeSum = 0;
				for(let i = 0; i < overCommuteList.length; i++){
					overCommuteTimeSum += (overCommuteList[i][1] - overCommuteList[i][0]);
				}
				
				console.log(overCommuteTimeSum);
				
				$("#overTime").text("초과 근로 시간 "+overCommuteTimeSum+"시간");
				
				$("#expectedTime").text("예상 근로시간 40시간");	
				
			}
		});
		
		
	}
	
	
 
	function previousWeek(){
// 		window.weekDate = "2023/01/01";
// 		window.weekYear = "2023";
// 		window.weekMonth = "01";
// 		window.weeklyNum = "01";
		
		
		if(window.weeklyNum == "1"){
			window.weeklyNum = "4";
			
			if(window.weekMonth == 1){
				window.weekYear -= 1;
				window.weekMonth = 12;
			}else{
				if(window.weekMonth <= 10){
					window.weekMonth = "0"+(window.weekMonth - 1);
				}else{
					window.weekMonth = window.weekMonth - 1;
				}				
				
			}
			
			
		}else{
			window.weeklyNum = (window.weeklyNum-1);
			
			
		}
		
		window.weekDate = window.weekYear+"/"+window.weekMonth+"/01";
		
		console.log("weekDate : "+window.weekDate);
		console.log("weekYear : "+window.weekYear);
		console.log("weekMonth : "+window.weekMonth);
		console.log("weeklyNum : "+window.weeklyNum);
		
		chartView(window.weekDate, window.weekYear, window.weekMonth, window.weeklyNum);
	}
	
	function nextWeek(){
		if(window.weeklyNum == "4"){
			window.weeklyNum = "1";
			
			if(window.weekMonth == 12){
				window.weekYear = parseInt(window.weekYear) + 1;
				window.weekMonth = "01";
			}else{
				if(window.weekMonth < 9){
					window.weekMonth = "0" + (parseInt(window.weekMonth) + 1);
				}else{
					window.weekMonth = (parseInt(window.weekMonth) + 1);
				}				
				
			}
			
			
		}else{
			window.weeklyNum = (parseInt(window.weeklyNum)+1);
			
			
		}
		
		window.weekDate = window.weekYear+"/"+window.weekMonth+"/01";
		
		console.log("weekDate : "+window.weekDate);
		console.log("weekYear : "+window.weekYear);
		console.log("weekMonth : "+window.weekMonth);
		console.log("weeklyNum : "+window.weeklyNum);
		
		chartView(window.weekDate, window.weekYear, window.weekMonth, window.weeklyNum);
		
	}
	
	
	function previousMonth(){
		
// 		console.log($("#dayInfo").text().substr(0,4));
		var year = $("#dayInfo").text().substr(0,4);
		var month = $("#dayInfo").text().substr(6,2);
		
		if(month == 1){
			year -= 1;
			month = 12;
		}else{
			
			if(month <= 10){
				month = "0"+(month - 1);
			}else{
				month = month - 1;
			}
		}
		
		
		console.log("previous함수 안 year"+year);
		console.log("previous함수 안 month"+month);
		
		var date = year+"/"+month+"/01";
		tableView(date, year, month);
	}
	
	function nextMonth(){
		
		var year = $("#dayInfo").text().substr(0,4);
		var month = $("#dayInfo").text().substr(6,2);
		
		
		
		if(month == 12){
			year = parseInt(year)+1;
			month = '01';
		}else{
			if(month < 9){
				month = "0"+(parseInt(month) + 1);
			}else{
				month = parseInt(month) + 1;
			}		
			
		}
		
// 		console.log(year);
// 		console.log(month);
		
		
		var date = year+"/"+month+"/01";
		tableView(date, year, month);
	}
	
	window.specialBtnClickFlag = false;
	// 지각/조퇴만 조회되도록 하는 버튼을 클릭 했을 시 
	function fn_specialCommuteSelect(){
// 		window.newDayArray
// 		window.newDayMemArray 
		if(window.specialBtnClickFlag){
			console.log("여길 어떻게 들어옴??");
			var myyear = $("#dayInfo").text().substr(0,4);
			var mymonth = $("#dayInfo").text().substr(6,2);
			var mydate = myyear+"/"+mymonth+"/01";
			$("#showSpecialCommuteBtn").text("지각/조퇴 조회");
			tableView(mydate, myyear, mymonth);
			window.specialBtnClickFlag = false;
			return;
		}
		
		
		
		var tblStr = "<table class='table table-centered mb-0'>";
		tblStr += "<tr><th class='text-center apple3' style='width : 400px;'>일자</th><th class='text-center apple3' style='width : 400px;'>총근무시간</th><th class='text-center apple3' style='width : 400px;'>출근시간</th><th class='text-center apple3' style='width : 400px;'>퇴근시간</th><th class='text-center apple3' style='width : 400px;'>비고</th></tr>";
			
		
		
		var today = new Date();
		var t_year = today.getFullYear();
		var t_month = ('0' + (today.getMonth() + 1)).slice(-2);
		var t_day = ('0' + today.getDate()).slice(-2);
		var dateString = t_year + t_month + t_day;
		console.log(dateString)
		
		var cntForMemArr = 0;
		for(var i = 0; i < window.newDayArray.length; i++){
			
			if(cntForMemArr < window.newDayMemArray.length){
				var workData = window.newDayMemArray[cntForMemArr].workDate;
//					console.log(workData);
//					console.log(dayArray[i].days.substr(8,2));
				
				
//					console.log("첫번째" + (workData.substr(0,4)+workData.substr(5,2)+workData.substr(8,2)));
//					console.log(year);
//					console.log(month);
//					console.log("두 번째" + (year+""+month+""+dayArray[i].days.substr(8,2)));
				var myWorkDate = (workData.substr(0,4)+workData.substr(5,2)+workData.substr(8,2))
				
				var anySpecial = '';
				if( myWorkDate == (window.year+""+window.month+""+window.newDayArray[i].days.substr(8,2)) ){
					
					// 지각/조퇴가 아닌 row는 해당 되지 않으므로 사전에 미리 넘겨버림 
					if(window.newDayMemArray[cntForMemArr].lateStatus == 'n'){
						if(window.newDayMemArray[cntForMemArr].workEnd.substr(0,2) >= 18){
							cntForMemArr++;
							continue;
						}
						
					}
					
					tblStr += "<tr>"; 
					if(dateString == myWorkDate){
						tblStr += "<td class='text-center apple3'>"+window.newDayArray[i].days.replaceAll("/",".")+"("+window.newDayArray[i].yoil+")"+"</td>";
					}else{
						tblStr += "<td class='text-center apple3'>"+window.newDayArray[i].days.replaceAll("/",".")+"("+window.newDayArray[i].yoil+")"+"</td>";
					}
//						tblStr += "<td>"+dayArray[i].days+"</td>";
// 					tblStr += "<td>"+window.newDayArray[i].yoil+"</td>";
// 							tblStr += "<td>"+dayMemArray[cntForMemArr].workDate.substr(0,10).replace('-','/')+"</td>"; 
					tblStr += "<td class='text-center apple3'>"+window.newDayMemArray[cntForMemArr].workTime+"분</td>";
					tblStr += "<td class='text-center apple3'>"+window.newDayMemArray[cntForMemArr].workStart+"</td>";
					tblStr += "<td class='text-center apple3'>"+window.newDayMemArray[cntForMemArr].workEnd+"</td>";
					
					// 비고란에 지각인지 아닌지 확인하는 로직 
					if(window.newDayMemArray[cntForMemArr].lateStatus == 'y'){
						// 정규퇴근 시간이 18시라 가정하고 조퇴인지 아닌지 확인하는 로직을 아래와 같이 작성 
						if(window.newDayMemArray[cntForMemArr].workEnd.substr(0,2) < 18){
							anySpecial = "지각/조퇴";
						}else{
							anySpecial = "지각";
						}
					}else{
						// 정규퇴근 시간이 18시라 가정하고 조퇴인지 아닌지 확인하는 로직을 아래와 같이 작성 
						if(window.newDayMemArray[cntForMemArr].workEnd.substr(0,2) < 18){
							anySpecial = "조퇴";
						}else{
							anySpecial = "-";
						}
					}
					
					if(anySpecial != '-'){
						tblStr += "<td class='text-center apple3' style='color:red;'>"+anySpecial+"</td>";
					}else{
						tblStr += "<td class='text-center apple3'>"+anySpecial+"</td>";
						
					}
					
					
					tblStr += "</tr>"; 

					cntForMemArr++;
					continue;
				}
			}
			
		}
		
							
//		tblStr += "<tr>"; 
//		for(let i = 0; i < dayMemArray.length; i++){
//			tblStr += "<td>"+dayMemArray[i].workDate.substr(0,10).replace('-','/')+"</td>"; 
//			tblStr += ""
//		}

		var iTag = "<div style='display : block; width : 1000px; text-align : center; margin-left : auto; margin-right : auto;'><i style='font-size : 30px;' class='dripicons-chevron-left apple3 text-dark' onclick='previousMonth()'></i>";
		var hTagForDate = "<div class='row ml-3 mr-3' style='display : inline-block;'><h2 class='apple3 text-dark' style='display : inline-block;' id='dayInfo'>"+year+"년 "+month+"월</h2></div>";
			iTag += hTagForDate;
			iTag += "<i style='font-size : 30px;' class='dripicons-chevron-right apple3 text-dark' onclick='nextMonth()'></i></div>"
		
		var btnTag = '<div class="row offset-9" style="padding-left : 177px;"><button onclick="fn_specialCommuteSelect()" type="button" id="showSpecialCommuteBtn" class="btn btn-primary workfitBtn apple3" style="font-size: 17px;">지각/조퇴 조회</button></div>';
		
		// 지각/조퇴 조회할 때 참조하게 하기 위해 윈도우 변수로 따로 선언해놓음 
		window.newTblStr = tblStr;
		
		$("#workTest").html(iTag + btnTag + tblStr);		
		
		
		// 지각이나 조퇴와 같은 특이사항이 있는 항목의 row를 다 빨간색으로 바꿔주는 로직 
		[...$("td")].map((ele)=>{
			if($(ele).text().includes('지각') || $(ele).text().includes('조퇴')){
//					console.log("까꿍");
				$(ele).parent().css("color","red");
			}
			
		})
		
		$("#showSpecialCommuteBtn").text("전체조회");
		window.specialBtnClickFlag = true;
	}
	
	
	
</script>






<!-- <canvas id="myChart1"></canvas> -->

<script>

// $(document).ready(function(){
// 	// 참고용 삭제 소스..
// 	  const ctx3 = document.getElementById('myChart1');

// 	  const data1 = {
// 	          label:'기준근로시간',
// 	          data:[[11, 17], [9, 11], [9, 13]],
// 	          backgroundColor:'rgba(255,206,145,.5)',
// 	          borderColor:'#CBCE91',
// 	          borderWidth:1
// 	}
// 	  const data2 = {
// 	          label:'초과근로시간',
// 	          data:[[0, 0], [11, 12], [13, 14]],
// 	          backgroundColor:'rgba(204,255,145,.5)',
// 	          borderColor:'#CBCE91',
// 	          borderWidth:1
// 	}
// 	  const data3 = {
// 	          label:'잔여근로시간',
// 	          data:[[9, 18], [12, 17], [14, 19]],
// 	          backgroundColor:'rgba(255,206,255,.5)',
// 	          borderColor:'#CBCE91',
// 	          borderWidth:1
// 	}
	  
// 	const data4 = {
// 	      label:'초과근로',
// 	      data:[[18, 20], [17, 22], [19, 23]],
// 	      backgroundColor:'rgba(203,255,145,255)',
// 	      borderColor:'#CBCE91',
// 	      borderWidth:1
// 	}
	  
// 	  new Chart(ctx3, {
// 	    type: 'bar',
// 	    data: {
// 	      labels: ['2023-01-02', '2023-01-03', '2023-01-04'],
// 	      datasets:[
// 	         data1,
// 	         data2, 
// 	         data3, 
// 	         data4 
// 	      ]
// 	    },
// 	    options: {
// 	       scales:{
// 	            x:{ //x축값 누적
// 	                stacked:true,
// // 	                tick : {
// // 		                min : 9,
// // 						stepSize : 3	                	
// // 	                }
	                
// 	            },
// 	            y:{ //y축값 누적
// // 	                stacked:true,
// 	                min : 9,
// 					stepSize : 3	                	
// 	            }
	            
// 	        }
// 	    }
// 	  });
	
	
	
	
	
	
// });
	
	
</script>






