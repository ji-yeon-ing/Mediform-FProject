<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PatientList</title>
</head>
<body>
<div class="card shadow-none">
	<div class="card-header">
		<div class="row flex-between-center">
			<div class="col-6 col-sm-auto d-flex align-items-center pe-0">
				<h5 class="fs-0 mb-0 text-nowrap py-2 py-xl-0">환자목록 </h5>
			</div>
		</div>
	</div>
	
	<div class="card-body px-0 pt-0">
		<table class="table mb-0 data-table fs--4"data-datatables='data-datatables {"responsive":false,"pagingType":"simple","lengthChange":false,"searching":false,"pageLength":8,"language":{"info":"_START_ to _END_ Items of _TOTAL_"}}'>
<!-- 		<table class="table table-sm mb-0 overflow-hidden data-table fs--1" data-datatables='{"responsive":false,"pagingType":"simple","lengthChange":false,"searching":false,"pageLength":8,"language":{"info":"_START_ to _END_ Items of _TOTAL_"}}'> -->
			<thead class="bg-200">
				<tr>
					<th class="text-900 no-sort white-space-nowrap">
						<div class="form-check mb-0 d-flex align-items-center">
							<input class="form-check-input" id="checkbox-bulk-item-select" type="checkbox" data-bulk-select='{"body":"table-simple-pagination-body","actions":"table-simple-pagination-actions","replacedElement":"table-simple-pagination-replace-element"}' />
						</div>
					</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">입원여부</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보험여부</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">환자번호</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">이름</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">성별</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">만 나이</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">연락처</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">메모사항</th>
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">주민번호</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">우편번호</th> -->
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">주소</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보호자이름</th>
					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">보호자연락처</th>
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">키(cm)</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">몸무게(kg)</th> -->
<!-- 					<th class="text-900 sort pe-1 align-middle white-space-nowrap text-center">혈액형</th> -->
				</tr>
			</thead>
			<tbody class="list" id="table-simple-pagination-body">
				<c:set value="${patientList }" var="patientList"/>
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
								<td class="align-middle white-space-nowrap text-center">${patient.patntHlthinsAt }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.patntHsptlzAt }</td>
								<td class="align-middle white-space-nowrap fw-semi-bold text-center no">${patient.patntNo }</td>
								<td class="align-middle white-space-nowrap fw-semi-bold text-center">${patient.patntNm }</td>
								<td class="align-middle white-space-nowrap text-center">${patient.patntSexdstn }</td>
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
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
	

</body>
</html>




