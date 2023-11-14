<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	border: 1px #ddd solid
}
</style>
<meta charset="UTF-8">
<title>CLANDER</title>
</head>
<body>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// 수정 flag
var updateFlag = $("#updateFlag").val();
console.log("처음 updateFlag: " + updateFlag);

$(function(){
	$.ajax({
		type: "GET",
		url: "/mediform/calender/list",
		dataType: 'json',
		contentType: "application/json; charset=utf-8",
		beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(param) {
        	console.log(param);
        	
        	// 캘린더 생성(초기화)
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
    			editable : true, 				// 수정 가능
    			selectable : true, 				// 달력 일자 드래그 설정 가능
    			droppable : true, 				// 드래그 앤 드롭
    			events : param,
    			locale : 'ko', 					// 한국어 설정
    			select: function(info){			// 날짜 클릭 및 드래그로 이벤트(일정 등록) 생성
    				clickNewModal(info);
    			},
    			eventClick: function(info){		// 이벤트 클릭시 상세보기 & 수정 & 삭제
    				updateFlag = "T";
    				console.log("eventClick updateFlag: " + updateFlag);
    				detailModal(info, updateFlag);
    			},
    			eventDrop: function(info){		// 드래그 앤 드랍 수정
    				updateFlag = "T";
    				console.log("eventDrop updateFlag: " + updateFlag);
    				dragDropUpdate(info, updateFlag);
            	},
//             	eventResize: function(info){	// 이벤트 사이즈 조절 가능
//             		updateFlag = "T";
//     				console.log("eventResize updateFlag: " + updateFlag);
//             		eventResizeUpdate(info, updateFlag);
//             	}
            	
    		});
    		calendar.render();
    		
        }	// success
	});
});
</script>
<div style="display: flex; align-items: center; flex-direction: column;">
	<div class="card" style="width: 100%">
		<div class="card-body" style="background-color: aliceblue;">
			<div id="calendar"></div>
			<br/>
		</div>
	</div>
</div>
<!-- modal 시작 -->
<div class="modal fade" id="new-event-modal" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0">
			<div class="position-absolute top-0 end-0 mt-3 me-3 z-1">
				<button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base closeCalenderBtn" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-0">
				<div class="rounded-top-3 bg-body-tertiary py-3 ps-4 pe-6">
					<h4 class="mb-1" id="textCalenderTitle">일정 추가</h4>
				</div>
				<div class="p-4">
					<input type="hidden" value="F" id="updateFlag"/>
					<form action="/mediform/calender/insert" method="POST" class="row g-3" id="insertCalenderForm">
						<input type="hidden" name="schdlAllDay" value="" id="allDay"/>
						<input type="hidden" name="schdlCd" value="" id="schdlCd"/>
						<div class="col-md-6" id="hiddenPstgDt" style="display: none;">
							<label class="form-label" for="pstgDt">작성날짜</label>
							<input class="form-control" type="text" id="pstgDt" name="pstgDt" value="" disabled="disabled"/>
						</div>
						<div class="col-md-6" id="hiddenSchdlUpdDt" style="display: none;">
							<label class="form-label" for="schdlUpdDt">수정날짜</label>
							<input class="form-control" type="text" id="schdlUpdDt" name="schdlUpdDt" value="" disabled="disabled"/>
						</div>
						<div class="col-md-12">
							<label class="form-label" for="schdlNm">일정명</label>
							<input class="form-control" id="schdlNm" name="schdlNm" type="text" placeholder="일정명을 입력하세요." required="required"/>
						</div>
						<div class="input-group">
							<div class="col-md-5">
								<div class="form-check form-switch">
									<input class="form-check-input" id="schdlAllDay" type="checkbox" value=""/> 
									<label class="form-label" for="schdlAllDay">하루종일</label>
								</div>
							</div>
							<div class="col-md-1">
								<label class="form-label" for="schdlColor">색상</label>
							</div>
							<div class="col-md-6">
								<select class="form-select schdlColor" id="schdlColor" name="schdlColor" aria-label="Default select example">
									<option class="bg-light" value="bg-light" selected="selected">White</option>
									<option class="bg-primary-subtle" value="bg-primary-subtle">Blue</option>
									<option class="bg-secondary-subtle" value="bg-secondary-subtle">Gray</option>
									<option class="bg-success-subtle" value="bg-success-subtle">Green</option>
									<option class="bg-info-subtle" value="bg-info-subtle">SkyBlue</option>
									<option class="bg-warning-subtle" value="bg-warning-subtle">Orange</option>
									<option class="bg-danger-subtle" value="bg-danger-subtle">Red</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<label class="form-label" for="schdlBgngDt">시작일</label>
							<input class="form-control datetimepicker" id="schdlBgngDt" name="schdlBgngDt" type="text" data-options='{"static":"true","enableTime":"true","format":"YYYY-MM-DD h:m"}' placeholder="YYYY-MM-DD hh:mm" required="required"/>
						</div>
						<div class="col-md-6">
							<label class="form-label" for="schdlEndDt">종료일</label>
							<input class="form-control datetimepicker" id="schdlEndDt" name="schdlEndDt" type="text" data-options='{"static":"true","enableTime":"true","format":"YYYY-MM-DD h:m"}' placeholder="YYYY-MM-DD hh:mm" required="required"/>
						</div>
						<div class="col-md-12">
							<label class="form-label" for="schdlCn">일정 내용</label>
							<textarea class="form-control" id="schdlCn" name="schdlCn" rows="3" placeholder="메모사항"></textarea>
						</div>
						<div class="col-md-12">
							<div align="right">
								<button class="btn btn-light btn-sm" type="reset" id="resetCalenderBtn">초기화</button>
								<button class="btn btn-primary btn-sm" type="button" id="insertCalenderBtn">등록</button>
								<button class="btn btn-secondary btn-sm closeCalenderBtn" type="button" data-bs-dismiss="modal" id="closeCalenderBtn">닫기</button>
							</div>
						</div>
						<sec:csrfInput /> 
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- modal 끝 -->

</body>
<link href="${pageContext.request.contextPath }/resources/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<script	src="${pageContext.request.contextPath }/resources/assets/js/flatpickr.js"></script>
<script type="text/javascript">


//하루종일
function allDayFunction(start, end){
	$("#schdlAllDay").on("change",function(){
		var schdlBgngDt = $("#schdlBgngDt");
		var schdlEndDt = $("#schdlEndDt");
		
		if($(this).is(":checked")){
			schdlBgngDt.readOnly = true;
			schdlBgngDt.val((start.toString() + ' 00:00'));
			schdlEndDt.readOnly = true;
			schdlEndDt.val((end.toString() + ' 23:59'));
			$(this).val("true");
		}else{
			schdlBgngDt.readOnly = false;
			schdlBgngDt.val("");
			schdlEndDt.readOnly = false;
			schdlEndDt.val("");
		}
	});
}

// 일정 등록(날짜 클릭시)
function clickNewModal(info){
	console.log("수정이 아닐때 updateFlag : " + updateFlag);
	$("#textCalenderTitle").html("일정 추가");
	$("#insertCalenderBtn").html("등록");
	$("#resetCalenderBtn").html("초기화");
	$("#resetCalenderBtn").type = "reset";
	$("#resetCalenderBtn").removeClass("btn btn-danger btn-sm").addClass("btn btn-light btn-sm");
	
	$("#insertCalenderForm")[0].reset();
	$('#new-event-modal').modal('show');
    
	var start = info.startStr; 											// 선택된 시작 날짜
	var eventEnd1 = new Date(info.endStr); 								// 선택된 종료 날짜(+1)
	var eventEnd = new Date(eventEnd1);
	eventEnd.setDate(eventEnd1.getDate() - 1);							// 종료일자 - 1일
	var end = eventEnd.toISOString().substring(0,10);					// allDay 함수로 넘길 종료일
	
	var currentHM = new Date();											// 시스템 시간
	var hour = currentHM.getHours().toString().padStart(2,'0');
	var minute = currentHM.getMinutes().toString().padStart(2,'0');
	var currentTime = hour + ":" + minute; 								// 현재 시간

	var startSet = start + ' ' + currentTime;							// 시작날짜 셋팅
	var endSet = eventEnd.toISOString().substring(0,10) + ' ' + currentTime;// 종료날짜 셋팅

	$("#schdlBgngDt").val(startSet);
	$("#schdlBgngDt").flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i", 			// 날짜 및 시간 형식
	    defaultDate: startSet 				// 시작일 값 설정
	});
	
	$("#schdlEndDt").val(endSet);
	$("#schdlEndDt").flatpickr({
	    enableTime: true,
	    dateFormat: "Y-m-d H:i", 			// 날짜 및 시간 형식
	    defaultDate: endSet 				// 시작일 값 설정
	});
	
	allDayFunction(start, end);
	
	$("#insertCalenderBtn").on("click",function(){
	    var schdlBgngDt = $("#schdlBgngDt").val();
	    var schdlEndDt = $("#schdlEndDt").val();
	    
	    // 시작일자 > 종료일자 일때
	    if(schdlBgngDt >= schdlEndDt){
	    	alert("종료일자는 시작일자보다 이후여야합니다.");
	    	return false;
	    }

		$("#allDay").val("false");
	    if($("#schdlAllDay").is(":checked")){
	    	$("#allDay").val("true");
	    }
	    
	    $("#insertCalenderForm").submit();
	});
}

// 닫기 버튼 클릭시
$(".closeCalenderBtn").on("click", function(){
	updateFlag = "F";
	console.log("닫기 버튼 클릭 updateFlag : " + updateFlag);
});

// 일정 상세보기 & 수정 & 삭제
function detailModal(info, updateFlag){
	console.log("일정 상세보기 & 수정 & 삭제 updateFlag: " + updateFlag);
	if(updateFlag == "T"){											// updateFlag가 "T"일때만 수정 실행
		var id = info.event.id;
		var pstgDt = info.event.extendedProps.pstgDt;
		var schdlUpdDt = info.event.extendedProps.schdlUpdDt;
		var title = info.event.title;
		var className = info.event.classNames;
		var allDay = info.event.extendedProps.schdlAllDay;
		var description = info.event.extendedProps.description;
		
		var start = info.event.start;								// 날짜 시작일
		var yearStart = start.getFullYear();
		var monthStart = (start.getMonth() + 1).toString().padStart(2,'0');
		var dayStart = start.getDate().toString().padStart(2,'0');
		var hoursStart = start.getHours().toString().padStart(2,'0');
		var minutesStart = start.getMinutes().toString().padStart(2,'0');
		var startFormat = yearStart + '-' + monthStart + '-' + dayStart + ' ' + hoursStart + ':' + minutesStart;		
		
		var end = info.event.end;								// 날짜 종료일
		var yearEnd = end.getFullYear();
		var monthEnd = (end.getMonth() + 1).toString().padStart(2,'0');
		var dayEnd = end.getDate().toString().padStart(2,'0');
		var hoursEnd = end.getHours().toString().padStart(2,'0');
		var minutesEnd = end.getMinutes().toString().padStart(2,'0');
		var endFormat = yearEnd + '-' + monthEnd + '-' + dayEnd + ' ' + hoursEnd + ':' + minutesEnd;		
		
		$("#new-event-modal").modal('show');
		$("#textCalenderTitle").html("일정 상세");
		$("#hiddenPstgDt").show();
		$("#hiddenSchdlUpdDt").show();
	    $("#resetBtn").hide();
		
		$("#schdlCd").val(id);
		$("#pstgDt").val(pstgDt);
		$("#schdlUpdDt").val(schdlUpdDt);
		$("#schdlNm").val(title);
		$("#schdlCn").val(description);
		$(".schdlColor").val(className).change();

		if(allDay == "true") {
			$("#schdlAllDay").prop("checked", true);
		    $("#allDay").val("true");
		} else {
			$("#schdlAllDay").prop("checked", false);
		    $("#allDay").val("false");
		}
		
		// 하루종일 날짜
		var startAllDay = new Date(start).toISOString().substring(0, 10);
		var endAllDay = new Date(end).toISOString().substring(0, 10);
		allDayFunction(startAllDay, endAllDay);

		$("#schdlBgngDt").val(startFormat);
		$("#schdlBgngDt").flatpickr({
		    enableTime: true,
		    dateFormat: "Y-m-d H:i", 				// 날짜 및 시간 형식
		    defaultDate: startFormat 				// 시작일 값 설정
		});
		
		$("#schdlEndDt").val(endFormat);
		$("#schdlEndDt").flatpickr({
		    enableTime: true,
		    dateFormat: "Y-m-d H:i", 				// 날짜 및 시간 형식
		    defaultDate: endFormat 					// 시작일 값 설정
		});
		
	    $("#insertCalenderBtn").html("수정");
	    // 수정 버튼
	    $("#insertCalenderBtn").on("click",function(){
	    	var schdlBgngDt = $("#schdlBgngDt").val();
	 	    var schdlEndDt = $("#schdlEndDt").val();
	 	    
	 	    // 시작일자 > 종료일자 일때
	 	    if(schdlBgngDt >= schdlEndDt){
	 	    	alert("종료일자는 시작일자보다 이후여야합니다.");
	 	    	return false;
	 	    }
	    	
	    	$("#allDay").val("false");
		    if($("#schdlAllDay").is(":checked")){
		    	$("#allDay").val("true");
		    }
		    
	    	var btnText = $(this).text();
	    	if(btnText == "수정"){
		    	if(confirm("'" + title +"'을 수정하시겠습니까?")){
					var insertForm = $("#insertCalenderForm");
					insertForm.attr("action", "/mediform/calender/update");	
					insertForm.submit();
		    	}else{
		    		$("#new-event-modal").modal('hide');
					alert("수정을 취소하였습니다.");
		    	}
	    	}else{
	    		alert("수정을 진행할 수 없습니다. 다시 시도해주세요!");
	    		return false;
	    	}
	    	
	    	updateFlag = "F";
			console.log("수정 updateFlag : " + updateFlag);
	    });
	    
	    $("#resetCalenderBtn").html("삭제");
	    $("#resetCalenderBtn").type = "button";
	    $("#resetCalenderBtn").removeClass("btn btn-light btn-sm").addClass("btn btn-danger btn-sm");
	    
	    // 삭제 버튼
		$("#resetCalenderBtn").on("click",function(){
			var btnText = $(this).text();
	    	
	    	if(btnText == "삭제"){
				if(confirm("'" + info.event.title +"'을 삭제하시겠습니까?")){
					
					var insertForm = $("#insertCalenderForm");
					insertForm.attr("action", "/mediform/calender/delete");
					insertForm.submit();
				}else{
					$("#new-event-modal").modal('hide');
					alert("삭제를 취소하였습니다.");
				}
	    	}else{
	    		alert("삭제를 진행할 수 없습니다. 다시 시도해주세요!");
	    		return false;
	    	}
			updateFlag = "F";
			console.log("삭제 updateFlag : " + updateFlag);
		});
	    
	}else{ // 일정 상세보기 & 수정 & 삭제 updateFlag 'F'일때
		console.log("일정 상세보기 & 수정 & 삭제 updateFlag 'F'일때: " + updateFlag);
		alert("다시 시도해주세요.");
		return false;
		$("#textCalenderTitle").html("일정 추가");
		$("#insertCalenderBtn").html("등록");
		$("#resetCalenderBtn").html("초기화");
		$("#resetCalenderBtn").type = "reset";
		$("#resetCalenderBtn").removeClass("btn btn-danger btn-sm").addClass("btn btn-light btn-sm");
	}
}

// 드래그 앤 드롭 기능
function dragDropUpdate(info, updateFlag) {
	console.log("드래그 앤 드롭 기능 updateFlag : " + updateFlag);
	if(updateFlag == "T"){					// updateFlag T일때
		var id = info.event.id;
		var title = info.event.title;
		var description = info.event.extendedProps.description;
		var pstgDt = info.event.extendedProps.pstgDt;
		var className = info.event.classNames;
		var allDay = info.event.extendedProps.schdlAllDay;
		
		$("#schdlCd").val(id);
		$("#schdlNm").val(title);
		$("#schdlCn").val(description);
		$("#pstgDt").val(pstgDt);
		$(".schdlColor").val(className).change();
		
		$("#allDay").val("false");
	    if(allDay == "true"){
	    	$("#allDay").val("true");
	    }
		
// 		var oldStart = info.oldEvent.start;		// 이전 시작 시간
// 		var oldEnd = info.oldEvent.end;			// 이전 종료 시간

		// 형식에 맞춘 날짜
		var start = info.event.start;								// 날짜 시작일
		var yearStart = start.getFullYear();
		var monthStart = (start.getMonth() + 1).toString().padStart(2,'0');
		var dayStart = start.getDate().toString().padStart(2,'0');
		var hoursStart = start.getHours().toString().padStart(2,'0');
		var minutesStart = start.getMinutes().toString().padStart(2,'0');
		var startFormat = yearStart + '-' + monthStart + '-' + dayStart + ' ' + hoursStart + ':' + minutesStart;		
		
		var end = info.event.end;								// 날짜 종료일
		var yearEnd = end.getFullYear();
		var monthEnd = (end.getMonth() + 1).toString().padStart(2,'0');
		var dayEnd = end.getDate().toString().padStart(2,'0');
		var hoursEnd = end.getHours().toString().padStart(2,'0');
		var minutesEnd = end.getMinutes().toString().padStart(2,'0');
		var endFormat = yearEnd + '-' + monthEnd + '-' + dayEnd + ' ' + hoursEnd + ':' + minutesEnd;
		
		console.log(startFormat);
		console.log(endFormat);
		$("#schdlBgngDt").val(startFormat);
 	    $("#schdlEndDt").val(endFormat);
		
	    if(confirm("'" + title +"'을 수정하시겠습니까?")){
			var insertForm = $("#insertCalenderForm");
			insertForm.attr("action", "/mediform/calender/update");	
			insertForm.submit();
		}else{
    		$("#new-event-modal").modal('hide');
			alert("수정을 취소하였습니다.");
    	}
		
		updateFlag = "F";
		console.log("드래그앤드랍 수정 updateFlag : " + updateFlag);
		
	}else{ // 일정 상세보기 & 수정 & 삭제 updateFlag 'F'일때
		console.log("일정 상세보기 & 수정 & 삭제 updateFlag 'F'일때: " + updateFlag);
		alert("다시 시도해주세요.");
		return false;
		$("#textCalenderTitle").html("일정 추가");
		$("#insertCalenderBtn").html("등록");
		$("#resetCalenderBtn").html("초기화");
		$("#resetCalenderBtn").type = "reset";
		$("#resetCalenderBtn").removeClass("btn btn-danger btn-sm").addClass("btn btn-light btn-sm");

	}
}
</script>
</html>