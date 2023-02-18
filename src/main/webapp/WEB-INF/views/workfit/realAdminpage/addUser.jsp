<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content-page" style="width: auto;">
    <div class="content">
        <div class="row mt-1">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h1 class="apple4 page-title text-dark text-center mb-3 mt-5 headerTitle"
                                style="font-size: 20px; letter-spacing: 2px; font-weight: bold;">사용자 관리</h1>
                        </div>
                        <div class="row">
                            <!--빈테이블-->
                            <div class="">
                                <label for="i">추가하기</label>
                            	<i class="dripicons-arrow-right" onclick="plusMember()" ></i>
                            </div>
                            <div class="col-10 importDiv">
                                <h5>직원 추가</h5>
                                <input type="file" id="excelFile" onchange="excelExport(event)" style="display: none;">
                                <button type="button" class="btn btn-light mb-2 mr-1" onclick="importBtn()" style="float: right;">Import</button>
                                <input type="checkbox" name="chk" onclick="selectAll(this)" style="float: right;">
                                <label style="float: right;">전체선택</label>
                                <table class="apple3 table mb-0">
                                <!-- <table id="datatable-buttons" class="apple3 table dt-responsive nowrap w-100"> -->
                                    <thead>
                                        <tr>
                                            <th>순번</th>
                                            <th>사원번호</th>
                                            <th>회원명</th>
                                            <th>직급</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>선택</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyTag1">
                                    </tbody>
                                </table>
                            </div>
                            <!--빈테이블 끝-->
                        </div>
                    </div>
                    <!-- end of content-header -->
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function(){
        console.log("메롱");
        
    }

    var header = '${_csrf.headerName}';
    var token = '${_csrf.token}';
    let importData = [];


    //엑셀 데이터 입력시
    function excelExport(event) {
        console.log("event:", event);
        console.log("event.target:", event.target);
        let input = event.target;
        let reader = new FileReader();
        reader.onload = function () {
            let fileData = reader.result;
            let wb = XLSX.read(fileData, { type: 'binary' });
            wb.SheetNames.forEach(function (sheetName) {
                var rowObj = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
                console.log("rowObj:", rowObj);
                importData = rowObj;
                console.log("importData:", importData);

                makeTable(importData);

				// //테이블 그리기
                // let d_table = $('#basic-datatable').DataTable({
                //     "columnDefs": [{
                //         "defaultContent": "-",
                //         "targets": "_all"
                //     }],
                //     select : {
                //         info:false
                //     },
                //     data : rowObj,
                //     destroy: true,
                //     columns: [
                //         { data: 'index'},
                //         { data: 'memDeptId' },
                //         { data: 'memName' },
                //         { data: 'memJobGrade' },
                //         { data: 'memTel' },
                //         { data: 'memEmail' },
                //         { data: 'memBirth' }
                //     ]
                // });
            })
        };
        reader.readAsBinaryString(input.files[0]);

    }

    //체크박스 전체 선택
    function selectAll(pthis){
        let chk = document.querySelectorAll("input[name='chk']");
        for(i of chk){
            i.checked = pthis.checked;
        }
    }

    //임포트
    function importBtn(){
        let excelFile = document.querySelector('#excelFile');
        excelFile.click();
    }


    //데이터 추가하기
    function plusMember(){
        let arr = [];   // 체크된 것들 담을 배열
        let arrIndex = []; //인덱스만 담을 배열
        let realData = [];
        let chk = document.querySelectorAll("input[name='chk']");//체크박스 요소 가져오기
        
        arr = Array.from(chk);  // chk는 유사배열이기 때문에 배열로 바꾸어 주어야함
        arr.shift();    // 배열 첫 인덱스 요소 삭제
        console.log("arr 앞부분 자름", arr);

        //체크된 인덱스만 arrIndex에 담기
        for(i of arr){
            if(i.checked == true){
                // arr.push(i.value);
                console.log("인덱스 확인:",i.value);
                arrIndex.push(i.value);
            }
        }

        for(i of arrIndex){
            console.log("arrIndex의 i값:", i);
            realData.push(importData[i-1])
        }

        console.log("realData에 담긴값은?:", realData);

        let xhr = new XMLHttpRequest();
        xhr.open("POST","/workfit/admin/plusMember",true);
        xhr.setRequestHeader(header, token);
        xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
        xhr.send(JSON.stringify(realData));
        xhr.onreadystatechange = function(){
            if(xhr.status == 200 && xhr.readyState == 4){
                let rslt = xhr.responseText
                if(rslt == 1 || rslt == -1){
                    console.log("전송결과: 성공");
                }else{
                    console.log("전송결과: 실패");
                }
            }

        }

    }


    //테이블 채우기
    function makeTable(data){
        let tbodyTag = document.querySelector("#tbodyTag1");
        while (tbodyTag.hasChildNodes()){
            tbodyTag.removeChild( tbodyTag.firstChild );       
        }
        console.log("data[0]:",data[0]);

        for(i of data){
            let trTag = document.createElement("tr");
            let tdTag_1 = document.createElement("td");
            let tdTag_2 = document.createElement("td");
            let tdTag_3 = document.createElement("td");
            let tdTag_4 = document.createElement("td");
            let tdTag_5 = document.createElement("td");
            let tdTag_6 = document.createElement("td");
            let tdTag_7 = document.createElement("td");
            
            tdTag_1.innerText = i.index;
            tdTag_2.innerText = i.memDeptId;
            tdTag_3.innerText = i.memName;
            tdTag_4.innerText = i.memJobGrade;
            tdTag_5.innerText = i.memTel;
            tdTag_6.innerText = i.memEmail;
            tdTag_7.innerHTML = `<input type="checkbox" name="chk" value="\${i.index}" />`;

            trTag.append(tdTag_1);
            trTag.append(tdTag_2);
            trTag.append(tdTag_3);
            trTag.append(tdTag_4);
            trTag.append(tdTag_5);
            trTag.append(tdTag_6);
            trTag.append(tdTag_7);
            tbodyTag.append(trTag);
        }

    }


//     function importInfo(importData){
//     	console.log("importInfo 함수 돈다!!! + :", importData );
//     	console.log("importInfo 함수 돈다!!! + 파싱:", JSON.parse(importData) );
//     	console.log("importInfo 함수 돈다!!! + 파싱한거 다시 스트링기:", JSON.stringify(JSON.parse(importData)) );
//         let xhr = new XMLHttpRequest();
//             xhr.open('post',"/workfit/admin/importExcel",true);
//             xhr.setRequestHeader(header,token);
// //             xhr.setRequestHeader("Content-Type","text/plain;charset=utf-8");
//             xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
//             xhr.send(importData);
//             xhr.onreadystatechange = function(){
//                 if(xhr.status == 200 && xhr.readyState == 4){
//                     let rslt = xhr.responseText;
//                     console.log("rslt 전송값:", rslt);
//                 }else{
//                     console.log("데이터 전송 실패했다.");
//                 }
//             }

//     }
</script>

<!-- <style>
.importDiv{
    /* margin-right: 100px; */
}

.memberTbl{
    margin-right: 0;
}
</style> -->