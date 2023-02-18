<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
h1{
	font-size:71px;
}
h2{
	font-size:37px;
}
h4{
	font-size:27px;
}

/* #chart-area2{ */
/* 	width: 800 !important;  */
/* 	height: 600 !impotant; */
/* } */
</style>



<div class='card mr-2 mt-2 p-4 workfitCardBg'>

	<div class='card p-3' style="border-radius: 0.7rem;">

		<h5 class='apple4 page-title text-dark pl-3 pt-2'
			style='margin-bottom: 0px; font-size: 31px; letter-spacing: 2px;'>스토리 보드</h5>

		<hr class="ml-3 mr-3 mt-1 mb-1">
		<div class="apple4 pl-3 pr-3 text-dark pb-2" style="font-size: 19px;">
			<span class="badge badge-warning badge-pill">TIP</span><br>
			스토리보드에서는 회사 구성원들의 통계 및 수치를 설명과 함께 확인할 수 있습니다
		</div>
	</div>
		
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="100000000">
    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">

				<div class="card p-4" style="border-radius: 0.7rem;">
					<div class="d-flex card-body mt-3 ml-3 justify-content-center">
						<!-- <canvas id="myChart" style="width:100%;max-width:700px"></canvas> -->
						<div id="chart-area1"></div>
						<div class="mt-4 mb-3 text-center" style="padding-top:5%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h2 class="apple3" style="display: inline; color: #785fff;">사원
							</h2>
							<h4  class="apple3" style="display: inline;">직책이</h4>
							<h1 class="apple3" style="color: #785fff;">45.65%</h1>
							<h4 class="apple3">로 가장 많은 비중을 차지하고 있네요!</h4>
						</div>
					</div>
				</div>
		</div>
        <div class="carousel-item">
			 <div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7" style="height:600px;">
							<canvas id="chart-area2" width="800" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h2 class="apple3" style="display: inline; color: #00a9ff;">개발부</h2>
							<h4 class="apple3" style="display: inline;">근속연수</h4>
							<h4 class="apple3" style="display: inline;">가 </h4>
							<h1 class="apple3" style="color: #00a9ff;">1위</h1>
							<h4 class="apple3">로 가장 높네요!</h4>
						</div>
					</div>
				</div>
			</div>
        <div class="carousel-item">
				<div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7 d-flex justify-content-end" style="height:600px;">
							<canvas class="w-95" id="chart-area3" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h4 class="apple3" style="display: inline;">인사부</h4>
							<h2 class="apple3" style="display: inline; color: #00a9ff;">정상출근</h2>
							<h4 class="apple3" style="display: inline;">이 </h4>
							<h1 class="apple3" style="color: #00a9ff;">80%</h1>
							<h4 class="apple3">로 출근이 성실이 이루어졌네요!</h4>
						</div>
					</div>
				</div>
			</div>
        <div class="carousel-item">
				<div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7 d-flex justify-content-end" style="height:600px;">
							<canvas class="w-95" id="chart-area4" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h4 class="apple3" style="display: inline;">재무부</h4>
							<h2 class="apple3" style="display: inline; color: rgb(255, 99, 132);">결근</h2>
							<h4 class="apple3" style="display: inline;">이 </h4>
							<h1 class="apple3" style="color: rgb(255, 99, 132);">30%</h1>
							<h4 class="apple3">로 다른 부서보다 다소 높네요!</h4>
						</div>
					</div>
				</div>
			</div>
        <div class="carousel-item">
				<div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7 d-flex justify-content-end" style="height:600px;">
							<canvas class="w-95" id="chart-area5" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h4 class="apple3" style="display: inline;">개발부</h4>
							<h2 class="apple3" style="display: inline; color: rgb(255, 205, 86);">지각</h2>
							<h4 class="apple3" style="display: inline;">이 </h4>
							<h1 class="apple3" style="color: rgb(255, 205, 86);">35%</h1>
							<h4 class="apple3">로 다른 부서보다 다소 높네요!</h4>
						</div>
					</div>
				</div>
			</div>
        <div class="carousel-item">
				<div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7 d-flex justify-content-end" style="height:600px;">
							<canvas class="w-95" id="chart-area6" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h4 class="apple3" style="display: inline;">총무부</h4>
							<h2 class="apple3" style="display: inline; color: rgb(255, 99, 132);">결근</h2>
							<h4 class="apple3" style="display: inline;">이 </h4>
							<h1 class="apple3" style="color: rgb(255, 99, 132);">30%</h1>
							<h4 class="apple3">로 다른 부서보다 다소 높네요!</h4>
						</div>
					</div>
				</div>
			</div>
        <div class="carousel-item">
				<div class="card p-4" style="border-radius: 0.7rem;">
				<div class="row justify-content-center">
						<div class="col-7 d-flex justify-content-end" style="height:600px;">
							<canvas class="w-95" id="chart-area7" height="600"></canvas>
						</div>
						<div class="ml-3 col-4 mt-1 mb-3 text-center" style="padding-top:10%; font-size: 1.5em;">
							<h4 class="apple3 mt-5">조유찬 CEO 님!</h4>
							<h4 class="apple3" style="display: inline;">영업부</h4>
							<h2 class="apple3" style="display: inline; color: #00a9ff;">정상출근</h2>
							<h4 class="apple3" style="display: inline;">이 </h4>
							<h1 class="apple3" style="color: #00a9ff;">95%</h1>
							<h4 class="apple3">로 출근이 성실이 이루어졌네요!</h4>
						</div>
					</div>
				</div>
			</div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</div>

  <script>
    var header = '${_csrf.headerName}';
    var token = '${_csrf.token}';
    var num = [];
    var grade = [];
    var fuckArr = [];


    const pieData = [];
    const columnLineChart =[];

    var chart = toastui.Chart;
    
    
    window.onload = function () {
    	
      let xhr = new XMLHttpRequest();
      xhr.open('POST', '/workfit/admin/statistics', true);
      xhr.setRequestHeader(header, token);
      // xhr.setRequestHeader('Content-Type', 'text/plain;charset=UTF-8');
      xhr.send();
      xhr.onreadystatechange = function () {
        if (xhr.status == 200 && xhr.readyState == 4) {
          let rslt = xhr.responseText;
          console.log("rslt:", rslt);
          console.log("JSON.parse(rslt):", JSON.parse(rslt));
          pieData.push(JSON.parse(rslt));
          var datas = JSON.parse(rslt);

          for (i of datas) {
            var fuckObj = {};
            console.log(i);
            console.log("i.num:", i.NUM);
            console.log("i.grade:", i.GRADE);
            num.push(i.NUM * 1);
            grade.push(i.GRADE);
            fuckObj.name = i.GRADE;
            fuckObj.data = i.NUM * 1
            fuckArr.push(fuckObj);

          }
          console.log("num:", num);
          console.log("grade:", grade);
          console.log("fuckArr:", fuckArr);
	
          // 첫번째 차트 시작

          var el = document.getElementById('chart-area1');
          
          var data = {
            categories: grade,
            series: fuckArr
          };
          
          var options = {	
            chart: { title: '직급별 구성비', width: 800, height: 600 },
            series: {
              selectable: true,
              dataLabels: {
                visible: true,
                anchor: 'outer'
              }
            }
          };


          const chart1 = chart.pieChart({ el, data, options });
        } else {}
          
      }
      // 첫번째 차트

    }
	
    
    Chart.defaults.font.size = 21;
    Chart.defaults.font.family = 'apple3';
    
    const ctx = document.getElementById('chart-area2');

    new Chart(ctx, {
        data: {
          datasets: [
           {
         	  type: 'line', 	
               label: '부서별 근속연수',
               data: [3, 5, 7, 3, 2, 2],
               borderWidth: 5,
   		       borderColor: '#00a9ff',
   		       backgroundColor: '#00a9ff',
             },  
        	{
		    type: 'bar',
            label: '여성',
            data: [5, 6, 4, 7, 8, 5],
            borderWidth: 1,
		    borderColor: '#ffb840',
		    backgroundColor: '#ffb840',
          },{
		    type: 'bar',
		    label: '남성',
            data: [7, 3, 7, 5, 3, 6],
            borderWidth: 1,
		    borderColor: '#00bd9f',
		    backgroundColor: '#00bd9f',
          }],
            
            labels: ['인사부', '재무부', '개발부', '총무부', '영업부'],
        },
        options: {
           plugins: {
               title: {
                   display: true,
                   text: '부서별 성비/ 근속연수',
                   align: 'center',
                   font: {
                	   size: 31,
                	   family:'apple3'
                   }
               },
               legend :{
	               labels: {
	                   font: {
	                       size: 21,
	                       family:'apple3'
	                   }
	           		},
	           		position: 'bottom',
               },
           },
	          responsive: true,
// 	          scales: {
// 	              yAxes: [{
// 	                  ticks: {
// 	                      beginAtZero: true
// 	                  }
// 	              }]
// 	          }
        }
      });
    
    
    const ctx2 = document.getElementById('chart-area3');
    
    new Chart(ctx2, {
    	type: 'doughnut', 
        data:{
  		  labels: [
  		    '정상출근',
  		    '결근',
  		    '지각'
  		  ],
  		  datasets: [{
  		    label: ['정상출근','결근','지각'],
  		    data: [80, 10, 10],
  		    backgroundColor: [
  		      'rgb(54, 162, 235)',
  		      'rgb(255, 99, 132)',
  		      'rgb(255, 205, 86)'
  		    ],
  		    hoverOffset: 4
  		  }]
  		},
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: '인사부',
                align: 'center',
                font: {
             	   size: 31,
             	   family:'apple3'
                }
              }
            }
          },
      });    
    const ctx3 = document.getElementById('chart-area4');
    
    new Chart(ctx3, {
    	type: 'doughnut', 
        data:{
  		  labels: [
    		    '정상출근',
      		    '결근',
      		    '지각'
  		  ],
  		  datasets: [{
  		    label: ['정상출근','결근','지각'],
  		    data: [70, 30, 0],
  		    backgroundColor: [
  		      'rgb(54, 162, 235)',
  		      'rgb(255, 99, 132)',
  		      'rgb(255, 205, 86)'
  		    ],
  		    hoverOffset: 4
  		  }]
  		},
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: '재무부',
                align: 'center',
                font: {
             	   size: 31,
             	   family:'apple3'
                }
              }
            }
          },
      });    
    
    const ctx4 = document.getElementById('chart-area5');
    
    new Chart(ctx4, {
    	type: 'doughnut', 
        data:{
  		  labels: [
    		    '정상출근',
      		    '결근',
      		    '지각'
  		  ],
  		  datasets: [{
  		    label: ['정상출근','결근','지각'],
  		    data: [55, 10, 35],
  		    backgroundColor: [
  		      'rgb(54, 162, 235)',
  		      'rgb(255, 99, 132)',
  		      'rgb(255, 205, 86)'
  		    ],
  		    hoverOffset: 4
  		  }]
  		},
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: '개발부',
                align: 'center',
                font: {
             	   size: 31,
             	   family:'apple3'
                }
              }
            }
          },
      });    
    const ctx5 = document.getElementById('chart-area6');
    
    new Chart(ctx5, {
    	type: 'doughnut', 
        data:{
  		  labels: [
    		    '정상출근',
      		    '결근',
      		    '지각'
  		  ],
  		  datasets: [{
  		    label: ['정상출근','결근','지각'],
  		    data: [65, 30, 5],
  		    backgroundColor: [
  		      'rgb(54, 162, 235)',
  		      'rgb(255, 99, 132)',
  		      'rgb(255, 205, 86)'
  		    ],
  		    hoverOffset: 4
  		  }]
  		},
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: '총무부',
                align: 'center',
                font: {
             	   size: 31,
             	   family:'apple3'
                }
              }
            }
          },
      });    
    const ctx6 = document.getElementById('chart-area7');
    
    new Chart(ctx6, {
    	type: 'doughnut', 
        data:{
  		  labels: [
    		    '정상출근',
      		    '결근',
      		    '지각'
  		  ],
  		  datasets: [{
  		    label: ['정상출근','결근','지각'],
  		    data: [95, 2, 3],
  		    backgroundColor: [
  		      'rgb(54, 162, 235)',
  		      'rgb(255, 99, 132)',
  		      'rgb(255, 205, 86)'
  		    ],
  		    hoverOffset: 4
  		  }]
  		},
        options: {
            responsive: true,
            plugins: {
              legend: {
                position: 'top',
              },
              title: {
                display: true,
                text: '영업부',
                align: 'center',
                font: {
             	   size: 31,
             	   family:'apple3'
                }
              }
            }
          },
      });    

    

  </script>