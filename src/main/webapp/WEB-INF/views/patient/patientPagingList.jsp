<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PatientList</title>
<style type="text/css">
.filter-Box{
	margin-top: 0.9rem;
	margin-left: 0.5rem;
}

.search-Box{
	margin-left: 0.5rem;
}
</style>
</head>
<body>
<div class="card shadow-none">
	<div class="card-header">
		<div class="row flex-between-center">
			<div class="col-6 col-sm-auto d-flex align-items-center pe-0">
				<h5 class="fs-0 mb-0 text-nowrap py-2 py-xl-0">환자목록 </h5>
			</div>
			<form class="col-6 col-sm-auto d-flex align-items-center pe-0" method="post" id="searchForm">
				<input type="hidden" name="page" id="page" />
				<div class="col-6 col-sm-auto d-flex align-items-center pe-0">
					<select class="form-select" aria-label="Default select example" name="searchType">
						<option value="patntnm" <c:if test="${searchType eq 'patntnm' }">selected</c:if>>환자명</option>
						<option value="patntno" <c:if test="${searchType eq 'patntno' }">selected</c:if>>환자번호</option>
					</select>
				</div>
				<div class="col-6 col-sm-auto d-flex align-items-center pe-0 search-Box">
					<div class="search-box">
						<div class="position-relative" data-bs-toggle="search" data-bs-display="static">
							<input class="form-control search-input fuzzy-search" type="text" placeholder="검색할 환자명을 입력해주세요." aria-label="Search" name="searchWord" id="${searchWord }" value="${searchWord }">
							<span class="fas fa-search search-box-icon"></span>
						</div>
					</div>
				</div>
				<sec:csrfInput/>
			</form>
			<div class="col-6 col-sm-auto ms-auto text-end ps-0">
				<div class="d-none" id="table-simple-pagination-actions">
					<div class="d-flex">
						<button class="btn btn-falcon-default btn-sm ms-2" type="button">Apply</button>
					</div>
				</div>
				<div class="table-simple-pagination-replace-element">
					<button class="btn btn-falcon-default btn-sm mx-1" type="button">
						<span class="fas fa-plus" data-fa-transform="shrink-3 down-2"></span>
						<span class="d-none d-sm-inline-block ms-1" data-bs-toggle="modal" data-bs-target="#newPatient-modal" id="newPatientBtn">신규환자등록</span>
					</button>
						<div class="btn-group">
							<button class="btn btn-falcon-default btn-sm mx-1 dropdown-toggle" type="button" data-bs-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">
								<span class="fas fa-filter" data-fa-transform="shrink-3 down-2"></span>
								<span class="d-none d-sm-inline-block ms-1">필터</span>
							</button>
							<div class="dropdown-menu py-0">
								<div class="card shadow-none border-0" style="width: 10rem;">
									<div class="card-body">
										<div class="row text-start justify-content-between align-items-center mb-2">
											<div class="col-auto">
												<p class="mb-0" style="font-size: 1rem">필터</p>
											</div>
										</div>
										<div class="position-relative">
											<hr />
										</div>
										<div class="row flex-between-center">
											<div class="col-auto">
												<div class="form-check mb-0">
													<input class="form-check-input" type="checkbox" id="checkAll" checked="checked" />
													<label class="form-check-label mb-0" for="basic-checkbox">전체</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntHsptlzAtY" value="filter1" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">입원</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntHsptlzAtN" value="filter2" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">외래</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntSexdstnM" value="filter3" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">남자</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntSexdstnF" value="filter4" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">여자</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntHlthinsAtY" value="filter5" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">보험 유</label>
												</div>
												<div class="form-check mb-0">
													<input class="form-check-input filter-check" id="patntHlthinsAtN" value="filter6" name="checkFilter" type="checkbox" checked="checked"/>
													<label class="form-check-label mb-0" for="basic-checkbox">보험 무</label>
												</div>
											</div>
										</div>
										<div class="position-relative mt-4">
											<hr style="margin: 0;"/>
										</div>
										<div style="display: flex; justify-content: flex-end;">
											<button class="btn btn-primary btn-sm d-block mt-3" id="checkFilterBtn" type="submit" name="submit">적용</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					<button class="btn btn-falcon-default btn-sm mx-1" type="button">
						<span class="fas fa-external-link-alt" data-fa-transform="shrink-3 down-2"></span>
						<span class="d-none d-sm-inline-block ms-1">execel저장</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="card-body px-0 pt-0">
		<table class="table mb-0 overflow-hidden data-table fs--4" data-datatables='{"responsive":false,"pagingType":"simple","lengthChange":false,"searching":false,"pageLength":8,"language":{"info":"_START_ to _END_ Items of _TOTAL_"}}'>
			<thead class="bg-200">
				<tr>
					<th class="text-900 no-sort white-space-nowrap">
						<div class="form-check mb-0 d-flex align-items-center">
							<input class="form-check-input" id="checkbox-bulk-item-select" type="checkbox" data-bulk-select='{"body":"table-simple-pagination-body","actions":"table-simple-pagination-actions","replacedElement":"table-simple-pagination-replace-element"}' />
						</div>
					</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">환자번호</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">환자명</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보험</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">입원</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">성별</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">만 나이</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">연락처</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">메모사항</th>
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">주민번호</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">우편번호</th> -->
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">주소</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보호자명</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보호자연락처</th>
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">키(cm)</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">몸무게(kg)</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">혈액형</th> -->
					<th class="text-900 no-sort pe-1 align-middle data-table-row-action"></th>
				</tr>
			</thead>
			<tbody class="list" id="table-simple-pagination-body">
				<c:set value="${pagingVO.dataList }" var="patientList"/>
				<c:choose>
					<c:when test="${empty patientList }">
						<tr>
							<td colspan="17" align="center">환자정보가 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${patientList }" var="patient">
							<tr class="btn-reveal-trigger">
								<td class="align-middle" style="width: 28px;">
									<div class="form-check mb-0">
										<input class="form-check-input" type="checkbox" id="simple-pagination-item-13" data-bulk-select-row="data-bulk-select-row" />
									</div>
								</td>
								<td class="align-middle white-space-nowrap fw-semi-bold text-center no">${patient.patntNo }</td>
								<td class="align-middle white-space-nowrap fw-semi-bold text-center">${patient.patntNm }</td>
								<c:choose>
									<c:when test="${patient.patntHlthinsAt eq 'Y'}">
										<td class="align-middle white-space-nowrap text-center">유</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle white-space-nowrap text-center">무</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${patient.patntHsptlzAt eq 'Y'}">
										<td class="align-middle white-space-nowrap text-center">유</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle white-space-nowrap text-center">무</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${patient.patntSexdstn eq 'M'}">
										<td class="align-middle white-space-nowrap text-center">남</td>
									</c:when>
									<c:otherwise>
										<td class="align-middle white-space-nowrap text-center">여</td>
									</c:otherwise>
								</c:choose>
								<td class="align-middle white-space-nowrap text-center">${patient.patntAge }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.patntTelno }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.patntMemo }</td>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntRrno1 }-${patient.patntRrno2 }</td> --%>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntZip }</td> --%>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntAdres1 } ${patient.patntAdres2 }</td> --%>
								<td class="align-middle white-space-nowrap text-center">${patient.patntAdres1 }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.prtctorNm }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.prtctorTelno }</td>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntHeight }</td> --%>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntBdwgh }</td> --%>
<%-- 								<td class="align-middle white-space-nowrap text-center">${patient.patntBdp }</td> --%>
								<td class="align-middle white-space-nowrap text-end">
									<div class="dropstart font-sans-serif position-static d-inline-block">
										<button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal float-end" type="button" id="dropdown-simple-pagination-table-item-13" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent">
											<span class="fas fa-ellipsis-h fs--1"></span>
										</button>
										<div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="dropdown-simple-pagination-table-item-13">
											<button class="dropdown-item detailPatientBtn" data-bs-toggle="modal" data-bs-target="#newPatient-modal" data-patient-id="${patient.patntNo}">상세정보</button>
											<button class="dropdown-item" data-bs-toggle="modal" data-bs-target="" data-patient-id="${patient.patntNo}">제증명</button>
											<div class="dropdown-divider"></div>
											<button class="dropdown-item" data-bs-toggle="modal" data-bs-target="" data-patient-id="${patient.patntNo}">진료차트</button>
<%-- 											<button class="dropdown-item text-danger deletePatientBtn" data-bs-toggle="modal" data-bs-target="#deletePatient-modal" data-patient-id="${patient.patntNo}">삭제</button> --%>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="card-footer clearfix col-auto align-self-center pagingArea" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
</div>
	
<!-- 신규 환자 등록 modal 시작 -->
<div class="modal fade" id="newPatient-modal" data-bs-keyboard="false" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg mt-6" role="document">
		<div class="modal-content border-0">
			<div class="position-absolute top-0 end-0 mt-3 me-3 z-1">
				<button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-0">
				<div class="rounded-top-3 bg-body-tertiary py-3 ps-4 pe-6">
					<h4 class="mb-1" id="textPatientTitle">신규 환자 등록</h4>
				</div>
				<div class="p-4">
					<form action="/mediform/patient/insert" method="post" class="row g-3" id="insertForm">
						<div class="col-md-12 pNo" style="display: none;">
							<label class="form-label" for="patntNm">환자번호</label>
							<input class="form-control" id="patntNo" name="patntNo" value="${patient.patntNo }" disabled="disabled"/>
							<p><font id="pNo" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-6">
							<label class="form-label" for="patntNm">환자명</label>
							<input class="form-control" id="patntNm" name="patntNm" type="text" placeholder="환자명" />
							<p><font id="pNm" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-6">
							<label class="form-label" for="patntTelno">환자 연락처</label>
							<input class="form-control" id="patntTelno" name="patntTelno" type="text" placeholder="환자연락처" />
							<p><font id="pTelno" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-8">
						    <label class="form-label" for="patntRrno">주민등록번호</label>
						    <button class="btn btn-sm btn-falcon-default" type="button" id="calAgeBtn" style="padding: revert;">적용</button>
						    <div class="input-group">
					            <input class="form-control" id="patntRrno1" name="patntRrno1" type="text" placeholder="앞 6자리" />&nbsp;&nbsp;
					            - &nbsp;&nbsp;
					            <input class="form-control" id="patntRrno2" name="patntRrno2" type="text" placeholder="뒤 7자리" />
						    </div>
				            <p><font id="pRrno1" color="red" class="text-danger"></font></p>
				            <p><font id="pRrno2" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-4">
							<label class="form-label" for="patntAge">만 나이</label>
							<input class="form-control" id="patntAge" name="patntAge" type="text" placeholder="만 나이" readonly="readonly"/>
							<p><font id="pAge" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-mb-2">
							<div class="col-sm-12">
								<div class="form-check-inline">
							        <input class="form-check-input" id="M" type="radio" name="patntSexdstn" value="M" readonly="readonly"/>
							        <label class="form-check-label mb-0" for="M">남성</label>
							    </div>
							    <div class="form-check-inline">
							        <input class="form-check-input" id="F" type="radio" name="patntSexdstn" value="F" readonly="readonly"/>
							        <label class="form-check-label mb-0" for="F">여성</label>
							    </div>
								<div class="form-check-inline">
									<input class="form-check-input" id="patntHlthinsAt" type="checkbox" checked="checked" value="Y"/>
									<input type="hidden" name="patntHlthinsAt" id="patntHlthinsAtHidden" value=""/>
									<label class="form-check-label" for="patntHlthinsAt">건강보험 유</label>
								</div>
								<div class="form-check-inline">
									<input class="form-check-input" id="patntHsptlzAt" type="checkbox" value="Y"/>
									<input type="hidden" name="patntHsptlzAt" id="patntHsptlzAtHidden" value=""/>
									<label class="form-check-label" for="patntHsptlzAt">입원환자</label>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<label class="form-label" for="patntHeight">신장(cm)</label>
							<input class="form-control" id="patntHeight" name="patntHeight" type="text" placeholder="신장" />
						</div>
						<div class="col-md-4">
							<label class="form-label" for="patntBdwgh">몸무게(kg)</label>
							<input class="form-control" id="patntBdwgh" name="patntBdwgh" type="text" placeholder="몸무게" />
						</div>
						<div class="col-md-4">
						    <label class="form-label" for="patntBdp">혈액형(ABO)</label>
						    <select class="form-select" id="patntBdp" name="patntBdp">
						      <option selected="selected" value="A">A</option>
						      <option value="B">B</option>
						      <option value="B">B</option>
						      <option value="AB">AB</option>
						      <option value="O">O</option>
						      <option value="기타">기타</option>
						    </select>
						  </div>
					    <div class="col-sm-12">
					        <label class="form-label" for="patntZip">우편번호</label>
					        <div class="input-group">
					            <input class="form-control" id="patntZip" name="patntZip" type="text" placeholder="우편번호" />
					            <button type="button" onclick="DaumPostcode()" class="btn btn-secondary btn-flat">우편번호 찾기</button>
					        </div>
				            <p><font id="pZip" color="red" class="text-danger"></font></p>
					    </div>
						    <div class="col-sm-12">
							<label class="form-label" for="patntAdres">주소</label>
							<input class="form-control" id="patntAdres1" name="patntAdres1" type="text" placeholder="주소" />
							<p><font id="pAdres1" color="red" class="text-danger"></font></p>
							<input class="form-control" id="patntAdres2" name="patntAdres2" type="text" placeholder="상세주소" />
							<p><font id="pAdres2" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-6">
							<label class="form-label" for="prtctorNm">보호자 성명</label>
							<input class="form-control" id="prtctorNm" name="prtctorNm" type="text" placeholder="보호자 성명" />
						</div>
						<div class="col-md-6">
							<label class="form-label" for="prtctorTelno">보호자 연락처</label>
							<input class="form-control" id="prtctorTelno" name="prtctorTelno" type="text" placeholder="보호자 연락처" />
						</div>
						<div class="col-md-12">
							<label class="form-label" for="patntMemo">메모사항</label>
							<textarea class="form-control" id="patntMemo" name="patntMemo" rows="3" placeholder="메모사항"></textarea>
						</div>
						<div align="right" class="form-check-inline patntAgre">
							<input class="form-check-input" id="patntAgre" name="patntAgre" type="checkbox" checked="checked" value="Y"/>
							<label class="form-check-label" for="patntAgre">개인 정보 제공 동의</label>
							<p><font id="pAgre" color="red" class="text-danger"></font></p>
						</div>
						<div class="col-md-12">
							<div align="right">
								<button class="btn" type="reset" id="resetBtn">초기화</button>
								<button class="btn btn-primary" id="insertBtn">저장</button>
							</div>
						</div>
						<sec:csrfInput /> 
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 신규 환자 등록 modal 끝 -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

// 신규 환자 등록 Modal
$(function(){
	var newPatientBtn = $("#newPatientBtn");
	
	newPatientBtn.on("click",function(){
		$('#newPatient-modal').modal();
	});
	
	var insertBtn = $("#insertBtn");
	$("#insertBtn").on("click", function() {
		var insertForm = $("#insertForm");
		var patntNm = $("#patntNm").val();
		var patntTelno = $("#patntTelno").val();
		var patntRrno1 = $("#patntRrno1").val();
		var patntRrno2 = $("#patntRrno2").val();
		var patntAge = $("#patntAge").val();
		var patntZip = $("#patntZip").val();
		var patntAdres1 = $("#patntAdres1").val();
		var patntAdres2 = $("#patntAdres2").val();
		var patntAgre = $("#patntAgre:checked").val();
		var patntHlthinsAt = $("#patntHlthinsAt:checked").val();
		var patntHsptlzAt = $("#patntHsptlzAt:checked").val();
		
		if (patntNm == null || patntNm == "") {
		    $("#pNm").html("환자명을 입력해주세요.");
		    $("#patntNm").focus();
		    return false;
		}
		if (patntTelno == null || patntTelno == "") {
		    $("#pTelno").html("환자 연락처를 입력해주세요.");
		    $("#patntTelno").focus();
		    return false;
		}
		if (patntRrno1 == null || patntRrno1 == "") {
		    $("#pRrno1").html("주민번호를 입력해주세요.");
		    $("#patntRrno1").focus();
		    return false;
		}
		if (patntRrno2 == null || patntRrno2 == "") {
		    $("#pRrno2").html("주민번호를 입력해주세요.");
		    $("#patntRrno2").focus();
		    return false;
		}
		if (patntAge == null || patntAge == "") {
		    $("#pAge").html("나이를 입력해주세요.");
		    $("#patntAge").focus();
		    return false;
		}
		if (patntZip == null || patntZip == "") {
		    $("#pZip").html("우편번호를 입력해주세요.");
		    $("#patntZip").focus();
		    return false;
		}
		if (patntAdres1 == null || patntAdres1 == "") {
		    $("#pAdres1").html("주소를 입력해주세요.");
		    $("#patntAdres1").focus();
		    return false;
		}
		if (patntAdres2 == null || patntAdres2 == "") {
		    $("#pAdres2").html("주소를 입력해주세요.");
		    $("#patntAdres2").focus();
		    return false;
		}
		if (patntAgre != 'Y' || patntAgre == "") {
		    $("#pAgre").html("개인 정보 제공에 동의하셔야합니다.");
		    $("#patntAgre").focus();
		    return false;
		}
		
		if($("#patntHsptlzAt").is(":checked")){
			$("#patntHsptlzAtHidden").val("Y");
		}else{
			$("#patntHsptlzAtHidden").val("N");
		}
		if($("#patntHlthinsAt").is(":checked")){
			$("#patntHlthinsAtHidden").val("Y");
		}else{
			$("#patntHlthinsAtHidden").val("N");
		}
		
		insertForm.submit();
	});

// 만나이 계산 & 성별 적용
$(function(){
	$("#calAgeBtn").on("click",function(){
		var patntRrno1Val = $("#patntRrno1").val();
		var patntRrno2Val = $("#patntRrno2").val();
		
		if (patntRrno1Val == null || patntRrno1Val == "") {
		    $("#pRrno1").html("주민번호를 입력해주세요.");
		    $("#patntRrno1").focus();
		    return false;
		}
		if (patntRrno2Val == null || patntRrno2Val == "") {
		    $("#pRrno2").html("주민번호를 입력해주세요.");
		    $("#patntRrno2").focus();
		    return false;
		}	
		
		var patntY1 = patntRrno1Val.substr(0,2);
		var patntY2 = patntRrno2Val.substr(0,1);
		
		if(patntY2 == 1 || patntY2 == 2) var patntY = '19' + patntY1;
		if(patntY2 == 3 || patntY2 == 4) var patntY = '20' + patntY1;
		
		console.log(patntY);
		
		var patntMD = patntRrno1Val.substr(2);
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		var day = date.getDate();
		
		if(month < 10) month = '0' + month;
		if(day < 10) day = '0' + day;
		var monthDay = month + '' + day;
		var age = year - patntY;

		var realAge = monthDay > patntMD ? age : age -1;
		
		$("#patntAge").val(realAge);
		
		// 성별
		if(patntY2 == 1 || patntY2 == 3){
			$("#M").prop("checked", true);
		}else if(patntY2 == 2 || patntY2 == 4){
			$("#F").prop("checked", true);
		}
	});
	
});
	
	
// 환자 정보 상세보기 & 수정{
	var detailPatientBtn = $(".detailPatientBtn");
	
	detailPatientBtn.on("click",function(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
        var patntNo = $(this).data("patient-id");
        
        $.ajax({
            type : "post",
            url : "/mediform/patient/updateForm",
            data : patntNo,
            contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){
	            xhr.setRequestHeader(header,token);
	        },
            success: function(data){
            	if(data == null || data == ""){
            		alert("다시 시도해주세요!");
            		return false;
            	}else{
	            	$('#newPatient-modal').modal();			// 모달 띄우기
	            	
	                $("#patntNo").val(data.patntNo);
	                $("#patntNm").val(data.patntNm);
	                $("#patntRrno1").val(data.patntRrno1);
	                $("#patntRrno2").val(data.patntRrno2);
	                $("#patntTelno").val(data.patntTelno);
	                $("#patntZip").val(data.patntZip);
	                $("#patntAdres1").val(data.patntAdres1);
	                $("#patntAdres2").val(data.patntAdres2);
	                $("#patntAge").val(data.patntAge);
	                $("#patntSexdstn").val(data.patntSexdstn);
	                $("#prtctorNm").val(data.prtctorNm);
	                $("#prtctorTelno").val(data.prtctorTelno);
	                $("#patntAgre").val(data.patntAgre);
	                $("#patntHeight").val(data.patntHeight);
	                $("#patntBdwgh").val(data.patntBdwgh);
	                $("#patntBdp").val(data.patntBdp);
	                $("#patntHlthinsAt").val(data.patntHlthinsAt);
	                $("#patntMemo").val(data.patntMemo);
	                $("#patntHsptlzAt").val(data.patntHsptlzAt);
	                
	                $(".pNo").show();
            		$("#textPatientTitle").html("환자 상세정보");
            		$(".patntAgre").css("display", "none");
                    $("#resetBtn").hide();
                    
					var insertForm = $("#insertForm");
                    insertBtn.html("수정");
                    insertForm.attr("action", "/mediform/patient/update");		// 폼 경로 바꾸기 
            	}
            },
            error: function () {
                console.error("데이터를 가져오는 중 오류가 발생했습니다.");
            }
        });
    });
});

// 페이징
$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});

// 체크박스 필터링
$(document).ready(function() {
    $(".filter-check").on("click", function() {
        var FilterChk = $(this).val();
    	
    	if (!$(this).is(':checked')) {
			$("#checkAll").prop("checked",false);
        }
        
        if ($(".filter-check:checked").length === $(".filter-check").length) {
            $("#checkAll").prop("checked", true);
       }
    });
});

// 전체
$(function(){
	var checkAll = $("#checkAll");
	checkAll.on("click",function(){
		if($(this).is(":checked")){
			$(".filter-check").prop("checked",true);
		}else{
			$(".filter-check").prop("checked",false);
		}
	});
});

// 필터 적용
$(document).ready(function() {
//     $(".filter-check").change(function() {
//         applyFilter();
//     });

    $("#checkFilterBtn").click(function() {
        applyFilter();
        
        $("#searchForm").submit();
    });

    // 필터 적용 함수
    function applyFilter() {
    	var html = "";
    	var flag = false;	// 검색 필터 체크된 항목이 없을때
    	console.log($(".filter-check"));
    	$(".filter-check").map(function(i,e){
			console.log("Element : " + e + ", index : " + i);    		
    		if(e.checked){
				html += "<input type='hidden' name='"+$(this).val()+"' value='"+$(this).val()+"'>";
				flag = true;
			}
   		})
    	if(flag){
			html += "<input type='hidden' name='filterFlag' value='true'>";    		
    	}
		$("#searchForm").append(html);
		console.log($("#searchForm").html());
    }
});

function DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== ''
						&& data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
			} 

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('patntZip').value = data.zonecode;
			document.getElementById("patntAdres1").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("patntAdres2").focus();
		}
	}).open();
};


</script>

</body>
</html>




