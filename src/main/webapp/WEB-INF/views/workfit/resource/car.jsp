<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content-page">
	<div class="content">
		<div class='row mt-1'>
			<div class='col-12'>
				<div class='card'>
					<div class='card-body'>
						<div class='card-title'>
							<h5 class='apple4 page-title text-dark text-center mb-5 mt-3'
								style='font-size: 30px; letter-spacing: 2px;'>차량</h5>
						</div>
						<div class="row ml-5 mr-5" id="resources">
							<!--  해당 자원들 출력하기  -->
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<div class="col-4">
								<div class="card d-block">
                                    <img class="card-img-top" src="assets/images/small/small-1.jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">Card title</h5>
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content. Some quick example text to build on the card title and make up.</p>
                                        <a href="javascript: void(0);" class="btn btn-primary">Button</a>
                                    </div> <!-- end card-body-->
                                </div>
							</div>
							<!-- 해당 자원 출력 끝 -->
						</div>	
					</div>
					<!-- end of content-header -->
					<div class='row ml-5 mr-5'></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
let leftArrow = document.querySelector(".dripicons-chevron-left");
let rightArrow = document.querySelector(".dripicons-chevron-right");
let dateHeader = document.querySelector("#dateHeader");


// --------------------------- 현재 날짜 가져오기
let time = dayjs();
var timeString = time.format("YYYY년 MM월 DD일 (ddd)")
console.log("최초 현재 날짜 : ", time)
console.log("최초 현재 날짜 : ", timeString)
var spanTag = document.createElement("span");
spanTag.id = "searchTime";
spanTag.innerHTML = timeString;
leftArrow.after(spanTag);

// bind 나 call apply 를 사용할 경우는 화살표 함수 말고 기본함수식 쓰기 !
var changeDate = function(flag){
	if(flag == 'left'){
		// 현재 날짜에서 일 빼기
		time = time.subtract(1, "d");
		var minusDateString = time.format("YYYY년 MM월 DD일 (ddd)");
			// console.log(this.nextSibling);
		this.nextSibling.innerHTML = minusDateString;
		reload();
	}else{
		// 현재 날짜에서 일 더하기
		time = time.add(1, "d");
			// console.log(time)
		var plusDateString = time.format("YYYY년 MM월 DD일 (ddd)");
		this.previousSibling.innerHTML = plusDateString;
		reload();
	}
}

leftArrow.onclick = changeDate.bind(leftArrow, 'left');
rightArrow.onclick = changeDate.bind(rightArrow, 'right');
// --------------------------- 현재 날짜 출력 끝
</script>