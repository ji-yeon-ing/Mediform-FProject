<%@page import="java.util.Arrays"%>
<%@page import="kr.or.ddit.calender.vo.VacationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#calendar .fc-day-sun{
	color: lightcoral;
}
#calendar .fc-day-sat{
	color: cornflowerblue;
}
.fc .fc-button-primary{
	background-color: midnightblue;
}
.fc .fc-scrollgrid{
	border: 1px solid
}
.form-select {
	padding-right: 10px;
}
.vacation-table {
    width: 600px;
    border-collapse: collapse;
    font-family: '맑은 고딕';
    font-size: 16px;
}
.vacation-cell {
    border: 1px solid;
    text-align: center;
    vertical-align: middle;
}
.vacation-title {
    width: 250px;
    font-weight: bold;
    letter-spacing: 15px;
    font-size: 25px;
}
.vacation-day {
    width: 20px;
}
.vacation-label {
    width: 90px;
}
.vacation-space {
    width: 100px;
}
.vacation-content {
    width: 500px;
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<title>메디폼 | 관리자</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// 캘린더 데이터
$(document).ready(function() {
	$.ajax({
		type: "GET",
		url: "/mediform/vacation/list",
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(param) {
//         	console.log(param);
        	InitCalender(param);
        },	// success
        error: function(){
//         	console.log("에러발생");
        }
	});
});

// 캘린더 초기화, 생성
function InitCalender(param){
	if(calendar) {
        calendar.destroy();
    }
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		headerToolbar : {
			start: 'prev,next today',
			center: 'title',
			end: 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		weekends: true,
		buttonText: {
			today: '오늘',
			month: '월간',
			week: '주간',
			day: '일간'
		},
		views: {
			dayGridMonth: {
				titleFormat: {month: 'long', year: 'numeric'}
			}
		},
		height: '700px',
		navLinks : true, 				// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		events : param,
		locale : 'ko', 					// 한국어 설정
		eventDataTransform: function(event) {
			if (event.end) {
				var endDt = new Date(event.end);
				endDt.setDate(endDt.getDate());
				event.end = endDt;
				}
				return event;
			}
	});
	calendar.render();
}
</script>
</head>

<body>
<c:set var="customUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<input type="hidden" name="loginEmpNo" id="loginEmpNo" value="${customUser.employee.empNo}"/>
<input type="hidden" name="loginEmpNm" id="loginEmpNm" value="${customUser.employee.empNm}"/>
<input type="hidden" name="loginEmpSe" id="loginEmpSe" value="${customUser.employee.empSe}"/>
<input type="hidden" name="loginEmpClsf" id="loginEmpClsf" value="${customUser.employee.empClsf}"/>
<input type="hidden" name="loginEmpYrycRemndr" id="loginEmpYrycRemndr" value="${customUser.employee.empYrycRemndr}"/>
<input type="hidden" name="loginEmpOffhodRemndr" id="loginEmpOffhodRemndr" value="${customUser.employee.empOffhodRemndr}"/>
<input type="hidden" name="loginEmpSicknsRemndr" id="loginEmpSicknsRemndr" value="${customUser.employee.empSicknsRemndr}"/>

<div class="row" style="height: 900px;">

	<!-- 회원정보 상세 시작 -->
	<div class="col-3">
		<div class="card border border-secondary" >
			<div class="">
				<div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
					<div class="row" style="display: flex; justify-content: start;">
						<div class="col-auto">
							<h5 class="mb-0 ms-2 text-white" style="font-weight: bold;">직원정보</h5>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="search-box p-2" style="float: left;">
							<div class="col-sm-auto d-flex align-items-center pe-0 search-Box">
								<button class="input-group-text pe-2" id="searchEmpBtn" style="padding-right: 10px; padding-left: 10px; background: unset; border: initial" disabled="disabled"><i class="fas fa-search"></i></button>
								<input class="form-control form-control-sm dropdown-toggle" type="text" placeholder="직원명 또는 사번을 입력해 주세요." name="searchEmpWord" id="searchEmpWord" value="${searchWord }"
										data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="min-width: 300px; float: left;"/>
								<div>
									<button class="btn btn-falcon-default btn-sm ms-3 allResetButton" type="button" style="float: left; min-width: 74px; height: 28px">초기화</button>
								</div>
								<div class="dropdown-menu dropdown-menu-start py-0" id="empDropList" style="min-width: 310px; position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(84px, 39px);" aria-labelledby="searchEmpWord">
									<table class="table table-sm table-hover">
										<thead>
											<tr>
												<td class="text-900 sort text-center">사번</td>
												<td class="text-900 sort text-center">직원명</td>
												<td class="text-900 sort text-center">부서</td>
												<td class="text-900 sort text-center">직급</td>
												<td class="text-900 sort text-center" style="min-width: 80px;">생년월일</td>
											</tr>
										</thead>
										<tbody id="empDrop"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body p-0 mx-2 mb-1">
					<div class="col-12">
						<div class="row">
							<div class="col-6 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 14px;">사번</span>
									<input class="form-control" type="text" id="detailEmpNo" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 14px;">성명</span>
									<input class="form-control" type="text" id="detailEmpNm" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 14px;">부서</span>
									<input class="form-control" type="text" id="detailEmpSe" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 14px;">직위</span>
									<input class="form-control" type="text" id="detailEmpClsf" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 14px;">성별</span>
									<input class="form-control" type="text" id="detailEmpSexdstn" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text">생년월일</span>
									<input class="form-control" type="text" id="detailEmpRrno1" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">전화번호</span>
									<input class="form-control" type="text" id="detailEmpTelno" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 4px;">입사일</span>
									<input class="form-control" type="text" id="detailEmpEncpn" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text" style="letter-spacing: 4px;">퇴사일</span>
									<input class="form-control" type="text" id="detailEmpRetire" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-4 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">사용연차</span>
									<input class="form-control" type="text" id="detailEmpYrycUse" readonly="readonly"/>
								</div>
							</div>
							<div class="col-4 px-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text">사용공가</span>
									<input class="form-control" type="text" id="detailEmpOffhodUse" readonly="readonly"/>
								</div>
							</div>
							<div class="col-4 ps-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">사용병가</span>
									<input class="form-control" type="text" id="detailEmpSicknsUse" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-4 pe-1 pb-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">남은연차</span>
									<input class="form-control" type="text" id="detailEmpYrycRemndr" readonly="readonly"/>
								</div>
							</div>
							<div class="col-4 px-0">
								<div class="input-group input-group-sm">
									<span class="input-group-text">남은공가</span>
									<input class="form-control" type="text" id="detailEmpOffhodRemndr" readonly="readonly"/>
								</div>
							</div>
							<div class="col-4 ps-1">
								<div class="input-group input-group-sm">
									<span class="input-group-text">남은병가</span>
									<input class="form-control" type="text" id="detailEmpSicknsRemndr" readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 휴가 내역 시작 -->
		<div class="card border border-secondary mt-2">
			<div class="card border-secondary" style="height: 465px; background-color: aliceblue;">
				<div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
					<div class="row" style="display: flex; justify-content: start;">
						<div class="col-auto">
							<h5 class="mb-0 ms-2 text-white" style="font-weight: bold;">신청내역</h5>
						</div>
					</div>
				</div>
				<div class="row border-secondary pt-1">
					<div class="col-3" style="padding-left: 20px; padding-right: 5px;">
						<div class="card text-center border" style="height: 415px;">
							<input class="col-8 text-white text-center form-control form-control-sm" type="text" value="신청일" style="background-color: midnightblue; border: white solid 1px; border-bottom-left-radius: revert; border-bottom-right-radius: revert;" disabled />
							<table>
								<tbody id="empRqstdt"  class="align-center"></tbody>
							</table>
						</div>
					</div>
					<div class="col-9" style="padding-left: 0px; padding-right: 20px;">
						<div class="card" style="height: 415px;">
							<div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
								<div class="row" style="display: flex; justify-content: start;">
									<div class="col-auto">
									</div>
								</div>
							</div>
							<div class="p-2 scrollbar">
								<div class="input-group input-group-sm mb-1">
									<span class="input-group-text">휴가코드</span>
									<div class="form-control" id="vacCdList"></div>
									<span>&nbsp;&nbsp;&nbsp;</span>
									<button class="btn btn-sm vacFormDetailBtn" id="vacFormDetailForm" type="button" style="height: 30px;">
										<div class="row p-0 ms-1">
											<div class="col-auto p-0">
												<span class="material-icons p-0" style="color: midnightblue;">description</span>
											</div>
											<div class="col-auto p-0 me-3" style="color: midnightblue; display: flex; align-items: center;">
												<span class="p-0">신청서</span>
											</div>
										</div>
									</button>
								</div>
								<div class="row">
									<div class="col-6 pe-1 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text">휴가분류</span>
											<input class="form-control" type="text" id="vacClList" readonly="readonly"/>
										</div>
									</div>
									<div class="col-6 ps-0">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 4px;">성명</span>
											<input class="form-control" type="text" id="vacNmList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-6 pe-1 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 14px;">부서</span>
											<input class="form-control" type="text" id="vacDepList" readonly="readonly"/>
										</div>
									</div>
									<div class="col-6 ps-0">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 4px;">직위</span>
											<input class="form-control" type="text" id="vacClsfList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm" style="height: 50px;">
											<span class="input-group-text">휴가사유</span>
											<input class="form-control" type="text" id="vacResonList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 5px;">시작일</span>
											<input class="form-control" type="text" id="vacBgndtList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 5px;">종료일</span>
											<input class="form-control" type="text" id="vacEnddtList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text">사용갯수</span>
											<input class="form-control" type="text" id="vacYrycCoList" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 2px;">1차승인</span>
											<input class="form-control" type="text" id="vacReprsntEmpno" readonly="readonly"/>
											<input class="form-control" type="text" id="vacConfmDt2" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text">최종승인</span>
											<input class="form-control" type="text" id="vacConfirmerEmpno" readonly="readonly"/>
											<input class="form-control" type="text" id="vacConfmDt1" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm">
											<span class="input-group-text" style="letter-spacing: 14px;">반려</span>
											<input class="form-control" type="text" id="vacRjctEmpno" readonly="readonly"/>
											<input class="form-control" type="text" id="vcaRjctDt" readonly="readonly"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 pb-1">
										<div class="input-group input-group-sm" style="height: 50px;">
											<span class="input-group-text">반려사유</span>
											<input class="form-control" type="text" id="vacReResonList" readonly="readonly"/>
										</div>
									</div>
								</div>
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text">휴가분류</span> -->
<!-- 									<div class="form-control" id="vacClList"></div> -->
<!-- 									<span>&nbsp;&nbsp;&nbsp;</span> -->
<!-- 									<span class="input-group-text">성명</span> -->
<!-- 									<div class="form-control" id="vacNmList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text">부서</span> -->
<!-- 									<div class="form-control" id="vacDepList"></div> -->
<!-- 									<span>&nbsp;&nbsp;&nbsp;</span> -->
<!-- 									<span class="input-group-text">직위</span> -->
<!-- 									<div class="form-control" id="vacClsfList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2" style="height: 50px;"> -->
<!-- 									<span class="input-group-text">휴가사유</span> -->
<!-- 									<div class="form-control" id="vacResonList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text">시작일</span> -->
<!-- 									<div class="form-control" id="vacBgndtList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text">종료일</span> -->
<!-- 									<div class="form-control" id="vacEnddtList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text">사용갯수</span> -->
<!-- 									<div class="form-control" id="vacYrycCoList"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text text-center" style="width: 82px;">1차승인</span> -->
<!-- 									<div class="form-control" id="vacReprsntEmpno"></div> -->
<!-- 									<div class="form-control" id="vacConfmDt1"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text text-center">최종승인</span> -->
<!-- 									<div class="form-control" id="vacConfirmerEmpno"></div> -->
<!-- 									<div class="form-control" id="vacConfmDt2"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2"> -->
<!-- 									<span class="input-group-text text-center" style="width: 82px;">반려</span> -->
<!-- 									<div class="form-control" id="vacRjctEmpno"></div> -->
<!-- 									<div class="form-control" id="vcaRjctDt"></div> -->
<!-- 								</div> -->
<!-- 								<div class="input-group input-group-sm mb-2" style="height: 50px;"> -->
<!-- 									<span class="input-group-text">반려사유</span> -->
<!-- 									<div class="form-control" id="vacReResonList"></div> -->
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 휴가 내역 끝 -->
		
	</div>
	<!-- 회원정보 상세 끝 -->
	
	<!-- 휴가 시작 -->
	<div class="col-5">
		<div class="card border border-secondary" style="height: 797px;">
			<div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
				<div class="row" style="display: flex; justify-content: start;">
					<div class="col-auto">
						<h5 class="mb-0 ms-2 text-white" style="font-weight: bold;">휴가결재</h5>
					</div>
				</div>
			</div>
			
			<!-- 탭 바디 시작 -->
			<div class="card-body p-0 m-2">
						
				<!-- 휴가 서브탭 시작 -->
				<div class="col-12 p-0">
					<ul class="nav nav-tabs" id="vacTab" role="tablist">
			            <li class="nav-item text-center col-3" role="presentation">
			                <a class="nav-link active me-1" id="signup-tab" data-bs-toggle="tab" href="#tab-signup" role="tab" aria-controls="tab-signup"
			                aria-selected="true" style="background-color: aliceblue;">신청중(<span class="p-0 signupCount" style="font-style: italic; color: cornflowerblue;"></span> )</a>
			            </li>
			            <li class="nav-item text-center col-3" role="presentation">
			                <a class="nav-link me-1" id="approval-tab" data-bs-toggle="tab" href="#tab-approval" role="tab" aria-controls="tab-approval"
			                aria-selected="false" style="background-color: aliceblue;">승인완료(<span class="p-0 appCount" style="font-style: italic; color: cornflowerblue;"></span> )</a>
			            </li>
			            <li class="nav-item text-center col-3" role="presentation">
			                <a class="nav-link me-1" id="return-tab" data-bs-toggle="tab" href="#tab-return" role="tab" aria-controls="tab-return"
			                aria-selected="false" style="background-color: aliceblue;">반려완료(<span class="p-0 returnCount" style="font-style: italic; color: cornflowerblue;"></span> )</a>
			            </li>
			            <li class="nav-item text-center col-3" role="presentation">
			                <a class="nav-link" id="allvac-tab" data-bs-toggle="tab" href="#tab-allvac" role="tab" aria-controls="tab-allvac"
			                aria-selected="false" style="background-color: aliceblue;">전체(<span class="p-0 vacCount" style="font-style: italic; color: cornflowerblue;"></span> )</a>
			            </li>
			        </ul>
				</div>
				<!-- 휴가 서브탭 끝 -->
				
				<!-- 상단 날짜, 등록버튼 시작 -->
				<div class="card-body p-1">
					<div class="mt-2">
						<div class="search-Box" style="float: left;">
							<input class="form-control form-control-sm datetimepicker" type="text"
								data-options='{"static":"true","format":"YYYY-MM-DD"}' id="searchVacStart"
								name="searchVacStart" value="" style="width: 150px"/>
						</div>
						<div class="p-0" style="text-align: center; font-weight: bold; font-size: 15px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="col-sm-auto d-flex align-items-center pe-0 search-Box" style="float: left;">
							<input class="form-control form-control-sm datetimepicker" type="text" 
								data-options='{"static":"true","format":"YYYY-MM-DD"}' id="searchVacEnd"
								name="searchVacEnd" value="" style="width: 150px; float: left;"/>
							<button class="input-group-text" id="vacDateFilterBtn" style="padding-right: 10px; padding-left: 10px; float: left;"><i class="fas fa-search"></i></button>
						</div>
						<div class="p-0" style="display: flex; justify-content: flex-end; height: 30px;">
<!-- 							<button class="btn btn-falcon-primary btn-sm" type="button"> -->
<!-- 								<span class="d-none d-sm-inline-block ms-1" data-bs-toggle="modal" data-bs-target="#new-vacation-modal" id="newVacationBtn" style="color: midnightblue;"><span class="fas fa-plus me-2"></span>휴가신청</span> -->
<!-- 							</button> -->
						</div>
					</div>
				</div>
				<!-- 상단 날짜, 등록 버튼 끝 -->
							
				<!-- 휴가 필터 & 검색 시작 -->
				<div class="card-body p-1 mt-1">
					<div class="">
						<div class="search-box" style="float: left;">
							<form class="col-sm-auto d-flex align-items-center pe-0" method="post" id="searchForm">
								<div class="col-sm-auto d-flex align-items-center pe-0">
									<select class="form-select form-select-sm" aria-label="Default select example" style="width: 90px;" name="searchType">
										<option value="searchstart" <c:if test="${searchType eq 'searchstart' }">selected="selected"</c:if>>시작일</option>
										<option value="searchend" <c:if test="${searchType eq 'searchend' }">selected="selected"</c:if>>종료일</option>
									</select>
								</div>
								<div class="col-6 col-sm-auto d-flex align-items-center pe-0 search-Box">
									<input class="form-control form-control-sm datetimepicker" type="text"
										data-options='{"static":"true","format":"YYYY-MM-DD"}' placeholder="날짜를 입력해 주세요."
										name="searchWord" id="searchWord" value="${searchWord }" style="width: 170px"/>
									<button class="input-group-text" id="searchBtn" style="padding-right: 10px; padding-left: 10px;"><i class="fas fa-search"></i></button>
								</div>
								<sec:csrfInput />
							</form>
						</div>
						<div class="p-0" style="display: flex; justify-content: flex-end;">
							<button class="btn btn-falcon-default btn-sm me-1 allResetButton" type="button">초기화</button>
							<div class="dropdown font-sans-serif">
								<button class="btn dropdown-toggle btn-sm btn-falcon-default" id="dropVacBtn" type="button" data-bs-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false" style="float: left;">부서별</button>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropVacBtn" style="--falcon-dropdown-min-width: 5.2rem; transform: translate(0px, 30px);">
									<button class="dropdown-item filterBtn dropVacBtn" value="a">원무</button>
									<button class="dropdown-item filterBtn dropVacBtn" value="d">의사</button>
									<button class="dropdown-item filterBtn dropVacBtn" value="n">간호</button>
									<button class="dropdown-item filterBtn dropVacBtn" value="t">치료</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 휴가 필터 & 검색 끝 -->
				
				<!-- 탭 content 시작 -->
				<div class="card-body p-1 mt-1">	
					<div class="tab-content">
						
						<!-- 휴가 신청 탭 시작 -->
						<div class="tab-pane fade show active" id="tab-signup" role="tabpanel" aria-labelledby="signup-tab">
							
							<!-- 휴가 신청내역 테이블 시작 -->
							<div class="table table-hover" id="VacationSignTable" >
								<div class="table-responsive scrollbar" style="height: 600px;">
									<table class="table table-sm table-hover data-table table-striped fs--1 mb-0 overflow-hidden" data-list='{"valueNames":["count","date","start","end", "status"]}'>
										<thead class="bg-200">
											<tr>
												<th class="text-900 sort pe-1" data-sort="count" style="text-align: center; padding-left: 4px;">번호</th>
												<th class="text-900 sort pe-1" data-sort="date" style="text-align: center;">신청일</th>
												<th class="text-900 sort pe-1" style="text-align: center;">구분</th>
												<th class="text-900 sort pe-1" style="text-align: center;">부서</th>
												<th class="text-900 sort pe-1" style="text-align: center;">신청자</th>
												<th class="text-900 sort pe-1" data-sort="start" style="text-align: center;">시작일</th>
												<th class="text-900 sort pe-1" data-sort="end" style="text-align: center;">종료일</th>
												<th class="text-900 sort pe-1" style="text-align: left; white-space: nowrap;
														overflow: hidden; text-overflow: ellipsis; max-width: 100px;">휴가사유</th>
												<th class="text-900 sort pe-1" style="text-align: center; min-width: 40px;">차감</th>
												<th class="text-900 sort pe-1" data-sort="status" style="text-align: center;">상태</th>
												<th class="text-900 sort pe-1" scope="col"></th>
											</tr>
										</thead>
										<tbody class="list" id="table-signup-body">
										<c:set value="${signupList }" var="signupList" />
										<c:set var="signupCount" value="0" />
											<c:choose>
												<c:when test="${empty signupList }">
													<tr>
														<td colspan="17" align="center">휴가 신청 정보가 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${signupList }" var="signList" varStatus="status">
														<tr class="btn-reveal-trigger">
															<td style="display: none;" id="signupVcatnCd" >${signList.vcatnCd }</td>
															<td style="display: none;" id="signupSelfEmpno">${signList.vcatnSelfEmpno }</td>
															<td style="display: none;" id="signupSelfEmpclsf">${signList.vcatnSelfEmpclsf }</td>
															<td class="count align-middle white-space-nowrap" style="text-align: center; padding-left: 4px;">${status.count}</td>
															<td class="date align-middle white-space-nowrap" style="text-align: center;">
																<fmt:formatDate value="${signList.vcatnRqstdt }" pattern="yyyy-MM-dd"/>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;">
																<c:if test="${signList.vcatnCl eq '1'}">연차휴가</c:if>
																<c:if test="${signList.vcatnCl eq '2'}">오전반차</c:if>
																<c:if test="${signList.vcatnCl eq '3'}">오후반차</c:if>
																<c:if test="${signList.vcatnCl eq '4'}">기타</c:if>
																<c:if test="${signList.vcatnCl eq '5'}">공가</c:if>
																<c:if test="${signList.vcatnCl eq '6'}">병가</c:if>
																<c:if test="${signList.vcatnCl eq '7'}">경조휴가</c:if>
																<c:if test="${signList.vcatnCl eq '8'}">출산휴가</c:if>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;" id="signupSelfEmpse">
																<c:if test="${signList.vcatnSelfEmpse eq 'a'}">원무과</c:if>
																<c:if test="${signList.vcatnSelfEmpse eq 'd'}">의사과</c:if>
																<c:if test="${signList.vcatnSelfEmpse eq 'n'}">간호과</c:if>
																<c:if test="${signList.vcatnSelfEmpse eq 't'}">치료과</c:if>
																<c:if test="${signList.vcatnSelfEmpse eq 'm'}">관리자</c:if>
																<c:if test="${signList.vcatnSelfEmpse eq 'k'}">병원장</c:if>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;" id="signupSelfEmpnm">${signList.vcatnSelfEmpnm }</td>
															<td class="start align-middle white-space-nowrap" style="text-align: center;">${signList.vcatnBgndt }</td>
															<td class="end align-middle white-space-nowrap" style="text-align: center;">${signList.vcatnEnddt }</td>
															<td class="align-middle white-space-nowrap" style="text-align: left; white-space: nowrap;
																overflow: hidden; text-overflow: ellipsis; max-width: 100px;">${signList.vcatnResn }</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;">${signList.vcatnYrycCo }</td>
															<td class="status align-middle white-space-nowrap" style="text-align: center;">
																<c:if test="${signList.vcatnConfmStep eq 1}">
																	<button class="btn btn-primary btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">1차승인</button>
																</c:if>
																<c:if test="${signList.vcatnConfmStep eq 0}">
																	<button class="btn btn-primary btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">대기</button>
																</c:if>
															</td>
															<td class="align-middle white-space-nowrap p-0">
																<div class="dropdown font-sans-serif position-static">
																	<button class="btn text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false">
																		<span class="fas fa-ellipsis-h fs--1"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end border py-2" style="min-width: 15px;">
																		<div class="">
																			<button class="dropdown-item vacSelfEmpInfoBtn" data-empno="${signList.vcatnSelfEmpno }" value="" title="직원정보">직원상세</button>
																			<button class="dropdown-item vacFormDetailBtn" value="${signList.vcatnCd }" title="휴가신청서">신청서</button>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
														<c:set var="signupCount" value="${signupCount + 1}" />
													</c:forEach>
												</c:otherwise>
											</c:choose>
											<tr class="btn-reveal-trigger" style="background: #EDF2F9;">
												<td colspan="17" align="right" style="font-weight: bold;  text-align: end;" onclick="event.stopPropagation()">총&nbsp;&nbsp;<span id="signupCount">${signupCount}</span> 건</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 휴가 신청 테이블 끝 -->
							
						</div>	
						<!-- 휴가 신청 탭 끝 -->
						
						<!-- 휴가 승인 탭 시작 -->
						<div class="tab-pane fade" id="tab-approval" role="tabpanel" aria-labelledby="approval-tab">
							
							<!-- 휴가 승인 테이블 시작 -->
							<div class="table table-hover" id="VacationAppTable" >
								<div class="table-responsive scrollbar" style="height: 600px;">
									<table class="table table-sm table-hover table-hover data-table table-striped fs--1 mb-0 overflow-hidden" data-list='{"valueNames":["count","start","end", "appdt"]}'>
										<thead class="bg-200">
											<tr>
												<th class="text-900 sort pe-1" data-sort="count" style="text-align: center; padding-left: 4px;">번호</th>
												<th class="text-900 sort pe-1" data-sort="date" style="text-align: center;">신청일</th>
												<th class="text-900 sort pe-1" style="text-align: center;">구분</th>
												<th class="text-900 sort pe-1" style="text-align: center;">부서</th>
												<th class="text-900 sort pe-1" style="text-align: center;">신청자</th>
												<th class="text-900 sort pe-1" data-sort="start" style="text-align: center;">시작일</th>
												<th class="text-900 sort pe-1" data-sort="end" style="text-align: center;">종료일</th>
												<th class="text-900 sort pe-1" style="text-align: left; white-space: nowrap;">휴가사유</th>
												<th class="text-900 sort pe-1" data-sort="appdt" style="text-align: center;">승인일</th>
												<th class="text-900 sort pe-1" style="text-align: center;">승인자</th>
												<th class="text-900 sort pe-1" style="text-align: center;">상태</th>
												<th class="text-900 sort pe-1" style="text-align: center;"></th>
												
											</tr>
										</thead>
										<tbody class="list" id="table-approval-body">
										<c:set value="${approvalList }" var="approvalList" />
										<c:set var="appCount" value="0" />
										<c:choose>
											<c:when test="${empty approvalList }">
												<tr>
													<td colspan="17" align="center">휴가 승인 정보가 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${approvalList }" var="appList" varStatus="appstatus">
													<tr class="btn-reveal-trigger">
														<td class="count align-middle white-space-nowrap" style="text-align: center; padding-left: 4px;">${appstatus.count}</td>
														<td class="date align-middle white-space-nowrap" style="text-align: center;">
															<fmt:formatDate value="${appList.vcatnRqstdt }" pattern="yyyy-MM-dd"/>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">
															<c:if test="${appList.vcatnCl eq '1'}">연차휴가</c:if>
															<c:if test="${appList.vcatnCl eq '2'}">오전반차</c:if>
															<c:if test="${appList.vcatnCl eq '3'}">오후반차</c:if>
															<c:if test="${appList.vcatnCl eq '4'}">기타</c:if>
															<c:if test="${appList.vcatnCl eq '5'}">공가</c:if>
															<c:if test="${appList.vcatnCl eq '6'}">병가</c:if>
															<c:if test="${appList.vcatnCl eq '7'}">경조휴가</c:if>
															<c:if test="${appList.vcatnCl eq '8'}">출산휴가</c:if>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">
															<c:if test="${appList.vcatnSelfEmpse eq 'a'}">원무과</c:if>
															<c:if test="${appList.vcatnSelfEmpse eq 'd'}">의사과</c:if>
															<c:if test="${appList.vcatnSelfEmpse eq 'n'}">간호과</c:if>
															<c:if test="${appList.vcatnSelfEmpse eq 't'}">치료과</c:if>
															<c:if test="${appList.vcatnSelfEmpse eq 'm'}">관리자</c:if>
															<c:if test="${appList.vcatnSelfEmpse eq 'k'}">병원장</c:if>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">${appList.vcatnSelfEmpnm }</td>
														<td class="start align-middle white-space-nowrap" style="text-align: center;">${appList.vcatnBgndt }</td>
														<td class="end align-middle white-space-nowrap" style="text-align: center;">${appList.vcatnEnddt }</td>
														<td class="align-middle white-space-nowrap" style="text-align: left; white-space: nowrap;
																overflow: hidden; text-overflow: ellipsis; max-width: 100px;">${appList.vcatnResn }</td>
														<td class="appdt align-middle white-space-nowrap" style="text-align: center;">
															<fmt:formatDate value="${appList.vcatnConfmDt2 }" pattern="yyyy-MM-dd"/>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">${appList.confirmerName }</td>
														<td class="align-middle white-space-nowrap" style="text-align: center; padding-right: 4px;">
															<button class="btn btn-success btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">승인</button>
														</td>
														<td class="align-middle white-space-nowrap p-0">
															<div class="dropdown font-sans-serif position-static">
																<button class="btn text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false">
																	<span class="fas fa-ellipsis-h fs--1"></span>
																</button>
																<div class="dropdown-menu dropdown-menu-end border py-2" style="min-width: 15px;">
																	<div class="">
																		<button class="dropdown-item vacSelfEmpInfoBtn" data-empno="${appList.vcatnSelfEmpno }" value="" title="직원정보">직원상세</button>
																		<button class="dropdown-item vacFormDetailBtn" value="${appList.vcatnCd }" title="휴가신청서">신청서</button>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<c:set var="appCount" value="${appCount + 1}" />
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<tr class="btn-reveal-trigger" style="background: #EDF2F9;">
											<td colspan="17" align="right" style="font-weight: bold; text-align: end;" onclick="event.stopPropagation()">총&nbsp;&nbsp;<span id="appCount">${appCount}</span> 건</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 휴가 승인 테이블 끝 -->
							
						</div>
						<!-- 휴가 승인 탭 끝 -->
						
						<!-- 휴가 반려 탭 시작 -->
						<div class="tab-pane fade" id="tab-return" role="tabpanel" aria-labelledby="return-tab">
						
							<!-- 휴가 반려 테이블 시작 -->
							<div class="table table-hover" id="VacationReturnTable" >
								<div class="table-responsive scrollbar" style="height: 600px;">
									<table class="table table-sm table-hover data-table table-striped fs--1 mb-0 overflow-hidden" data-list='{"valueNames":["count", "date", "redt"]}'>
										<thead class="bg-200">
											<tr>
												<th class="text-900 sort pe-1" data-sort="count" style="text-align: center; padding-left: 4px;">번호</th>
												<th class="text-900 sort pe-1" data-sort="date" style="text-align: center;">신청일</th>
												<th class="text-900 sort pe-1" style="text-align: center;">구분</th>
												<th class="text-900 sort pe-1" style="text-align: center;">부서</th>
												<th class="text-900 sort pe-1" style="text-align: center;">신청자</th>
												<th class="text-900 sort pe-1" data-sort="redt" style="text-align: center;">반려일</th>
												<th class="text-900 sort pe-1" style="text-align: center; white-space: nowrap;
														overflow: hidden; text-overflow: ellipsis; max-width: 100px;">반려사유</th>
												<th class="text-900 sort pe-1" style="text-align: center;">반려자</th>
												<th class="text-900 sort pe-1" style="text-align: center;">처리</th>
												<th class="text-900 sort pe-1" style="text-align: center;"></th>
											</tr>
										</thead>
										<tbody class="list" id="table-return-body">
										<c:set value="${rejectList }" var="rejectList" />
										<c:set var="returnCount" value="0" /> 
										<c:choose>
											<c:when test="${empty rejectList }">
												<tr>
													<td colspan="17" align="center">휴가 반려 정보가 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${rejectList }" var="reList" varStatus="restatus">
													<tr class="btn-reveal-trigger">
														<td class="count align-middle white-space-nowrap" style="text-align: center; padding-left: 4px;">${restatus.count}</td>
														<td class="date align-middle white-space-nowrap" style="text-align: center;">
															<fmt:formatDate value="${reList.vcatnRqstdt }" pattern="yyyy-MM-dd"/>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">
															<c:if test="${reList.vcatnCl eq '1'}">연차휴가</c:if>
															<c:if test="${reList.vcatnCl eq '2'}">오전반차</c:if>
															<c:if test="${reList.vcatnCl eq '3'}">오후반차</c:if>
															<c:if test="${reList.vcatnCl eq '4'}">기타</c:if>
															<c:if test="${reList.vcatnCl eq '5'}">공가</c:if>
															<c:if test="${reList.vcatnCl eq '6'}">병가</c:if>
															<c:if test="${reList.vcatnCl eq '7'}">경조휴가</c:if>
															<c:if test="${reList.vcatnCl eq '8'}">출산휴가</c:if>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">
															<c:if test="${reList.vcatnSelfEmpse eq 'a'}">원무과</c:if>
															<c:if test="${reList.vcatnSelfEmpse eq 'd'}">의사과</c:if>
															<c:if test="${reList.vcatnSelfEmpse eq 'n'}">간호과</c:if>
															<c:if test="${reList.vcatnSelfEmpse eq 't'}">치료과</c:if>
															<c:if test="${reList.vcatnSelfEmpse eq 'm'}">관리자</c:if>
															<c:if test="${reList.vcatnSelfEmpse eq 'k'}">병원장</c:if>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">${reList.vcatnSelfEmpnm }</td>
														<td class="appdt align-middle white-space-nowrap" style="text-align: center;">
															<fmt:formatDate value="${reList.vcatnRjctDt }" pattern="yyyy-MM-dd"/>
														</td>
														<td class="align-middle white-space-nowrap" style="text-align: left; white-space: nowrap;
															overflow: hidden; text-overflow: ellipsis; max-width: 100px;">${reList.vcatnRjctResn }</td>
														<td class="align-middle white-space-nowrap" style="text-align: center;">${reList.rejectorName }</td>
														<td class="align-middle white-space-nowrap" style="text-align: center; padding-right: 4px;">
															<button class="btn btn-danger btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">반려</button>
														</td>
														<td class="align-middle white-space-nowrap p-0">
															<div class="dropdown font-sans-serif position-static">
																<button class="btn text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false">
																	<span class="fas fa-ellipsis-h fs--1"></span>
																</button>
																<div class="dropdown-menu dropdown-menu-end border py-2" style="min-width: 15px;">
																	<div class="">
																		<button class="dropdown-item vacSelfEmpInfoBtn" data-empno="${reList.vcatnSelfEmpno }" value="" title="직원정보">직원상세</button>
																		<button class="dropdown-item vacFormDetailBtn" value="${reList.vcatnCd }" title="휴가신청서">신청서</button>
																		<button class="dropdown-item vacRjctResnBtn" value="${reList.vcatnCd }" title="반려사유">반려사유</button>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<c:set var="returnCount" value="${returnCount + 1}" />
												</c:forEach>
											</c:otherwise>
										</c:choose>
										<tr class="btn-reveal-trigger" style="background: #EDF2F9;">
											<td colspan="17" align="left" style="font-weight: bold; text-align: end;" onclick="event.stopPropagation()">총&nbsp;&nbsp;<span id="returnCount">${returnCount}</span> 건</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 휴가 반려 테이블 끝 -->
							
						</div>
						<!-- 휴가 반려 탭 끝 -->
						
						<!-- 휴가 전체 탭 시작 -->
						<div class="tab-pane fade" id="tab-allvac" role="tabpanel" aria-labelledby="allvac-tab">
							
							<!-- 휴가 전체 테이블 시작 -->
							<div class="table table-hover" id="vacationTable" >
								<div class="table-responsive scrollbar" style="height: 600px;">
									<table class="table table-sm table-hover data-table table-striped fs--1 mb-0 overflow-hidden" data-list='{"valueNames":["count","date","start","end", "status"]}'>
										<thead class="bg-200">
											<tr>
												<th class="text-900 sort pe-1" data-sort="count" style="text-align: center; padding-left: 4px;">번호</th>
												<th class="text-900 sort pe-1" data-sort="date" style="text-align: center;">신청일</th>
												<th class="text-900 sort pe-1" style="text-align: center;">구분</th>
												<th class="text-900 sort pe-1" style="text-align: center;">부서</th>
												<th class="text-900 sort pe-1" style="text-align: center;">신청자</th>
												<th class="text-900 sort pe-1" data-sort="start" style="text-align: center;">시작일</th>
												<th class="text-900 sort pe-1" data-sort="end" style="text-align: center;">종료일</th>
												<th class="text-900 sort pe-1" style="text-align: left; white-space: nowrap;
														overflow: hidden; text-overflow: ellipsis; max-width: 100px;">휴가사유</th>
												<th class="text-900 sort pe-1" style="text-align: center; min-width: 40px;">차감</th>
												<th class="text-900 sort pe-1" data-sort="status" style="text-align: center;">상태</th>
												<th class="text-900 sort pe-1" scope="col"></th>
											</tr>
										</thead>
										<tbody class="list" id="table-vacation-body">
										<c:set value="${dataList }" var="dataList" />
										<c:set var="vacCount" value="0" />
											<c:choose>
												<c:when test="${empty dataList }">
													<tr>
														<td colspan="17" align="center">휴가 신청 정보가 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${dataList }" var="vacList" varStatus="vacstatus">
														<tr class="btn-reveal-trigger" >
															<td class="count align-middle white-space-nowrap" style="text-align: center; padding-left: 4px;">${vacstatus.count}</td>
															<td class="date align-middle white-space-nowrap" style="text-align: center;">
																<fmt:formatDate value="${vacList.vcatnRqstdt }" pattern="yyyy-MM-dd"/>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;">
																<c:if test="${vacList.vcatnCl eq '1'}">연차휴가</c:if>
																<c:if test="${vacList.vcatnCl eq '2'}">오전반차</c:if>
																<c:if test="${vacList.vcatnCl eq '3'}">오후반차</c:if>
																<c:if test="${vacList.vcatnCl eq '4'}">기타</c:if>
																<c:if test="${vacList.vcatnCl eq '5'}">공가</c:if>
																<c:if test="${vacList.vcatnCl eq '6'}">병가</c:if>
																<c:if test="${vacList.vcatnCl eq '7'}">경조휴가</c:if>
																<c:if test="${vacList.vcatnCl eq '8'}">출산휴가</c:if>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;" id="signupSelfEmpse">
																<c:if test="${vacList.vcatnSelfEmpse eq 'a'}">원무과</c:if>
																<c:if test="${vacList.vcatnSelfEmpse eq 'd'}">의사과</c:if>
																<c:if test="${vacList.vcatnSelfEmpse eq 'n'}">간호과</c:if>
																<c:if test="${vacList.vcatnSelfEmpse eq 't'}">치료과</c:if>
																<c:if test="${vacList.vcatnSelfEmpse eq 'm'}">관리자</c:if>
																<c:if test="${vacList.vcatnSelfEmpse eq 'k'}">병원장</c:if>
															</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;" id="signupSelfEmpnm">${vacList.vcatnSelfEmpnm }</td>
															<td class="start align-middle white-space-nowrap" style="text-align: center;">${vacList.vcatnBgndt }</td>
															<td class="end align-middle white-space-nowrap" style="text-align: center;">${vacList.vcatnEnddt }</td>
															<td class="align-middle white-space-nowrap" style="text-align: left; white-space: nowrap;
																overflow: hidden; text-overflow: ellipsis; max-width: 100px;">${vacList.vcatnResn }</td>
															<td class="align-middle white-space-nowrap" style="text-align: center;">${vacList.vcatnYrycCo }</td>
															<td class="status align-middle white-space-nowrap" style="text-align: center;">
																<c:if test="${vacList.vcatnConfmAt eq 'Y'}">
																	<button class="btn btn-success btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">승인</button>
																</c:if>
																<c:if test="${vacList.vcatnConfmAt eq 'N'}">
																	<button class="btn btn-danger btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">반려</button>
																</c:if>
																<c:if test="${vacList.vcatnConfmAt eq null}">
																	<c:if test="${vacList.vcatnConfmStep eq 1}">
																		<button class="btn btn-primary btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">1차승인</button>
																	</c:if>
																	<c:if test="${vacList.vcatnConfmStep eq 0}">
																		<button class="btn btn-primary btn-sm rounded-pill p-1" type="button" disabled="disabled" style="font-size: 12px;">대기</button>
																	</c:if>
																</c:if>
															</td>
															<td class="align-middle white-space-nowrap p-0">
																<div class="dropdown font-sans-serif position-static">
																	<button class="btn text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false">
																		<span class="fas fa-ellipsis-h fs--1"></span>
																	</button>
																	<div class="dropdown-menu dropdown-menu-end border py-2" style="min-width: 15px;">
																		<div class="">
																			<button class="dropdown-item vacSelfEmpInfoBtn" data-empno="${vacList.vcatnSelfEmpno }" value="" title="직원정보">직원상세</button>
																			<button class="dropdown-item vacFormDetailBtn" value="${vacList.vcatnCd }" title="휴가신청서">신청서</button>
																		</div>
																	</div>
																</div>
															</td>
														</tr>
														<c:set var="vacCount" value="${vacCount + 1}" />
													</c:forEach>
												</c:otherwise>
											</c:choose>
											<tr class="btn-reveal-trigger" style="background: #EDF2F9;">
												<td colspan="17" align="right" style="font-weight: bold; text-align: end;" onclick="event.stopPropagation()">총&nbsp;&nbsp;<span id="vacCount">${vacCount}</span> 건</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 휴가 신청 테이블 끝 -->
							
						</div>
						<!-- 휴가 전체 탭 끝 -->
						
					</div>
					
				</div>
				<!-- tab content 끝 -->
					
			</div>
			<!-- 탭 바디 끝 -->
			
		</div>
	</div>
	<!-- 휴가 끝 -->
	
	<!-- 캘린더 시작 -->
	<div class="col-4">
		<div class="card border border-secondary" >
			<div class="">
				<div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
					<div class="row" style="display: flex; justify-content: start;">
						<div class="col-auto">
							<h5 class="mb-0 ms-2 text-white" style="font-weight: bold;">달력</h5>
						</div>
					</div>
				</div>

				<!-- 캘린더 시작 -->
				<div style="display: flex; align-items: center; flex-direction: column;">
					<div class="card" style="width: 100%;  height: 754px;">
						<div class="card-body pb-0" style="background-color: aliceblue;">
							<div id="calendar"></div>
							<br/>
						</div>
					</div>
				</div>
				<!-- 캘린더 끝 -->
				
			</div>
		</div>
	</div>
	<!-- 캘린더 끝 -->
	
	
</div>



<!-- 휴가 상세 모달 시작 -->
<div class="modal fade" id="detail-vacation-modal" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg mt-3 p-2" role="document" style="width: 700px;">
		<div class="modal-content border-0">
			<div class="p-5" style="color: black;">
			    <table class="vacation-table">
			        <tr>
			            <td class="vacation-cell vacation-title" rowspan="3" colspan="2">휴가신청서</td>
			            <td class="vacation-cell vacation-day p-3" rowspan="3">
			                <p>결</p>
			                <p>재</p>
			            </td>
			            <td class="vacation-cell vacation-label">기안자</td>
			            <td class="vacation-cell vacation-label">부결</td>
			            <td class="vacation-cell vacation-label">전결</td>
			        </tr>
			        <tr style="height: 70px;">
			            <td class="vacation-cell vacation-label" id="vacNm1Form"></td>
			            <td class="vacation-cell vacation-label" id="vacRepForm"></td>
			            <td class="vacation-cell vacation-label" id="vacCofForm"></td>
			        </tr>
			        <tr style="height: 20px;">
			            <td class="vacation-cell vacation-label" id="writeDt3Form"></td>
			            <td class="vacation-cell vacation-label" id="vacRepDtForm"></td>
			            <td class="vacation-cell vacation-label" id="vacCofDtForm"></td>
			        </tr>
			        <tr style="height: 50px;">
			            <td class="vacation-cell vacation-space">소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;속</td>
			            <td class="vacation-cell vacation-content" id="vacDepForm" colspan="5"></td>
			        </tr>
			        <tr style="height: 50px;">
			            <td class="vacation-cell vacation-space">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위</td>
			            <td class="vacation-cell vacation-content" id="vacClsfForm" colspan="5"></td>
			        </tr>
			        <tr style="height: 50px;">
			            <td class="vacation-cell vacation-space">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
			            <td class="vacation-cell vacation-content" id="vacNmForm" colspan="5" style="height: 50px; text-align: center;"></td>
			        </tr>
			        <tr style="height: 50px;">
			            <td class="vacation-cell vacation-space">휴가구분</td>
			            <td class="vacation-cell vacation-content" id="vacClForm" colspan="5" style="font-size: 16px;"></td>
			        </tr>
			        <tr style="height: 50px;">
			            <td class="vacation-cell vacation-space">일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시</td>
			            <td class="vacation-cell vacation-content" id="vacDtForm" colspan="5"></td>
			        </tr>
			        <tr style="height: 100px;">
			            <td class="vacation-cell vacation-space">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유</td>
			            <td class="vacation-cell vacation-content" id="vacResonForm" colspan="5"></td>
			        </tr>
			        <tr style="height: 220px;">
			            <td class="vacation-cell vacation-content" colspan="6">
			            	<br>
			            	<br>
			                <p>위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</p>
			                <br>
			                <p>
			                <P id="writeDtForm" style="height: 40px; width: 300px; margin-left: 150px; text-align: center;"></p>
			                <div class="p-4" style="display: flex; justify-content: flex-end; align-items: center;">
			                	<div class="p-0" style="float: left; text-align: center;">성&nbsp;명&nbsp;:&nbsp;&nbsp;</div>
			                	<P class="p-0 m-0" id="writeNameForm" style="float: left; height: 30px; display: flex; width: 100px; align-items: center; justify-content: center;"></p>
			                	<p class="p-0 m-0" style="float: left;">&nbsp;&nbsp;&nbsp;(인) </p>
			                </div>
			            </td>
			        </tr>
			    </table>
				<div class="col-md-12">
					<div class="pt-3" align="right" id="">
						<button class="btn btn-secondary closeVacBtn" type="button" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 휴가 상세 모달 끝 -->

<!-- 반려사유 모달  탬플릿 시작 -->
<div class="modal fade" id="reject-vacation-modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 500px">
		<div class="modal-content position-relative">
			<div class="modal-body p-0">
				<div class="rounded-top-3 py-3 ps-4 pe-6 bg-body-tertiary">
					<h5 class="mb-1">휴가 반려</h5>
				</div>
				<div class="p-4 pb-0">
					<div class="mb-3 form-group">
						<label class="col-form-label" for="reason">반려사유</label>
						<textarea class="form-control" id="vcatnRjctResn" rows="3" placeholder="반려사유를 입력해 주세요."></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-light me-1" id="rejReset" type="reset">초기화</button>
				<button class="btn btn-danger me-1" type="button" id="rejectBtn">반려</button>
				<button class="btn btn-secondary recancelBtn" type="button" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 반려사유 모달 탬플릿 끝 -->

</body>

<link href="${pageContext.request.contextPath }/resources/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<script	src="${pageContext.request.contextPath }/resources/assets/js/flatpickr.js"></script>
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// 날짜 형식화(-)
function formatDate(date){
	var year = date.getFullYear();
	var month = String(date.getMonth() + 1).padStart(2, '0');
	var day = String(date.getDate()).padStart(2, '0');
	return year + "-" + month + "-" + day;
}

// 날짜 형식화(년월일)
function formatDate2(date){
	var year = date.getFullYear();
	var month = String(date.getMonth() + 1).padStart(2, '0');
	var day = String(date.getDate()).padStart(2, '0');
	return year + "년 " + month + "월 " + day + "일";
}

// 날짜 형식화(.)
function formatDate3(date){
	var year = date.getFullYear().toString().substring(2, 4);
	var month = String(date.getMonth() + 1).padStart(2, '0');
	var day = String(date.getDate()).padStart(2, '0');
	return year + "." + month + "." + day;
}

// 시간 형식화 함수
function formatTime(date){
	var hour = date.getHours().toString().padStart(2,'0');
	var minute = date.getMinutes().toString().padStart(2,'0');
	return hour + ":" + minute;
}

// datetimepicker 초기화 및 형식화 함수
function datetimepicker(date, id){
	$('#' + id).val(date);
	$('#' + id).flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i", 												// 날짜 및 시간 형식
	    defaultDate: date 														// 시작일 값 설정
	});
	return date;
}

// 한달간의 날짜
$(function() {
	var today = new Date();																// 현재시간
    var first = new Date(today.getFullYear(), today.getMonth());						// 첫날
    var last = new Date(today.getFullYear(), today.getMonth()+1, 0);					// 끝날
    var firstDay = formatDate(first);
    var lastDay = formatDate(last);
    
	$("#searchVacStart").attr("placeholder", firstDay);
	$("#searchVacEnd").attr("placeholder", lastDay);
});

$("#searchBtn").on('click',function(){
	var searchWord = $("#searchWord").val();
	if(searchWord == null || searchWord == ""){
		Swal.fire({
			title: "날짜 입력",
			text: "날짜를 입력해 주세요.",
			icon: 'error',
			confirmButtonColor: 'gray',
			confirmButtonText: '닫기'
		});
		return false;
	}
});

//필터 적용(버튼필터)
var html = "";
var vacationFlag = false;
var searchDep;

// 부서 필터
$(".filterBtn").click(function() {
// 	console.log($(this).val());
    html = "<input type='hidden' name='searchDep' id='searchDep' value='" + $(this).val() + "'>";
    vacationFlag = true;
	
    if(vacationFlag){
		html += "<input type='hidden' name='filterFlag' value='true'>";
    }
	$("#searchForm").append(html);
// 	console.log($("#searchForm").html());
	
	$("#searchForm").submit();
});

// 날짜 필터
$("#vacDateFilterBtn").on('click', function() {
	if($("#searchVacStart").val() == null || $("#searchVacStart").val() == ""){
		Swal.fire({
			title: "시작일 입력",
			text: "시작일을 입력하세요!",
			icon: 'error',
			confirmButtonColor: 'gray',
			confirmButtonText: '닫기'
		});
		return false;
	}
	if($("#searchVacEnd").val() == null || $("#searchVacEnd").val() == ""){
		Swal.fire({
			title: "종료일 입력",
			text: "종료일을 입력하세요!",
			icon: 'error',
			confirmButtonColor: 'gray',
			confirmButtonText: '닫기'
		});
		return false;
	}
	
	var vSS = new Date($("#searchVacStart").val());
	var vSE = new Date($("#searchVacEnd").val());
	var formatVSS = formatDate(vSS);
	var formatVSE = formatDate(vSE);
	
	if(vSS > vSE){
		Swal.fire({
		      title: "일자 변경 안내",
		      text: "종료일자는 시작일자보다 이후여야합니다.",
		      icon: 'error',
		      confirmButtonColor: 'gray',
		      confirmButtonText: '닫기'
		    });
	}else{
		html = "<input type='hidden' name='searchVacStart' value='" + formatVSS + "'>";
	    html += "<input type='hidden' name='searchVacEnd' value='" + formatVSE + "'>";
	    schedulerFlag = true;
		
	    if(schedulerFlag){
			html += "<input type='hidden' name='filterFlag' value='true'>";
	    }
// 	    console.log(html);
		$("#searchForm").append(html);
		
		$("#searchForm").submit();
	}
});

// 부서 한글로
function getEmpSe(se){
	var dep;
	if(se == "a"){
		dep = "원무과";
	}else if(se == "d"){
		dep = "의사";
	}else if(se == "n"){
		dep = "간호과";
	}else if(se == "t"){
		dep = "치료사";
	}else if(se == "k"){
		dep = "병원장";
	}else if(se == "m"){
		dep = "관리자";
	}
	return dep;
}

// 직원 직급 한글로
function getEmpClsf(clsf){
	var vacClsf;
	if(clsf == '0'){
		vacClsf = "과장";
	}else if(clsf == '1'){
		vacClsf = "일반";
	}
	return vacClsf;
}

// 직원 성별 한글로
function getEmpGender(gender){
	if(gender == 'M'){
		var gen = "남";
	}else if('F'){
		var gen = "여";
	}
	return gen;
}

// 휴가 분류 한글로
function getEmpCl(cl){
	var vacCl;
	if(cl == 1){
		vacCl = "연차휴가";
	}else if(cl == 2){
		vacCl = "오전반차";
	}else if(cl == 3){
		vacCl = "오후반차";
	}else if(cl == 4){
		vacCl = "기타";
	}else if(cl == 5){
		vacCl = "공가";
	}else if(cl == 6){
		vacCl = "병가";
	}else if(cl == 7){
		vacCl = "경조휴가";
	}else if(cl == 8){
		vacCl = "출산휴가";
	}
	return vacCl;
}

// 휴가 상세정보 폼
function setDetailForm(dep, vacClsf, vcatnSelfEmpnm, vacCl, startFormat, endFormat, day, vcatnResn, writeDt, writeDt3,
		vcatnConfmDt1, vcatnConfmDt2, vcatnRjctDt, vcatnConfmAt, representativeName, appButton, confirmerName,
		vcatnConfmStep, rejectorName, rejButton, loginEmpClsf, loginEmpSe, btnList, vcatnRjctEmpno){
	$("#vacDepForm").text(dep);							// 부서
	$("#vacClsfForm").text(vacClsf);
	$("#vacNmForm").text(vcatnSelfEmpnm);				// 휴가자 이름
	$("#writeNameForm").text(vcatnSelfEmpnm);			// 이름
	$("#vacNm1Form").text(vcatnSelfEmpnm);				// 이름
	$("#vacClForm").text(vacCl);						// 분류
	$("#vacDtForm").text(startFormat + " 부터 \u00a0" + endFormat + " 까지 \u00a0< " + (day + 1) + " 일간 >");	// 휴가일 
	$("#vacResonForm").text(vcatnResn);				// 휴가 사유
	$("#writeDtForm").text(writeDt);
	$("#writeDt3Form").text(writeDt3);
	
	var confmDt1 = new Date(vcatnConfmDt1);
	var con1 =  formatDate3(confmDt1);
	console.log("vcatnConfmDt1 >> " + vcatnConfmDt1);
	console.log("confmDt1 >> " + confmDt1);
	console.log("con1 >> " + con1);
	var confmDt2 = new Date(vcatnConfmDt2);
	var con2 = formatDate3(confmDt2);
	var rjctDt = new Date(vcatnRjctDt);
	var rjct =  formatDate3(rjctDt);
	
	if(vcatnConfmAt == 'Y' && vcatnConfmStep == '2'){								// 승인이면
		if(vcatnConfmDt1 != null && vcatnConfmDt1 != ""){
			$("#vacRepForm").append(representativeName  + "<br/>" + appButton);
			$("#vacRepDtForm").text(con1);
		}else{
			$("#vacRepForm").text("-");
			$("#vacRepDtForm").text("-");
		}
	
		$("#vacCofForm").append(confirmerName + "<br/>" + appButton);
		$("#vacCofDtForm").text(con2);
		
	}else if(vcatnConfmAt == 'N' && vcatnConfmStep == '2'){							// 반려면
		var se = (vcatnRjctEmpno).substring(0,1);
		if(se == 'm'){
			if(vcatnConfmDt1 != null && vcatnConfmDt1 != ""){
				$("#vacRepForm").append(representativeName + "<br/>" + appButton);
				$("#vacRepDtForm").text(con1);
			}else{
				$("#vacRepForm").text("-");
				$("#vacRepDtForm").text("-");
			}
			$("#vacCofForm").append(rejectorName  + "<br/>" + rejButton);
			$("#vacCofDtForm").text(rjct);
		}else{
			$("#vacRepForm").append(rejectorName + "<br/>" + rejButton);
			$("#vacRepDtForm").text(rjct);
			$("#vacCofForm").text("-");
			$("#vacCofDtForm").text("-");
		}
		
	}else if(vcatnConfmAt == null || vcatnConfmAt == ""){
		if(vcatnConfmStep == '0'){													// 대기면
			if(loginEmpClsf == '0'){
				if(loginEmpSe == 'm'){
					$("#vacRepForm").text("-");
					$("#vacRepDtForm").text("-");
					$("#vacCofForm").append(btnList);
					$("#vacCofDtForm").text(writeDt3);
				}else{
					$("#vacRepForm").append(btnList);
					$("#vacRepDtForm").text(writeDt3);
					$("#vacCofForm").text("");
					$("#vacCofDtForm").text("");
				}
			}
		}else if(vcatnConfmStep == '1'){											// 1차 승인이면
			if(loginEmpSe == 'm'){
				$("#vacRepForm").append(representativeName);
				$("#vacRepDtForm").text(con1);
				$("#vacCofForm").append(btnList);
				$("#vacCofDtForm").text(writeDt3);
			}else{
				$("#vacRepForm").append(representativeName + "<br/>" + appButton);
				$("#vacRepDtForm").text(con1);
				$("#vacCofForm").text("");
				$("#vacCofDtForm").text("");
			}
		}
	}
}

// 휴가 상세 정보
function getVacationDetail(result, formflag){
	var loginEmpNo = $("#loginEmpNo").val();						// 로그인 사번
	var loginEmpSe = $("#loginEmpSe").val();						// 로그인 부서
	var loginEmpClsf = $("#loginEmpClsf").val();					// 로그인 직위
	
	$.each(result, function(index, data) {
		if (result.length === 0) {
// 	        console.log("결과가 비어 있습니다");
	        return;
		}else if(index === 0){
			var vcatnCd = data.vcatnCd;
			var vcatnSelfEmpno = data.vcatnSelfEmpno;
			var vcatnSelfEmpse = data.vcatnSelfEmpse;
			var dep = getEmpSe(vcatnSelfEmpse);
			var vcatnSelfEmpclsf = data.vcatnSelfEmpclsf;	// 직위
			var vacClsf = getEmpClsf(vcatnSelfEmpclsf);
			var vcatnSelfEmpnm = data.vcatnSelfEmpnm;
			var vcatnCl = data.vcatnCl;						// 분류
			var vacCl = getEmpCl(vcatnCl);
			var start = data.vcatnBgndt;					// 시작일
			var startDate = new Date(start);
			var end = data.vcatnEnddt;						// 종료일
			var endDate = new Date(end);
			var day = (endDate - startDate) / (1000 * 60 * 60 * 24);	// 일수
			var startFormat1 = formatDate(startDate);
			var endFormat1 = formatDate(endDate);
			var startFormat = formatDate2(startDate);
			var endFormat = formatDate2(endDate);
			var startFormat3 = formatDate3(startDate);
			var endFormat3 = formatDate3(endDate);
			var rqstdt = data.vcatnRqstdt;					// 휴가 신청일
			var writeDay = new Date(rqstdt);
			var writeDt =  formatDate2(writeDay);
			var writeDt3 =  formatDate3(writeDay);
			var vcatnConfmDt1 = data.vcatnConfmDt1;
			var vcatnConfmDt2 = data.vcatnConfmDt2;
			var vcatnRjctDt = data.vcatnRjctDt;
			var vcatnConfmAt = data.vcatnConfmAt;
			var vcatnConfmStep = data.vcatnConfmStep;
			var vcatnYrycCo = data.vcatnYrycCo;
			var vcatnResn = data.vcatnResn;
			var representativeName = data.representativeName;
			var confirmerName = data.confirmerName;
			var vcatnRjctEmpno = data.vcatnRjctEmpno;
			var rejectorName = data.rejectorName;
			var vcatnRjctResn = data.vcatnRjctResn;
			
			var btnList = null;
			btnList = "<button class='btn btn-sm btn-primary rounded-pill me-1' type='button' data-appVacSelfEmpno='" + vcatnSelfEmpno + "' data-appVacCl='" + vcatnCl + "' data-appVacYrycCo='" + vcatnYrycCo + "' data-appVacCd='" + vcatnCd + "' value='" + vcatnSelfEmpse + "' id='approvalBtn'>승인</button>";
			btnList += "<button class='btn btn-sm btn-danger rounded-pill me-1' type='button' data-reVacCd='" + vcatnCd + "' value='" + vcatnSelfEmpse + "'  id='returnBtn'>반려</button>";
			var appButton = "<button class='btn btn-primary btn-sm rounded-pill p-1' type='button' disabled='disabled' style='font-size: 12px;'>승인</button>";
			var rejButton = "<button class='btn btn-danger btn-sm rounded-pill p-1' type='button' disabled='disabled' style='font-size: 12px;'>반려</button>";
			
			if(formflag){
				setDetailForm(dep, vacClsf, vcatnSelfEmpnm, vacCl, startFormat, endFormat, day, vcatnResn, writeDt, writeDt3,
						vcatnConfmDt1, vcatnConfmDt2, vcatnRjctDt, vcatnConfmAt, representativeName, appButton, confirmerName,
						vcatnConfmStep, rejectorName, rejButton, loginEmpClsf, loginEmpSe, btnList, vcatnRjctEmpno);
			}else{
				setDetailList(vcatnCd, vacCl, vcatnSelfEmpnm, dep, vacClsf, vcatnResn, startFormat1, endFormat1, vcatnRjctDt,
						vcatnYrycCo, representativeName, vcatnConfmDt1, confirmerName, vcatnConfmDt2, vcatnRjctEmpno, rejectorName, vcatnRjctResn);
			}
			
		}
	});
}

// 날짜 클릭시 상세정보
function setDetailList(vcatnCd, vacCl, vcatnSelfEmpnm, dep, vacClsf, vcatnResn, startFormat1, endFormat1, vcatnRjctDt,
		vcatnYrycCo, representativeName, vcatnConfmDt1, confirmerName, vcatnConfmDt2, rejectorName, vcatnRjctResn
		){
	
	var confmDt1 = new Date(vcatnConfmDt1);
	var con1 =  formatDate(confmDt1);
	var confmDt2 = new Date(vcatnConfmDt2);
	var con2 = formatDate(confmDt2);
	var rjctDt = new Date(vcatnRjctDt);
// 	console.log(vcatnRjctDt);
// 	console.log(rjctDt);
	var rjct =  formatDate(rjctDt);
// 	console.log(rjct);
	
	$("#vacCdList").text(vcatnCd);
	$("#vacFormDetailForm").val(vcatnCd);
	
	$("#vacClList").val(vacCl);
	$("#vacNmList").val(vcatnSelfEmpnm);
	$("#vacDepList").val(dep);
	$("#vacClsfList").val(vacClsf);
	$("#vacResonList").val(vcatnResn);
	$("#vacBgndtList").val(startFormat1);
	$("#vacEnddtList").val(endFormat1);
	$("#vacYrycCoList").val(vcatnYrycCo);
	
	if(representativeName != null && representativeName != ""){
		$("#vacReprsntEmpno").val(representativeName);
		$("#vacConfmDt1").val(con1);
	}else{
		$("#vacReprsntEmpno").val("");
		$("#vacConfmDt1").val("");
	}
	if(confirmerName != null && confirmerName != ""){
		$("#vacConfirmerEmpno").val(confirmerName);
		$("#vacConfmDt2").val(con2);
	}else{
		$("#vacConfirmerEmpno").val("");
		$("#vacConfmDt2").val("");
	}
	if(rejectorName != null && rejectorName != ""){
		$("#vacRjctEmpno").val(rejectorName);
		$("#vcaRjctDt").val(rjct);
		$("#vacReResonList").val(vcatnRjctResn);
	}else{
		$("#vacRjctEmpno").val("");
		$("#vcaRjctDt").val("");
		$("#vacReResonList").val("");
	}
}

// 시작일자 > 종료일자
function beginEnd(){
	var schdlBgngDt = $("#schdlBgngDt").val();
    var schdlEndDt = $("#schdlEndDt").val();
    
    if(schdlBgngDt >= schdlEndDt){
		Swal.fire({
			title: "일자 변경 안내",
			text: "종료일자는 시작일자보다 이후여야합니다.",
			icon: 'error',
			confirmButtonColor: 'gray',
			confirmButtonText: '닫기'
		});
    }
}

function closeReset(){
	$("#vacNm1Form").text('');
	$("#vacRepForm").text('');
	$("#vacCofForm").text('');
	$("#writeDt3Form").text('');
	$("#vacRepDtForm").text('');
	$("#vacCofDtForm").text('');
	$("#vacDepForm").text('');
	$("#vacClsfForm").text('');
	$("#vacNmForm").text('');
	$("#vacClForm").text('');
	$("#vacDtForm").text('');
	$("#vacResonForm").text('');
	$("#writeDtForm").text('');
	$("#writeNameForm").text('');
}

// 닫기 버튼 클릭시 초기화
$(".closeVacBtn").on("click", function(){
	closeReset();
});

// 반려사유 입력 닫기 버튼 클릭시 초기화
$(".recancelBtn").on('click', function(){
	$("#vcatnRjctResn").val('');
	$("#rejReset").show();
	$("#rejectBtn").show();
	$(".recancelBtn").text('취소');	
});

// 필터 초기화
$(function(){
	$(".allResetButton").on('click',function(){
		location.href = "/mediform/vacation/main";
	});
});

// 현재 리스트 수 출력
$(function(){
	var signupCount = $("#signupCount").text();
	var appCount = $("#appCount").text();
	var returnCount = $("#returnCount").text();
	var vacCount = $("#vacCount").text();

	$(".signupCount").text(signupCount);
	$(".appCount").text(appCount);
	$(".returnCount").text(returnCount);
	$(".vacCount").text(vacCount);
});


// 직원 정보 상세보기
function getEmployeeDetail(empNo){
	var empObj = {
			vcatnSelfEmpno: empNo
		};
		
	$.ajax({
 		type : "post",
		url : "/mediform/vacation/detail",
		data : JSON.stringify(empObj),
 		contentType : "application/json; charset=utf-8",
        beforeSend : function(xhr){            
            xhr.setRequestHeader(header,token);
        },
 		success : function(result) {
// 			console.log(result);
 			if (result.length === 0) {
//  		        console.log("결과가 비어 있습니다");
 		        return;
 		    }else{
				var vacationList = "";
				$.each(result, function(index, data) {
					if(index === 0){										// 직원 정보는 최신 데이터
						var se = data.employeeVO.empSe;						// 부서
						var dep = getEmpSe(se);
						$("#detailEmpSe").val(dep);													// 직원 부서

						var clsf = data.employeeVO.empClsf;										// 직위
						var vacClsf = getEmpClsf(clsf);
						$("#detailEmpClsf").val(vacClsf);											// 직원 권한
						
						$("#detailEmpNo").val(data.employeeVO.empNo);
						$("#detailEmpNm").val(data.employeeVO.empNm);
						
						var tel = data.employeeVO.empTelno;
						var telSet = tel.replace(/(\d{3})(\d{3,4})(\d{4})/, "$1-$2-$3");
						$("#detailEmpTelno").val(telSet);
						
						var year = data.employeeVO.empRrno2.toString().substring(0,1);
						if(year === '1' || year === '2'){
							var birthY = 19;
						}else if(year === '3' || year === '4'){
							var birthY = 20;
						}
						var birthYMD = data.employeeVO.empRrno1.toString();
						var birth1 = birthYMD.substring(0,2);
						var birth2 = birthYMD.substring(2,4);
						var birth3 = birthYMD.substring(4,6);
						var birth = (birthY + '' + birth1 + '.' + birth2 + "." + birth3);
						$("#detailEmpRrno1").val(birth);
						
						var gender = data.employeeVO.empSexdstn;							// 성별
						var gen = getEmpGender(gender);
						$("#detailEmpSexdstn").val(gen);
						
						var enterDt = data.employeeVO.empEncpn;	// 입사일
						var dateEnterDt = new Date(enterDt);
						var Edt = formatDate3(dateEnterDt);
						$("#detailEmpEncpn").val(Edt);
						
						var retireDt = data.employeeVO.empRetire;	// 퇴사일
// 						console.log("퇴사일: " + retireDt)
						if(retireDt != null && retireDt != ""){
							var dateRetireDt = new Date(retireDt);
							var Rdt = formatDate3(dateRetireDt);
							$("#detailEmpRetire").val(Rdt);
						}else{
							$("#detailEmpRetire").val("-");
						}
						$("#detailEmpYrycUse").val(data.employeeVO.empYrycUse);
						$("#detailEmpYrycRemndr").val(data.employeeVO.empYrycRemndr);
						$("#detailEmpOffhodUse").val(data.employeeVO.empOffhodUse);
						$("#detailEmpOffhodRemndr").val(data.employeeVO.empOffhodRemndr);
						$("#detailEmpSicknsUse").val(data.employeeVO.empSicknsUse);
						$("#detailEmpSicknsRemndr").val(data.employeeVO.empSicknsRemndr);
					}
					
					var vcatnCd = data.vcatnCd;
					if(vcatnCd != null && vcatnCd != ""){
						var vcatnRqstdt = data.vcatnRqstdt;
// 						console.log(vcatnRqstdt);
						var date = new Date(vcatnRqstdt);
						var signDt = formatDate3(date);
						var itemList;
						itemList += "<tr><td><button class='btn btn-sm btn-falcon-default itemListVcatnCd' type='button' value='" + vcatnCd + "'>" + signDt + "</button></td></tr>";
						vacationList += itemList;
// 						console.log(itemList);
// 						console.log("vcatnCd>>>" + vcatnCd);
						
					}else{
						vacationList = "휴가 신청내역이 없습니다."
					}
					$("#empRqstdt").empty().append(vacationList);
				});
 		    }
 		},
 		errors: function(){
//  			console.log("에러발생");
 		}
 	});
}

// 상세
$(function(){
	var cd = null;			// 휴가 코드
	var name = null;		// 휴가 신청자 이름
	var dropflag = false;
	var reReason = null;
	
	$("#searchEmpWord").focusout(function(){
		setTimeout(() => {
			$("#empDropList").hide();
		}, 100);
	});
	
	$("#searchEmpWord").on('keyup',function(event){
		$("#empDropList").show();
		$("#empDropList").css({'position': 'absolute', 'inset': '0px auto auto 0px',
							'margin': '0px', 'transform': 'translate(84px, 39px)'});
		if(event.which == 13){	// enter 일때
			event.preventDefault();
			var empNo = $(".vacSelfEmpInfo").eq(0).data('empno');
			if(empNo != null && empNo != ""){
// 				console.log(empNo);
				getEmployeeDetail(empNo);
			}
			$("#empDropList").hide();
		}
		
		var searchEmpWord = $("#searchEmpWord").val();
		$.ajax({
			type : "post",
			url  : "/mediform/vacation/detail/emp",
			data : searchEmpWord,
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(result){
// 				console.log(result);
				var InfoList = "";
				if(result.length === 0){
					InfoList = "<tr><td colspan='5' class='white-space-nowrap' style='text-align: center;'>조회된 직원이 존재하지 않습니다.</td></tr>";
				}else{
					$.each(result, function(index, data){
						var empNo = data.employeeVO.empNo;
						var empNm = data.employeeVO.empNm;
						var empSe = data.employeeVO.empSe;
						var se = getEmpSe(empSe);
						var empClsf = data.employeeVO.empClsf;
// 						console.log(empClsf);
						var clsf = getEmpClsf(empClsf);
// 						console.log(clsf);
						var birthYMD = data.employeeVO.empRrno1.toString();
						var birth1 = birthYMD.substring(0,2);
						var birth2 = birthYMD.substring(2,4);
						var birth3 = birthYMD.substring(4,6);
						var birth = (birth1 + '.' + birth2 + "." + birth3);
						
						var itemList;
						itemList +=	"<tr class='vacSelfEmpInfoBtn vacSelfEmpInfo' data-empno='" + empNo + "'>";
						itemList += "<td class='white-space-nowrap'>" + empNo + "</td>";
						itemList += "<td class='white-space-nowrap'>" + empNm + "</td>";
						itemList += "<td class='white-space-nowrap'>" + se + "</td>";
						itemList += "<td class='white-space-nowrap'>" + clsf + "</td>";
						itemList += "<td class='white-space-nowrap'>" + birth + "</td></tr>";
							
						InfoList += itemList;
					});
				}
				$("#empDrop").empty().append(InfoList);
			},
			errors : function(errors){
// 				console.log("에러 : " + errors);
			}
		});
	});
	
	// 직원 정보 상세보기
	$(document).on('click', '.vacSelfEmpInfoBtn', function() {
		var empNo = $(this).data('empno');
// 		console.log(empNo);
		
		getEmployeeDetail(empNo);
	});
	
	// 휴가폼 상세보기
	$(".vacFormDetailBtn").on('click',function(){
		var vacCd = $(this).val();
// 		console.log(vacCd);
		
		if(vacCd != null && vacCd != ""){
			vcatnCdObj = {
				vcatnCd: vacCd
			};
			
			$.ajax({
		 		type : "post",
				url : "/mediform/vacation/detail",
				data : JSON.stringify(vcatnCdObj),
		 		contentType : "application/json; charset=utf-8",
		        beforeSend : function(xhr){            
		            xhr.setRequestHeader(header,token);
		        },
		 		success : function(result) {
// 					console.log(result);
					$("#detail-vacation-modal").modal('show');				// 모달 띄우기
					closeReset();
					var formflag = true;
					getVacationDetail(result, formflag);
		 		}
		 	});
		}
	});
		
	
	// 반려사유 버튼 클릭
	$(".vacRjctResnBtn").on('click',function(){
		var vacCd = $(this).val();
		
		vcatnCdObj = {
			vcatnCd: vacCd
		};
		
		$.ajax({
	 		type : "post",
			url : "/mediform/vacation/detail",
			data : JSON.stringify(vcatnCdObj),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	 		success : function(result) {
// 				console.log(result);
				$("#reject-vacation-modal").modal('show');				// 모달 띄우기
				$("#rejReset").hide();
				$("#rejectBtn").hide();
				$(".recancelBtn").text('닫기');
				$.each(result, function(index, data) {
					if (index === 0) {
						$("#vcatnRjctResn").val(data.vcatnRjctResn);
					}
				});
	 		}
	 	});
	});
	
	// 날짜 클릭 상세보기
	$(document).on('click', '.itemListVcatnCd', function() {
		var vacCd = $(this).val();
// 		console.log(vacCd);
		
		vcatnCdObj = {
			vcatnCd: vacCd
		};
		
		$.ajax({
	 		type : "post",
			url : "/mediform/vacation/detail",
			data : JSON.stringify(vcatnCdObj),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(result){
// 				console.log(result);
				var vacDetailList;
				getVacationDetail(result);
	        },
	        errors: function(){
	        	
	        }
		});
	});
	
	// 승인 버튼 클릭
	$(document).on('click', '#approvalBtn', function() {
		var loginEmpNo = $("#loginEmpNo").val();						// 로그인 사번
		var loginEmpSe = $("#loginEmpSe").val();						// 로그인 부서
		var loginEmpClsf = $("#loginEmpClsf").val();					// 로그인 직위
		
		var se = $(this).val();
		var cd = $(this).attr('data-appVacCd');
		var cl = $(this).attr('data-appVacCl');
		var yrycCo = $(this).attr('data-appVacYrycCo');
		var selfempNo = $(this).attr('data-appVacSelfEmpno');
// 		console.log(cl);
// 		console.log(yrycCo);
		
		var signObj;
		if(loginEmpClsf == '0'){										// 직위 == 과장
			if(loginEmpSe == 'm'){										// 승인자 == 매니저
				signObj = {
					vcatnSelfEmpno: selfempNo,
					vcatnCl : cl,
					vcatnYrycCo : yrycCo,
					vcatnCd: cd,
					vcatnConfirmerEmpno: loginEmpNo						// 최종 승인자 셋팅
				};
			}else{														// 매니저 제외
				if(se == loginEmpSe){									// 같은 부서
					signObj = {
						
						vcatnCd: cd,
						vcatnReprsntEmpno: loginEmpNo					// 1차 승인자 셋팅
					};
				}else{
					Swal.fire({
						title: '승인 권한 안내',
						text: "승인 권한이 없습니다.",
						icon: 'error',
						confirmButtonColor: 'gray',
						confirmButtonText: '닫기'
					});
					return;
				}
			}
		
			Swal.fire({
				icon: 'info',
				title: '승인 처리',
				text: '승인 처리 하시겠습니까?',
				confirmButtonText: '확인',
				confirmButtonColor: 'midnightblue'
			}).then(result => {
				if(result.isConfirmed){
					
					$.ajax({
				 		type : "post",
						url : "/mediform/vacation/update/approval",
						data : JSON.stringify(signObj),
				 		contentType : "application/json; charset=utf-8",
				        beforeSend : function(xhr){            
				            xhr.setRequestHeader(header,token);
				        },
				 		success : function(result) {
				 			if(result == "OK"){
					 			Swal.fire({
									icon: 'success',
									title: '승인 처리 성공',
									text: '정상적으로 승인되었습니다.',
									confirmButtonText: '확인',
									confirmButtonColor: 'midnightblue'
								}).then(result => {
									if(result.isConfirmed){
										location.reload();
									}else{
										return;
									}
								});
				 			}else{
				 				Swal.fire({
									icon: 'error',
									title: '승인 처리 실패',
									text: '승인처리에 실패하였습니다. 다시 시도해주세요.',
									confirmButtonColor: 'gray',
									confirmButtonText: '닫기'
								}).then(result => {
									if(result.isConfirmed){
										location.reload();
									}else{
										return;
									}
								});
				 			}
				 		}
				 	});
					
				}else{
					return;
				}
			});
			
		}else{
			Swal.fire({
				title: '승인 권한 안내',
				text: "승인 권한이 없습니다.",
				icon: 'error',
				confirmButtonColor: 'gray',
				confirmButtonText: '닫기'
			});
			return;
		}
// 		console.log(signObj);
	});

	// 반려 버튼 클릭
	$(document).on('click', '#returnBtn', function() {
		var loginEmpNo = $("#loginEmpNo").val();						// 로그인 사번
		var loginEmpSe = $("#loginEmpSe").val();						// 로그인 부서
		var loginEmpClsf = $("#loginEmpClsf").val();					// 로그인 직위
// 		console.log(loginEmpNo);
// 		console.log(loginEmpSe);
// 		console.log(loginEmpClsf);
		
		var se = $(this).val();
		var cd = $(this).attr('data-reVacCd');
// 		console.log(se);
// 		console.log(cd);
		
		if(loginEmpClsf == '0'){										// 직위 == 과장
			if(loginEmpSe == 'm' || se == loginEmpSe){					// 관리자 또는 같은 부서
				$("#reject-vacation-modal").modal('show');
			
				$("#rejectBtn").on('click',function(){
					var vcatnRjctResn = $("#vcatnRjctResn").val();					// 반려 사유
					if(vcatnRjctResn == null || vcatnRjctResn == ""){
						Swal.fire({
							title: "반려 사유 입력",
							text: "반려 사유를 입력해주세요!",
							icon: 'error',
							confirmButtonColor: 'gray',
							confirmButtonText: '닫기'
						});
						return false;
					}
					
					var loginEmpNo = $("#loginEmpNo").val();						// 로그인 사번
					var loginEmpSe = $("#loginEmpSe").val();						// 로그인 부서
					var loginEmpClsf = $("#loginEmpClsf").val();					// 로그인 직위
					
					var signObj;
					
					signObj = {
						vcatnCd: cd,
						vcatnRjctEmpno: loginEmpNo,							// 반려자 셋팅
						vcatnRjctResn: vcatnRjctResn
					};
// 					console.log(signObj);
					
					Swal.fire({
						icon: 'info',
						title: '반려 처리',
						text: '반려처리 하시겠습니까?',
						confirmButtonText: '확인',
						confirmButtonColor: 'midnightblue'
					}).then(result => {
						if(result.isConfirmed){
							
							$.ajax({
						 		type : "post",
								url : "/mediform/vacation/update/reject",
								data : JSON.stringify(signObj),
						 		contentType : "application/json; charset=utf-8",
						        beforeSend : function(xhr){            
						            xhr.setRequestHeader(header,token);
						        },
						 		success : function(result) {
						 			if(result == "OK"){
							 			Swal.fire({
											icon: 'success',
											title: '반려 처리 성공',
											text: '정상적으로 반려되었습니다.',
											confirmButtonText: '확인',
											confirmButtonColor: 'midnightblue'
										}).then(result => {
											if(result.isConfirmed){
												location.reload();
											}else{
												return;
											}
										});
						 			}else{
						 				Swal.fire({
											icon: 'error',
											title: '반려 처리 실패',
											text: '반려처리에 실패하였습니다. 다시 시도해주세요.',
											confirmButtonColor: 'gray',
											confirmButtonText: '닫기'
										}).then(result => {
											if(result.isConfirmed){
												location.reload();
											}else{
												return;
											}
										});
						 			}
						 		}
						 	});
							
						}else{
							return;
						}
					});
					
				});
			
			}else{
				Swal.fire({
					title: '승인 권한 안내',
					text: "승인 권한이 없습니다.",
					icon: 'error',
					confirmButtonColor: 'gray',
					confirmButtonText: '닫기'
				});
				return;
			}
		}else{
			Swal.fire({
				title: '승인 권한 안내',
				text: "승인 권한이 없습니다.",
				icon: 'error',
				confirmButtonColor: 'gray',
				confirmButtonText: '닫기'
			});
			return;
		}
	});
});


</script>
</html>