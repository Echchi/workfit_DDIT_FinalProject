<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<style>
	/* RESET STYLES & HELPER CLASSES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
:root {
  --level-1: #8dccad;
  --level-2: #f5cc7f;
  --level-3: #7b9fe0;
  --level-4: #f27c8d;
  --black: black;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

ol {
  list-style: none;
}

body {
  margin: 50px 0 100px;
  text-align: center;
  font-family: "Inter", sans-serif;
}

.container {
  max-width: 1000px;
  padding: 0 10px;
  margin: 0 auto;
}

.rectangle {
  position: relative;
  padding: 20px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}


/* LEVEL-1 STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.level-1 {
  width: 50%;
  margin: 0 auto 40px;
  background: var(--level-1);
}

.level-1::before {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  height: 20px;
  background: var(--black);
}


/* LEVEL-2 STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.level-2-wrapper {
  position: relative;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}

.level-2-wrapper::before {
  content: "";
  position: absolute;
  top: -20px;
  left: 25%;
  width: 50%;
  height: 2px;
  background: var(--black);
}

.level-2-wrapper::after {
  display: none;
  content: "";
  position: absolute;
  left: -20px;
  bottom: -20px;
  width: calc(100% + 20px);
  height: 2px;
  background: var(--black);
}

.level-2-wrapper li {
  position: relative;
}

.level-2-wrapper > li::before {
  content: "";
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  height: 20px;
  background: var(--black);
}

.level-2 {
  width: 70%;
  margin: 0 auto 40px;
  background: var(--level-2);
}

.level-2::before {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  transform: translateX(-50%);
  width: 2px;
  height: 20px;
  background: var(--black);
}

.level-2::after {
  display: none;
  content: "";
  position: absolute;
  top: 50%;
  left: 0%;
  transform: translate(-100%, -50%);
  width: 20px;
  height: 2px;
  background: var(--black);
}


/* LEVEL-3 STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.level-3-wrapper {
  position: relative;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-column-gap: 20px;
  width: 90%;
  margin: 0 auto;
}

.level-3-wrapper::before {
  content: "";
  position: absolute;
  top: -20px;
  left: calc(25% - 5px);
  width: calc(50% + 10px);
  height: 2px;
  background: var(--black);
}

.level-3-wrapper > li::before {
  content: "";
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -100%);
  width: 2px;
  height: 20px;
  background: var(--black);
}

.level-3 {
  margin-bottom: 20px;
  background: var(--level-3);
}


/* LEVEL-4 STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.level-4-wrapper {
  position: relative;
  width: 80%;
  margin-left: auto;
}

.level-4-wrapper::before {
  content: "";
  position: absolute;
  top: -20px;
  left: -20px;
  width: 2px;
  height: calc(100% + 20px);
  background: var(--black);
}

.level-4-wrapper li + li {
  margin-top: 20px;
}

.level-4 {
  font-weight: normal;
  background: var(--level-4);
}

.level-4::before {
  content: "";
  position: absolute;
  top: 50%;
  left: 0%;
  transform: translate(-100%, -50%);
  width: 20px;
  height: 2px;
  background: var(--black);
}


/* MQ STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
@media screen and (max-width: 700px) {
  .rectangle {
    padding: 20px 10px;
  }

  .level-1,
  .level-2 {
    width: 100%;
  }

  .level-1 {
    margin-bottom: 20px;
  }

  .level-1::before,
  .level-2-wrapper > li::before {
    display: none;
  }
  
  .level-2-wrapper,
  .level-2-wrapper::after,
  .level-2::after {
    display: block;
  }

  .level-2-wrapper {
    width: 90%;
    margin-left: 10%;
  }

  .level-2-wrapper::before {
    left: -20px;
    width: 2px;
    height: calc(100% + 40px);
  }

  .level-2-wrapper > li:not(:first-child) {
    margin-top: 50px;
  }
}


/* FOOTER
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.page-footer {
  position: fixed;
  right: 0;
  bottom: 20px;
  display: flex;
  align-items: center;
  padding: 5px;
}

.page-footer a {
  margin-left: 4px;
}
	
</style>





<div class="container">
  <h1 class="level-1 rectangle">워크핏</h1>
  <ol class="level-2-wrapper">
    <li>
      <h2 class="level-2 rectangle">Director A</h2>
      <ol class="level-3-wrapper">
        <li>
          <h3 class="level-3 rectangle">Manager A</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
        <li>
          <h3 class="level-3 rectangle">Manager B</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
      </ol>
    </li>
    <li>
      <h2 class="level-2 rectangle">Director B</h2>
      <ol class="level-3-wrapper">
        <li>
          <h3 class="level-3 rectangle">Manager C</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
        <li>
          <h3 class="level-3 rectangle">Manager D</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
      </ol>
    </li>
    <li>
      <h2 class="level-2 rectangle">Director B</h2>
      <ol class="level-3-wrapper">
        <li>
          <h3 class="level-3 rectangle">Manager C</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
        <li>
          <h3 class="level-3 rectangle">Manager D</h3>
          <ol class="level-4-wrapper">
            <li>
              <h4 class="level-4 rectangle">Person A</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person B</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person C</h4>
            </li>
            <li>
              <h4 class="level-4 rectangle">Person D</h4>
            </li>
          </ol>
        </li>
      </ol>
    </li>
  </ol>
</div>

<script>
var deptList = JSON.parse('${deptData}');
console.log("deptList 제이슨 데이터 확인"+JSON.stringify(deptList));


// $(function(){
// 	deptList.map((ele) =>{
// 		// Lv2, Lv3, Lv4의 ol태그를 미리 만들어 놓은 후 여기에다가 append 시키는 방식으로?  
// 		var olTagLv2 = document.createElement("ol");
// 		$(olTagLv2).addClass("level-2-wrapper");
		
// 		var olTagLv3 = document.createElement("ol");
// 		$(olTagLv3).addClass("level-3-wrapper");
		
// 		var olTagLv4 = document.createElement("ol");
// 		$(olTagLv4).addClass("level-4-wrapper");
		
		
// 		if(ele.deptName != '미배정'){ // 미배정은 필터링 한 번 해주고
			
			
// 			if(ele.deptDirect == null){ // Lv2 
				
				
// 				// 내가 append 되려는 부모태그가 이미 ol태그를 보유하고 있는지 아닌지에 따라서 다른 처리 프로세스를 가져야 한다 
// 				if($("#org_container").children("ol").length == 0){
// 					var liTag = "<li id='"+ele.deptCode+"'><h2 class='level-2 rectangle'>"+ele.deptName+"</h2></li>";
// 					var newOlTag = olTagLv2.cloneNode(true)
// 					$(newOlTag).append(liTag);
// 					$("#org_container").append(newOlTag);
					
					
					
// 				}else{
// 					var liTag = "<li id='"+ele.deptCode+"'><h2 class='level-2 rectangle'>"+ele.deptName+"</h2></li>";
// 					$("#org_container").children("ol").append(liTag);
					
// 				}
				
				
				
				
// 			}else{
// 				// 부모 태그의 level을 확인 한 후 그 level에 1을 더해서 append 시킴 
				
				
// 			}
					
			
			
// 		}
		
		
		
		
// 	})
	
	
// })



</script>
