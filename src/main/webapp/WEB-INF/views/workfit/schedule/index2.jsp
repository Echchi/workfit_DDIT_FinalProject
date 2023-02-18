<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
.insertSch{
	border-top:none;
	border-left:none;
	border-right:none;
	font-size: 14px;
	height: 20px;
	width: 250px;
	text-align:center;
}

.insertSch:focus{
	outline:none;
}
</style>
<div class="card justify-content-center mt-3">
	<div class="card-body">
		<h1 class="h1 apple-4 ml-4">일정관리........................!</h1>
		<div class="row justify-content-center">
<!-- 			<div class="col-lg-3 ml-3" id="myToDoList"> -->
<!-- 				<div class="card-body shadow text-center " style="border-radius: 27px; overflow: hidden;"> -->
<!-- 					<h4 class="h4 apple-4 text-center" >오늘의 할 일</h4> -->
<!-- <!-- 					<input type="text" id="insertSch" class="insertSch" style="border-top:none; border-left:none; border-right:none "> --> 
<!-- 					<input type="text" id="insertSch" class="apple-4 insertSch p-2" placeholder="오늘의 할 일을 입력해주세요"> -->
<!-- 					<button type="button" id="insertSchBtn" style="background-color:inherit; border:none;"> -->
<!-- 						<i class="uil uil-plus" style="font-size:25px; font-weigth:bold"></i> -->
<!-- 					</button> -->
<!-- 					<ul id="toDoList"></ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-lg-8 ml-3" >
			<div class="mb-2 d-flex justify-content-around">
<!-- 					<span id="menu-navi"> -->
						<button type="button" class="btn btn-default btn-sm move-day" id="prevBtn">이전 달</button>
						<button type="button" class="btn btn-default btn-sm move-today" id="todayBtn">Today</button>
						<button type="button" class="btn btn-default btn-sm move-day" id="nextBtn">다음 달</button>
<!-- 					</span> -->
			</div>
					<div id="myCalendar" style="height: 900px;"></div>
			</div>
		</div>
	</div>
</div>


<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />

<script src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>

<script>
	const Calendar = tui.Calendar;	// 캘린더 생성
	
	const todayBtn = document.querySelector("#todayBtn")
	const prevBtn = document.querySelector("#prevBtn")
	const nextBtn = document.querySelector("#nextBtn")
	const renderRange = document.querySelector("#renderRange")
    const container = document.querySelector('#myCalendar');
	const insertSch = document.querySelector('#insertSch');
	const insertSchBtn = document.querySelector('#insertSchBtn');
	const toDoList = document.querySelector('#toDoList');
	
	// 캘린더
	const options = {
	     defaultView: 'month',         // 기본 뷰 하루
	     taskView: false,            // 마일스톤 보지 말기
	     useFormPopup : true,         // 일정 생성할 때 쓰는 팝업
	     useDetailPopup: true,         // 일정 상세 팝업
	     week : {
	        hourStart : 8,
	        hourEnd : 20,
	        eventView: ['time'],         // 위에  allday 안보이게 하기
	        taskView: false,            // milestone / task 안보이게 하기
	     },
	     template: {
	           popupIsAllday: function () {
	              return 'All day?';
	            },
	            popupStateFree: function () {
	              return '🏝️ Free';
	            },
	            popupStateBusy: function () {
	              return '🔥 Busy';
	            },
	            titlePlaceholder: function () {
	              return 'Enter title';
	            },
	            locationPlaceholder: function () {
	              return 'Enter location';
	            },
	            startDatePlaceholder: function () {
	              return 'Start date';
	            },
	            endDatePlaceholder: function () {
	              return 'End date';
	            },
	            popupSave: function () {
	              return 'Add Event';
	            },
	            popupUpdate: function () {
	              return 'Update Event';
	            },
	            popupEdit: function () {
	              return 'Modify';
	            },
	            popupDelete: function () {
	              return 'Delete';
	            },
	            popupDetailTitle: function (data) {
	              return data.title;
	            },
	     },
	     
	     calendars: [								// 개인 캘린더/ 부서 캘린더 설정 (id = calendarId)
	    	    {
	    	      id: 'cal1',
	    	      name: '개인',
	    	      backgroundColor: '#03bd9e',
	    	    },
	    	    {
	    	      id: 'cal2',
	    	      name: '직장',
	    	      backgroundColor: '#00a9ff',
	    	    },
	    	  ],

	     
	     theme: {									// 테마 CSS 
    	    common: {
    	    	holiday: {							// 휴일 글자 색상
    	    		color: '#FF6618',
    	    	},
    	    	gridSelection:{						// 기간 잡았을 때
    	    		border:'none',
    	    	}
    	      },
    	    },
	   
	};
	
	
	
	   var calendar = new Calendar('#myCalendar', options);
	   
	   
	   
	   
	    calendar.createEvents([
	        {
	            id: '1',
	            calendarId: 'cal1',
	            title: '개인 일정',
	            category: 'time',
	            dueDateClass: '',
	            start: '2023-01-01T10:30:00+09:00',
	            end: '2023-01-01T12:30:00+09:00',
	        },
	        {
	            id: '2',
	            calendarId: 'cal2',
	            title: '부서 일정',
	            category: 'time',
	            dueDateClass: '',
	            start: '2023-01-15T14:30:00+09:00',
	            end: '2023-01-15T16:30:00+09:00',
	        },
	    ]);

	    calendar.on('clickEvent', (scheduleData) => {
	    	console.log(" 클릭햇슴 ???")
	        setTimeout(function() {
	        	
	          $(".toastui-calendar-detail-container").css("position", "relative").css("right","800px").css("bottom", "500px");
	          $(".toastui-calendar-popup-container").css("right","800px").css("bottom", "500px").css("left", "500px").css("top", "500px");
	          $(".toastui-calendar-form-container").css("position", "absolute").css("right","400px").css("bottom", "400px");
	          
	        }, 100)

	     })
	    
	    
	    calendar.on('beforeCreateEvent', (scheduleData) => {
// 	    	console.log(" 클릭햇슴 ???")
// 	        setTimeout(function() {
// 	    	console.log(" 클릭햇슴 ???")
// 		          $(".toastui-calendar-detail-container").css("position", "relative").css("right","800px").css("bottom", "500px");
// 		          $(".toastui-calendar-popup-container").css("right","800px").css("bottom", "500px").css("left", "500px").css("top", "500px");
// 		          $(".toastui-calendar-form-container").css("position", "absolute").css("right","400px").css("bottom", "400px");
		          
// 		        }, 100)
	    	console.log(scheduleData)
	    	console.log("일정 등록하려고?"); 
	    	calendar.createEvents([
	    		    {
	    		           calendarId: scheduleData.calendarId,
	    		           id: String(Math.random() * 100000000000000000),
	    		           title: scheduleData.title,
	    		           isAllDay: scheduleData.isAllDay,
	    		           start: scheduleData.start,
	    		           end: scheduleData.end,
	    		           category: scheduleData.isAllDay ? 'allday' : 'time',
	    		           location: scheduleData.location
	    		   
	    		    },
	    		  ]);
	    	
	
	         alert('일정 생성 완료');
	         
	    });
	   


	
	
	nextBtn.addEventListener("click", () => {
		  calendar.next();                          // 다음 달로 이동
	});
	
	prevBtn.addEventListener("click", () => {
		  calendar.prev();                          // 이전 달로 이동
	});
	
	todayBtn.addEventListener("click", () => {
		  calendar.today();                          // 이전 달로 이동
	});
	
	
	
	
	
	
	
	
	// 오늘의 할 일
	function insertSchBtnHandler(){
		console.log(insertSch.value);
		var li = document.createElement("li");
		console.log(li);
		var input = document.createElement("input");
		input.setAttribute("type","checkbox");
		console.log(input);
		input.setAttribute("class","mr-1");
		li.appendChild(input);
		li.innerText = insertSch.value;
		toDoList.appendChild(li);
		insertSch.value="";

	}
	
	insertSchBtn.addEventListener("click",insertSchBtnHandler)
	

</script>
</html>