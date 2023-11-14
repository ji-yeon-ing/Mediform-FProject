<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MedicineList</title>
<style type="text/css">
.pagingArea {
	display: flex;
	justify-content: center;
}

#purchaseModalBody {
	width: auto;
}

#purchaseModalBody input[type="text"] {
	width: 50px;
}

.th-width-custom {
	width: 100px;
}

.scrollbar::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body>
	<c:set var="customUser"
		value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
	<div class="row">
		<div class="col-6">
			<div class="card border border-secondary" style="height: 820px;">

				<div class="card-header border-bottom p-2" 	style="height: 35px; background-color: midnightblue">
					<div class="col-12 align-self-center">
						<h5 class="text-white mb-0 fw-semi-bold" id="header">
							약품 재고 현황</h5>
					</div>
				</div>

				<div class="card-body">

					<div id="tableExample2"
						data-list='{"valueNames":["code","name","mfbiz","unit","count","price"],"page":13,"pagination":true}'>
						<div class="row justify-content-between g-0">
							<div class="col-sm-5">
								<!-- 약품 검색창 -->
								<div class="input-group mb-2">
									<input class="form-control search-input fuzzy-search"
										type="search" placeholder="검색할 약품명을 입력해 주세요" aria-label="search" />
									<div class="input-group-text bg-transparent">
										<span class="fas fa-search search-box-icon"></span>
									</div>
								</div>
							</div>
							<div class="col-auto">
								<!-- 약품 신청 버튼 -->
								<button class="btn btn-secondary btn-sm" id="addMedcin"
									style="background-color: midnightblue;">약품 신청</button>
							</div>
						</div>
						<div class="table-responsive scrollbar mx-nx1 mt-3"
							id="tableExample2">
							<table class="table table-bordered table-striped fs--1 mb-0"
								id="medicineTable">
								<thead class="bg-200">
									<tr>
										<th class="text-800 sort"><i class="far fa-square"></i></th>
										<th class="text-800 text-center sort" data-sort="code">약품코드</th>
										<th class="text-800 text-center sort" data-sort="name">약품명</th>
										<th class="text-800 text-center sort" data-sort="mfbiz">제조업체</th>
										<th class="text-800 text-center sort" data-sort="unit">단위</th>
										<th class="text-800 text-center sort" data-sort="count">수량</th>
										<th class="text-800 text-center sort" data-sort="price">금액(원)</th>
								</thead>
								<tbody class="list" id="table-crm-location-session"
									class="bg-200">
									<c:set value="${medicineList }" var="medicineList" />
									<c:choose>
										<c:when test="${empty medicineList }">
											<tr>
												<td colspan="17" align="center">약품정보가 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${medicineList }" var="medicine">
												<tr>
													<td><input type="checkbox" name="selectedMedicine"></td>
													<td class="code text-center fw-semi-bold sessions"
														val-type="medcinCd">${medicine.medcinCd }</td>
													<td class=" name text-left fw-semi-bold sessions"
														val-type="medcinNm"">${medicine.medcinNm }</td>
													<td class=" mfbiz text-center" val-type="medcinMfbiz">${medicine.medcinMfbiz }</td>
													<td class="unit text-left" val-type="medcinUnit">${medicine.medcinUnit }</td>
													<td
														class="count text-center <c:if test="${medicine.medcinInvntry < 6}">text-danger</c:if>"
														val-type="medcinInvntry">${medicine.medcinInvntry }</td>
													<td class="price text-end" val-type="medcinPc"><fmt:formatNumber
															value="${medicine.medcinPc}" type="number"
															pattern="#,###" /></td>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div class="d-flex justify-content-center mt-3">
								<button class="btn btn-sm btn-falcon-default me-1" type="button"
									title="Previous" data-list-pagination="prev">
									<span class="fas fa-chevron-left"></span>
								</button>
								<ul class="pagination mb-0"></ul>
								<button class="btn btn-sm btn-falcon-default ms-1" type="button"
									title="Next" data-list-pagination="next">
									<span class="fas fa-chevron-right"> </span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 발주서 목록 -->
		<div class="col-6">
			<div class="card border border-secondary" style="height: 820px;">
				<div class="card-header border-bottom p-2" style="height: 35px; background-color: midnightblue">
					<div class="col-12 align-self-center">
						<h5 class="text-white mb-0 fw-semi-bold" id="header">
							발주목록</h5>
					</div>
				</div>

				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-bs-toggle="tab" href="#tab-home" role="tab"
						aria-controls="tab-home" aria-selected="true">발주서</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-bs-toggle="tab" href="#tab-profile" role="tab"
						aria-controls="tab-profile" aria-selected="false">발주리스트</a></li>
				</ul>
				<div class="tab-content scrollbar border border-top-0 pt-4"
					id="myTabContent" style="overflow-y: auto;">
					<div class="tab-pane fade show active" id="tab-home"
						role="tabpanel" aria-labelledby="home-tab">

						<!-- 발주서 -->

						<p class="normal0"
							style="text-align: center; line-height: 115%; font-size: 19pt; padding-top: 30px;">
							<span>발주서</span>
						</p>
						<div class="row justify-content-end">
							<table class="table" style="width: 250pt;">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">발주처</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>상호</td>
										<td>메디폼 병원</td>
									</tr>
									<tr>
										<td>담당자</td>
										<td>${customUser.employee.empNm}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="table-responsive scrollbar">
							<table class="table " id="orderTable">
								<thead>
									<tr>
										<th scope="col" class="text-center" style="width: 140px;">약품코드</th>
										<th scope="col" class="text-center" style="width: 140px;">품명</th>
										<th scope="col" class="text-center" style="width: 100px;">업체</th>
										<th scope="col" class="text-center" style="width: 60px;">단위</th>
										<th scope="col" class="text-center" style="width: 80px;">수량</th>
										<th scope="col" class="text-center th-width-custom">합계(원)</th>
										<th scope="col" class="text-center th-width-custom">비고</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<table class="table d-flex justify-content-end"
								style="width: 680pt;" id="totalTable">
								<thead>
									<tr>
										<th>총 금액</th>
										<th id="allTotal"></th>
									</tr>
								</thead>
							</table>
							<div class="d-flex justify-content-end"
								style="margin-right: 10px;">
								<button class="btn btn-primary btn-sm me-1"
									style="background-color: midnightblue; border: none;" id="save">저장</button>
								<button class="btn btn-danger btn-sm" id="cancel" style="border: none;">취소</button>
							</div>
						</div>
					</div>


					<!-- 발주리스트 -->
					<div class="tab-pane fade" id="tab-profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div id="tableExample3"
							data-list='{"valueNames":["cd","cate","date","emp","total","confm"],"page":26,"pagination":true}'>
							<!-- 							<div class="row justify-content-end g-0"> -->
							<!-- 								<div class="col-auto col-sm-5 mb-3"> -->
							<!-- 									<form> -->
							<!-- 										<div class="input-group"> -->
							<!-- 											<input class="form-control search-input fuzzy-search" -->
							<!-- 												type="search" placeholder="발주서 뭘로 찾을까" aria-label="search" /> -->
							<!-- 											<div class="input-group-text bg-transparent"> -->
							<!-- 												<span class="fas fa-search search-box-icon"></span> -->
							<!-- 											</div> -->
							<!-- 										</div> -->
							<!-- 									</form> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<div class="table-responsive scrollbar mt-2">
								<table class="table table-bordered table-striped fs--1 mb-0"
									id="purchaseTable">
									<thead class="bg-200">
										<tr>
											<th class="text-900 sort text-center" data-sort="cd">No</th>
											<th class="text-900 sort text-center" data-sort="cate">구분</th>
											<th class="text-900 sort text-center" data-sort="date">주문일</th>
											<th class="text-900 sort text-center" data-sort="emp">발주자</th>
											<th class="text-900 sort text-center" data-sort="total">발주
												총금액</th>
											<th class="text-900 sort text-center" data-sort="confm">1차 승인여부</th>
											<c:if test="${customUser.employee.empClsf == '0'}">
												<th class="text-900 sort text-center">1차 승인</th>
											</c:if>
										</tr>
									</thead>
									<tbody class="list" id="table-crm-location-session">
										<c:set value="${orderList }" var="orderList" />
										<c:choose>
											<c:when test="${empty orderList }">
												<tr>
													<td colspan="17" align="center">발주서가 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${orderList }" var="order">
													<tr>
														<td class="cd text-center">${order.porderCd }</td>
														<td class="cate text-center"><a data-bs-toggle="collapse" href="#collapse${order.porderCd}" role="button"
															aria-expanded="false" aria-controls="collapse${order.porderCd}">${order.porderCt }</a>
														</td>
														<td class="date text-center"><fmt:formatDate value="${order.porderDate }" pattern="yyyy.MM.dd" /></td>
														<td class="emp text-center ">${order.porderEmpNo}- ${order.porderEmpNm}</td>
														<td class="total" style="text-align: right;"><fmt:formatNumber value="${order.porderTotal}" type="number" pattern="#,###" /></td>
														<td class="confm text-center">
															<c:choose>
														        <c:when test="${order.porderConfm == 'Y'}"> 승인
														        </c:when>
														        <c:when test="${order.porderConfm == 'N'}"> 반려
														        </c:when>
													  		</c:choose>
														</td>

														<!-- empClsf가 0일때만 승인 반려 버튼 보임 -->
														<c:if test="${customUser.employee.empClsf == '0'}">
															<td style="padding: 0; padding-top: 10px; vertical-align: middle; text-align: center;">
																<button class="aBtn btn btn-primary btn-sm text-white" style="font-size: 12px; padding: 3px; background-color: midnightblue; border: none;" onclick="approveOrder('${order.porderCd}')">승인</button>
																<button class="rBtn btn btn-danger btn-sm text-white" style="font-size: 12px; padding: 3px; border: none;" id="rBtn" onclick="rejectOrder('${order.porderCd}')">반려</button>
															</td>
														</c:if>
													</tr>
													<tr>
														<td colspan="6" class="collapse" id="collapse${order.porderCd}">
															<div class="card card-body">
																<table class="table" id="orderTable">
																	<thead>
																		<tr>
																			<th class="text-center" scope="col">품명</th>
																			<th class="text-center" scope="col">업체</th>
																			<th class="text-center" scope="col">수량</th>
																			<th class="text-center" scope="col">단위</th>
																			<th class="text-center" scope="col">금액</th>
																			<th class="text-center" scope="col">비고</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:set value="${orderList }" var="orderList" />
																		<c:choose>
																			<c:when test="${empty orderList }">
																				<tr>
																					<td colspan="4" align="center">발주서가 존재하지 않습니다.</td>
																				</tr>
																			</c:when>
																			<c:otherwise>
																				<c:forEach items="${orderMap[order.porderCd]}"
																					var="purchase">
																					<tr>
																						<td class="cd" style="text-align: left;">${purchase.podetailNm }</td>
																						<td class="cate text-center">${purchase.podetailMfbiz }</td>
																						<td class="amount text-center">${purchase.podetailAmount }</td>
																						<td class="unit text-center">${purchase.podetailUnit }</td>
																						<td class="total" style="text-align: right;">
																							<fmt:formatNumber value="${purchase.podetailTotal}" type="number" pattern="#,###" />
																						</td>
																						<td class="memo">${purchase.podetailMemo }</td>
																					</tr>
																				</c:forEach>
																			</c:otherwise>
																		</c:choose>
																	</tbody>
																</table>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<div class="d-flex justify-content-center mt-3">
								<button class="btn btn-sm btn-falcon-default me-1" type="button" title="Previous" data-list-pagination="prev">
									<span class="fas fa-chevron-left"></span>
								</button>
								<ul class="pagination mb-0"></ul>
								<button class="btn btn-sm btn-falcon-default ms-1" type="button" title="Next" data-list-pagination="next">
									<span class="fas fa-chevron-right"> </span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 발주할 약품들을 체크(checkbox)하고 약품신청 버튼을 누르면 체크된 약품들로 모달창 gogogoogogogogogogo -->

	<div class="modal fade" id="medicineModal" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg mt-6" role="document">
			<div class="modal-content border-0">
				<div class="modal-body p-0">
					<!-- ==================================발주서=======================-==== -->
					<div class="kanban-column" style="width: 100%">
						<div class="kanban-column-header" style="background-color: midnightblue; padding-top: 10px;">
							<h5 class="fs-0 mb-0 text-white">
								발주<span class="text-500" id="modalCount"></span>
							</h5>
						</div>
						<table class="table mb-0 data-table fs--1 " id="medicineTable2" data-list='{"valueNames":["count"]}'>
							<thead class="bg-200">
								<tr>
									<th class="text-800 text-center sort th-width-custom">약품코드</th>
									<th class="text-800 text-center sort" style="width: 120px;">약품명</th>
									<th class="text-800 text-center sort th-width-custom">제조업체</th>
									<th class="text-800 text-center sort" style="width: 80px;">단위</th>
									<th class="text-800 text-center sort" data-sort="count" style="width: 5%;">재고수량</th>
									<th class="text-800 text-center sort th-width-custom">단가(원)</th>
									<th class="text-800 text-center sort th-width-custom">발주수량</th>
									<th class="text-800 text-center sort" style="width: 130px;">합계(원)</th>
							</thead>
							<tbody class="list" id="purchaseModalBody">
							</tbody>
						</table>
						<table class="table d-flex justify-content-end" style="width: 575pt;" id="totalTable2">
							<thead>
								<tr>
									<th>총 금액</th>
									<th id="allTotal2"></th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="d-flex justify-content-end m-2">
						<button class="btn btn-primary btn-sm me-1" id="complete" style="background-color: midnightblue; border: none;">완료</button>
						<button class="btn btn-secondary btn-sm" id="close" style="border: none;">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="vendors/jquery/jquery.min.js"></script>
<!-- alert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<!--datepicker -->
<link href="vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<script src="assets/js/flatpickr.js"></script>
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	// 약품 정보를 담을 테이블
	var medicineTable = $("#medicineTable");
	var purcArr = []; // 신청한 발주 목록을 넣을 공간

	console.log('1');

	$(function() {
		console.log('3');

		//약품 신청 버튼 이벤트 추가
		//발주하고 싶은 약품을 체크하고 (약품신청) 버튼을 누르면 체크된 항목들이 모달창으로 띄워짐
		// 발주수량 inputbox 에서 발주할 수량 (keyup, change)로 설정
		$("#addMedcin")
				.on(
						"click",
						function() {

							const $list = $('#medicineTable2').find('tbody');
							$list.empty();

							$('input[name=selectedMedicine]:checked')
									.each(
											function(index, item) {

												let medcinCd = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinCd]')
														.html();
												let medcinNm = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinNm]')
														.html();
												let medcinMfbiz = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinMfbiz]')
														.html();
												let medcinUnit = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinUnit]')
														.html();
												let medcinInvntry = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinInvntry]')
														.html();
												let medcinPc = $(item)
														.closest('tr')
														.find(
																'td[val-type=medcinPc]')
														.html();

												console.log(medcinCd);

												let $tr = $('<tr>');
												$tr
														.append('<td class="text-800 text-center th-width-custom" val-type="medcinCd">'
																+ medcinCd
																+ '</td>');
												$tr
														.append('<td class="text-800 text-start th-width-custom">'
																+ medcinNm
																+ '</td>');
												$tr
														.append('<td class="text-800 text-start th-width-custom">'
																+ medcinMfbiz
																+ '</td>');
												$tr
														.append('<td class="text-800 text-center th-width-custom">'
																+ medcinUnit
																+ '</td>');
												$tr
														.append('<td class="text-800 text-center th-width-custom">'
																+ medcinInvntry
																+ '</td>');
												$tr
														.append('<td class="text-800 text-end" val-type="medcinPc">'
																+ medcinPc
																+ '</td>');

												let $orderTd = $('<td>');
												let $orderNum = $('<input>');
												$orderNum
														.attr('type', 'number');
												$orderNum.val(0);
												$orderNum.css('width', '80%');
												$orderNum.on('keyup',
														recalOrderTotal);
												$orderNum.on('change',
														recalOrderTotal);
												$orderTd.append($orderNum);

												$tr.append($orderTd);
												$tr
														.append('<td class="text-800 text-end" val-type="orderTotal">0</td>');

												$list.append($tr);
											});

							//모달창에 들어간 리스트
							$('#modalCount')
									.html(
											'('
													+ $('#medicineTable2')
															.find('tbody')
															.find('tr').length
													+ ')');

							$("#medicineModal").modal('show');

							$("#close").on("click", function() {
								$("#medicineModal").modal('hide');
							});
						});

		// 모달창에서 입력한 값을 발주서에 
		// 발주할 수량을 선택하고 [완료]버튼을 누르면 발주서에 그대로 입력
		$("#complete").on(
				"click",
				function() {

					let selectedRows = $("#medicineTable2 tbody tr").map(
							function() {
								let clonedRow = $(this).clone();

								// 재고수량 및 금액 열 제거
								clonedRow.find('td:nth-child(5)').remove();
								clonedRow.find('td:nth-child(6)').remove();
// 								clonedRow.find('td:nth-child(1)').remove();

								// medicineTable2에서 입력된 발주수량이랑 total
								let orderCnt = $(this).find('td:eq(6) input').val();
								let orderTot = $(this).find('td:eq(7)').text();
								// 모달창에 입력한 값들을 발주서로 출력
								clonedRow.find('td:eq(3)').text(orderCnt);
								clonedRow.find('td:eq(4)').text(orderTot);

								return clonedRow;
							}).get();

					// 발주라는 모달에서 셋팅되고 있는 약품재고 현황에서 체크된 약품 발주목록들
					// 약품명, 업체, 단위, 수량, 금액, 비고를 만들어준다 (목록)
					var eleTrs = $("#purchaseModalBody").find("tr");
					eleTrs.map(function(i, e) {
						eleTds = $(e).find("td");
						purcArr.push({
							medcinCd : eleTds[0].innerText,
							podetailNm : eleTds[1].innerText,
							podetailMfbiz : eleTds[2].innerText,
							podetailUnit : eleTds[3].innerText,
							podetailAmount : $(eleTds[6]).find("input").val(),
							podetailTotal : eleTds[7].innerText
									.replace(',', '')
						});
					});

					// 모달 내의 발주금액들 계산 (금액x발주수량들 다 더하기)
					let totalAmount = 0;
					$("#medicineTable2 tbody tr").each(
							function() {
								let rowTotal = Number($(this).find(
										'td[val-type="orderTotal"]').text()
										.replace(',', ''));
								totalAmount += rowTotal;
							});

					// 계산된 총합을 <발주서 총합>에 출력
					$("#allTotal").text(numerCommas(totalAmount) + "원");

					$("#orderTable tbody").empty().append(selectedRows);
					$("#medicineModal").modal('hide');
				});

		//발주품목과 수량 금액을 확인 한 후에 저장 버튼을 누르면 최종적으로 발주리스트로 저장됨 (db)
		$("#save").on("click", function() {
			$.ajax({
				url : "/mediform/nurse/medicine/orderlist/insert",
				method : "POST",
				data : JSON.stringify(purcArr),
				contentType : "application/json; charset=utf-8",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(response) {
					if (response == "OK") {
						Swal.fire({
		      			      icon: 'success',
		      			      title: '약품 발주',
		      			      text: '발주서가 저장되었습니다.',
		      			    });
						location.href = "/mediform/nurse/medicine/list/select";
					} else {
						Swal.fire({
						      icon: 'warning',
						      title: '발주서 저장에 실패했습니다!',
						      confirmButtonColor: 'midnightblue'
						    });
					}
				},
				error : function(err) {
					alert("Error: " + err);
				}
			});
		});

		$("#cancel").on("click", function() {
			clearOrderForm();
		});

	});

	console.log('2');

	// 발주될 총금액 (약품 가격 x 발주할 수량)
	function recalOrderTotal() {
		let orderNum = $(this).val();
		let medcinPc = $(this).closest('tr').find('td[val-type=medcinPc]')
				.html().replace(',', '');
		let total = Number(orderNum) * Number(medcinPc);
		$(this).closest('tr').find('td[val-type=orderTotal]').html(
				numerCommas(total));

		let totalAmount = 0;
		$("#medicineTable2 tbody tr")
				.each(
						function() {
							totalAmount += Number($(this).find(
									'td[val-type=orderTotal]').text().replace(
									',', ''));
						});

		$("#allTotal2").text(numerCommas(totalAmount) + "원");
	}

	//숫자에 , 추가하기
	function numerCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 발주서에서 취소 버튼!~!!!!

	function clearOrderForm() {
		$("#orderTable tbody").empty();

		$("#allTotal").text("0");

		purcArr = [];
	}
	
	
	
	
	function approveOrder(porderCd) {
	    var examData = {
	        porderCd: porderCd
	    };

	    $.ajax({
	        url: "/mediform/nurse/medicine/sanction/approve",
	        method: "POST",
	        data: JSON.stringify(examData),
	        contentType: "application/json; charset=utf-8",
	        beforeSend: function (xhr) {
	            xhr.setRequestHeader(header, token);
	        },
	        success: function (response) {
	            Swal.fire({
	                icon: 'success',
	                title: '1차 승인',
	                text: '승인이 완료되었습니다.',
	                confirmButtonText: '확인',
	                confirmButtonColor: 'midnightblue',
	            });
	            location.href = "/mediform/nurse/medicine/list/select";
	            console.log(">>>>>승인 완료 <<<<<")
	        },
	        error: function (err) {
	            alert("Error: " + err);
	        }
	    });
	}

	function rejectOrder(porderCd) {
	    var examData = {
	        porderCd: porderCd
	    };

	    $.ajax({
	        url: "/mediform/nurse/medicine/sanction/reject",
	        method: "POST",
	        data: JSON.stringify(examData),
	        contentType: "application/json; charset=utf-8",
	        beforeSend: function (xhr) {
	            xhr.setRequestHeader(header, token);
	        },
	        success: function (response) {
	            Swal.fire({
	                icon: 'success',
	                title: '1차 반려',
	                text: '반려가 완료되었습니다.',
	                confirmButtonText: '확인',
	                confirmButtonColor: 'midnightblue',
	            });
	            location.href = "/mediform/nurse/medicine/list/select";
	            console.log(">>>>>반려 완료 <<<<<")
	        },
	        error: function (err) {
	            alert("Error: " + err);
	        }
	    });
	}
</script>
</html>

<!-- 
	20231025_작업 추가 완료
-->