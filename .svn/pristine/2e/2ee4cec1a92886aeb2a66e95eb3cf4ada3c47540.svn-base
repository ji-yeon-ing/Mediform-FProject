<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Care</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<style>
  		  .card { 
	            border: 1px solid #b3b3cc; /* 카드 테두리 스타일 */ */
	            border-radius: 10px; /* 카드 모서리 라운딩 */ */
	            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */ */
        	 } 
         
  		  .card img {
	        max-height: 200px; /* 이미지의 최대 높이를 200px로 설정 */
	        max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞춤 */
	        object-fit: contain; /* 이미지가 비율을 유지하면서 부모 요소에 맞게 맞춥니다. */
	   		 }
			#soap tr{
				height: 60px;
			}
			
			.selected {
	   			 border: 10px red;
			}
		    .fixed-height-row {
		        height: 25px; /* 원하는 높이로 설정 */
		    }
	      .ms-3.ps-5 {
		    overflow-y: scroll;
		    scrollbar-width: none; /* Firefox */
		    -ms-overflow-style: none; /* Internet Explorer 10+ */
		  }
		
		  .ms-3.ps-5::-webkit-scrollbar {
		    display: none; /* Webkit (Safari, Chrome) */
		  }
		  
		  .orderListScroll::-webkit-scrollbar {
		    display: none; /* Webkit (Safari, Chrome) */
		  }
		  
		  .btn-success {
	        border: none;
	    }
</style>
</head>
<body>
	<c:set var="customUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
	<input type="hidden" id="sessionUserId" value="${customUser.username}"/>
<%-- 	<c:set value="${customUser.employee.empNm}" var="sessionUserNm"/> --%>
	
	<input type="hidden" name="pageFlag" id="pageFlag" value="">
	<input type="hidden" name="msg" id="msg" value="${msg }">
	<div class="container-fulid">
		<div class="row">
			<div class="col-5 text-center">



				<div class="card border border-secondary mb-2" style="height: 460px;">
					<div class="card-header border-bottom p-2" style="height: 35px; background-color: midnightblue">
						<div class="row">
							<div class="col-12 align-self-center">
								<h5 class="text-start text-white mb-0 fw-semi-bold">대기 환자</h5>
							</div>
						</div>
					</div>
					<div>
						<ul class="nav nav-tabs" id="myWaitingTab" role="tablist">
						  <li class="nav-item text-center col-6" id="therapyPtLi">
						    <a class="nav-link active fw-semi-bold" id="home-tab" data-bs-toggle="tab" href="#tab-waiting1" role="tab" aria-controls="tab-home" aria-selected="true">물리치료 대기환자</a>
						  </li>
						  <li class="nav-item text-center col-6" id="therapyOtLi">
						    <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#tab-waiting2" role="tab" aria-controls="tab-contact" aria-selected="false">작업치료 대기환자</a>
						  </li>
						</ul>
					</div>
					<!-- 탭 큰바디 -->
					<div class="tab-content" id="myTabContent">
						<!-- 물리치료 대기환자 탭  -->
						<div class="tab-pane fade show active" id="tab-waiting1" role="tabpanel" aria-labelledby="home-tab">
							<div class="row card-body pt-0 mt-0">
								<div class="table-container" style="max-height: 320px; overflow-y: auto;">
									<table class="table table-sm table-striped">
										<thead>
											<tr id="" class="bg-light">
												<th class="col-2" scope="col">No.</th>
												<th class="col-4" scope="col">환자명</th>
												<th class="col-6 text-center" scope="col">생년월일</th>
											</tr>
										</thead>
										<tbody style="max-height: none;">
											<c:set value="1" var="count1" />
											<c:choose>
												<c:when test="">
		
												</c:when>
												<c:otherwise>
													<c:forEach items="${waitingList }" var="waiting" varStatus="loop">
														<c:if test="${waiting.rceptSttus == '5' }">
															<tr class="onePatient trPatntNo pt-5 fixed-height-row" id="${waiting.rceptNo }" style="cursor: pointer; max-height: 36px;">
																<td>${count1}</td>
																<td>${waiting.patntNm}</td>
																<td class="patntRrno1Td">${waiting.patntRrno1 }</td>
															</tr>
															<c:set value="${count1+1 }" var="count1" />
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						<!-- 작업치료 대기환자 탭 -->
						<div class="tab-pane fade" id="tab-waiting2" role="tabpanel" aria-labelledby="contact-tab">
							<div class="row card-body pt-0 mt-0">
								<div class="table-container" style="max-height: 350px; overflow-y: auto;">
									<table class="table table-sm table-striped">
										<thead>
											<tr id="" class="bg-light">
												<th class="col-2" scope="col">No.</th>
												<th class="col-4" scope="col">환자명</th>
												<th class="col-6 text-center" scope="col">생년월일</th>
											</tr>
										</thead>
										<tbody style="max-height: none;">
											<c:set value="1" var="count1" />
											<c:choose>
												<c:when test="">
		
												</c:when>
												<c:otherwise>
													<c:forEach items="${waitingList }" var="waiting" varStatus="loop">
														<c:if test="${waiting.rceptSttus == '7' }">
															<tr class="onePatient trPatntNo p-0 fixed-height-row" id="${waiting.rceptNo }" style="cursor: pointer; height: 35px;">
																<td>${count1}</td>
																<td>${waiting.patntNm}</td>
																<td class="patntRrno1Td">${waiting.patntRrno1 }</td>
															</tr>
															<c:set value="${count1+1 }" var="count1" />
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						
						
					</div>
				</div>


				<!-- 환자 정보 카드 시작  -->
				<div class="card border border-secondary" style="height: 350px;">
					<div class="card-header border-bottom p-2"
						style="height: 35px; background-color: midnightblue">
						<div class="row">
							<div class="col-12 align-self-center">
								<h5 class="text-start text-white mb-0 fw-semi-bold">환자 정보</h5>
							</div>
						</div>
						<input type="hidden" id="patntNo" name="patntNo">
						<input type="hidden" id="rceptNo" name="rceptNo">
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-5">
								<div class="input-group mb-3 text-center">
									<div class="row">
										<div class="col-5 pe-0">
											<span class="input-group-text" id="inputGroup">이름</span>
										</div>
										<div class="col-7 ps-0">
											<input class="form-control patntInfo" id="patntNm" type="text" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" />
										</div>
									</div>
								</div>
								<div class="input-group mb-3">
									<div class="row">
										<div class="col-5 pe-0">
											<span class="input-group-text" id="inputGroup-sizing-default">성별</span>
										</div>
										<div class="col-7 ps-0">
											<input class="form-control patntInfo" id="patntSexdstn" type="text"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" />
										</div>
									</div>
								</div>
								<div class="input-group mb-3">
									<div class="row">
										<div class="col-5 pe-0">
											<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
										</div>
										<div class="col-7 ps-0">
											<input class="form-control patntInfo pe-0" id="patntTelno" type="text"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" />
										</div>
									</div>
								</div>
								<div class="input-group mb-3">
									<div class="row">
										<div class="col-5 pe-0">
											<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
										</div>
										<div class="col-7 ps-0">
											<input class="form-control patntInfo" id="patntRrno1" type="text"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" />
										</div>
									</div>
								</div>
								<div class="input-group mb-3">
									<div class="row">
										<div class="col-5 pe-0">
											<span class="input-group-text" id="inputGroup-sizing-default">나이</span>
										</div>
										<div class="col-7 ps-0">
											<input class="form-control patntInfo" id="patntAge" type="text"
												aria-label="Sizing example input"
												aria-describedby="inputGroup-sizing-default" />
										</div>
									</div>
								</div>
							</div>
							<div class="col-7">
								<div class="card">
									<div class="card-header p-2">
										<h6 class="mb-0 fw-semi-bold ">오더 내역</h6>
									</div>
									<div class="card-body p-0 orderListScroll" id="orderListCardBody" style="height: 220px; overflow-y: auto">
<!-- 										<div class="d-flex justify-content-between border-top hover-actions-trigger btn-reveal-trigger px-x1 border-200 todo-list-item"> -->
<!-- 											<div class="col-6"> -->
<!-- 												<div class="form-check mb-0 d-flex align-items-center"> -->
<!-- 													<input class="form-check-input rounded-circle form-check-line-through p-2 form-check-input-primary" type="checkbox" id="checkbox-todo-0" />  -->
<!-- 													<label class="form-check-label mb-0 p-3" for="checkbox-todo-0">적외선치료</label> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="col-6"> -->
<!-- 												<label class="mb-0 p-3">물리</label> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-7">
				<div class="card p-1" style="height: 820px">
					<div>
						<ul class="nav nav-tabs" id="myTab" role="tablist">
						  <li class="nav-item text-center col-6" id="ptRoomLi">
						    <a class="nav-link active fw-semi-bold" id="home-tab" data-bs-toggle="tab" href="#tab-home" role="tab" aria-controls="tab-home" aria-selected="true">물리치료실</a>
						  </li>
						  <li class="nav-item text-center col-6" id="otRoomLi">
						    <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#tab-contact" role="tab" aria-controls="tab-contact" aria-selected="false">작업치료실</a>
						  </li>
						</ul>
					</div>
					<div class="row card-body pt-0">
						<div class="tab-content" id="myTabContent">
					<!-- 물리치료실 탭 -->
							<div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">

								<!-- 물리치료실 큰 바디  -->
								<div class="card-body text-center p-1 m-0">
									<table>
										<!-- 첫째줄 -->
										<tr>
											<c:forEach items="${roomList}" var="roomVO"> 
												<c:set value="${roomVO.physicalSckrm}" var="sckrm"/>
												<c:choose>
													<c:when test="${sckrm < 6 }">
														<c:if test="${roomVO.physicalSttus eq 'N' }">
															<td width="20%">
																<div class="card border border-secondary m-3" style="height: 200px; cursor: pointer">
																	<!-- 카드 헤더 시작 -->
																	<div class="card-header border-bottom p-2"
																		style="height: 35px; background-color: midnightblue">
																		<div class="row">
																			<div class="col-12 align-self-center">
																				<h5 class="text-center text-white mb-0 fw-semi-bold" id="header">${sckrm }번 침상</h5>
																			</div>
																		</div>
																	</div>
																	<!-- 카드 헤더 끝 -->
																	<!-- 카드 바디 시작 -->
																	<div class="row card-body pt-0">
																		<div class="tab-content">
																			<img class="p-4 mb-1" alt="" src="/resources/image/therapist/bed1.png" width="200px" id="image1">
																			<p class="fw-semi-bold">
																				<a class="icon-link icon-link-hover sttusN" id="${sckrm}"
																				 href="#!">환자배정<span class="bi fas fa-sign-in-alt"></span></a>
																			</p>
																		</div>
																	</div>
																	<!-- 카드 바디 끝 -->
																</div>
															</td>
														</c:if>
														<c:if test="${roomVO.physicalSttus eq 'Y' }">
															<td width="20%">
																	<div class="card  m-3 inTreatmentPatient" id="${roomVO.rceptNo }"  style="height: 200px; cursor: pointer;">
																		<!-- 카드 헤더 시작 -->
																		<div class="card-header border-bottom p-2"
																			style="height: 35px; background-color: #3e9500;">
																			<div class="row">
																				<div class="col-12 align-self-center">
																					<h5 class="text-center text-white mb-0 fw-semi-bold" >치료중</h5>
																				</div>
																			</div>
																		</div>
																		<!-- 카드 헤더 끝 -->
																		<!-- 카드 바디 시작 -->
																		<div class="card-body sttusY pb-0" id="${sckrm}">
																			<div class="row text-center fw-semi-bold">
																				<div class="col-12 pb-3">
																					${roomVO.patntNm } 환자 <br>
																					<fmt:parseDate var="birthDate" value="${roomVO.patntRrno1 }" pattern="yyMMdd" />
																					<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																				</div>
																			</div>
																				<p class="fw-semi-bold">치료사 ${roomVO.empNm}</p>
																			<div class="btn-group">
																			  <button class="btn dropdown-toggle mb-2 btn-success" style="background-color: #3e9500;" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">치료상태
																			  </button>
																			  <div class="dropdown-menu">
																			    <a class="dropdown-item" href="#" onclick="sttusCp('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')" >치료완료</a>
																			    <a class="dropdown-item" href="#" onclick="sttusOt('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')">작업치료실 이동</a>
																			  </div>
																			</div>
																		</div>
																		<!-- 카드 바디 끝 -->
																	</div>
																</td>															
														</c:if>
													</c:when>
												</c:choose>
											</c:forEach>
										</tr>
									
										<!-- 둘째줄 -->
										<tr>
											<c:forEach items="${roomList}" var="roomVO"> 
												<c:set value="${roomVO.physicalSckrm}" var="sckrm"/>
												<c:choose>
													<c:when test="${sckrm > 5 && sckrm < 11 }">
														<c:if test="${roomVO.physicalSttus eq 'N' }">
															<td width="20%">
																<div class="card border border-secondary m-3" style="height: 200px; cursor: pointer">
																	<!-- 카드 헤더 시작 -->
																	<div class="card-header border-bottom p-2"
																		style="height: 35px; background-color: midnightblue">
																		<div class="row">
																			<div class="col-12 align-self-center">
																				<h5 class="text-center text-white mb-0 fw-semi-bold" id="header">${sckrm }번 침상</h5>
																			</div>
																		</div>
																	</div>
																	<!-- 카드 헤더 끝 -->
																	<!-- 카드 바디 시작 -->
																	<div class="row card-body pt-0">
																		<div class="tab-content">
																			<img class="p-4 mb-1" alt="" src="/resources/image/therapist/bed1.png" width="200px" id="image1">
																			<p class="fw-semi-bold">
																				<a class="icon-link icon-link-hover sttusN" id="${sckrm}"
																				 href="#!">환자배정<span class="bi fas fa-sign-in-alt"></span></a>
																			</p>
																		</div>
																	</div>
																	<!-- 카드 바디 끝 -->
																</div>
															</td>
														</c:if>
														<c:if test="${roomVO.physicalSttus eq 'Y' }">
															<td width="20%">
																<div class="card  m-3 inTreatmentPatient" id="${roomVO.rceptNo }"  style="height: 200px; cursor: pointer;">
																	<!-- 카드 헤더 시작 -->
																	<div class="card-header border-bottom p-2"
																		style="height: 35px; background-color: #3e9500;">
																		<div class="row">
																			<div class="col-12 align-self-center">
																				<h5 class="text-center text-white mb-0 fw-semi-bold" >치료중</h5>
																			</div>
																		</div>
																	</div>
																	<!-- 카드 헤더 끝 -->
																	<!-- 카드 바디 시작 -->
																	<div class="card-body sttusY pb-0" id="${sckrm}">
																		<div class="row text-center fw-semi-bold">
																			<div class="col-12 pb-3">
																				${roomVO.patntNm } 환자 <br>
																				<fmt:parseDate var="birthDate" value="${roomVO.patntRrno1 }" pattern="yyMMdd" />
																				<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																			</div>
																		</div>
																			<p class="fw-semi-bold">치료사 ${roomVO.empNm}</p>
																		<div class="btn-group">
																		  <button class="btn dropdown-toggle mb-2 btn-success" style="background-color: #3e9500;" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">치료상태
																		  </button>
																		  <div class="dropdown-menu">
																		    <a class="dropdown-item" href="#" onclick="sttusCp('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')" >치료완료</a>
																		    <a class="dropdown-item" href="#" onclick="sttusOt('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')">작업치료실 이동</a>
																		  </div>
																		</div>
																	</div>
																	<!-- 카드 바디 끝 -->
																</div>
															</td>															
														</c:if>
													</c:when>
												</c:choose>
											</c:forEach>
										</tr>
										<!-- 세번째 줄  -->
										<tr>
											<c:forEach items="${roomList}" var="roomVO"> 
												<c:set value="${roomVO.physicalSckrm}" var="sckrm"/>
												<c:choose>
													<c:when test="${sckrm > 10 && sckrm < 16 }">
														<c:if test="${roomVO.physicalSttus eq 'N' }">
															<td width="20%">
																<div class="card border border-secondary m-3" style="height: 200px; cursor: pointer">
																	<!-- 카드 헤더 시작 -->
																	<div class="card-header border-bottom p-2"
																		style="height: 35px; background-color: midnightblue">
																		<div class="row">
																			<div class="col-12 align-self-center">
																				<h5 class="text-center text-white mb-0 fw-semi-bold" id="header">${sckrm }번 침상</h5>
																			</div>
																		</div>
																	</div>
																	<!-- 카드 헤더 끝 -->
																	<!-- 카드 바디 시작 -->
																	<div class="row card-body pt-0">
																		<div class="tab-content">
																			<img class="p-4 mb-1" alt="" src="/resources/image/therapist/bed1.png" width="200px" id="image1">
																			<p class="fw-semi-bold">
																				<a class="icon-link icon-link-hover sttusN" id="${sckrm}"
																				 href="#!">환자배정<span class="bi fas fa-sign-in-alt"></span></a>
																			</p>
																		</div>
																	</div>
																	<!-- 카드 바디 끝 -->
																</div>
															</td>
														</c:if>
														<c:if test="${roomVO.physicalSttus eq 'Y' }">
															<td width="20%">
																<div class="card m-3 inTreatmentPatient" id="${roomVO.rceptNo }"  style="height: 200px; cursor: pointer;">
																	<!-- 카드 헤더 시작 -->
																	<div class="card-header border-bottom p-2"
																		style="height: 35px; background-color: #3e9500;">
																		<div class="row">
																			<div class="col-12 align-self-center">
																				<h5 class="text-center text-white mb-0 fw-semi-bold" >치료중</h5>
																			</div>
																		</div>
																	</div>
																	<!-- 카드 헤더 끝 -->
																	<!-- 카드 바디 시작 -->
																	<div class="card-body sttusY pb-0" id="${sckrm}">
																		<div class="row text-center fw-semi-bold">
																			<div class="col-12 pb-3">
																				${roomVO.patntNm } 환자 <br>
																				<fmt:parseDate var="birthDate" value="${roomVO.patntRrno1 }" pattern="yyMMdd" />
																				<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																			</div>
																		</div>
																			<p class="fw-semi-bold">치료사 ${roomVO.empNm}</p>
																		<div class="btn-group">
																		  <button class="btn dropdown-toggle mb-2 btn-success" style="background-color: #3e9500;" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">치료상태
																		  </button>
																		  <div class="dropdown-menu">
																		    <a class="dropdown-item" href="#" onclick="sttusCp('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')" >치료완료</a>
																		    <a class="dropdown-item" href="#" onclick="sttusOt('${roomVO.physicalSckrm}','${roomVO.rceptNo}','${roomVO.patntNo}')">작업치료실 이동</a>
																		  </div>
																		</div>
																	</div>
																	<!-- 카드 바디 끝 -->
																</div>
															</td>															
														</c:if>
													</c:when>
												</c:choose>
											</c:forEach>
										</tr>

										
									</table>
								</div>
							</div>

							<!-- 작업치료실 탭 -->
							<div class="tab-pane fade" id="tab-contact" role="tabpanel" aria-labelledby="contact-tab">
							
								<c:set value="${oTList }" var="oTList"/>
								
									<div class="row pt-3">

									<!-- when : t1 진료실에 현재 배정된 환자가 있을 때 -->
									<!-- otherwise: t1 진료실에 현재 배정된 환자가 없을 때 -->
									<c:set var="t1" value="0" />
									<c:choose>
										<c:when test="${not empty oTList }">
											<c:forEach items="${oTList }" var="oTList">
												<c:if test="${oTList.rceptClnc eq 't1' }">
													<div class="col-6">
														<div class="card tRoomO"
															id="${oTList.rceptNo }"
															style="height: 320px; cursor: pointer;">
															<div class="card-header border-bottom p-2"
																style="height: 35px; background-color: #3e9500;">
																<div class="row">
																	<div class="col-12 align-self-center">
																		<h5 class="text-center text-white mb-0 fw-semi-bold"
																			id="">1 작업치료실 - ${oTList.empNm }</h5>
																	</div>
																</div>
															</div>
															<div class="card-body">
																<div class="row g-3 h-100">
																	<div class="col-sm-6 col-lg-12">
																		<div class="card position-relative rounded-4">
																			<div class="card-body p-3"
																				style="height: 180px;">
																				<div class="row">
																					<p class="fw-semi-bold ps-4 mb-2">현재 처방중인 치료</p>
																					<c:if test="${not empty oTList.mtList }">
																						<ul class="ms-3 ps-5" style="height: 120px; overflow-y: auto;">
																							<c:forEach items="${oTList.mtList }" var="mt">
																								<li>${mt.mdlrtNm }</li>
																							</c:forEach>
																						</ul>
																					</c:if>
																				</div>
																				<img
																					class="position-absolute end-0 bottom-0 mb-2 me-2"
																					src="/resources/image/therapist/patient.png" alt=""
																					width="70" />
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 col-lg-12">
																		<table
																			class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																			<tbody>
																				<tr>
																					<td class="p-1" style="width: 25%;">환자명:</td>
																					<td class="p-1 text-600">${oTList.patntNm } 환자</td>
																					<td class="text-end" rowspan="2">
																						<button class="endTBtn btn btn-success"
																							id="${oTList.rceptNo }" type="button"
																							style="background-color: #3e9500;">치료완료</button>
																					</td>
																				</tr>
																				<tr>
																					<td class="p-1" style="width: 25%;">생년월일:</td>
																					<td class="p-1 text-600">
																						<fmt:parseDate var="birthDate" value="${oTList.patntRrno1 }" pattern="yyMMdd" />
																						<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<c:set var="t1" value="1" />
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<c:if test="${t1 == '0'}">
										<div class="col-6">
											<div class="card  tRoom" id="t1"
												style="height: 320px;">

												<div class="card-header border-bottom p-2"
													style="height: 35px; background-color: midnightblue;">
													<div class="row">
														<div class="col-12 align-self-center">
															<h5 class="text-center text-white mb-0 fw-semi-bold"
																id="">1 작업치료실</h5>
														</div>
													</div>
												</div>

												<div class="card-body">
													<div class="row g-3 h-100">
														<div class="col-sm-6 col-lg-12">
															<div class="card position-relative rounded-4">
																<div class="card-body p-4 pt-xxl-4"
																	style="height: 180px;">
																	<div class="row">
																		<img class="position-absolute end-0 bottom-0 p-5 mt-3"
																			alt="plus" src="/resources/image/therapist/plus.png"
																			style="cursor: pointer;">
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6 col-lg-12">
															<table
																class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																<tbody>
																	<tr>
																		<td class="p-1" style="width: 25%;">환자명:</td>
																		<td class="p-1 text-600">
																			<!--환자명  -->
																		</td>
																		<td class="text-end" rowspan="2">
																			<button class="endTBtn btn btn-secondary"
																				type="button"
																				style="background-color: midnightblue;">미배정</button>
																		</td>
																	</tr>
																	<tr>
																		<td class="p-1" style="width: 25%;">생년월일:</td>
																		<td class="p-1 text-600">
																			<!--생년월일  -->
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>
										</div>
									</c:if>







									<!-- when : t2 진료실에 현재 배정된 환자가 있을 때 -->
										<!-- otherwise: t2 진료실에 현재 배정된 환자가 없을 때 -->
									<c:set var="t2" value="0" />
									<c:choose>
										<c:when test="${not empty oTList }">
											<c:forEach items="${oTList }" var="oTList">
												<c:if test="${oTList.rceptClnc eq 't2' }">
													<div class="col-6">
														<div class="card tRoomO"
															id="${oTList.rceptNo }"
															style="height: 320px; cursor: pointer;">
															<div class="card-header border-bottom p-2"
																style="height: 35px; background-color: #3e9500;">
																<div class="row">
																	<div class="col-12 align-self-center">
																		<h5 class="text-center text-white mb-0 fw-semi-bold"
																			id="">2 작업치료실 - ${oTList.empNm }</h5>
																	</div>
																</div>
															</div>
															<div class="card-body">
																<div class="row g-3 h-100">
																	<div class="col-sm-6 col-lg-12">
																		<div class="card position-relative rounded-4">
																			<div class="card-body p-3"
																				style="height: 180px;">
																				<div class="row">
																					<p class="fw-semi-bold ps-4 mb-2">현재 처방중인 치료</p>
																					<c:if test="${not empty oTList.mtList }">
																						<ul class="ms-3 ps-5" style="height: 120px; overflow-y: auto;">
																							<c:forEach items="${oTList.mtList }" var="mt">
																								<li>${mt.mdlrtNm }</li>
																							</c:forEach>
																						</ul>
																					</c:if>
																				</div>
																				<img
																					class="position-absolute end-0 bottom-0 mb-2 me-2"
																					src="/resources/image/therapist/patient.png" alt=""
																					width="70" />
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 col-lg-12">
																		<table
																			class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																			<tbody>
																				<tr>
																					<td class="p-1" style="width: 25%;">환자명:</td>
																					<td class="p-1 text-600">${oTList.patntNm } 환자</td>
																					<td class="text-end" rowspan="2">
																						<button class="endTBtn btn btn-success"
																							id="${oTList.rceptNo }" type="button"
																							style="background-color: #3e9500;">치료완료</button>
																					</td>
																				</tr>
																				<tr>
																					<td class="p-1" style="width: 25%;">생년월일:</td>
																					<td class="p-1 text-600">
																						<fmt:parseDate var="birthDate" value="${oTList.patntRrno1 }" pattern="yyMMdd" />
																						<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<c:set var="t2" value="1" />
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<c:if test="${t2 == '0'}">
										<div class="col-6">
											<div class="card  tRoom" id="t2"
												style="height: 320px;">

												<div class="card-header border-bottom p-2"
													style="height: 35px; background-color: midnightblue;">
													<div class="row">
														<div class="col-12 align-self-center">
															<h5 class="text-center text-white mb-0 fw-semi-bold"
																id="">2 작업치료실</h5>
														</div>
													</div>
												</div>

												<div class="card-body">
													<div class="row g-3 h-100">
														<div class="col-sm-6 col-lg-12">
															<div class="card position-relative rounded-4">
																<div class="card-body p-4 pt-xxl-4"
																	style="height: 180px;">
																	<div class="row">
																		<img class="position-absolute end-0 bottom-0 p-5 mt-3"
																			alt="plus" src="/resources/image/therapist/plus.png"
																			style="cursor: pointer;">
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6 col-lg-12">
															<table
																class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																<tbody>
																	<tr>
																		<td class="p-1" style="width: 25%;">환자명:</td>
																		<td class="p-1 text-600">
																			<!--환자명  -->
																		</td>
																		<td class="text-end" rowspan="2">
																			<button class="endTBtn btn btn-secondary"
																				type="button"
																				style="background-color: midnightblue;">미배정</button>
																		</td>
																	</tr>
																	<tr>
																		<td class="p-1" style="width: 25%;">생년월일:</td>
																		<td class="p-1 text-600">
																			<!--생년월일  -->
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>
										</div>
									</c:if>
									</div>



									<div class="row pt-3">
										<!-- when : t3 진료실에 현재 배정된 환자가 있을 때 -->
										<!-- otherwise: t3 진료실에 현재 배정된 환자가 없을 때 -->
										<c:set var="t3" value="0" />
									<c:choose>
										<c:when test="${not empty oTList }">
											<c:forEach items="${oTList }" var="oTList">
												<c:if test="${oTList.rceptClnc eq 't3' }">
													<div class="col-6">
														<div class="card tRoomO"
															id="${oTList.rceptNo }"
															style="height: 320px; cursor: pointer;">
															<div class="card-header border-bottom p-2"
																style="height: 35px; background-color: #3e9500;">
																<div class="row">
																	<div class="col-12 align-self-center">
																		<h5 class="text-center text-white mb-0 fw-semi-bold"
																			id="">3 작업치료실 - ${oTList.empNm }</h5>
																	</div>
																</div>
															</div>
															<div class="card-body">
																<div class="row g-3 h-100">
																	<div class="col-sm-6 col-lg-12">
																		<div class="card position-relative rounded-4">
																			<div class="card-body p-3"
																				style="height: 180px;">
																				<div class="row">
																					<p class="fw-semi-bold ps-4 mb-2">현재 처방중인 치료</p>
																					<c:if test="${not empty oTList.mtList }">
																						<ul class="ms-3 ps-5" style="height: 120px; overflow-y: auto;">
																							<c:forEach items="${oTList.mtList }" var="mt">
																								<li>${mt.mdlrtNm }</li>
																							</c:forEach>
																						</ul>
																					</c:if>
																				</div>
																				<img
																					class="position-absolute end-0 bottom-0 mb-2 me-2"
																					src="/resources/image/therapist/patient.png" alt=""
																					width="70" />
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 col-lg-12">
																		<table
																			class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																			<tbody>
																				<tr>
																					<td class="p-1" style="width: 25%;">환자명:</td>
																					<td class="p-1 text-600">${oTList.patntNm } 환자</td>
																					<td class="text-end" rowspan="2">
																						<button class="endTBtn btn btn-success"
																							id="${oTList.rceptNo }" type="button"
																							style="background-color: #3e9500;">치료완료</button>
																					</td>
																				</tr>
																				<tr>
																					<td class="p-1" style="width: 25%;">생년월일:</td>
																					<td class="p-1 text-600">
																						<fmt:parseDate var="birthDate" value="${oTList.patntRrno1 }" pattern="yyMMdd" />
																						<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<c:set var="t3" value="1" />
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<c:if test="${t3 == '0'}">
										<div class="col-6">
											<div class="card  tRoom" id="t3" style="height: 320px;">

												<div class="card-header border-bottom p-2"
													style="height: 35px; background-color: midnightblue;">
													<div class="row">
														<div class="col-12 align-self-center">
															<h5 class="text-center text-white mb-0 fw-semi-bold"
																id="">3 작업치료실</h5>
														</div>
													</div>
												</div>

												<div class="card-body">
													<div class="row g-3 h-100">
														<div class="col-sm-6 col-lg-12">
															<div class="card position-relative rounded-4">
																<div class="card-body p-4 pt-xxl-4"
																	style="height: 180px;">
																	<div class="row">
																		<img class="position-absolute end-0 bottom-0 p-5 mt-3"
																			alt="plus" src="/resources/image/therapist/plus.png"
																			style="cursor: pointer;">
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6 col-lg-12">
															<table
																class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																<tbody>
																	<tr>
																		<td class="p-1" style="width: 25%;">환자명:</td>
																		<td class="p-1 text-600">
																			<!--환자명  -->
																		</td>
																		<td class="text-end" rowspan="2">
																			<button class="endTBtn btn btn-secondary"
																				type="button"
																				style="background-color: midnightblue;">미배정</button>
																		</td>
																	</tr>
																	<tr>
																		<td class="p-1" style="width: 25%;">생년월일:</td>
																		<td class="p-1 text-600">
																			<!--생년월일  -->
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>
										</div>
									</c:if>



										<!-- when : t4 진료실에 현재 배정된 환자가 있을 때 -->
										<!-- otherwise: t4 진료실에 현재 배정된 환자가 없을 때 -->
										<c:set var="t4" value="0" />
									<c:choose>
										<c:when test="${not empty oTList }">
											<c:forEach items="${oTList }" var="oTList">
												<c:if test="${oTList.rceptClnc eq 't4' }">
													<div class="col-6">
														<div class="card tRoomO"
															id="${oTList.rceptNo }"
															style="height: 320px; cursor: pointer;">
															<div class="card-header border-bottom p-2"
																style="height: 35px; background-color: #3e9500;">
																<div class="row">
																	<div class="col-12 align-self-center">
																		<h5 class="text-center text-white mb-0 fw-semi-bold"
																			id="">4 작업치료실 - ${oTList.empNm }</h5>
																	</div>
																</div>
															</div>
															<div class="card-body">
																<div class="row g-3 h-100">
																	<div class="col-sm-6 col-lg-12">
																		<div class="card position-relative rounded-4">
																			<div class="card-body p-3"
																				style="height: 180px;">
																				<div class="row">
																					<p class="fw-semi-bold ps-4 mb-2">현재 처방중인 치료</p>
																					<c:if test="${not empty oTList.mtList }">
																						<ul class="ms-3 ps-5" style="height: 120px; overflow-y: auto;">
																							<c:forEach items="${oTList.mtList }" var="mt">
																								<li>${mt.mdlrtNm }</li>
																							</c:forEach>
																						</ul>
																					</c:if>
																				</div>
																				<img
																					class="position-absolute end-0 bottom-0 mb-2 me-2"
																					src="/resources/image/therapist/patient.png" alt=""
																					width="70" />
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6 col-lg-12">
																		<table
																			class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																			<tbody>
																				<tr>
																					<td class="p-1" style="width: 25%;">환자명:</td>
																					<td class="p-1 text-600">${oTList.patntNm } 환자</td>
																					<td class="text-end" rowspan="2">
																						<button class="endTBtn btn btn-success"
																							id="${oTList.rceptNo }" type="button"
																							style="background-color: #3e9500;">치료완료</button>
																					</td>
																				</tr>
																				<tr>
																					<td class="p-1" style="width: 25%;">생년월일:</td>
																					<td class="p-1 text-600">
																						<fmt:parseDate var="birthDate" value="${oTList.patntRrno1 }" pattern="yyMMdd" />
																						<fmt:formatDate value="${birthDate}" pattern="yyyy.MM.dd" />
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<c:set var="t4" value="1" />
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<c:if test="${t4 == '0'}">
										<div class="col-6">
											<div class="card tRoom" id="t4"
												style="height: 320px;">

												<div class="card-header border-bottom p-2"
													style="height: 35px; background-color: midnightblue;">
													<div class="row">
														<div class="col-12 align-self-center">
															<h5 class="text-center text-white mb-0 fw-semi-bold"
																id="">4 작업치료실</h5>
														</div>
													</div>
												</div>

												<div class="card-body">
													<div class="row g-3 h-100">
														<div class="col-sm-6 col-lg-12">
															<div class="card position-relative rounded-4">
																<div class="card-body p-4 pt-xxl-4"
																	style="height: 180px;">
																	<div class="row">
																		<img class="position-absolute end-0 bottom-0 p-5 mt-3"
																			alt="plus" src="/resources/image/therapist/plus.png"
																			style="cursor: pointer;">
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6 col-lg-12">
															<table
																class="table table-borderless fw-medium font-sans-serif fs--1 mb-2">
																<tbody>
																	<tr>
																		<td class="p-1" style="width: 25%;">환자명:</td>
																		<td class="p-1 text-600">
																			<!--환자명  -->
																		</td>
																		<td class="text-end" rowspan="2">
																			<button class="endTBtn btn btn-secondary"
																				type="button"
																				style="background-color: midnightblue;">미배정</button>
																		</td>
																	</tr>
																	<tr>
																		<td class="p-1" style="width: 25%;">생년월일:</td>
																		<td class="p-1 text-600">
																			<!--생년월일  -->
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>
										</div>
									</c:if>
									</div>
							</div>
					</div>
				</div>
			</div>

			
		</div>
	</div>
</div>

<!-- 작업치료 완료 처리 -->
<form action="/mediform/therapist/therapyRoom/update" method="post" id="tEndForm">
	<input type="hidden" id="tEndRceptNo" name="rceptNo">
	<input type="hidden" id="tEndPatntNo" name=patntNo>
	<input type="hidden" id="tEndClnicNo" name="clnicNo">
	<sec:csrfInput/>
</form>


<!-- 작업치료실 배정 -->
<form action="/mediform/therapist/therapyRoom/registration" method="post" id="therapyRoom">
	<input type="hidden" id="therapyRoomRceptNoInput" name="rceptNo"/>
	<input type="hidden" id="therapyRoomPatntNoInput" name="patntNo"/>
	<input type="hidden" id="therapyRoomClnicNo" name="rceptClnc"/>
	<input type="hidden" id="therapyRoomMdlrtCurer" name="mdlrtCurer" value="${customUser.username}"/>
	<sec:csrfInput/>
</form>


<!-- 물리치료 배정 -->
<form action="/mediform/therapist/physicalClinicRoom/registration" method="post" id="insertPhysicalClinicRoom">
	<input type="hidden" id="rceptNoInput" name="rceptNo">
	<input type="hidden" id="patntNoInput" name=patntNo>
	<input type="hidden" id="physicalSckrmInput" name="physicalSckrm">
	<input type="hidden" id="physicalRoomMdlrtCurer" name="mdlrtCurer" value="${customUser.username}"/>
	<sec:csrfInput/>
</form>

<!-- 치료상태 > 치료완료 처리 -->
<form name="frmRceptSttusCp" action="/mediform/therapist/physicalClinicRoom/updateRceptSttusCp" method="post">
	<input type="hidden" name="physicalSckrm" />
	<input type="hidden" name="rceptNo" />
	<input type="hidden" name="patntNo" />
	<sec:csrfInput/>
</form>

<!-- 치료상태 > 작업치료실로 이동  -->
<form name="frmRceptSttusOt" action="/mediform/therapist/physicalClinicRoom/updateRceptSttusOt" method="post">
	<input type="hidden" name="physicalSckrm" />
	<input type="hidden" name="rceptNo" />
	<input type="hidden" name="patntNo" />
	<sec:csrfInput/>
</form>

<input type="hidden" id="therapyFlag" value="물리">
<input type="hidden" id="roomFlag" value="물리">

<!-- 작업 페이지 이동을 위한 flag -->
<input type="hidden" id="otFlag" value="${otFlag }">



</body>
<script>
//시큐리티 토큰 관련 2개
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

// console.log("sessionUserNm : " + ${sessionUserNm})
$('#ptRoomLi').on('click', function(){
	var roomFlag = $('#roomFlag');
	roomFlag.val("물리");
});

$('#otRoomLi').on('click', function(){
	var roomFlag = $('#roomFlag');
	roomFlag.val("작업");
});

$('#therapyPtLi').on('click', function(){
	var therapyFlag = $('#therapyFlag');
	therapyFlag.val("물리");
	
// 	console.log("therapyPtLi click.. : " + therapyFlag.val());
});
$('#therapyOtLi').on('click', function(){
	var therapyFlag = $('#therapyFlag');
	therapyFlag.val("작업");
// 	console.log("therapyOtLi click.. : " + therapyFlag.val());
});

// 물리치료실> 치료상태 > 치료완료 클릭 시 실행
function sttusCp(physicalSckrm, rceptNo, patntNo){
	
	console.log("rceptNo : " + rceptNo);
	
	Swal.fire({
	      icon: 'info',
	      title: '치료완료',
	      text: '물리 치료를 완료하시겠습니까 ?',
	      showCancelButton: true,
	      confirmButtonText: '확인',
	      cancelButtonText: '취소',
	      confirmButtonColor: 'midnightblue',
	      cancelButtonColor: 'red', // cancel 버튼 색깔 지정
	    }).then(result => {
	    	if(result.isConfirmed){
	    		
	    		// 잔여 작업 치료 여부 체크
	    		if(rceptNo != null && rceptNo != ""){
	    			var data = {
	    					rceptNo : rceptNo
	    					};
	    			
	    			$.ajax({
	    				type : "post",
	    				url  : "/mediform/therapist/physicalClinicRoom/medicalTreatmentRecord/check",
	    				data : JSON.stringify(data),
	    				contentType : "application/json; charset=utf-8",
	    		        beforeSend : function(xhr){
	    		            //ajax호출 중 처리
	    		            //글로벌 변수로 설정한 csrf token 셋팅
	    		            xhr.setRequestHeader(header,token);
	    		        },
	    				success : function(rst){
	    					console.log("rst : ", rst);
	    					if(rst != null && rst === "success"){
		    					// 잔여 작업 치료가 없을 시 
		    		    		document.frmRceptSttusCp.physicalSckrm.value = physicalSckrm;
		    		    		document.frmRceptSttusCp.rceptNo.value = rceptNo;
		    		    		document.frmRceptSttusCp.patntNo.value = patntNo;
		    		    		
		    		    		if(physicalSckrm==""){
		    		    			alert("physicalSckrm가 없습니다.");
		    		    			return;
		    		    		}
		    		    		if(rceptNo==""){
		    		    			alert("rceptNo가 없습니다.");
		    		    			return;
		    		    		}
		    		    		if(patntNo==""){
		    		    			alert("patntNo가 없습니다.");
		    		    			return;
		    		    		}
		    		    		
		    		    		document.frmRceptSttusCp.submit();
	    					}else if(rst != null && rst === "failed"){
	    						Swal.fire({
	    						      icon: 'error',
	    						      title: '실행 결과',
	    						      text: '잔여 치료 내역이 있습니다.',
	    						      confirmButtonText: '확인',
	    						      confirmButtonColor: 'midnightblue',
	    						    });
	    					}
	    				},
	    				error : function(err){
	    					console.log("err에러 : " + err);
	    				}
	    				
	    			});
	    		}
	    		
	    		
	    		
	    	}
	    		
	    });
}

// 물리치료실 > 치료상태 > 작업치료실로 이동 클릭 시 실행
function sttusOt(physicalSckrm, rceptNo, patntNo){
	
	Swal.fire({
	      icon: 'info',
	      title: '작업치료실 이동',
	      text: '환자를 작업치료 대기실로 이동하시겠습니까 ?',
	      showCancelButton: true,
	      confirmButtonText: '확인',
	      cancelButtonText: '취소',
	      confirmButtonColor: 'midnightblue',
	      cancelButtonColor: 'red', // cancel 버튼 색깔 지정
	    }).then(result => {
	    	if(result.isConfirmed){
				console.log("physicalSckrm : " + physicalSckrm + ", rceptNo : " + rceptNo + ", patntNo : " + patntNo);
				
				document.frmRceptSttusOt.physicalSckrm.value = physicalSckrm;
				document.frmRceptSttusOt.rceptNo.value = rceptNo;
				document.frmRceptSttusOt.patntNo.value = patntNo;
				
				if(physicalSckrm==""){
					alert("physicalSckrm가 없습니다.");
					return;
				}
				if(rceptNo==""){
					alert("rceptNo가 없습니다.");
					return;
				}
				if(patntNo==""){
					alert("patntNo가 없습니다.");
					return;
				}
				
				document.frmRceptSttusOt.submit();
	    		}
	    });
	
	
}


// 작업 치료실 배정
$(".tRoom").click(function () {
	
	var rceptClnc = $(this).attr("id"); // 진료실
	var therapyRoom = $("#therapyRoom");
	
	
	console.log(">>>작업치료실 번호 >>> " + rceptClnc);
	
	// 환자 번호
    var patntNo = $('#patntNo').val();
    
    // 접수 번호 
    var rceptNo = $('#rceptNo').val();
    
    
    $("#therapyRoomClnicNo").val(rceptClnc);
    
    console.log("#therapyRoomClnicNo value 값 >>> " + $("#therapyRoomClnicNo").val());
    
    // 환자 널 체킹
    if (patntNo == null || patntNo == "") {
        Swal.fire({
            icon: 'error',
            title: '오류',
            text: '선택된 환자가 없습니다.',
            confirmButtonColor: 'midnightblue'
        });
        return;
    }
	
    
 // 작업 치료 체크 여부를 확인하는 플래그
    var isPhysicalChecked = true;

    // 치료 오더에서 '작업'인 애들을 반복문 돌림 
    $('.orderCheckBox[data-mdlrtcl="작업"]').each(function() {
    	// 체크 되어있으면 그냥 넘어가시고
        if ($(this).is(':checked')) {
//	            console.log("true : " + $(this).data("mdlrtcd"));
        }else{
        	// 혹시라도 체크 되어 있는 놈이 없으면 false
        	isPhysicalChecked = false;
        	console.log("false : " + $(this).data("mdlrtcd"));
        	return;
        }
    });
    
    
    if (isPhysicalChecked) {
        // 모두 체크되면
//	        console.log("Submit the form");
	    
	    $('#therapyRoomRceptNoInput').val(rceptNo);
	    $('#therapyRoomPatntNoInput').val(patntNo);
	    $("#therapyRoomClnicNo").val(rceptClnc);
// 	    console.log("서브밋 하기 직전 진료실 번호 >>>> !!!!" + $("#therapyRoomClnicNo").val());
// 	    console.log("서브밋 하기 직전 진료실 번호 >>>> !!!! (변수 자체) >>> " + rceptClnc);
	    $("#therapyRoomClnicNo").val(rceptClnc);
	    
	    therapyRoom.submit();
	    
	    // alert("sttusN 실행. 방 번호 : " + physicalSckrm);
    } else {
        Swal.fire({
            icon: 'error',
            title: '오류',
            text: '작업 치료가 체크되어 있지 않습니다.',
            confirmButtonColor: 'blue'
        });
        event.preventDefault(); // 폼 제출을 막음
        return;
    }
});


// 작업치료실 치료완료 버튼 클릭시 실행
$(".endTBtn").click(function(){
	
// 	console.log("작업치료실 치료완료 버튼 클릭 이벤트!!!");
	
	var rceptNo = $(this).attr("id");
	var tEndForm = $("#tEndForm");
	
// 	console.log("클릭한 접수 번호 >>>> " + rceptNo);
// 	selectPatientAjax(rceptNo);
	
	Swal.fire({
	      icon: 'info',
	      title: '작업치료 완료',
	      text: '작업 치료를 완료하시겠습니까 ?',
	      showCancelButton: true,
	      confirmButtonText: '확인',
	      cancelButtonText: '취소',
	      confirmButtonColor: 'midnightblue',
	      cancelButtonColor: 'red', // cancel 버튼 색깔 지정
	    }).then(result => {
	    	if(result.isConfirmed){
	    		
	    		$("#tEndRceptNo").val(rceptNo);
// 	    		console.log("접수 번호 >>>> " + rceptNo);
 	    		tEndForm.submit();
	    		
	    		}
	    });
	
	
	
});





$(function(){
	$(document).ready(function() {
	    msgFunction();
	    
	    var otFlag = $('#otFlag').val();
	    if(otFlag != null && otFlag == "ot"){
	    	$('#therapyOtLi').click();
	    }
	    
	    // 생년월일(00년생 처리 부분)
	    $('.patntRrno1Td').each(function(){
	    	// 화면단에 출력될 rrno값을 가져온 후
	    	var thisRrno = $(this).text();
	    	// 00년생 처리 후 다시 값 넣어주기
	    	$(this).text(formatBirthday(thisRrno));
	    });
    
	});

	// 치료중인 환자를 클릭했을 때 환자 상세정보, 오더 내역 출력해주는 ajax
	$('.inTreatmentPatient').on('click', function(){
		
		var rceptNo = $(this).attr("id");
// 		 	console.log("!rceptNo : " + rceptNo);
		
		// 환자 조회 ajax 호출
		selectPatientAjax(rceptNo);
		
	});
	
	//위에서 뿌려준 환자 정보 클릭 이벤트 시작(드롭다운 div 안에 있는 <h6>태그 요소를 전부 가져와 클릭 이벤트 발생 시 작동)
	$('.onePatient').on('click', function(){
		
		var rceptNo = $(this).attr("id");
//	 	console.log("rceptNo : " + rceptNo);
		
		// 환자 조회 ajax 호출
		selectPatientAjax(rceptNo);
		
	});
	

	$(".tRoomO").click(function(){
		
		console.log("작업치료실 진료중인 카드 클릭 이벤트!!!");
		
		var rceptNo = $(this).attr("id");
		
// 		console.log("클릭한 접수 번호 >>>> " + rceptNo);
	 	selectPatientAjax(rceptNo);
		
		
	});
	
	
	// 빈 치료실 클릭 이벤트
	$('.sttusN').on('click', function(event) {
	    event.preventDefault(); // 폼 제출을 막음
	    
	    // 물리/작업 구분
		var therapyFlag = $('#therapyFlag').val();
	    
	    if(therapyFlag != null && therapyFlag === "물리"){
		    // 치료실 번호
		    var physicalSckrm = $(this).attr("id");
		    
		    // 환자 번호
		    var patntNo = $('#patntNo').val();
		    
		    // 접수 번호 
		    var rceptNo = $('#rceptNo').val();
	    	
		    // 환자 널 체킹
		    if (patntNo == null || patntNo == "") {
		        Swal.fire({
		            icon: 'error',
		            title: '오류',
		            text: '선택된 환자가 없습니다.',
		            confirmButtonColor: 'blue'
		        });
		        return;
		    }
		    
		 	// 물리 치료 체크 여부를 확인하는 플래그
		    var isPhysicalChecked = true;
		 	
		    // 치료 오더에서 '물리'인 애들을 반복문 돌림 
		    $('.orderCheckBox[data-mdlrtcl="물리"]').each(function() {
		    	// 체크 되어있으면 그냥 넘어가시고
		        if ($(this).is(':checked')) {
	// 	            console.log("true : " + $(this).data("mdlrtcd"));
		        }else{
		        	// 혹시라도 체크 되어 있는 놈이 없으면 false
		        	isPhysicalChecked = false;
		        	console.log("false : " + $(this).data("mdlrtcd"));
		        	return;
		        }
		    });
		 	
		    if (isPhysicalChecked) {
		        // 모두 체크되면
	// 	        console.log("Submit the form");
			    
			    $('#rceptNoInput').val(rceptNo);
			    $('#patntNoInput').val(patntNo);
			    $('#physicalSckrmInput').val(physicalSckrm);
			    
			    var insertPhysicalClinicRoom = $('#insertPhysicalClinicRoom');
				insertPhysicalClinicRoom.submit();
			    
			    // alert("sttusN 실행. 방 번호 : " + physicalSckrm);
		    } else {
		        Swal.fire({
		            icon: 'error',
		            title: '오류',
		            text: '물리 치료가 체크되어 있지 않습니다.',
		            confirmButtonColor: 'blue'
		        });
		        event.preventDefault(); // 폼 제출을 막음
		        return;
		    }
		
		
	    }else{
	    	// 작업치료 대기환자 탭을 클릭했을 시 
	    	Swal.fire({
	            icon: 'error',
	            title: '오류',
	            text: '오류가 발생했습니다.',
	            confirmButtonColor: 'blue'
	        });
	    	
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
	
	
	// 전화번호 형식을 변경하는 함수
	function formatPhoneNumber(phoneNumber) {
        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }
    
	
	function msgFunction(){
		var msg = $('#msg').val();
		console.log(msg);
		if (msg != null && msg != "" && msg == "y") {
			Swal.fire({
			      icon: 'success',
			      title: '실행 결과',
			      text: '정상적으로 처리 되었습니다.',
			      confirmButtonColor: 'blue'
			    });
		}else if(msg != null && msg != "" && msg == "n"){
			Swal.fire({
			      icon: 'error',
			      title: '실행 결과',
			      text: '해당 요청 실행 중 오류가 발생했습니다.',
			      confirmButtonColor: 'blue'
			    });
		}else if(msg != null && msg != "" && msg == "e"){
			Swal.fire({
			      icon: 'error',
			      title: '실행 결과',
			      text: '이미 본 과에 해당 직책이 존재합니다.',
			      confirmButtonColor: 'blue'
			    });
		}
	}
	
// 시큐리티 토큰 관련 2개
// var token = $("meta[name='_csrf']").attr("content");
// var header = $("meta[name='_csrf_header']").attr("content");



// 오더 내역 출력 스크립트
$('#orderListCardBody').on('change', '.orderCheckBox', function(){
	
	var rceptNo = $(this).data("rceptno");
	var mdlrtCd = $(this).data("mdlrtcd");
	var mdlrtrdChk = $(this).data("mdlrtrdchk");
	var formatMdlrtrdChk = "";
	if(mdlrtrdChk != null && mdlrtrdChk == "F"){
		formatMdlrtrdChk = "T";
	}else{
		formatMdlrtrdChk = "F";
	}
	var thisCheckBox = $(this);
	
	var sessionUserId = $('#sessionUserId').val();
// 	console.log("mdlrtrdChk : " + mdlrtrdChk);
// 	console.log("formatMdlrtrdChk : " + formatMdlrtrdChk);
	
// 	console.log("orderCheckBox클릭");
// 	console.log("rceptNo : " + rceptNo);
// 	console.log("mdlrtCd : " + mdlrtCd);
// 	console.log("mdlrtrdChk : " + mdlrtrdChk);
	
	var data = {
			rceptNo : rceptNo, 
			mdlrtCd : mdlrtCd, 
			mdlrtrdChk : mdlrtrdChk, 
			sessionUserId : sessionUserId
			};


	$.ajax({
		type : "post",
		url  : "/mediform/therapist/medicalTreatmentRecord/statusChange",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header,token);
        },
		success : function(rst){
// 			console.log("success formatMdlrtrdChk : " + formatMdlrtrdChk);
			thisCheckBox.data("mdlrtrdchk", formatMdlrtrdChk);
			if(rst != null && rst == "FAILED"){
				Swal.fire({
				      title: '오더 내역 수행 결과',
				      text: "업데이트에 실패 했습니다.",
				      icon: 'error',
				      showCancelButton: true,
				      cancelButtonColor: '#d33',
				      cancelButtonText: '닫기',
				      
				    });
			}
		},
		error : function(err){
			console.log("err에러 : " + err);
		}
		
	});
	
	
});

// 대기 환자 출력 스크립트
function selectPatientAjax(rceptNo){
	// 테이블용 환자 정보 ajax 시작
	var data = {
			rceptNo : rceptNo
			};
	
	$.ajax({
		type : "post",
		url  : "/mediform/therapist/patient/detail",
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
        beforeSend : function(xhr){
            //ajax호출 중 처리
            //글로벌 변수로 설정한 csrf token 셋팅
            xhr.setRequestHeader(header,token);
        },
		success : function(rst){
			
// 			console.log("ajax 성공...!");
			$('#rceptNo').val(rst.rceptNo);
			$('#patntNo').val(rst.patntNo);
			$('#patntNm').val(rst.patntNm);
			var sexStr = "";
			if(rst.patntSexdstn != null && rst.patntSexdstn == 'M'){
				sexStr = "남성";
			}else{
				sexStr = "여성";
			}
			$('#patntSexdstn').val(sexStr);
			$('#patntTelno').val(formatPhoneNumber(rst.patntTelno));
			$('#patntRrno1').val(formatBirthday(rst.patntRrno1));
			$('#patntAge').val(rst.patntAge+"세");

			var orderHTML = "";
			var dataList = rst.mtrList;
			var mdlrtrdChkStr = "";
			var orderListCardBody = $('#orderListCardBody');
			orderListCardBody.empty();
			var disabledFlag = "";
			
			var thisTherapyFlag = $('#therapyFlag').val();
			
			$.each(dataList, function(index, item){
				if(item.mdlrtrdChk != null && item.mdlrtrdChk == 'F'){
					mdlrtrdChkStr = "";
				}else{
					mdlrtrdChkStr = "checked='checked'";
				}
				
				
				// 여기
				// 물리/작업 여부에 따라 disabled 속성을 주기 위함
				if(item.mdlrtCl != null && item.mdlrtCl === thisTherapyFlag){
					disabledFlag = "";
				}else{
					disabledFlag = "disabled='disabled'"
				}
				
				var mdlrtCl = item.mdlrtCl;
	            var mdlrtClinfo="";
	            	if(mdlrtCl == "물리"){
	            		mdlrtClinfo = '<span class="badge rounded-pill badge-subtle-primary mt-3">물리</span>';
	            	}else{
	            		mdlrtClinfo = '<span class="badge rounded-pill badge-subtle-success mt-3">작업</span>';
	            	}
	            	
				orderHTML += "<div class='d-flex justify-content-between border-top hover-actions-trigger btn-reveal-trigger px-x1 border-200 todo-list-item'>";
				orderHTML += "<div class='col-8'>";
				orderHTML += "<div class='form-check mb-0 d-flex align-items-center'>";
				orderHTML += "<input class='orderCheckBox form-check-input rounded-circle form-check-line-through p-2 form-check-input-primary' data-mdlrtcl='" + item.mdlrtCl + "'data-mdlrtrdchk='" + item.mdlrtrdChk + "' data-rceptno='" + item.rceptNo + "' data-mdlrtcd='"+ item.mdlrtCd +"' type='checkbox'" + mdlrtrdChkStr + " id='checkbox-todo-0'"+ disabledFlag +" />" ;
				orderHTML += "<label class='form-check-label mb-0 p-3' for='checkbox-todo-0'>" + item.mdlrtNm + "</label>";
				orderHTML += "</div>";
				orderHTML += "</div>";
				orderHTML += "<div class='col-4'>";
				orderHTML += mdlrtClinfo;
				orderHTML += "</div>";
				orderHTML += "</div>";
				
			      
			});
			
			orderListCardBody.append(orderHTML);
		},
		error : function(err){
			console.log("err에러 : " + err);
		}
		
	});
	// 테이블용 환자 정보 ajax 끝
}
// 테이블용 환자 정보 ajax 호출 함수 끝
});
</script>


<!-- JavaScript 부분 -->

<!--물리치료 대기환자 > 물리치료실   // 작업치료 대기환자 > 작업치료실  -->
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var therapyPtLi = document.getElementById("therapyPtLi");
    var therapyOtLi = document.getElementById("therapyOtLi");
    var ptRoomLi = document.getElementById("ptRoomLi");
    var otRoomLi = document.getElementById("otRoomLi");

    therapyPtLi.addEventListener("click", function(e) {
      e.preventDefault();
      ptRoomLi.querySelector("a").click();
      therapyOtLi.querySelector("a").classList.remove("active");
    });

    therapyOtLi.addEventListener("click", function(e) {
      e.preventDefault();
      otRoomLi.querySelector("a").click();
      therapyPtLi.querySelector("a").classList.remove("active");
    });

    ptRoomLi.addEventListener("click", function(e) {
      e.preventDefault();
      therapyPtLi.querySelector("a").click();
      otRoomLi.querySelector("a").classList.remove("active");
    });

    otRoomLi.addEventListener("click", function(e) {
      e.preventDefault();
      therapyOtLi.querySelector("a").click();
      therapyPtLi.querySelector("a").classList.remove("active");
    });
  });
</script>
<script type="text/javascript">
//현재 선택된 <tr> 요소를 저장할 변수
var selectedRow = null;

// 클릭된 <tr> 요소에 파란색 테두리를 추가하고 이전 선택을 초기화하는 함수
function addBorderToRow(event) {
  const targetRow = event.currentTarget;
  
  // 이전에 선택한 <tr>의 테두리를 초기화
  if (selectedRow) {
    selectedRow.style.border = "";
  }

  // 현재 선택한 <tr>에 파란색 테두리를 추가
  targetRow.style.border = "2px solid blue";
  
  // 현재 선택한 <tr>를 selectedRow에 저장
  selectedRow = targetRow;
}

// 모든 .trPatntNo 클래스를 가진 <tr> 요소에 클릭 이벤트 리스너 추가
const trElements = document.querySelectorAll('.trPatntNo');
trElements.forEach((trElement) => {
  trElement.addEventListener('click', addBorderToRow);
});
</script>





<!-- 알러트 쓰세용  -->
<!-- Swal.fire({
	      icon: 'info',
	      title: '물리치료 완료',
	      text: '물리 치료를 완료하시겠습니까 ?',
	      showCancelButton: true,
	      confirmButtonText: '확인',
	      cancelButtonText: '취소',
	      confirmButtonColor: 'midnightblue',
	      cancelButtonColor: 'red', // cancel 버튼 색깔 지정
	    }).then(result => {
	    	if(result.isConfirmed){
	    		
	    		
	    	}
	    		
	    }); -->
</html>