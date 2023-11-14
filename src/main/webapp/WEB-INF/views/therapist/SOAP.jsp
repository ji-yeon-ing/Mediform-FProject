<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<meta charset="UTF-8">
<title>SOAP</title>
<style>
	.selected {
    border: 2px solid blue; /* 파란색 테두리 2px 두께 */
	}
</style>
</head>
<body>

	<div class="container-fulid">
		<div class="row">

			<div class="col-5 text-center">
				<div class="card border border-secondary mb-2"
					style="height: 450px;">
					<div class="card-header border-bottom p-2"
						style="height: 35px; background-color: midnightblue">
						<div class="row">
							<div class="col-12 align-self-center">
								<h5 class="text-start text-white mb-0 fw-semi-bold">진료 내역</h5>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-8">
								<div class="row">
									<div class="col ms-3  pe-0 py-3">
										<div class="input-group">
											<input type="text" name="searchWord" id="searchWord" class="form-control float-right" placeholder="환자명" style="height: 40px;">		
										</div>
									</div>
									<div class="col px-0 py-3">
										<div class="input-group">
											<input class="form-control datetimepicker" id="thisDate" name="thisDate" type="text" style="height: 40px;" />
											<div class="input-group-append">
												<button id="searchBtn2" type="button" class="btn btn-outline-secondary" style="height: 40px">
													&nbsp;<i class="fas fa-search"></i>&nbsp;
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col px-0 py-3">
								
							</div>
						</div>
					<div class="row card-body pt-0 mt-0">
						<div class="table-container" style="height: 220px; overflow-y: auto;">
							<table class="table table-sm table-striped">
								<thead>
									<tr id="" class="bg-light">
										<th class="col-2" scope="col">No.</th>
										<th class="col-2" scope="col">환자명</th>
										<th class="col-4 text-center " scope="col">생년월일</th>
										<th class="col-4 text-center" scope="col">진료일시</th>
									</tr>
								</thead>
								<tbody style="max-height: none;" id="therapistPatientTbody">
								
								</tbody>
							</table>
						</div>
							<div class="row text-center">
								<div class="col">
										<div class="d-flex justify-content-center mt-4 pt-5 card-footer col-auto align-self-center pagingArea" id="therapistPatientPagingArea" style="padding-top: 0px;"></div>
								</div>
							</div>
					</div>
				</div>

				<div class="card border border-secondary" style="height: 360px;">
					<div class="card-header border-bottom p-2"
						style="height: 35px; background-color: midnightblue">
						<div class="row">
							<div class="col-12 align-self-center">
								<h5 class="text-start text-white mb-0 fw-semi-bold" >치료 내역</h5>
							</div>
						</div>
					</div>
					
<!-- 							<div class="col-12" id="mtrListHtmlSpace"> -->
					<!-- 여기  -->
					<div class="card-body">
						<div class="row g-3 h-100">
							<div class="col-sm-6 col-lg-12">
								<div class="card position-relative rounded-4">
									<div class="card-body p-3 scrollbar" style="height: 280px;">
										<div class="row">
											<div class="col-6">
												<p class="fw-semi-bold pb-1 mb-1 me-5">치료명</p>
											</div>
											<div class="col-6">
												<p class="fw-semi-bold pb-1 mb-1">물리/작업</p>
											</div>
										<hr class="mb-0 fw-semi-bold">
										</div>
										<div class="row my-2 scrollbar" id="mtrListHtmlSpace">
<!-- 											<div class="col-6"> -->
<!-- 												<div class="rounded-3"> -->
<!-- 													<p><span class="fas fa-circle fs--1 me-3 text-primary"></span>전산화인지재활치료</p> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-6"> -->
<!-- 											    <p class="fs--3">물리</p> -->
<!-- 										  	</div> -->
										</div>
										<img
											class="position-absolute end-0 bottom-0 mb-2 me-2"
											src="/resources/image/therapist/therapy1.png" alt=""
											width="70" />
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>


			<!-- 환자 정보 카드 시작  -->

			<div class="col-7">
				<div class="card" style="height: 820px;">
					<div class="card-header border-bottom p-2"
						style="height: 35px; background-color: midnightblue">
						<div class="row">
							<div class="col-12 align-self-center">
								<h5 class="text-start text-white mb-0 fw-semi-bold">치료 기록지</h5>
							</div>
						</div>
					</div>
					<div class="card-body scrollbar">
						<div class="row">
							<div class="col-md-12">
								<table class="table table-outline text-center" border="1"
									style="width: 100%;" id="soap">
									<tr>
										<th style="text-align: center; vertical-align: middle;">No.</th>
										<td colspan="2"><input class="form-control" type="text"
											placeholder="차트번호" id="clnicNo" name="clnicNo" disabled="disabled"/></td>
										<th style="text-align: center; vertical-align: middle;">Room
											No.</th>
										<td colspan="2"><input class="form-control" type="text" disabled="disabled"
											placeholder="입원병실" id="hspitalization" name="hspitalization"/></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Name</th>
										<td><input class="form-control" type="text" disabled="disabled"
											placeholder="환자명" id="patntNm" name="patntNm"/>
											<input type="hidden" id="patntNo" name="patntNo"/>
										</td>
										<th style="text-align: center; vertical-align: middle;">Gender</th>
										<td><input class="form-control" type="text" disabled="disabled"
											placeholder="성별" id="patntSexdstn" name="patntSexdstn"/></td>
										<th style="text-align: center; vertical-align: middle;">Age</th>
										<td><input class="form-control" type="text" disabled="disabled"
											placeholder="나이" id="patntAge" name="patntAge"/></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Dx</th>
										<td colspan="5"><input class="form-control" type="text" disabled="disabled"
											placeholder="의사가 내린 환자의 진단명" id="sckwndKr" name="sckwndKr"/></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Onset</th>
										<td colspan="5"><input class="form-control" type="text" disabled="disabled"
											placeholder="발병일" id="atfssDt" name="atfssDt"/></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">C.C</th>
										<td colspan="5"><input class="form-control" id="otptAppeal" name="otptAppeal" type="text" placeholder="주호소" disabled="disabled" /></td>
									</tr>
<!-- 									<tr> -->
<!-- 										<th style="text-align: center; vertical-align: middle;">PHx</th> -->
<!-- 										<td colspan="5"><input class="form-control" id="otptHistory" name="otptHistory" type="text" -->
<!-- 											placeholder="과거력" /></td> -->
<!-- 									</tr> -->
									<tr>
										<th rowspan="4"
											style="text-align: center; vertical-align: middle;">Cognitive
											Function</th>
										<th rowspan="2"
											style="text-align: center; vertical-align: middle; font-size: ">Orientation</th>
										<th class="">T</th>
										<th class="">P</th>
										<th class="">P</th>
									</tr>
									<tr>
										<td class=""><input class="form-control text-center" id="orientTime" name="orientTime"
											type="text" placeholder="+ or -" /></td>
										<td class=""><input class="form-control text-center" id="orientPlace" name="orientPlace"
											type="text" placeholder="+ or -" /></td>
										<td class=""><input class="form-control text-center" id="orientPerson" name="orientPerson"
											type="text" placeholder="+ or -" /></td>
									</tr>
									<tr>
										<th rowspan="2"
											style="text-align: center; vertical-align: middle;">Memory</th>
										<th colspan="2">STM</th>
										<th colspan="2">LTM</th>
									</tr>
									<tr>
										<td colspan="2"><input class="form-control text-center" id="otptStm" name="otptStm"
											type="text" placeholder="+ or -" /></td>
										<td colspan="2"><input class="form-control text-center" id="otptLtm" name="otptLtm"
											type="text" placeholder="+ or -" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Speech</th>
										<td colspan="5"><input class="form-control" type="text" id="otptSt" name="otptSt"
											placeholder="intact(정상) aphasia(언어중추손상) Dysphonia(발성장애) Dysarthria(조음장애)" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Swalowing</th>
										<td colspan="5"><input class="form-control" type="text" id="otptDysp" name="otptDysp"
											placeholder="삼킴장애 유/무" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Ambulation</th>
										<td colspan="5"><input class="form-control" type="text" id="otptPd" name="otptPd"
											placeholder="W/C, Walking, Walking with cane" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Other</th>
										<td colspan="5"><input class="form-control" type="text" id="mustEtc" name="mustEtc"
											placeholder="주의사항" /></td>
									</tr>
									<tr>
										<th rowspan="4"
											style="text-align: center; vertical-align: middle;">Muscle
											Tons (MAS)</th>
										<th rowspan="2"
											style="text-align: center; vertical-align: middle;">U/E</th>
										<th colspan="2">Rt</th>
										<th colspan="2">Lt</th>
									</tr>
									<tr>
										<td colspan="2"><input class="form-control text-center" id="mustUbRight" name="mustUbRight"
											type="text" placeholder="MAS 등급" /></td>
										<td colspan="2"><input class="form-control text-center" id="mustUbLeft" name="mustUbLeft"
											type="text" placeholder="MAS 등급" /></td>
									</tr>
									<tr>
										<th rowspan="2"
											style="text-align: center; vertical-align: middle;">L/E</th>
										<th colspan="2">Rt</th>
										<th colspan="2">Lt</th>
									</tr>
									<tr>
										<td colspan="2"><input class="form-control text-center" id="mustLbRight" name="mustLbRight"
											type="text" placeholder="MAS 등급" /></td>
										<td colspan="2"><input class="form-control text-center" id="mustLbLeft" name="mustLbLeft"
											type="text" placeholder="MAS 등급" /></td>
									</tr>
									<tr>
										<th rowspan="3"
											style="text-align: center; vertical-align: middle;">Assessment</th>
										<th style="text-align: center; vertical-align: middle;">Problem
											List</th>
										<td colspan="4"><input class="form-control" type="text" id="mainCntrvs" name="mainCntrvs"
											placeholder="환자의 주요 문제점" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">LTG</th>
										<td colspan="4"><input class="form-control" type="text" id="lngtrCoal" name="lngtrCoal"
											placeholder="환자의 장기목표" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">STG</th>
										<td colspan="4"><input class="form-control" type="text" id="srtpdCoal" name="srtpdCoal"
											placeholder="환자의 단기목표" /></td>
									</tr>
									<tr>
										<th style="text-align: center; vertical-align: middle;">Plan</th>
										<td colspan="5"><input class="form-control" type="text" id="mustPlan" name="mustPlan"
											placeholder="목표를 위해 적용할 치료방법" /></td>
									</tr>
									<tr>
										<td colspan="6">
											<button id="saveBtn" type="button" class="btn btn-primary"
       											 style="width: 120px; background-color: midnightblue;  border: none;">저장</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<input type="hidden" id="page" value="1"/>




<script type="text/javascript">

//시큐리티 토큰 관련 2개
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

	$(document).ready(function(){
		pagingAjax();
		function pagingAjax(){
			var searchWord = $("#searchWord").val();
			var thisDate = $("#thisDate").val();
			var page = 1;
			clnicAjax(searchWord, thisDate, page);
		}
		
		$('#thisDate').val(getTodayDate);
	});
	
	$("#thisDate").on("change", function(){
		var searchWord = $("#searchWord").val();
		var thisDate = $("#thisDate").val();
		var page = 1;
		clnicAjax(searchWord, thisDate, page);
	});
	$("#searchWord").on("keyup", function(event){
		if(event.key == "Enter"){
			var searchWord = $("#searchWord").val();
			var thisDate = $("#thisDate").val();
			var page = 1;
			clnicAjax(searchWord, thisDate, page);
		}
	});
	
	// 00년생 처리 함수
	   function formatBirthday(number){
	      
	      // 변환된 생년월일을 담을(리턴할) 변수
	      var formatRrno1 = "";
	      // 주민번호 앞자리에 0이 들어간 길이
	      // number가 정수형이므로 문자열로 바꾼뒤 length구함
	      var zeroLength = 6 - number.toString().length;
	      
	      // 0의 길이만큼 앞자리 생성
	      if(zeroLength > 0){
	         for(var i = 0; i < zeroLength; i++){
	            formatRrno1 += "0";
	         }
	      }
	      
	      // 생성된 앞자리 + 원래 주민번호 앞자리
	      formatRrno1 += number;
	      
	        return formatRrno1;
	   }
	
	function getTodayDate() {
        var today = new Date();
        var year = today.getFullYear();
        var month = today.getMonth() + 1; // 월은 0부터 시작하므로 +1
        var day = today.getDate();

        // 날짜를 "yyyy-MM-dd" 형식의 문자열로 변환
        var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
        return formattedDate;
    }
	
	/* 신청 내역 페이징 */
	   var therapistPatientPagingArea = $('#therapistPatientPagingArea');
	   therapistPatientPagingArea.on("click", "a", function(event){
	      event.preventDefault();
	      
	      var searchWord = $('#searchWord').val();
	      var thisDate = $('#thisDate').val();
	      var page = $(this).data("page");
	      
//	       console.log("page click");
//	       console.log("page : "  + page);
	      
	      clnicAjax(searchWord, thisDate, page);
	   });
	
	var searchBtn2 = $("#searchBtn2");
	searchBtn2.on("click", function(){
		var searchWord = $("#searchWord").val();
		var thisDate = $("#thisDate").val();
		var page = $("#page").val();
		clnicAjax(searchWord, thisDate, page);
		
		
	});

	var saveBtn = $("#saveBtn");
	
	saveBtn.on("click", function(){
		
		// 변수 담기
		var clnicNo = $("#clnicNo").val();
		var patntNm     = $("#patntNm").val(); // 환자 이름
		var patntNo = $("#patntNo").val();
		var otptAppeal  = $("#otptAppeal").val(); // 주호소
		var otptHistory = $("#otptHistory").val(); // 과거력(Null)           
		var orientTime  = $("#orientTime").val(); // 인지지남력시간(Null)       
		var orientPlace = $("#orientPlace").val(); // 인지지남력장소(Null)       
		var orientPerson= $("#orientPerson").val(); // 인지지남력사람(Null)       
		var otptStm     = $("#otptStm").val(); // 인지 단기기억력(Null)      
		var otptLtm     = $("#otptLtm").val(); // 인지 장기기억력(Null)      
		var otptSt      = $("#otptSt").val(); // 언어(Null)            
		var otptDysp    = $("#otptDysp").val(); // 삼킴(Null)            
		var otptPd      = $("#otptPd").val(); // 이동(Null)            
		var mustUbRight = $("#mustUbRight").val(); // 근긴장도 상지오른쪽(Null)    
		var mustUbLeft  = $("#mustUbLeft").val(); // 근긴장도 상지왼쪽(Null)     
		var mustLbRight = $("#mustLbRight").val(); // 근긴장도 하지오른쪽(Null)    
		var mustLbLeft  = $("#mustLbLeft").val(); // 근긴장도 하지왼쪽(Null)     
		var mainCntrvs  = $("#mainCntrvs").val(); // 주요문제점(Null)         
		var lngtrCoal   = $("#lngtrCoal").val(); // 장기목표(Null)          
		var srtpdCoal   = $("#srtpdCoal").val(); // 단기목표(Null)          
		var mustPlan    = $("#mustPlan").val(); // 계획(Null)            
		var mustEtc     = $("#mustEtc").val(); // 기타사항(Null)         
		
		// 변수 담기 끝
		
		// 브라우저 콘솔 출력
		console.log("patntNm 환자 >>>>" + patntNm);
		
		var soapObj = {
			
			clnicNo : clnicNo
			, patntNo : patntNo	
			, otptAppeal : otptAppeal
			, otptHistory : otptHistory
			, orientTime : orientTime
			, orientPlace : orientPlace
			, orientPerson : orientPerson
			, otptStm : otptStm
			, otptLtm : otptLtm
			, otptSt : otptSt
			, otptDysp : otptDysp
			, otptPd : otptPd
			, mustUbRight : mustUbRight	
			, mustUbLeft : mustUbLeft
			, mustLbRight : mustLbRight
			, mustLbLeft : mustLbLeft
			, mainCntrvs : mainCntrvs
			, lngtrCoal : lngtrCoal
			, srtpdCoal : srtpdCoal
			, mustPlan : mustPlan
			, mustEtc : mustEtc
		};
		
		
		
		$.ajax({
	 		type : "post",
			url : "/mediform/therapist/SOAP/update",
			data : JSON.stringify(soapObj),
	 		contentType : "application/json; charset=utf-8",
	 		async: false,
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	 		success : function(result) {
				console.log("update 성공!!!");
				
				Swal.fire({
				      icon: 'success',
				      title: 'SOAP',
				      text: '저장되었습니다',
				      confirmButtonText: '확인',
				      confirmButtonColor: 'midnightblue',
				    })
				
	 		}
	 	});
		
		
		// 브라우저 콘솔 출력
		
	});
	
	// 타임스탬프 날짜 변환 함수(시,분,초 포함) 
	// yyyy/MM/dd hh:mm
	function formatDate(timeStamp){
	    var date = new Date(timeStamp);
	
	    var year = date.getFullYear();
	    var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고, 두 자리로 만듭니다.
	    var day = date.getDate().toString().padStart(2, '0'); // 일도 두 자리로 만듭니다.
	    var hours = date.getHours().toString().padStart(2, '0'); // 시도 두 자리로 만듭니다.
	    var minutes = date.getMinutes().toString().padStart(2, '0'); // 분도 두 자리로 만듭니다.
// 	    var seconds = date.getSeconds().toString().padStart(2, '0'); // 초도 두 자리로 만듭니다.
	
	    var formattedDate = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;
	
	    return formattedDate;
	}
	
	
	// 신청 내역 출력을 ajax로 하기 위한 함수 시작
	function clnicAjax(searchWord, thisDate, page){
		
		var data = {
				searchWord : searchWord, 
				thisDate : thisDate,
				page : page
			};
		
// 		console.log("ajax직전 page : " + page);

// 		console.log('data', data);
		
		// AJAX 요청
		$.ajax({
		    type: "post",
		    url: "/mediform/therapist/SOAP/clinic/list",
		    data: JSON.stringify(data),
		    contentType: "application/json; charset=utf-8",
		    beforeSend: function(xhr) {
		        xhr.setRequestHeader(header, token);
		    },
		    success: function(response) {
// 		        console.log("ajax 성공");
		        console.log(response);
		        
		        // 페이징 정보 업데이트
		        $("#therapistPatientPagingArea").html(response.pagingHTML);
		        
		        // 목록 데이터 업데이트
		        var dataList = response.dataList;
		        var tableBody = $("#therapistPatientTbody");
		        tableBody.empty();
		        var selectedRow = null;
		        
		        if (dataList.length === 0) {
		            tableBody.append("<tr><td colspan='4' align='center'>조회된 진료내역이 없습니다</td></tr>");
		        } else {
		            $.each(dataList, function(index, item) {
		                var row = $("<tr>").attr("id", item.clnicNo).addClass("therapistPatientTrList")
		                    .append($("<td>").text(index+1).addClass("clnicIndex"))
		                    .append($("<td>").text(item.patntNm).addClass("patntNm"))
		                    .append($("<td>").text(formatBirthday(item.patntRrno1)).addClass("patntRrno1"))
		                    .append($("<td>").text(formatDate(item.clnicTime)).addClass("clnicTime"))
		                
		                row.on("click", function() {
		                    if (selectedRow !== null) {
		                        // 이전에 클릭한 행의 "selected" 클래스를 제거
		                        selectedRow.removeClass("selected");
		                    }
		                    // 새로 클릭한 행에 "selected" 클래스를 추가
		                    $(this).addClass("selected");
		                    selectedRow = $(this); // 이전에 클릭한 행을 업데이트
		                });
		                
		                tableBody.append(row);
		            });
		        }
		    }
		});
	}
	
	
	// 진료 클릭 시 치료 내역 출력
	$("#therapistPatientTbody").on("click", ".therapistPatientTrList", function(){
		
		
		
		$("#clnicNo").val("");
		$("#hspitalization").val("");
		$("#patntNm").val("");
		
		$("#patntSexdstn").val("");
		$("#patntAge").val("");
		$("#sckwndKr").val("");
		
		$("#atfssDt").val("");
		$("#otptAppeal").val("");
		
		$("#otptHistory").val();
		$("#orientTime").val("");
		$("#orientPlace").val("");
		$("#orientPerson").val("");
		$("#otptStm").val("");
		$("#otptLtm").val("");
		$("#otptSt").val("");
		$("#otptDysp").val("");
		$("#otptPd").val("");
		$("#mustUbRight").val("");
		$("#mustUbLeft").val("");
		$("#mustLbRight").val("");
		$("#mustLbLeft").val("");
		$("#mainCntrvs").val("");
		$("#lngtrCoal").val("");
		$("#srtpdCoal").val("");
		$("#mustPlan").val("");
		$("#mustEtc").val("");
		
		
		
		var clnicNo = $(this).attr("id");
		
		console.log("진료 번호 >>> " + clnicNo);
		
		var thrapListObj = {
				clnicNo : clnicNo
		}
		
		
		var mtrListHtmlSpace = $("#mtrListHtmlSpace");
		var mtrListHtml = "";
		
		$.ajax({
	 		type : "post",
			url : "/mediform/therapist/SOAP/medicalTreatmentRecord/list",
			data : JSON.stringify(thrapListObj),
	 		contentType : "application/json; charset=utf-8",
	 		async: false,
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	 		success : function(res) {
				console.log("치료 오더 내용 끌고 오기 성공");
				
// 				var dateString = res[0].mdlrDt;
// 				var date = new Date(dateString);
// 				var year = date.getFullYear();
// 				var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
// 				var day = date.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅

// 				// 원하는 형식으로 조합
// 				var formattedDate = year + '.' + month + '.' + day;
				
// 				mtrListHtml += "<br>";
// 				mtrListHtml += "<div class='row input-group'>";
// 				mtrListHtml += "  <input class='fw-semi-bold col-5 bg-secondary-subtitle text-black text-center form-control' type='text' value='치료일시' disabled />";
// 				mtrListHtml += "  <div class='col-7 input-group-append p-0 m-0'>";
// 				mtrListHtml += "    <input class='text-black form-control bg-white' type='text' value='" + formattedDate + "' disabled />";
// 				mtrListHtml += "  </div>";
// 				mtrListHtml += "</div>";
				
				
				/*여기  */
				$(res).each(function(){
					var mdlrtCl = this.mdlrtCl;
					var mdlrtNminfo=""
		            var mdlrtClinfo="";
		            	if(mdlrtCl == "물리"){
		            		mdlrtClinfo = '<span class="badge rounded-pill badge-subtle-primary">물리</span>';
		            		mdlrtNminfo = "primary";
		            	}else{
		            		mdlrtClinfo = '<span class="badge rounded-pill badge-subtle-success">작업</span>';
		            		mdlrtNminfo = "success";
		            	}
					

						mtrListHtml +=  "<div class='col-1'>"
						mtrListHtml +=  "</div>"
						mtrListHtml +=  "<div class='col-5 text-start'>"
						mtrListHtml +=  "<div class='rounded-3'>"
						mtrListHtml +=  "<p><span class='fas fa-circle fs--1 me-3 text-" + mdlrtNminfo + "'></span>"+ this.mdlrtNm +"</p>"
						mtrListHtml +=  "</div>"
						mtrListHtml +=  "</div>"
						mtrListHtml +=  "<div class='col-6'>"
						mtrListHtml +=  mdlrtClinfo
						mtrListHtml +=  "</div>"
						mtrListHtml +=  "<hr>"
						

// 					mtrListHtml += "<div class='row'>";
// 					mtrListHtml += "<div class='d-flex flex-between-center rounded-3 bg-body-tertiary p-3 mt-2'>";
// 					mtrListHtml += "<h6 class='mb-0 ms-2' style='font-size : 15px;'><span class='fas fa-circle fs--1 me-3 text-primary'></span>"+ this.mdlrtNm +"</h6>";
// 					mtrListHtml += "<p class='fs--2 text-800 mb-0 fw-semi-bold'>"+ this.mdlrtCl +"</p>"; 
// 					mtrListHtml += "</div>"; 
// 					mtrListHtml += "</div>";
					
				});
				
				mtrListHtmlSpace.html(mtrListHtml);
				
	 		}
	 	});
		
		$.ajax({
	 		type : "post",
			url : "/mediform/therapist/SOAP/clnic/select",
			data : JSON.stringify(thrapListObj),
	 		contentType : "application/json; charset=utf-8",
	 		async: false,
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	 		success : function(res) {
				console.log("진료 기록 가져오기");
				
				console.log("진료기록 size >>> " + res.length);
				
				console.log("병실 >>" + res.clnicCn);
				
				$("#clnicNo").val(res.clnicNo);
				
				if(res.hsptlzSckrm != null || res.hsptlzSckrm === ""){
					$("#hspitalization").val(res.hsptlzSckrm + "-" + res.hsptlzSckbd);
				}else{
					$("#hspitalization").val("-");
				}
				
				$("#patntNm").val(res.patntNm);
				
				
				var gender = "";
				if(res.patntSexdstn === "M"){
					gender = "남";
				}else if(res.patntSexdstn === "F"){
					gender = "여";
				}
				$("#patntSexdstn").val(gender);
				$("#patntAge").val(res.patntAge);
				$("#sckwndKr").val(res.sckwndKr);
				
				var dateString = res.atfssDt;
				var date = new Date(dateString);
				var year = date.getFullYear();
				var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
				var day = date.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅

				// 원하는 형식으로 조합
				var formattedDate = year + '.' + month + '.' + day;
				
				$("#atfssDt").val(formattedDate);
				$("#otptAppeal").val(res.clnicCn);
				
				$("#patntNo").val(res.patntNo);
				
				
	 		}
	 	});
		
		
		$.ajax({
	 		type : "post",
			url : "/mediform/therapist/SOAP/select",
			data : JSON.stringify(thrapListObj),
	 		contentType : "application/json; charset=utf-8",
	 		async: false,
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	 		success : function(res) {
				console.log("soap 기록 가져오기");
				
				
				$("#orientTime").val(res.orientTime);
				$("#orientPlace").val(res.orientPlace);
				$("#orientPerson").val(res.orientPerson);
				$("#otptStm").val(res.otptStm);
				$("#otptLtm").val(res.otptLtm);
				$("#otptSt").val(res.otptSt);
				$("#otptDysp").val(res.otptDysp);
				$("#otptPd").val(res.otptPd);
				$("#mustUbRight").val(res.mustUbRight);
				$("#mustUbLeft").val(res.mustUbLeft);
				$("#mustLbRight").val(res.mustLbRight);
				$("#mustLbLeft").val(res.mustLbLeft);
				$("#mainCntrvs").val(res.mainCntrvs);
				$("#lngtrCoal").val(res.lngtrCoal);
				$("#srtpdCoal").val(res.srtpdCoal);
				$("#mustPlan").val(res.mustPlan);
				$("#mustEtc").val(res.mustEtc);
				
				
				
	 		}
	 	});
		
	});
</script>



</body>
</html>




