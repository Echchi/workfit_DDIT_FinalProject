<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set value="${postList[0] }" var ="postList"/>
<c:set value="${postList.boardAttachs}" var = "pop" />
<%-- <c:set value="${postList[0].boardAttachs }" var="popb"/> --%>

<div class="layer_cont">
	<c:choose>
	<c:when test="${not empty postList }">
<!-- 		<div class="popup-header"> -->
<%-- 			<h1 class="apple3 text-dark">&nbsp;&nbsp;&nbsp;${postList.postTitle }</h1> --%>
<!-- 		</div> -->
			<div class="img_wrap">
						<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					    <div class="carousel-inner" role="listbox">
						<c:forEach items="${pop}" var="pop" varStatus="status" >
							<c:set value="${pop.boardAttachPath}" var='path'/>
							<c:set value="${fn:length(path)}" var ='pathLength' />
							<c:choose>
								<c:when test="${status.index == 0  }" >
									 <div class="carousel-item active">
							            <img class="d-block img-fluid" src="${fn:substring(path,2,pathLength) }${pop.boardAttachNewname}" alt="First slide" width="500px" style="height: 650px;object-fit: fill;"  />
							        </div>
						        </c:when>
						        <c:otherwise>
							         <div class="carousel-item">
							            <img class="d-block img-fluid" src="${fn:substring(path,2,pathLength) }${pop.boardAttachNewname}" alt="First slide" width="500px" style="height: 650px;object-fit: fill;"/>
							        </div>
						        </c:otherwise>
					        </c:choose>
						</c:forEach>
					<!-- 	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> -->
					<!--     <div class="carousel-inner" role="listbox"> -->
					       
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
			<div class="btn_wrap">
				<!-- 오늘 하루 보지 않기 --->
				<button class="btn_today_close">
					<div class="mt-2">
					    <div class="custom-control custom-checkbox">
					        <input type="checkbox" class="custom-control-input" id="customCheck1">
					        <label class="col-pr-4 offset-8 apple3 text-dark custom-control-label" for="customCheck1">오늘 하루 보지 않기</label>
					    </div>
					</div>		
				</button>
				<button class="btn_close">close</button>
				<!-- 그냥 닫기 --->
			</div>
		</c:when>
		<c:otherwise>
			<div class="popup-header"  style="border: 1px dashed #222222;min-height: 80px">
				<h2 style="text-align: center;"> 팝업 설정된 <br/>공지사항이 없습니다. </h2>
			</div>
			<div class="img_wrap">
						<img class="d-block img-fluid" src="/resources/assets/images/chatbot/WorkFit.gif"  width="500" height="700"/>
			</div>
			<div class="btn_wrap">
				<!-- 오늘 하루 보지 않기 --->
				<button class="btn_today_close">
					<span>오늘 하루 보지 않기</span>
				</button>
				<button class="btn_close">close</button>
				<!-- 그냥 닫기 --->
			</div>
		</c:otherwise>
		</c:choose>
	</div>
<div>
	
	
</div>





<style>
button {
  border: 0;
  background: none;
  cursor: pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 40px -6px #061626;
  top: 100px;
  left: 100px;
  width : 500px;
  height : 720px;
  display: none;
}
.main_popup.on {
  display: block;
  background-color: #fff;
  border-radius : 0.85rem
}
.main_popup .img_wrap {
  width: 500px;
  height: 650px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.main_popup .btn_close {
  width: 15px;
  height: 15px;
  position: absolute;
  top: 17px;
  right: 17px;
  font-size: 0;
  border: 0;
  background: none;
}
.main_popup .btn_close::before {
  content: "";
  width: 2px;
  height: 14px;
  background-color: #333;
  position: absolute;
  top: 0;
  left: 14px;
  transform: rotate(45deg);
}
.main_popup .btn_close::after {
  content: "";
  width: 14px;
  height: 2px;
  background-color: #333;
  position: absolute;
  top: 6px;
  left: 9px;
  transform: rotate(45deg);
}
.main_popup .btn_today_close {
  width: 100%;
  height: 50px;
  background-color: #fff;
  text-align: center;
  color: #eff;
  font-size: 14px;
  display: block;
}
.main_popup .btn_today_close span {
  display: block;
  line-height: 10px;
  vertical-align: bottom;
  opacity: 0.8;
}
</style>