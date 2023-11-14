<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="/resources/vendors/flatpickr/flatpickr.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<c:set var="customUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />
<style>
.table thead {
    position: sticky;
    top: 0;
    z-index: 1;
}

.card {
    padding: 0;
}

.card-header {
    margin: 0;
    padding: 0;
}

.card-body {
    margin: 0;
    padding: 0;
}

.bed:hover {
    border-width: 2px !important;
    border-color: green !important;
}

.ebed:hover {
    border-width: 2px !important;
    border-color: red !important;
}

.dropCss {
    height: 25px;
    width: 20px;
    padding-top: 0;
    padding-left: 0;
}

#backBtn {
    margin-left: 25px;
    width: 140px;
    border: 1px #f1f1f1 solid;
    padding-left: 5px;
    padding-right: 0px;
    cursor: pointer;
    height: 35px;
    display: flex;
    align-items: center;
}

#backBtn:hover {
    background-color: #f1f1f1;
}

.selected {
    background-color: #f1f1f1;
}

.nurseTr,
.therapyTr,
.roundTr,
#roundTrNew {
    cursor: pointer;
}

.nurseTr:hover,
.therapyTr:hover,
.roundTr:hover,
.roundTrNew:hover {
    background-color: #f1f1f1;
}

.inpatientRecordTr,
.nurseTr,
.clinicTr,
.otptRecordTr {
    cursor: pointer;
}

.inpatientRecordTr:hover,
.nurseTr:hover,
.clinicTr:hover,
.otptRecordTr:hover {
    background-color: #f1f1f1;
}

.bed-center {
    display: flex;
    justify-content: center;
}

.patientInfoCss {
    border: none;
    box-shadow: none;
    background-color: none;
}

.patientCss2 {
    font-weight: bold;
    color: midnightblue;
	background: none;
}

.patientInfoCss3{
	box-shadow: none;
    background-color: none;
}

.patient-content {
    display: flex;
    align-items: center;
}

</style>

<input type="hidden" id="sessionUserId" value="${customUser.username}" />
<input type="hidden" id="sessionUserNm" value="${customUser.employee.empNm}" />
<input type="hidden" id="msg" value="${msg }" />

<div class="row" style="display: flex;" id="roundMainBodyParent">

    <!-- 환자 정보 시작 -->
	<div class="col-4 px-3 pe-0">
		<div class="card border border-secondary" >
			
			<div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
				<div class="my-1 ps-1" style="display: flex; justify-content: start;">
					<div class="fw-semi-bold text-white text-start ms-2" style="font-size: 20px;">환자정보</div>
				</div>
			</div>
				
			<!-- 환자 정보 시작 -->
			<div class="">
				<div class="mt-1">
					<div class="col-12 scrollbar" style="height: 152px; overflow-x: hidden;">
						<div class="row">
							<div class="col-6 pe-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">환자번호</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntNoDt" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">환자명</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntNmDt" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">생년월일</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntRrno1Dt" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0" style="letter-spacing: 4px;">나 이</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntAgeDt" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0" style="letter-spacing: 13px;">성별</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntSexdstnDt" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">환자연락처</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntTelDt" readonly="readonly"/>
								</div>
							</div>
						</div>	
						<div class="row">
							<div class="col-6 pe-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">보험여부</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="patntHlthinsAtDt" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0" style="letter-spacing: 4px;">입원여부</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="hsptlzAtDt" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pe-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">보호자연락처</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="prtctorTelnoDt" readonly="readonly"/>
								</div>
							</div>
							<div class="col-6 ps-0">
								<div class="input-group">
									<span class="input-group-text patientInfoCss patientCss2 pe-0">보호자이름</span>
									<input class="form-control patientInfoCss patient-content pe-0" type="text" id="prtctorNmDt" readonly="readonly"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="input-group mb-2">
									<span class="input-group-text patientInfoCss patientCss2 pe-0" style="display: flex; align-items: flex-start;">특이사항</span>
									<textarea class="form-control patientInfoCss patient-content" cols="2" id="patntMemoDt" readonly="readonly"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 환자 정보 끝 -->
			</div>
		</div>
		<!-- 환자 정보 끝 -->
				
		<!-- 바이탈 시작 -->
		<div class="card border border-secondary mt-2" style="height: 60px;">
			<div class="card-body scrollbar p-0">
				<div id="p-0">
					<div class="table-responsive scrollbar">
						<table class="table table-bordered table-striped mb-0">
							<thead class="bg-200" style="height: 30px;">
								<tr>
									<th class="text-800 text-center py-0 ms-2">키</th>
									<th class="text-800 text-center py-0">몸무게</th>
									<th class="text-800 text-center py-0">혈액형</th>
									<th class="text-800 text-center py-0">최고혈압</th>
									<th class="text-800 text-center py-0">최저혈압</th>
									<th class="text-800 text-center py-0 me-2">체온</th>
								</tr>
							</thead>
							<tbody class="list text-center">
								<tr class="" style="height: 30px;">
									<td class="py-0 ms-2" id="patntHeightDt"></td>
									<td class="py-0" id="patntBdwghDt"></td>
									<td class="py-0" id="patntBdpDt"></td>
									<td class="py-0" id="hghrkHhprsDt"></td>
									<td class="py-0" id="lwtrkHhprsDt"></td>
									<td class="py-0 me-2" id="bdheatDt"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>	
		</div>
		<!-- 바이탈 끝 -->
				
		<!-- 진료기록 시작 -->
		<div class="card mt-2">
			<div class="card border border-secondary" style="height: 530px; background-color: aliceblue;">
				<div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
					<div class="ps-1" style="display: flex; justify-content: start;">
						<div class="fw-semi-bold text-white text-start" style="font-size: 20px;">진료기록</div>
					</div>
				</div>
				<div class="row pt-2">
					<div class="col-auto" style="padding-left: 30px; padding-right: 5px;">
						<div class="card" style="height: 470px; min-width: 105px; max-width: 105px;">
							<div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
								<div class="" style="display: flex; justify-content: center;">
									<div class="fw-semi-bold text-white text-center" style="font-size: 16px;">진료날짜</div>
								</div>
							</div>
							<table>
								<tbody id="clinicTrBody" style="text-align: center;"></tbody>
							</table>
						</div>
					</div>
					<div class="col-auto" style="padding-left: 0px; padding-right: 20px;">
						<div class="card ms-2" style="height: 470px; min-width: 470px; max-width: 470px;">
							<div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
								<div class="" style="display: flex; justify-content: center;"></div>
							</div>
							<div class="p-2 scrollbar" style="overflow-x: hidden;">
								<div class="row mb-2">
									<div class="col-12 pe-0">
										<div class="input-group">
											<span class="input-group-text patientInfoCss patientCss2 pe-0">진료일시</span>
											<div class="form-control patientInfoCss pe-0 " id="pastClnicTime"></div>
										</div>
									</div>
								</div>
								<div class="row mb-2">
									<div class="col-7 pe-0">
										<div class="input-group">
											<span class="input-group-text patientInfoCss patientCss2 pe-0">진료번호</span>
											<div class="form-control patientInfoCss  pe-0" id="pastClnicNo"></div>
										</div>
									</div>
									<div class="col-5 ps-0">
										<div class="input-group">
											<span class="input-group-text patientInfoCss patientCss2 pe-0">담당의</span>
											<div class="form-control patientInfoCss  pe-0" id="pastEmpNm"></div>
										</div>
									</div>
								</div>
								<div class="row mb-2">
									<div class="input-group">
										<span class="input-group-text patientInfoCss patientCss2 pe-0" style="letter-spacing: 5px;">발병일</span>
										<div class="form-control patientInfoCss  pe-0" id="pastAtfssDt"></div>
									</div>
								</div>
								<div class="input-group">
									<div class="input-group-text patientInfoCss patientCss2 pe-0">진단내역</div>
								</div>
								<div class="input-sm mb-2">
									<div id="pastClnicCn" class="scrollbar form-control  patientInfoCss"></div>
								</div>
								<div class="input-group">
									<div class="input-group-text patientInfoCss patientCss2 pe-0">상병내역</div>
								</div>
								<div class="input-sm mb-2">
									<div id="pastSAW" class="scrollbar form-control  patientInfoCss"></div>
								</div>
								<div class="input-group">
									<div class="input-group-text patientInfoCss patientCss2 pe-0">검사내역</div>
								</div>
								<div class="input-sm mb-2">
									<div id="pastMEO" class="form-control patientInfoCss "></div>
								</div>
								<div class="input-group">
									<div class="input-group-text patientInfoCss patientCss2 pe-0">처방내역</div>
								</div>
								<div class="input-sm mb-2">
									<div id="pastPO" class="form-control patientInfoCss "></div>
								</div>
								<div class="input-group">
									<div class="input-group-text text-center patientInfoCss patientCss2 pe-0">메모사항</div>
								</div>
								<div class="input-sm mb-2">
									<div id="pastMemo" class="form-control patientInfoCss "></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 진료기록 끝 -->
	</div>
	<!-- 환자정보 끝 -->

    <!-- 환자 기록 시작 -->
    <div class="col-8" id="secondBody" style="display: none;">

        <div class="card border border-secondary" style="height: 810px;">
            <div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
                <div class="row" style="display: flex; flex-wrap: wrap;">
                    <div class="col-10">
                        <h5 class="fw-semi-bold text-white text-start ps-2 mt-1">회진차트</h5>
                    </div>
                    <div class="col-2 p-0" style="display: flex; align-items: end; justify-content: flex-end;">
                        <button class="btn btn-falcon-default backBtn pe-2 me-4" style="width: auto" id="backBtn"><span class="material-icons text-secondary fs-3">arrow_back</span>입원병동</button>
                    </div>
                </div>
            </div>

            <!-- 기록지 시작 -->
            <div class="row card-body pt-0" style="background: aliceblue;">
            	<div class="row ps-3 py-2">
            		
            		<div class="row col-7">
            			<div class="mb-4" style="height: 300px;">
            				<!-- 간호기록지 시작 -->
		                    <div class="">
		                        <div class="card border border-secondary" style="height: 320px;">
		                            <div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
		                                <div class="" style="display: flex; flex-wrap: wrap;">
		                                    <div class="fw-semi-bold text-white text-center ms-2">간호기록차트</div>
		                                </div>
		                            </div>
		
		                            <div class="row border-secondary pt-2">
		                                <div class="col-3" style="padding-left: 30px; padding-right: 5px;">
		                                    <div class="card text-center border" style="height: 260px;">
		                                        <div class="card-header" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
		                                            <div class="text-center">
		                                                <div class="fw-semi-bold text-white text-center my-1">내역</div>
		                                            </div>
		                                        </div>
		                                        <table class="">
		                                            <thead class="align-center"></thead>
		                                            <tbody id="nurseTrBody" class="align-center"></tbody>
		                                        </table>
		                                    </div>
		                                </div>
		
		                                <div class="col-9" style="padding-left: 5px; padding-right: 30px;">
		                                    <div class="card scrollbar" style="height: 260px; overflow: auto;">
		                                        <div class="cord-body">
		                                            <table class="table table-outline text-center" border="1" id="soap">
		                                                <tbody>
		                                                    <tr>
		                                                        <th class="py-1" style="text-align: left; vertical-align: middle;">작성자</th>
		                                                        <td class="py-1"  colspan="5"><input class="form-control bg-white patientInfoCss3" id="nrsRcordWrterNr" type="text" disabled="disabled" placeholder=""></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="py-1"  style="text-align: left; vertical-align: middle;">작성자명</th>
		                                                        <td class="py-1"  colspan="5"><input class="form-control bg-white patientInfoCss3" id="empNmNr" type="text" disabled="disabled" placeholder=""></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="py-1"  style="text-align: left; vertical-align: middle;">환자명</th>
		                                                        <td class="py-1"  colspan="5"><input class="form-control bg-white patientInfoCss3" id="patntNmNr" type="text" disabled="disabled" placeholder=""></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="py-1"  style="text-align: left; vertical-align: middle;">작성일</th>
		                                                        <td class="py-1"  colspan="5"><input class="form-control bg-white patientInfoCss3" id="nrsRcordDeNr" type="text" disabled="disabled" placeholder=""></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="text-start pb-0" colspan="6" style="vertical-align: middle; border-bottom: white 1px solid">간호 기록 내역</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <td colspan="6">
		                                                            <textarea class="form-control patientInfoCss3 p-0" readonly="readonly" id="nrsRcordMemoNr" rows="8"></textarea>
		                                                        </td>
		                                                    </tr>
		                                                </tbody>
		                                            </table>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- 간호기록지 끝 -->
            			</div>
            			
            			<div class="">
            				<!-- 치료 기록지 시작 -->
		                    <div class="">
		                        <div class="card border border-secondary" style="height: 400px;">
		                            <div class="card-header p-1" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
		                                <div class="" style="display: flex; flex-wrap: wrap;">
		                                    <div class="fw-semi-bold text-white text-center ms-2">치료기록차트</div>
		                                </div>
		                            </div>
		                            <div class="row border-secondary pt-2">
		                                <div class="col-3" style="padding-left: 30px; padding-right: 5px;">
		                                    <div class="card text-center border" style="height: 340px;">
		                                        <div class="card-header" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
		                                            <div class="text-center">
		                                                <div class="fw-semi-bold text-white text-center my-1">내역</div>
		                                            </div>
		                                        </div>
		                                        <table>
		                                            <thead class="align-center"></thead>
		                                            <tbody id="otptRecordTrBody" class="align-center" style="overflow: auto;"></tbody>
		                                        </table>
		                                    </div>
		                                </div>
		                                <div class="col-9" style="padding-left: 5px; padding-right: 30px;">
		                                    <div class="card scrollbar" style="height: 340px; overflow: auto;">
		                                        <div class="cord-body" style="">
		                                            <table class="table table-outline text-center" border="1" id="soap">
		                                                <tbody>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">No.</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="차트번호" id="otptCdOr">
		                                                        </td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="" style="text-align: left; vertical-align: middle;">Name</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="환자명" id="patntNmOr">
		                                                        </td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">Gender</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="성별" id="patntSexdstnOr">
		                                                        </td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">C.C</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="주호소" id="otptAppealOr">
		                                                        </td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="5" style="text-align: center; vertical-align: middle;">Cognitive Function</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <th rowspan="2" style="text-align: center; vertical-align: middle;">Orientation</th>
		                                                        <th class="">T</th>
		                                                        <th class="">P</th>
		                                                        <th class="">P</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <td class=""><input class="form-control text-center bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="+ or -" id="orientTimeOr"></td>
		                                                        <td class=""><input class="form-control text-center bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="+ or -" id="orientPlaceOr"></td>
		                                                        <td class=""><input class="form-control text-center bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="+ or -" id="orientPersonOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  rowspan="2" style="text-align: left; vertical-align: middle;">Memory</th>
		                                                        <th class="" >STM</th>
		                                                        <th class="" >LTM</th>
		                                                        <th class="" > </th>
		                                                    </tr>
		                                                    <tr>
		                                                        <td class="" ><input class="form-control text-center bg-white" disabled="disabled" type="text" placeholder="+ or -" id="otptStmOr"></td>
		                                                        <td class="" ><input class="form-control text-center bg-white" disabled="disabled" type="text" placeholder="+ or -" id="otptLtmOr"></td>
		                                                        <td class="" ></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">Speech</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="언어" id="otptStOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">Swalowing</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="삼킴장애 유/무" id="otptDyspOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">Ambulation</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="Walking" id="otptPdOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="5" style="text-align: center; vertical-align: middle;">Muscle Tons (MAS)</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="5" style="text-align: center; vertical-align: middle;">U/E</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="2">Rt</th>
		                                                        <th class=""  colspan="2">Lt</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <td class=""  colspan="2"><input class="form-control text-center bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="MAS 등급" id="mustUbRightOr"></td>
		                                                        <td class="" colspan="2"><input class="form-control text-center bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="MAS 등급" id="mustUbLeftOr"></td>
		                                                        <td class="" ></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="5" style="text-align: center; vertical-align: middle;">L/E</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="2">Rt</th>
		                                                        <th class=""  colspan="2">Lt</th>
		                                                        <th class="" > </th>
		                                                    </tr>
		                                                    <tr>
		                                                        <td class=""  colspan="2"><input class="form-control text-center bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="MAS 등급" id="mustLbRightOr"></td>
		                                                        <td class="py-0"  colspan="2"><input class="form-control text-center bg-white patientInfoCss3" disabled="disabled" type="text" placeholder="MAS 등급" id="mustLbLeftOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  colspan="5" style="text-align: center; vertical-align: middle;">Assessment</th>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">Problem
		                                                            List</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="환자의 주요 문제점" id="mainCntrvsOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">LTG</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="환자의 장기목표" id="lngtrCoalOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class=""  style="text-align: left; vertical-align: middle;">STG</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="환자의 단기목표" id="srtpdCoalOr"></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th class="" style="text-align: left; vertical-align: middle;">Plan</th>
		                                                        <td class=""  colspan="4"><input class="form-control bg-white patientInfoCss3" type="text" disabled="disabled" placeholder="목표를 위해 적용할 치료방법" id="mustPlanOr"></td>
		                                                    </tr>
		                                                </tbody>
		                                            </table>
		                                        </div>
		
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- 치료기록지 끝 -->
            			</div>
            		</div>
            		<div class="col-5">
            		
            			<div class="row ps-2">
            				<div class="card border border-secondary" style="height: 100px; min-width: 545px;">
            					<div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
	                                <div class="" style="display: flex; flex-wrap: wrap;"></div>
	                            </div>
                            	<div class="row p-2 mx-2">
									<div class="col-6 d-flex btn-reveal-trigger">
										<div class="calendar">
											<span class="calendar-month" id="hsptlzDeMonth"></span>
											<span class="calendar-day" id="hsptlzDeDay"></span>
										</div>
										<div class="flex-1 position-relative ps-3">
											<h5 class="fs-0 my-1 fw-semi-bold">입원일</h5>
											<p class="text-1000 my-1" id="hsptlzDeTime"></p>
										</div>
									</div>
									<div class="col-6 d-flex btn-reveal-trigger">
										<div class="calendar">
											<span class="calendar-month" id="prarndeLhstlMonth"></span>
											<span class="calendar-day" id="prarndeLhstlDay"></span>
										</div>
										<div class="flex-1 position-relative ps-3">
											<h5 class="fs-0 my-1 fw-semi-bold">퇴원 예정일</h5>
											<p class="text-1000 my-1" id="prarndeLhstlTime"></p>
										</div>
									</div>
								</div>
            				</div>
            			</div>
            		
            			 <!-- 회진 차트 시작 -->
	                    <div class="row ps-2 mt-3">
	                        <!-- 카드  -->
	                        <div class="card border border-secondary" style="height: 620px; min-width: 545px;">
	                            <div class="card-header p-2" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
	                                <div class="" style="display: flex; flex-wrap: wrap;">
	                                    <div class="fw-semi-bold text-white text-center ms-2">회진차트 작성</div>
	                                </div>
	                            </div>
	
	                            <div class="row border-secondary">
	                                <div class="col-4 pt-2" style="padding-left: 30px; padding-right: 5px;">
	                                    <div class="card scrollbar text-center border" style="height: 560px;">
	                                        <div class="card-header" style="border-bottom: 1px solid #ededed; background-color: midnightblue;">
	                                            <div class="text-center">
	                                                <div class="fw-semi-bold text-white text-center my-1">내역</div>
	                                           	</div>
	                                        </div>
	                                        <table>
	                                            <thead class="align-center">
	                                                <tr class="py-1" id="roundTrNew" style="border-bottom: 2px dashed #dfe2e5">
	                                                    <th> + 신규 작성 </th>
	                                                </tr>
	                                            </thead>
	                                            <tbody id="inpatientRecordTrBody" class="align-center" style="overflow: auto;">
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                                <div class="col-8 pt-1" style="padding-left: 5px; padding-right: 30px;">
	                                    <div class="card scrollbar" style="height: 560px; overflow: auto;">
	                                        <div class="cord-body">
	                                            <form action="/mediform/doctor/round/insert" method="post" id="roundInsertForm">
	                                                <input type="hidden" id="hsptlzCdHidden" name="hsptlzCd" />
	                                                <input type="hidden" id="doctrEmpnoHidden" name="doctrEmpno" />
	                                                <input type="hidden" id="inptntRcordHidden" name="inptntRcord" />
	                                                <sec:csrfInput />
	                                            </form>
	                                            <input type="hidden" id="patntNmHidden" />
	                                            <table class="table table-outline text-center" border="1" id="soap">
	                                                <tbody>
	                                                    <tr>
	                                                        <th class="" style="text-align: left; vertical-align: middle; font-size: 16px;" >담당의<br/> 사번</th>
	                                                        <td class="" colspan="5"><input class="form-control bg-white"id="doctorEmpNo" type="text" disabled="disabled" placeholder=""></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th class="" style="text-align: left; vertical-align: middle; font-size: 16px;">담당의<br/> 이름</th>
	                                                        <td class="" colspan="5"><input class="form-control bg-white" id="doctorEmpNm" type="text" disabled="disabled" placeholder=""></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th class="" style="text-align: left; vertical-align: middle; font-size: 16px;">환자명</th>
	                                                        <td class="" colspan="5"><input class="form-control bg-white" id="doctorPatntNm" type="text" disabled="disabled" placeholder=""></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <th class="" style="text-align: left; vertical-align: middle; font-size: 16px;">작성일</th>
	                                                        <td class="" colspan="5"><input class="form-control bg-white" type="text" id="doctorSysdate" disabled="disabled" placeholder=""></td>
	                                                    </tr>
	                                                    <tr style="border-bottom: 1px solid white;">
	                                                        <th class="text-start py-3 colspan="5" style="vertical-align: middle; border-bottom: white 1px solid; font-size: 16px; min-width: 100px;">회진기록</th>
	                                                        <th class="text-end py-2" colspan="1">
	                                                            <button class="btn btn-primary" id="roundUpplyBtn" style="display: none; border: midnightblue; background-color: midnightblue;" type="button">등록</button>
	                                                        </th>
	                                                    </tr>
	                                                    <tr>
	                                                        <td class="" colspan="6">
	                                                            <textarea class="form-control p-0" id="roundTextarea" rows="12" readonly="readonly" placeholder="회진기록을 작성해 주세요."></textarea>
	                                                        </td>
	                                                    </tr>
	                                                </tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
		                <!-- 회진 차트 종료 -->
		                
            		</div>
            	</div>

            </div>
        </div>
    </div>

    <c:set value="${sickbedList }" var="sickbedList" />
    <c:set value="/resources/image/in.png" var="imgIn" />
    <c:set value="/resources/image/out.png" var="imgOut" />

    <!-- 회진 -->
    <div class="col-8 px-3" id="roundMainBody">
        <!-- 탭 메뉴 -->
        <div class="card border border-secondary" style="height: 810px; background-color: aliceblue;">
            <div>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    
                    <c:set var="six" value="0" />
					<c:forEach items="${sickbedList}" var="item">
					    <c:if test='${(item.sckbdNo).startsWith("5") }'>
					        <c:set var="six" value="${six + 1}" />
					    </c:if>
					</c:forEach>
					
					<c:set var="four" value="0" />
					<c:forEach items="${sickbedList}" var="item">
					    <c:if test='${(item.sckbdNo).startsWith("6") }'>
					        <c:set var="four" value="${four + 1}" />
					    </c:if>
					</c:forEach>
					
                    <li class="nav-item text-center col-6">
                        <a class="nav-link active fw-semi-bold" id="home-tab" data-bs-toggle="tab" href="#tab-home" role="tab" aria-controls="tab-home" aria-selected="true" style="font-size: 20px;">5층 (6인실)
							 &nbsp;&nbsp;&nbsp;<span><span class="fw-semi-bold text-danger"> <c:out value="${six }"/></span> / 36</span>
                        </a>
                    </li>
                    <li class="nav-item text-center col-6">
                        <a class="nav-link fw-semi-bold" id="profile-tab" data-bs-toggle="tab" href="#tab-profile" role="tab" aria-controls="tab-profile" aria-selected="false" style="font-size: 20px;">6층 (4인실)
							 &nbsp;&nbsp;&nbsp;<span><span class="fw-semi-bold text-danger"> <c:out value="${four }"/></span> / 36</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- 탭 컨탠츠 -->
            <div class="row card-body pt-0">
                <div class="tab-content" id="myTabContent">
                    <!-- 5층 병상 (6인실) 탭 -->
                    <div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">
                        <br>
                        <!-- 6인실 병실 전체 영역 -->
                        <div class="row ps-3">
                            <!-- 6인실 병실 좌측 (501호~503호) -->
                            <div class="col-6 me-2" style="width: 600px;">

                                <!-- 501호 (6인실) -->
                                <div class="row">
                                    <div></div>
                                    <!-- 카드  -->
                                    
                                    <c:set var="room501" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("501") }'>
									        <c:set var="room501" value="${room501 + 1}" />
									    </c:if>
									</c:forEach>
										
                                    <div class="card border border-secondary" id="501" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                    	501호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room501 } </span> / 6 )</span>
                                                    </h5>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 501호 상단 -->

                                            <!-- 501-1 -->
                                            <c:set var="found5011" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('501-1') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-1' }">

                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem; position: relative;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>

                                                            <c:set var="found5011" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>

                                            <c:if test="${found5011 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-1</span>
                                                            <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-1 끝 -->

                                            <!-- 501-2 -->
                                            <c:set var="found5012" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5012') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5012" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5012 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-2</span>
                                                            <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-2 끝 -->

                                            <!-- 501-33 -->
                                            <c:set var="found5013" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5013') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5013" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5013 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-3</span>
                                                            <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-3 끝 -->
                                            <!-- 501호 상단 끝 -->

                                            <!-- 501호 하단 -->
                                            <!-- 501-4 -->
                                            <c:set var="found5014" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5014') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5014" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5014 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-4 끝 -->

                                            <!-- 501-5 -->
                                            <c:set var="found5015" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5015') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5015" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5015 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-5 끝 -->


                                            <!-- 501-6 -->
                                            <c:set var="found5016" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5016') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '501-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">501-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5016" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5016 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="501_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">501-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 501-6 끝 -->
                                            <!-- 501호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 501호(6인실) 끝 -->



                                <!-- 502호 (6인실) -->
                                <div class="row mt-1">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room502" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("502") }'>
									        <c:set var="room502" value="${room502 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="502" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        502호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room502 } </span> / 6 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 502호 상단 -->
                                            <!-- 502-1 -->
                                            <c:set var="found5021" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5021') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-1' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5021" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5021 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-1 끝 -->

                                            <!-- 502-2 -->
                                            <c:set var="found5022" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5022') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5022" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5022 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-2 끝 -->
                                            <!-- 502-3 -->
                                            <c:set var="found5023" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5023') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5023" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5023 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-3 끝 -->
                                            <!-- 502호 상단 끝 -->

                                            <!-- 502호 하단 -->
                                            <!-- 502-4 -->
                                            <c:set var="found5024" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5024') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5024" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5024 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-4 끝 -->

                                            <!-- 502-5 -->
                                            <c:set var="found5025" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5025') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5025" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5025 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-5 끝 -->
                                            <!-- 502-6 -->
                                            <c:set var="found5026" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5026') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '502-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">502-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5026" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5026 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="502_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">502-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 502-6 끝 -->
                                            <!-- 502호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 502호 (6인실) 끝 -->

                                <!-- 503호 (6인실) -->
                                <div class="row mt-1">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room503" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("503") }'>
									        <c:set var="room503" value="${room503 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="503" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        503호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room503 } </span> / 6 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 503호 상단 -->
                                            <!-- 503-1 -->
                                            <c:set var="found5031" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5031') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-1' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5031" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5031 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-1 끝 -->

                                            <!-- 503-2 -->
                                            <c:set var="found5032" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5032') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5032" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5032 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-2 끝 -->
                                            <!-- 503-3 -->
                                            <c:set var="found5033" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5033') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5033" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5033 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-3 끝 -->
                                            <!-- 503호 상단 끝 -->

                                            <!-- 503호 하단 -->

                                            <!-- 503-4 -->
                                            <c:set var="found5034" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5034') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5034" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5034 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-4 끝 -->

                                            <!-- 503-5 -->
                                            <c:set var="found5035" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5035') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5035" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5035 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-5 끝 -->
                                            <!-- 503-6 -->
                                            <c:set var="found5036" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5036') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '503-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">503-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5036" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5036 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="503_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">503-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 503-6 끝 -->
                                            <!-- 503호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                            </div>
                            <!-- 503호 (6인실) 끝 -->



                            <!-- 6인실 병실 우측 (504호~506호 )-->
                            <div class="col-6 " style="width: 600px;">
                                <!-- 504호 (6인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    
                                    <c:set var="room504" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("504") }'>
									        <c:set var="room504" value="${room504 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="504" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        504호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room504 } </span> / 6 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 504호 상단 -->
                                            <!-- 504-1 -->
                                            <c:set var="found5041" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5041') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-1' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5041" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5041 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 504-1 끝 -->

                                            <!-- 504-2 -->
                                            <c:set var="found5042" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5042') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5042" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5042 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 504-2 끝 -->
                                            <!-- 504-3 -->
                                            <c:set var="found5043" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5043') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5043" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5043 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 504-3 끝 -->
                                            <!-- 504호 상단 끝 -->

                                            <!-- 504호 하단 -->
                                            <!-- 504-4 -->
                                            <c:set var="found5044" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5044') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5044" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5044 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 504-4 끝 -->

                                            <!-- 504-5 -->
                                            <c:set var="found5012" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5012') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5012" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5012 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <!-- 504-5 끝 -->
                                            <!-- 504-6 -->
                                            <c:set var="found5046" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5046') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '504-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">504-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5046" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5046 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="504_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">504-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 504-6 끝 -->
                                            <!-- 504호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 504호 (6인실) 끝 -->


                                <!-- 505호 (6인실) -->
                                <div class="row mt-1">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room505" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("505") }'>
									        <c:set var="room505" value="${room505 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="505" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        505호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room505 } </span> / 6 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 505호 상단 -->
                                            <!-- 505-1 -->
                                            <c:set var="found5051" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5051') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-1' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5051" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5051 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-1 끝 -->

                                            <!-- 505-2 -->
                                            <c:set var="found5052" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5052') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5052" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5052 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-2 끝 -->
                                            <!-- 505-3 -->
                                            <c:set var="found5053" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5053') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5053" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5053 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-3 끝 -->
                                            <!-- 505호 상단 끝 -->

                                            <!-- 505호 하단 -->
                                            <!-- 505-4 -->
                                            <c:set var="found5054" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5054') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5054" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5054 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-4 끝 -->

                                            <!-- 505-5 -->
                                            <c:set var="found5055" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5055') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5055" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5055 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-5 끝 -->
                                            <!-- 505-6 -->
                                            <c:set var="found5056" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5056') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '505-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">505-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5056" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5056 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="505_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">505-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 505-6 끝 -->
                                            <!-- 505호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 505호 (6인실) 끝 -->

                                <!-- 506호 (6인실) -->
                                <div class="row mt-1">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room506" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("506") }'>
									        <c:set var="room506" value="${room506 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="506" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        506호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room504 } </span> / 6 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 506호 상단 -->
                                            <!-- 506-1 -->
                                            <c:set var="found5061" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5061') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-1' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-1</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5061" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5061 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-1 끝 -->

                                            <!-- 506-2 -->
                                            <c:set var="found5062" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5062') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-2' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-2</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5062" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5062 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-2 끝 -->
                                            <!-- 506-3 -->
                                            <c:set var="found5063" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5063') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-3' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-3</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5063" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5063 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-3 끝 -->
                                            <!-- 506호 상단 끝 -->

                                            <!-- 506호 하단 -->
                                            <!-- 506-4 -->
                                            <c:set var="found5064" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5064') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-4' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-4</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5064" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5064 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-4 끝 -->

                                            <!-- 506-5 -->
                                            <c:set var="found5065" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5065') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-5' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-5</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5065" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5065 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_5" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-5</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-5 끝 -->
                                            <!-- 506-6 -->
                                            <c:set var="found5066" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('5066') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '506-6' }">
                                                            <div class="row col-4 m-0 p-0 bed-center">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">506-6</span>
                                                                        <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center"><img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" /></div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found5066" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found5066 == '0' }">
                                                <div class="row col-4 m-0 p-0 bed-center">
                                                    <div id="506_6" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">506-6</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 506-6 끝 -->
                                            <!-- 506호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 506호 (6인실) 끝 -->

                            </div>
                        </div>
                    </div>

                    <!-- 6층 병상 (4인실) 탭 -->
                    <div class="tab-pane fade" id="tab-profile" role="tabpanel" aria-labelledby="profile-tab">

                        <br>
                        <!-- 6인실 병실 전체 영역 -->
                        <div class="row ps-3">
                            <!-- 6인실 병실 좌측 (501호~503호) -->
                            <div class="col-6 me-2" style="width: 600px;">

                                <!-- 601호 (4인실) -->
                                <div class="row">
                                    <div></div>
                                    
                                    <c:set var="room601" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("601") }'>
									        <c:set var="room601" value="${room601 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <!-- 카드  -->
                                    <div class="card border border-secondary" id="601" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        601호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room601 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 601호 상단 -->
                                            <!-- 601-1 -->
                                            <c:set var="found6011" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6011') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '601-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">601-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <c:set var="found6011" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6011 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="601_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">601-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <!-- 601-1 끝 -->


                                            <!-- 601-2 -->
                                            <c:set var="found6012" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6012') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '601-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">

                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">601-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <c:set var="found6012" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6012 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="601_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">601-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <!-- 601-2 끝 -->
                                            <!-- 601호 상단 끝 -->

                                            <!-- 601호 하단 -->
                                            <!-- 601-3 -->
                                            <c:set var="found6013" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6013') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '601-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">

                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">601-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <c:set var="found6013" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6013 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="601_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">601-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <!-- 601-3 끝 -->

                                            <!-- 601-4 -->
                                            <c:set var="found6014" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6014') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '601-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">

                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">601-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <c:set var="found6014" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6014 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">

                                                    <div id="601_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">601-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </c:if>
                                            <!-- 601-4 끝 -->

                                            <!-- 601호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 601호(4인실) 끝 -->



                                <!-- 602호 (4인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room602" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("602") }'>
									        <c:set var="room602" value="${room601 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary mt-1" id="602" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        602호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room602 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 602호 상단 -->
                                            <!-- 602-1 -->
                                            <c:set var="found6021" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6021') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '602-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">

                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">602-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <c:set var="found6021" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6021 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="602_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">602-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 602-1 끝 -->

                                            <!-- 602-2 -->
                                            <c:set var="found6022" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6022') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '602-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">602-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6022" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6022 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="602_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">602-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 602-2 끝 -->

                                            <!-- 602호 상단 끝 -->

                                            <!-- 602호 하단 -->
                                            <!-- 602-3 -->
                                            <c:set var="found6023" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6023') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '602-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">602-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6023" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6023 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="602_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">602-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 602-3 끝 -->

                                            <!-- 602-4 -->
                                            <c:set var="found6011" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6011') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '602-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">602-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6011" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6011 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="602_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">602-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 602-4 끝 -->

                                            <!-- 602호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 602호 (4인실) 끝 -->

                                <!-- 603호 (4인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room603" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("603") }'>
									        <c:set var="room603" value="${room603 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary mt-1" id="603" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        603호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room603 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 603호 상단 -->
                                            <!-- 603-1 -->
                                            <c:set var="found6031" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6031') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '603-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">603-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6031" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6031 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="603_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">603-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 603-1 끝 -->

                                            <!-- 603-2 -->
                                            <c:set var="found6032" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6032') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '603-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">603-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6032" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6032 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="603_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">603-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 603-2 끝 -->

                                            <!-- 603호 상단 끝 -->

                                            <!-- 603호 하단 -->

                                            <!-- 603-3 -->
                                            <c:set var="found6033" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6033') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '603-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">603-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6033" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6033 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="603_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">603-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 603-3 끝 -->

                                            <!-- 603-4 -->
                                            <c:set var="found6034" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6034') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '603-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">603-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6034" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6034 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="603_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">603-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 603-4 끝 -->

                                            <!-- 603호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                            </div>
                            <!-- 603호 (4인실) 끝 -->



                            <!-- 4인실 병실 우측 (604호~606호 )-->
                            <div class="col-6" style="width: 600px;">
                                <!-- 604호 (4인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    
                                    <c:set var="room604" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("604") }'>
									        <c:set var="room604" value="${room604 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary" id="604" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        604호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room604 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 604호 상단 -->
                                            <!-- 604-1 -->
                                            <c:set var="found6041" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6041') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '604-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">604-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6041" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6041 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="604_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">604-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 604-1 끝 -->

                                            <!-- 604-2 -->
                                            <c:set var="found6042" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6042') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '604-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">604-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6042" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6042 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="604_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">604-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 604-2 끝 -->

                                            <!-- 604호 상단 끝 -->

                                            <!-- 604호 하단 -->
                                            <!-- 604-3 -->
                                            <c:set var="found6043" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6043') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '604-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">604-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6043" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6043 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="604_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">604-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 604-3 끝 -->

                                            <!-- 604-4 -->
                                            <c:set var="found6044" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6044') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '604-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">604-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6044" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6044 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="604_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">604-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 604-4 끝 -->

                                            <!-- 604호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 604호 (4인실) 끝 -->


                                <!-- 605호 (4인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room605" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("605") }'>
									        <c:set var="room605" value="${room605 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary mt-1" id="605" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        605호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room605 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 605호 상단 -->
                                            <!-- 605-1 -->
                                            <c:set var="found6051" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6051') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '605-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">605-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6051" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6051 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="605_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">605-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 605-1 끝 -->

                                            <!-- 605-2 -->
                                            <c:set var="found6052" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6052') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '605-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">605-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6052" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6052 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="605_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">605-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 605-2 끝 -->

                                            <!-- 605호 상단 끝 -->

                                            <!-- 605호 하단 -->
                                            <!-- 605-3 -->
                                            <c:set var="found6053" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6053') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '605-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">605-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6053" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6053 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="605_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">605-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 605-3 끝 -->

                                            <!-- 605-4 -->
                                            <c:set var="found6054" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6054') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '605-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">605-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6054" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6054 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="605_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">605-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 605-4 끝 -->

                                            <!-- 605호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 605호 (4인실) 끝 -->

                                <!-- 606호 (4인실) -->
                                <div class="row">
                                    <!-- 카드  -->
                                    <div></div>
                                    
                                    <c:set var="room606" value="0" />
									<c:forEach items="${sickbedList}" var="item">
									    <c:if test='${(item.sckbdNo).startsWith("606") }'>
									        <c:set var="room606" value="${room606 + 1}" />
									    </c:if>
									</c:forEach>
                                    
                                    <div class="card border border-secondary mt-1" id="606" style="height: 240px; display: flex;">

                                        <!-- 카드 헤더 시작 -->
                                        <div class="card-header pt-2" style="height: 30px; background-color: midnightblue; display: flex; align-items: center; justify-content: center;">
                                            <div class="row">
                                                <div class="col-12 align-self-center">
                                                    <h5 class="text-center text-white fw-semi-bold" id="header">
                                                        606호 <span class="text-sm" style="font-size: 16px;"> (<span class="text-danger"> ${room606 } </span>/ 4 )</span>
                                                    </h5>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- 카드 헤더 끝 -->

                                        <!-- 카드 바디 시작 -->
                                        <div class="row card-body pt-0 w-100">

                                            <!-- 606호 상단 -->




                                            <!-- 606-1 -->
                                            <c:set var="found6061" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6061') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '606-1' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">606-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6061" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6061 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="606_1" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">606-1</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 606-1 끝 -->


                                            <!-- 606-2 -->
                                            <c:set var="found6011" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6011') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '606-2' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">606-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6011" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6011 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="606_2" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">606-2</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 606-2 끝 -->

                                            <!-- 606호 상단 끝 -->

                                            <!-- 606호 하단 -->
                                            <!-- 606-3 -->
                                            <c:set var="found6063" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6063') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '606-3' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">606-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6063" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6063 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="606_3" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">606-3</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 606-3 끝 -->

                                            <!-- 606-4 -->
                                            <c:set var="found6064" value="0" />
                                            <c:choose>
                                                <c:when test="${not empty sickbedList && fn:length('6064') > 0 }">
                                                    <c:forEach items="${sickbedList }" var="sickBed">
                                                        <c:if test="${sickBed.sckbdNo == '606-4' }">

                                                            <div class="row col-6 m-0 p-0 bed-center" style="height: 84px;">
                                                                <div id="${sickBed.hsptlzCd }" data-patntno="${sickBed.patntNo }" data-patntnm="${sickBed.patntNm }" class="bed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                                    <div class="card-body">
                                                                        <span class="badge badge-subtle-secondary" style="hight: 8px">606-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;">${sickBed.patntNm }</span>
                                                                    </div>
                                                                    <div class="card-img-top text-center">
                                                                        <img class="img-fluid" src="/resources/image/in.png" style="max-width: 100px;" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <c:set var="found6064" value="1" />
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${found6064 == '0' }">

                                                <div class="row col-6 m-0 p-0 bed-center">
                                                    <div id="606_4" class="ebed card overflow-hidden align-self-center border border-secondary align-self-center border border-secondary" style="width: 10rem;">
                                                        <div class="card-body">
                                                            <span class="badge badge-subtle-secondary" style="hight: 8px">606-4</span> <span class="text-center fw-semi-bold" style="font-size: 12px;"></span>
                                                        </div>
                                                        <div class="card-img-top text-center">
                                                            <img class="img-fluid" src="/resources/image/out.png" style="max-width: 100px;" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <!-- 606-4 끝 -->

                                            <!-- 606호 하단 끝 -->

                                        </div>
                                        <!-- 카드 바디 끝 -->

                                    </div>
                                    <!-- 카드  끝 -->
                                </div>
                                <!-- 606호 (4인실) 끝 -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/resources/assets/js/flatpickr.js"></script>
<script type="text/javascript">
//전화번호 형식 함수
function getTelFormat(tel){
	var tel1 = tel.substring(0,3);
	var tel3 = tel.substring(tel.length - 4);
	var tel2 = tel.substring(3, tel.length - 4);
	var telFormat = tel1 + "-" + tel2 + "-" + tel3;
	return telFormat;
}

//병상 클릭했을 시 모달창 띄우기
$(function(){

	$(document).ready(function() {
        msgFunction();
        
    });
	
	function msgFunction() {
        var msg = $('#msg').val();
        console.log(msg);
        if (msg != null && msg != "" && msg == "y") {
            Swal.fire({
                icon: 'success',
                title: '실행 결과',
                text: '정상적으로 처리 되었습니다.',
                confirmButtonColor: 'blue'
            });
        } else if (msg != null && msg != "" && msg == "n") {
            Swal.fire({
                icon: 'error',
                title: '실행 결과',
                text: '해당 요청 실행 중 오류가 발생했습니다.',
                confirmButtonColor: 'blue'
            });
        } else if (msg != null && msg != "" && msg == "e") {
            Swal.fire({
                icon: 'error',
                title: '실행 결과',
                text: '이미 본 과에 해당 직책이 존재합니다.',
                confirmButtonColor: 'blue'
            });
        }
    }

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	// 로그인 된 사번
	var sessionUserId = $('#sessionUserId').val();
	// 로그인 된 이름
	var sessionUserNm = $('#sessionUserNm').val();
	// 새글 작성 클릭 이벤트
	$('#roundTrNew').on('click', function(){
// 		console.log("roundTrNew Click...!");
		$('#roundTextarea').prop("readonly", false);
		$('#roundUpplyBtn').show();
		
		// 선택된 tr의 입원코드
		var hsptlzCdHidden = $('#hsptlzCdHidden').val();
		// 선택된 tr의 환자명
		var patntNmHidden = $('#patntNmHidden').val();
		// textarea 비우기
		$('#roundTextarea').val("");
		
// 		console.log("선택된 환자명 : " + patntNmHidden);
// 		console.log("선택된 입원코드 : " + hsptlzCdHidden);
		
		// 현재 시간
		var now = new Date();
        var year = now.getFullYear();
        var month = String(now.getMonth() + 1).padStart(2, '0');
        var day = String(now.getDate()).padStart(2, '0');
        
        var formattedDate = year + '.' + month + '.' + day;
        
		// 해당 input에 세션 정보 넣어주기
		$('#doctorEmpNo').val(sessionUserId);
		$('#doctorEmpNm').val(sessionUserNm);
		$('#doctorSysdate').val(formattedDate);
		$('#doctorPatntNm').val(patntNmHidden);
	});
	
	// 회진 기록 등록 버튼 클릭시 
	$('#roundUpplyBtn').on('click', function(){
		
		// null check
		// 입원 코드
		var hsptlzCdHidden = $('#hsptlzCdHidden').val();
		// 회진 의사 사번
		var doctorEmpNo = $('#doctorEmpNo').val();
		// 회진 기록
		var roundTextarea = $('#roundTextarea').val();
		
		if(hsptlzCdHidden == null || hsptlzCdHidden == ""){
			Swal.fire({
			      icon: 'error',
			      title: '실행 결과',
			      html: '오류 발생 <br> 잠시후 다시 시도해 주세요.',
			      confirmButtonText: '확인',
			      confirmButtonColor: 'midnightblue',
			    });
			return;
		}else if(doctorEmpNo == null || doctorEmpNo == ""){
			Swal.fire({
			      icon: 'error',
			      title: '실행 결과',
			      html: '오류 발생 <br> 잠시후 다시 시도해 주세요.',
			      confirmButtonText: '확인',
			      confirmButtonColor: 'midnightblue',
			    });
			return;
		}else if(roundTextarea == null || roundTextarea == ""){
			Swal.fire({
			      icon: 'error',
			      title: '등록 실패',
			      text: '작성된 내용이 없습니다.',
			      confirmButtonText: '확인',
			      confirmButtonColor: 'midnightblue',
			    });
			return;
		}else{
			$('#inptntRcordHidden').val(roundTextarea);
			$('#doctrEmpnoHidden').val(doctorEmpNo);
			$('#roundInsertForm').submit();
		}
		
		
		
	})
	
	// 병상 클래스 받아오기
	var oneBed = $(".bed");
	var oneEbed = $(".ebed");
	var hospitalizationModal = $("#hospitalizationModal");
	var eHospitalizationModal = $("#eHospitalizationModal");
	var hospitalizationInsertBtn = $("#hospitalizationInsertBtn");
	
	// 병상 클릭시
	var roundMainBody = $('#roundMainBody');
	var secondBody = $('#secondBody');
	var thirdBody = $('#thirdBody');
	
	// 날짜 변환 yyyy.MM.dd
	function formatDateNoTime(timeStamp) {
        var date = new Date(timeStamp);

        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = date.getDate().toString().padStart(2, '0');

        var formattedDate = year + '.' + month + '.' + day;

        return formattedDate;
    }
	
	// 타임스탬프 날짜 변환 함수(시,분,초 포함) 
    // yyyy/MM/dd hh:mm
    function formatDate(timeStamp) {
        var date = new Date(timeStamp);

        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var day = date.getDate().toString().padStart(2, '0');
        var hours = date.getHours().toString().padStart(2, '0');
        var minutes = date.getMinutes().toString().padStart(2, '0');
        var seconds = date.getSeconds().toString().padStart(2, '0');

        var formattedDate = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes;

        return formattedDate;
    }
	
	
	// 입원 환자 클릭시
	oneBed.on('click', function(){
		
		var hsptlzCd = $(this).attr("id");
		var patntNo = $(this).data("patntno");
		var patntNm = $(this).data("patntnm");
		$('#hsptlzCdHidden').val(hsptlzCd);
		$('#patntNmHidden').val(patntNm);
		
		var hospitalizationInfoObj = {
				hsptlzCd : hsptlzCd, 
				patntNo : patntNo
		}
		
// 		console.log("");
// 		console.log("hsptlzCd : " + hsptlzCd);
// 		console.log("patntNo : " + patntNo);
		
		$.ajax({
	 		type : "post", 
			url : "/mediform/doctor/round/patient/detail",
			data : JSON.stringify(hospitalizationInfoObj),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(res) {
// 	            console.log("ajax 성공...!");
	            console.log(res);
	            
	            var inpatientRecordList = res.inpatientRecordList;
	            var clinicList = res.clinicList;
	            var otptRecordList = res.otptRecordList;
	            var nurseRecordList = res.nurseRecordList;
	            var hsptlzDe = res.hsptlzDe;
	            var prarndeLhstl = res.prarndeLhstl;
	            
	            var date1 = new Date(hsptlzDe);
	            var date2 = new Date(prarndeLhstl);
	            
	            var hDt = formatDateNoTime(date1);
	            var pDt = formatDateNoTime(date2);
	            
	            console.log("hsptlzDe >>>>>> "+ date1);
	            console.log(date1);
	            
	            var hMonth = date1.getMonth() + 1; 
	            var hDate = date1.getDate();
	            
	            var pMonth = date2.getMonth() + 1;
	            var pDate = date2.getDate();
	            
	            $("#hsptlzDeMonth").text(hMonth + " 월");
	            $("#hsptlzDeDay").text(hDate);
	            $("#hsptlzDeTime").text(hDt);
	            $("#prarndeLhstlMonth").text(pMonth + " 월");
	            $("#prarndeLhstlDay").text(pDate);
	            $("#prarndeLhstlTime").text(pDt);
	            
	            $('#inpatientRecordTrBody').empty();
	            $('#nurseTrBody').empty();
	            $('#clinicTrBody').empty();
	            $('#otptRecordTrBody').empty();
				
	            $("#patntNoDt").val(res.patientVO.patntNo);
	            $("#patntNmDt").val(res.patientVO.patntNm);
	            
	            var patntRrno1 = res.patientVO.patntRrno1;
	            var birth1 = patntRrno1.toString().substring(0,2);
	            var birth2 = patntRrno1.toString().substring(2,4);
	            var birth3 = patntRrno1.toString().substring(4,6);
	            var birth = birth1 + "." + birth2 + "." + birth3;
	            $("#patntRrno1Dt").val(birth);
	            
	            $("#patntAgeDt").val(res.patientVO.patntAge);
	            
	            var patntSexdstn = "";
				if(res.patientVO.patntSexdstn == "M"){
					patntSexdstn = "남";
				}else{
					patntSexdstn = "여";
				}
	            $("#patntSexdstnDt").val(patntSexdstn);
	            
	            if(res.patientVO.patntHlthinsAt == "Y"){
					patntHlthinsAt = "O";
				}else{
					patntHlthinsAt = "X";
				}
	            $("#patntHlthinsAtDt").val(patntHlthinsAt);
				
	            // 입원여부
	            var patntHsptlzAt = "";
				if(res.patientVO.patntHsptlzAt == "Y"){
					patntHsptlzAt = "O";
				}else{
					patntHsptlzAt = "X";
				}
	            $("#hsptlzAtDt").val(patntHsptlzAt);
	            
	            var patntTelno = getTelFormat(res.patientVO.patntTelno);
	            
	            $("#patntTelDt").val(patntTelno);
	            
	            var parentTel = res.patientVO.prtctorTelno;
	            if(parentTel != null && parentTel != ""){
		            $("#prtctorTelnoDt").val(getTelFormat(parentTel));
	            }else{
		            $("#prtctorTelnoDt").val("-");
	            }
	            
	            var parentTelNm = res.patientVO.prtctorNm;
	            if(parentTelNm != null && parentTelNm != ""){
		            $("#prtctorNmDt").val(parentTelNm);
	            }else{
		            $("#prtctorNmDt").val("-");
	            }
	            
	            var patntMemo = res.patientVO.patntMemo;
	            if(patntMemo != null && patntMemo != ""){
		            $("#patntMemoDt").val(patntMemo);
	            }else{
		            $("#patntMemoDt").val("-");
	            }
	            
	            var patntHeight = res.patientVO.patntHeight;
	            if(patntHeight != null && patntHeight != ""){
		            $("#patntHeightDt").text(patntHeight);
	            }else{
		            $("#patntHeightDt").text("-");
	            }
	            
	            var patntBdwgh = res.patientVO.patntBdwgh;
	            if(patntBdwgh != null && patntBdwgh != ""){
		            $("#patntBdwghDt").text(patntBdwgh);
	            }else{
		            $("#patntBdwghDt").text("-");
	            }
	            
	            var patntBdp = res.patientVO.patntBdp;
	            if(patntBdp != null && patntBdp != ""){
		            $("#patntBdpDt").text(patntBdp);
	            }else{
		            $("#patntBdpDt").text("-");
	            }
	            
	            if (res.vitalVO && (res.vitalVO.hghrkHhprs == null || res.vitalVO.hghrkHhprs == "")) {
	                $("#hghrkHhprsDt").text("-");
	            } else if (res.vitalVO) {
	                $("#hghrkHhprsDt").text(res.vitalVO.hghrkHhprs);
	            } else {
	                $("#hghrkHhprsDt").text("-");
	            }

	            if (res.vitalVO && (res.vitalVO.lwtrkHhprs == null || res.vitalVO.lwtrkHhprs == "")) {
	                $("#lwtrkHhprsDt").text("-");
	            } else if (res.vitalVO) {
	                $("#lwtrkHhprsDt").text(res.vitalVO.lwtrkHhprs);
	            } else {
	                $("#lwtrkHhprsDt").text("-");
	            }
	            
	            if (res.vitalVO && (res.vitalVO.bdheat == null || res.vitalVO.bdheat == "")) {
	                $("#bdheatDt").text("-");
	            } else if (res.vitalVO) {
	                $("#bdheatDt").text(res.vitalVO.bdheat);
	            } else {
	                $("#bdheatDt").text("-");
	            }
	            
	            // 회진 내역 일자 내역 채우기
	            inpatientRecordList.forEach(function(inpatientRecord) {
	                var newRow = '<tr class="inpatientRecordTr" data-inptntno="' + inpatientRecord.inptntNo + '"><td>' + formatDateNoTime(inpatientRecord.inptntDe) + '</td></tr>';
	                $('#inpatientRecordTrBody').append(newRow);
	            });

	            // 간호기록지 일자 내역 채우기
	            nurseRecordList.forEach(function(nurseRecord) {
	                var newRow = '<tr class="nurseTr" data-nrsrcordcd="' + nurseRecord.nrsRcordCd + '"><td>' + formatDateNoTime(nurseRecord.nrsRcordDe) + '</td></tr>';
	                $('#nurseTrBody').append(newRow);
	            });

	            // 진료내역 일자 내역 채우기
	            clinicList.forEach(function(clinic) {
	                var newRow = '<tr class="clinicTr" data-clinicno="' + clinic.clnicNo + '"><td>' + formatDateNoTime(clinic.clnicTime) + '</td></tr>';
	                $('#clinicTrBody').append(newRow);
	            });

	            // 치료기록지 일자 내역 채우기
	            otptRecordList.forEach(function(otptRecord) {
	                var newRow = '<tr class="otptRecordTr" data-otptcd="' + otptRecord.otptCd + '"><td>' + formatDateNoTime(otptRecord.mdlrtDt) + '</td></tr>';
	                $('#otptRecordTrBody').append(newRow);
	            });
				

	            // 해당 요소 숨기고 새로운 요소 보여주기
	            roundMainBody.hide();
	            secondBody.show();
	            thirdBody.show();
	            $('#clinicDiv').show();
	            
	            $('.inpatientRecordTr').eq(0).click();
	            $('.nurseTr').eq(0).click();
	            $('.clinicTr').eq(0).click();
	            $('.otptRecordTr').eq(0).click();
	        }

	 	});
	});
	
	/* 날짜 출력 완료 */
	/* 날짜를 선택하여 해당 Detail 가져오기 시작*/
	/* 치료기록지 출력 시작 */
	$('#otptRecordTrBody').on('click', '.otptRecordTr', function(){
		var otptCd = $(this).data("otptcd");
		var data = {
				otptCd : otptCd	
		};
		$('.otptRecordTr').removeClass('selected');
	    $(this).addClass('selected');
		$.ajax({ 
	 		type : "post", 
			url : "/mediform/doctor/round/otptRecord/detail",
			data : JSON.stringify(data),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(res) {
// 	            console.log("ajax 성공...!");
// 	            console.log(res);
	            
	            $('#otptCdOr').val(res.otptCd);
	            $('#patntNmOr').val(res.patntNm);
	            var formatPatntSexdstn = "";
	            if(res.patntSexdstn != null && res.patntSexdstn == "M"){
	            	formatPatntSexdstn = "남성";
	            }else{
	            	formatPatntSexdstn = "여성";
	            }
	            $('#patntSexdstnOr').val(formatPatntSexdstn);
	            $('#otptAppealOr').val(res.otptAppeal);
// 	            $('#otptHistoryOr').val(res.otptHistory);
	            $('#orientTimeOr').val(res.orientTime);
	            $('#orientPlaceOr').val(res.orientPlace);
	            $('#orientPersonOr').val(res.orientPerson);
	            $('#otptStmOr').val(res.otptStm);
	            $('#otptLtmOr').val(res.otptLtm);
	            $('#otptStOr').val(res.otptSt);
	            $('#otptDyspOr').val(res.otptDysp);
	            $('#otptPdOr').val(res.otptPd);
	            $('#mustUbRightOr').val(res.mustUbRight);
	            $('#mustUbLeftOr').val(res.mustUbLeft);
	            $('#mustLbRightOr').val(res.mustLbRight);
	            $('#mustLbLeftOr').val(res.mustLbLeft);
	            $('#mainCntrvsOr').val(res.mainCntrvs);
	            $('#lngtrCoalOr').val(res.lngtrCoal);
	            $('#srtpdCoalOr').val(res.srtpdCoal);
	            $('#mustPlanOr').val(res.mustPlan);
	        }

	 	});
		
	});
	/* 치료기록지 출력 종료 */
	
	/* 간호기록지 출력 시작 */
	$('#nurseTrBody').on('click', '.nurseTr', function(){
		var nrsRcordCd = $(this).data("nrsrcordcd");
		var data = {
				nrsRcordCd : nrsRcordCd
		};
		$('.nurseTr').removeClass('selected');
	    $(this).addClass('selected');
// 	    console.log("nrsRcordCd : " + nrsRcordCd);
	    $.ajax({ 
	 		type : "post", 
			url : "/mediform/doctor/round/nurseRecord/detail",
			data : JSON.stringify(data),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(res) {
// 	            console.log("ajax 성공...!");
// 	            console.log(res);
	            
	            $('#nrsRcordWrterNr').val(res.nrsRcordWrter);
	            $('#empNmNr').val(res.empNm);
	            $('#patntNmNr').val(res.patntNm);
	            $('#nrsRcordDeNr').val(formatDate(res.nrsRcordDe));
	            $('#nrsRcordMemoNr').val(res.nrsRcordMemo);
	            
	        }
	 	});
	});
	
	/* 간호기록지 출력 종료 */
	
	/* 회진 내역 시작 */
	$('#inpatientRecordTrBody').on('click', '.inpatientRecordTr' ,function(){
		var inptntNo = $(this).data("inptntno");
		var data = {
				inptntNo : inptntNo, 
			};
		$('.inpatientRecordTr').removeClass('selected');
	    $(this).addClass('selected');
// 	    console.log("inptntNo : " + inptntNo);
	    $.ajax({ 
	 		type : "post", 
			url : "/mediform/doctor/round/inpatientRecord/detail",
			data : JSON.stringify(data),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(res) {
// 	            console.log("ajax 성공...!");
// 	            console.log(res);
	            $('#doctorEmpNo').val(res.doctrEmpno);
	            $('#doctorEmpNm').val(res.empNm);
	            $('#doctorPatntNm').val(res.patntNm);
	            $('#doctorSysdate').val(formatDate(res.inptntDe));
	            $('#roundTextarea').val(res.inptntRcord);
	            
	            
	        }

	 	});
		
	});
	/* 회진 내역 끝 */
	
	
	/* 진료 내역 시작 */
	$('#clinicTrBody').on('click', '.clinicTr', function(){
		var clnicNo = $(this).data("clinicno");
// 		console.log("clnicNo : " + clnicNo);
		
		var data = {
				clnicNo : clnicNo, 
			}
		console.log(data);
	    $('.clinicTr').removeClass('selected');
	    $(this).addClass('selected');
		
		$.ajax({
	 		type : "post", 
			url : "/mediform/doctor/round/clinic/detail",
			data : JSON.stringify(data),
	 		contentType : "application/json; charset=utf-8",
	        beforeSend : function(xhr){            
	            xhr.setRequestHeader(header,token);
	        },
	        success: function(res) {
// 	            console.log("ajax 성공...!");
	            console.log(res);
	            
	          	$("#pastClnicTime").text("");
	         	// 진료 번호 값 초기화
	          	$("#pastClnicNo").text("");
	          	// 담당의 값 초기화
	          	$("#pastEmpNm").text("");
	          	// 발병일 값 초기화
	          	$("#pastAtfssDt").text("");
	          	// 진단내역 값 초기화
	          	$("#pastClnicCn").text("");
	          	// 상병 값 초기화
	          	$("#pastSAW").text("");
	          	// 검사 값 초기화
	          	$("#pastMEO").text("");
	          	// 치료 값 초기화
	          	$("#pastMTR").text("");
	          	// 처방 값 초기화
	          	$("#pastPO").text("");
	          	// 메모 값 초기화
	          	$("#pastMemo").text("");
	            
	            $("#pastClnicNo").text(res.clnicNo);
	            $('#pastEmpNm').text(res.empNm);
	            $('#pastClnicTime').text(formatDate(res.clnicTime));
	            $('#pastMTR').text(formatDate(res.prarndeLhstl));
	            $('#pastAtfssDt').text(formatDate(res.atfssDt));
	            
	            var clnicCnList = "";
	            if(res.clnicCn == null || res.clnicCn == ""){
	            	clnicCnList = '<div class="card p-2"> - </div>';
	            }else{
		            clnicCnList = '<div class="card p-2">' + res.clnicCn + '</div>';
	            }
	            $('#pastClnicCn').html(clnicCnList);
	            
	            var clnicMemoList = "";
	            if(res.clnicMemo == null || res.clnicMemo == ""){
	            	clnicMemoList = '<div class="card p-2"> - </div>';
	            }else{
		            clnicMemoList = '<div class="card p-2">' + res.clnicMemo + '</div>';
	            }
	            $('#pastMemo').html(clnicMemoList);
	            
	            // 상병 내역
	            var roundSickAndWoundedList = res.roundSickAndWoundedList;
	            var sickAndWoundedStr = "";
	            var sickStrList = "";
	            if(roundSickAndWoundedList == null || roundSickAndWoundedList.length == 0){
	    			
	            	sickAndWoundedStr = '<div class="card p-2"> - </div>';
				
				}else{
				
					var inx = 1;
					$.each(roundSickAndWoundedList, function(index, item){
						
						var sckwndSeKo = "";
			      		if(item.sckwndSe == '1'){
			      			sckwndSeKo = "주";
			      		}else if(item.sckwndSe == '2'){
			      			sckwndSeKo = "부";
			      		}else if(item.sckwndSe == '3'){
			      			sckwndSeKo = "배제";
			      		}
						
			      		sickStrList += '<div class="card mt-1 p-2">' + sckwndSeKo + " | " + item.kcd + " | " + item.sckwndKr + " | " + item.sckwndEn + '</div>';
						
					});
				}
	            
	            sickAndWoundedStr += sickStrList;
	            $('#pastSAW').html(sickAndWoundedStr);
	            
	            // 처방 오더 내역
	            var prescriptionOrderList = res.prescriptionOrderList;
	            var prescriptionOrderStr = "";
	            var pastPOList = "";
				if(prescriptionOrderList == null || prescriptionOrderList.length == 0){
	    			
					prescriptionOrderStr = '<div class="card p-2"> - </div>';
				
				}else{
				
					var inx = 1;
					$.each(prescriptionOrderList, function(index, item){
						
						pastPOList += '<div class="card mt-1 p-2">' + item.prscrptnNm + " │ " + item.mdctnCpcty + " (" + item.mdctnUnit + ") │"
						+ item.mdctnCo +  " (회) │ " + item.mdctnPd +  " (일) │ " + item.mdctnCoursUsage + '</div>';
						
					});
				}
				prescriptionOrderStr += pastPOList;
	            $('#pastPO').html(prescriptionOrderStr);
	            
	            // 검사 오더 내역
	            var medicalExamOrderList = res.medicalExamOrderList;
	            var medicalExamOrderStr = "";
	            var pastExamOrderList = "";
				if(medicalExamOrderList == null || medicalExamOrderList.length == 0){
					
					medicalExamOrderStr = '<div class="card p-2"> - </div>';
					
				}else{
				
					var inx = 1;
					$.each(medicalExamOrderList, function(index, item){
						var hlthchkpDt = formatDate(item.hlthchkpDt);
						
						pastExamOrderList += '<div class="card mt-1 p-2">' + hlthchkpDt + " │ " + item.hlthchkpCd + " | " + item.hlthchkpNm + " │" + item.hlthchkpResult + '</div>';
						
					});
				}
				medicalExamOrderStr += pastExamOrderList;
	            $('#pastMEO').html(medicalExamOrderStr);
	            
	        }

	 	});
	});
	
	
	
	
	/* 진료 내역 종료 */
	
	/* 날짜를 선택하여 해당 Detail 가져오기 종료 */
	
	
	$('.backBtn').on('click', function(){
		secondBody.hide();
		thirdBody.hide();
		roundMainBody.show();
		$('#clinicDiv').hide();
		
		// 회진 내역 값 비우기
		$('#doctorEmpNo').val("");
		$('#doctorEmpNm').val("");
		$('#doctorSysdate').val("");
		$('#hsptlzCdHidden').val("");
		$('#patntNmHidden').val("");
		$('#doctorPatntNm').val("");
		$('#roundTextarea').val("");
		$('#roundTextarea').prop("readonly", true);
		
		// 진단 내역 값 비우기
		$('#patntNmCl').val("");
		$('#patntSexdstnCl').val("");
        $('#patntAgeCl').val("");
        $('#empNmCl').val("");
        $('#clnicTimeCl').val("");
        $('#hsptlzDeCl').val("");
        $('#prarndeLhstlCl').val("");
        $('#atfssDtCl').val("");
        $('#clnicCnCl').val("");
        $('#sickAndWoundedCl').val("");
        $('#prescriptionOrderCl').val("");
        
        // 간호기록지 내역 삭제 
        $('#nrsRcordWrterNr').val("");
        $('#empNmNr').val("");
        $('#patntNmNr').val("");
        $('#nrsRcordDeNr').val("");
        $('#nrsRcordMemoNr').val("");
		
        // 치료기록지 값 비우기
        $('#otptCdOr').val("");
        $('#patntNmOr').val("");
        $('#patntSexdstnOr').val("");
        $('#otptAppealOr').val("");
//         $('#otptHistoryOr').val("");
        $('#orientTimeOr').val("");
        $('#orientPlaceOr').val("");
        $('#orientPersonOr').val("");
        $('#otptStmOr').val("");
        $('#otptLtmOr').val("");
        $('#otptStOr').val("");
        $('#otptDyspOr').val("");
        $('#otptPdOr').val("");
        $('#mustUbRightOr').val("");
        $('#mustUbLeftOr').val("");
        $('#mustLbRightOr').val("");
        $('#mustLbLeftOr').val("");
        $('#mainCntrvsOr').val("");
        $('#lngtrCoalOr').val("");
        $('#srtpdCoalOr').val("");
        $('#mustPlanOr').val("");
        
        // 모든 백그라운드 칼라 잡힌 놈들 클래스 삭제
        $('.clinicTr').removeClass('selected');
	});
	
	
	
	// 환자가 있는 병상 클릭 시 모달  -> 입원 정보 수정 및 퇴원 처리
	
	
	// 빈 병상 클릭 시 모달 -> 입원 처리
	oneEbed.on("click", function(){
		
// 		console.log("빈 병상 클릭 이벤트 성공!");
		
		
		var bedNo = $(this).attr("id"); // 병상 번호 가져오기 (예 : 501_1)
		
		// 클릭한 병상의 ID를 가져와서 스플릿하여 병실 호수 와 병상 번호 가져오기
		var hospitalizationRoomNoSplit = bedNo.split("_")[0]; // 병실 호수
		var hospitalizationBedNoSplit = bedNo.split("_")[1]; // 병상 번호
		
		// 환자를 선택하지 않았을 경우 예외처리
		if($("#patntNo").val() == null || $("#patntNo").val() === ""){
			Swal.fire({
			      icon: 'error',
			      title: '선택한 환자 정보가 없습니다',
			      text: '환자를 선택해주세요',
			      confirmButtonText: '확인',
			      confirmButtonColor: 'midnightblue',
			    });
		// 환자를 선택했을 경우 모달창 띄우기
		}else{
			eHospitalizationModal.modal("show");
			
			var selectedClinic = '';
			$("#clinicListTable1").on("change", ".checkPatient", function(){
				
				var checkboxes = $(".checkPatient");
				
				if($(this).is(":checked")){
					selectedClinic = $(this).val();
					 checkboxes.not(this).prop("checked", false);
				}
// 				console.log("체크된 진료 기록 >>> " + selectedClinic);
			});
			
		}
		
	});
	
});

$(function(){
		// 시큐리티 토큰 관련 2개
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		// 환자 정보를 담을 테이블
		var patientTable = $("#patientTable");
// 		console.log(patientTable);
		let selectedIndex = -1;

		// 반만 작동중 수정해야함
		// 검색창에 공백일 때 클릭 시 전체 리스트 출력
		
		// 환자 검색 시 키보드를 한글자씩 눌렀다가 떼는 순간 이벤트 발생
		
});
	
	
//모든 진료 기록 조회 호출 함수 시작
function selectClinicList(patntNo){
	
// 	console.log("진료기록 조회 함수 시작!!!")
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var clinicListHtml = "";
	var clinicListTable = $("#clinicListTable");
	
	var patientObj = {
			patntNo : patntNo
		};
	
	
	var clinic = "";
	// 환자 진료 기록 조회 ajax 시작
	$.ajax({
		type : "post",
		url  : "/mediform/doctor/allClinic",
		data : JSON.stringify(patientObj),
		contentType : "application/json; charset=utf-8",
        beforeSend : function(xhr){
            xhr.setRequestHeader(header,token);
        },
		success : function(res){
			console.log("환자 진료 기록 조회 : " + res.length);
				
			console.log("환자 진료 기록 조회 : " + res.length);
			console.log("진료번호 : " + this.clnicNo);

			if(res.length == 0){
			
// 				console.log("진료 기록 조회 없음");
				clinicListHtml += "<tr class='oneBoard' id=''>";
				clinicListHtml += "	<td colspan='4' class='text-center' style='vertical-align: middle'>" + "진료 내역이 없습니다" + "</td>";
				clinicListHtml += "</tr>";
			
			}else{
			
				var inx = 1;
				$(res).each(function(){
				
					var dateString = this.clnicTime;
					var date = new Date(dateString);
					var year = date.getFullYear();
					var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
					var day = date.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅

					// 원하는 형식으로 조합
					var formattedDate = year + '.' + month + '.' + day;
	
// 					console.log("의사 사번 :>>> " + this.empNo);
					
					///////////////////////////////////////////////////
					// 사번 >>> if문 추가
					///////////////////////////////////////////////////
					
					
					clinicListHtml += "<tr class='oneBoard' id=''>";
					clinicListHtml += "	<td class='text-center' style='vertical-align: middle'>" + inx + "</td>";
					clinicListHtml += "	<td class='text-center' style='vertical-align: middle'>" + formattedDate + "</td>";
					clinicListHtml += "	<td class='text-center' style='vertical-align: middle'>" + "" + "</td>";
					clinicListHtml += "	<td class='text-center' style='vertical-align: middle'>" + this.clnicMemo + "</td>";
					clinicListHtml += "</tr>";
					
					
					inx += 1;
				});
			}
			clinicListTable.html(clinicListHtml);
				
		},
		error : function(err){
// 			console.log(err.status)
		}
	});
	// 환자 진료 기록 조회 ajax 끝
}

function selectPatientAjax(patntNo){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var patientObj = {
				patntNo : patntNo
				};
		
		// 환자 정보 ajax 시작
		$.ajax({
			type : "post",
			url  : "/mediform/patient/info",
			data : JSON.stringify(patientObj),
			contentType : "application/json; charset=utf-8",
			async: false,
	        beforeSend : function(xhr){
	            //ajax호출 중 처리
	            //글로벌 변수로 설정한 csrf token 셋팅
	            xhr.setRequestHeader(header,token);
	        },
			success : function(res){
// 				console.log("patntNo : "+res.patntNo+" | patntNM : "+res.patntNm +" | patntTelno : "+res.patntTelno);
				// 보험
				if(res.patntHlthinsAt == "Y"){
					patntHlthinsAt = "O";
				}else{
					patntHlthinsAt = "X";
				}
				// 입원여부
				if(res.patntHsptlzAt == "Y"){
					patntHsptlzAt = '<span class="fas fa-bed text-success fs-2"></span>';
					
				}else {
					patntHsptlzAt = '<span class="fas fa-bed text-danger fs-2"></span>';
				}
				// 주민등록번호 앞자리를 문자열로 바꾼 후 앞에서 2개씩 끊어낸다.(생년월일에 사용하기 위해)
				var patntRrno1 = res.patntRrno1;
				// 성별
				var patntSexdstn = "";
				if(res.patntSexdstn == "M"){
					patntSexdstn = "남";
				}else{
					patntSexdstn = "여";
				}
				
				
				// 환자 간단 정보에 값 넣기
// 					$(pTableTd[0]).html(res.patntNm);
// 					$(pTableTd[1]).html(res.patntNo);
// 					$(pTableTd[2]).html(patntHlthinsAt);
// 					$(pTableTd[3]).html(patntHsptlzAt);
// 					$(pTableTd[4]).html('<a href="/">특이사항</a>');
// 					$(pTableTd[5]).html(patntRrno1);
// 					$(pTableTd[6]).html(res.patntAge+"세");
// 					$(pTableTd[7]).html(patntSexdstn);
// 					$(pTableTd[8]).html(res.patntTelno);
// 					$(pTableTd[10]).html(res.patntMemo);
				
// 				console.log("성별 ::::" + patntSexdstn);
// 				console.log("나이 ::::" + res.patntAge);

				$("#patntNm").val(res.patntNm);
				$("#patntSexdstn").val(patntSexdstn);
				$("#patntRrno1").val(patntRrno1);
				$("#patntTelno").val(res.patntTelno);
				$("#patntAge").val(res.patntAge+"세");
				$("#patntHlthinsAt").val(patntHlthinsAt);
				$("#patntAdres1").val(res.patntAdres1);
				$("#patntAdres2").val(res.patntAdres1);
				$("#patntMemo").val(res.patntMemo);
				
				// 받아온 환자 정보 hidden으로 값을 숨기기
				$("#patntNo").val(res.patntNo);
				$("#prtctorNm").val(res.prtctorNm);
				$("#prtctorTelno").val(res.prtctorTelno);
				$("#patntHeight").val(res.patntHeight);
				$("#patntBdwgh").val(res.patntBdwgh);
				$("#patntBdp").val(res.patntBdp);
				
// 				console.log("환자번호 : " + res.patntNo);
// 				console.log("보호자 이름 : " + res.prtctorNm);
// 				console.log("보호자 전화번호 : " + res.prtctorTelno);
// 				console.log("환자  키 : " + res.patntHeight);
// 				console.log("환자 몸무게 : " + res.patntBdwgh);
// 				console.log("환자 혈액형 : " + res.patntBdp);
				
			},
			error : function(err){
// 				console.log("err에러 : " + err);
			}
			
		});
	// 환자 정보 ajax 끝
	
	
}
	
	
</script>