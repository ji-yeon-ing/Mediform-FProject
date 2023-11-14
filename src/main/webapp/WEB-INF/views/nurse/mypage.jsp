<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 프로필 촬영을 위한 스크립트 시작-->
<script src="http://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script>
<!-- 프로필 촬영을 위한 스크립트 종료 -->
<script>
	var isRTL = JSON.parse(localStorage.getItem('isRTL'));
	if (isRTL) {
		var linkDefault = document.getElementById('style-default');
		var userLinkDefault = document.getElementById('user-style-default');
		linkDefault.setAttribute('disabled', true);
		userLinkDefault.setAttribute('disabled', true);
		document.querySelector('html').setAttribute('dir', 'rtl');
	} else {
		var linkRTL = document.getElementById('style-rtl');
		var userLinkRTL = document.getElementById('user-style-rtl');
		linkRTL.setAttribute('disabled', true);
		userLinkRTL.setAttribute('disabled', true);
	}
</script>
<c:set var="customUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />


<form action="/mediform/common/mypage/update" id="updateForm"
	method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="empNo" value="${employeeVO.empNo}"/>
	
	<div class="card border border-secondary mb-3">
		<div class="card-header bg-secondary">
			<div class="row flex-between-end">
				<div class="col-auto align-self-center">
					<h5 class="text-white mb-0 fw-semi-bold" data-anchor="data-anchor">회원정보</h5>
				</div>
			</div>
		</div>
		<div class="card-body bg-body-tertiary">
			<div class="tab-content">
				<div class="tab-pane preview-tab-pane active" role="tabpanel"
					aria-labelledby="tab-dom-a5ed76cd-9697-4ee4-b6d5-4d29bc251807"
					id="dom-a5ed76cd-9697-4ee4-b6d5-4d29bc251807">

					<div class="row">
						
						<div class="col-2">
						
						
						</div>

						<div class="col-4">
							<div class="row">

								<div class="col-6">
									<label class="form-label" for="dateInputmask">이름</label> <input
										class="form-control" id="empNm" name="empNm"
										value="${employeeVO.empNm}" type="text" />
								</div>

								<div class="col-6">
									<label class="form-label" for="dateInputmask">성별</label> <select
										class="form-select" id="empSexdstn" name="empSexdstn"
										aria-label="Default select example">
										
										<option value="M"<c:if test="${employeeVO.empSexdstn eq 'M'}">selected</c:if>>남자</option>
										<option value="F"<c:if test="${employeeVO.empSexdstn eq 'F'}">selected</c:if>>여성</option>
									</select>
								</div> 
							</div>

							<br>

							<div class="row">
								<div class="col-6">
									<label class="row form-label" for="dateInputmask">&nbsp;&nbsp;&nbsp;&nbsp;주민등록번호</label>
									<input class="form-control" id="empRrno1" name="empRrno1"
										value="${employeeVO.empRrno1}" type="text" />
								</div>

								<div class="col-6">
									<label class="row form-label" for="dateInputmask">&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input class="form-control" id="empRrno2" name="empRrno2"
										value="${employeeVO.empRrno2}" type="password" />
								</div>
							</div>

							<br>

							<div class="row">
								<div class="col-12">
									<label class="form-label" for="dateInputmask">휴대폰번호</label> <input
										class="form-control" id="empTelno" name="empTelno"
										value="${employeeVO.empTelno}" type="text" />
								</div>

							</div>
							<br>
							<div class="row">
								<div class="col-12">
									<label class="form-label" for="dateInputmask">이메일</label> <input
										class="form-control" id="empEmail" name="empEmail"
										value="${employeeVO.empEmail}" type="text" />
								</div>
								
							</div>


							<div class="row">
								<div class="col-6">
									<label class="form-label" for="dateInputmask">우편번호</label> <input
										class="form-control" id="empZip" name="empZip"
										data-input-mask='{"alias":"datetime","inputFormat":"dd/mm/yyyy"}'
										value="${employeeVO.empZip}" type="text" />
								</div>
								<div class="col-6">
									<label class="form-label" for="dateInputmask">&nbsp;&nbsp;</label><br>
									<button type="button" onclick="DaumPostcode()"
										class="btn btn-secondary btn-flat">우편번호 찾기</button>
								</div>
							</div>
							<br>
							<div class="mb-3">
								<label class="form-label" for="dateInputmask">주소</label> <input
									class="form-control" id="empAdres1" name="empAdres1"
									value="${employeeVO.empAdres1}" type="text" />
							</div>

							<div class="mb-3">
								<label class="form-label" for="dateInputmask">상세주소</label> <input
									class="form-control" id="empAdres2" name="empAdres2"
									value="${employeeVO.empAdres2}" type="text" />
							</div>
						</div>



						<div class="col-4">
							<!-- 프로필 이미지, 경력사항 -->
							<br><br><br><br><br>
							
							<div class="row">
								<div class="col-3">
								
								</div>
							
								<div class="col-6">
									<div class="input-group mb-3 text-center">
										<div class="avatar avatar-5xl avatar-profile shadow-sm img-thumbnail rounded-circle" id="profileDiv">
											<div class="h-100 w-100 rounded-circle overflow-hidden position-relative">
												<img id="thumbnail" src="${employeeVO.empProfile}" width="200" alt="" data-dz-thumbnail="data-dz-thumbnail" />
												<label class="mb-0 overlay-icon d-flex flex-center" for=""> 
													<span class="bg-holder overlay overlay-0"></span> 
													<span class="z-1 text-white dark__text-white text-center fs--1">
													<span class="fas fa-camera"></span> 
													<span class="d-block">Update</span>
												</span>
												</label>
											</div>
										</div>
									</div>
									<input class="d-none" name="imgFile" id="profileImage" type="file" style="display: none;"/> 
								<div class="col-3">
							
								</div>
							</div>
						</div>
						<br><br><br><br>
						<div class="row">
							<div class="col-2">
							
							</div>
							<div class="col-8">
								<span class="mb-0 fw-semi-bold">사번</span> &nbsp;&nbsp;&nbsp; ${employeeVO.empNo}
							</div>
							<div class="col-2">
								
							</div>
						</div>
						
						<c:if test = "${employeeVO.empSe eq 'a'}">
							<c:set value="원무과" var="dept"/>
						</c:if>
						<c:if test = "${employeeVO.empSe eq 'd'}">
							<c:set value="의사" var="dept"/>
						</c:if>
						<c:if test = "${employeeVO.empSe eq 'n'}">
							<c:set value="간호사" var="dept"/>
						</c:if>
						<c:if test = "${employeeVO.empSe eq 't'}">
							<c:set value="치료사" var="dept"/>
						</c:if>
						<c:if test = "${employeeVO.empSe eq 'm'}">
							<c:set value="관리자" var="dept"/>
						</c:if>
						<c:if test = "${employeeVO.empSe eq 'k'}">
							<c:set value="병원장" var="dept"/>
						</c:if>
						
						<div class="row">
							<div class="col-2">
							
							</div>
							<div class="col-8">
								<span class="mb-0 fw-semi-bold">소속</span> &nbsp;&nbsp;&nbsp; ${dept}
							</div>
							<div class="col-2">
							
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-2">
							
							</div>
							<div class="col-8">
								<span class="mb-0 fw-semi-bold">연차 잔여수</span> &nbsp;&nbsp;&nbsp; ${employeeVO.empYrycRemndr}
							</div>
							<div class="col-2">
								
							</div>
						</div>
						
						<hr>
						
						<div class="row">
							<div class="col-2">
									
							</div>
							<div class="col-8">
								<h5 class="mb-0 fw-semi-bold">비밀번호 변경</h5>
							</div>
							<div class="col-2">
									
							</div>
						
						</div>
						
						<br>
						
						<div class="row">
							<div class="col-2">
									
							</div>
							<div class="col-7">
								<label class="form-label" for="dateInputmask">기존 비밀번호</label> 
								<input
									class="form-control" id="pwBefore" name="pwBefore"
									value="" type="text" />
							</div>
							<div class="col-3">
									
							</div>
						</div>
						
						<div class="row">
							<div class="col-2">
									
							</div>
							<div class="col-7">
								<label class="form-label" for="dateInputmask">새 비밀번호</label> 
								<input
									class="form-control" id="empPw" name="empPw"
									value="" type="text" />
							</div>
							<div class="col-3">
									
							</div>
						</div>
						
						<div class="row">
							<div class="col-2">
									
							</div>
							<div class="col-7">
								<label class="form-label" for="dateInputmask">새 비밀번호 확인</label> 
								<input
									class="form-control" id="empPwCheck" name="empPwCheck"
									value="" type="text" />
							</div>
							<div class="col-3">
								<div style="height: 32px;"></div>
								<button id="updateBtn" type="button" class="btn btn-primary">수정</button>
							</div>
						</div>
						
						
		
						
						<div class="col-2">
							
						
						</div>
						
								
					</div>
						
				</div>
			</div>
		</div>
	</div>
</div>
<!-- | 프로필 사진을 찍기 위한 영상 모달 | 시작 -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document"
		style="max-width: 800px">
		<div class="modal-content position-relative">
			<div class="position-absolute top-0 end-0 mt-2 me-2 z-1">
			</div>
			<div class="modal-body p-0">
				<div class="rounded-top-3 py-3 ps-4 pe-6 bg-body-tertiary">
					<h4 class="modalHeader mb-1" id="modalExampleDemoLabel">프로필 촬영</h4>
				</div>
				<!-- 바디 본문 -->
				<div class="row mt-3" style="">
					<div class="d-flex flex-center">
						<video id="myCam" poster="" playsinline autoplay muted></video>
					</div>
				</div>
				
				
				<div class="row">
				  <div class="d-flex flex-center mt-3">
				    <button class="btn btn-falcon-primary me-1 mb-1" type="button" id="captureBtn" style="width: 100px;">
				      <div style="height: 30px; display: flex; align-items: center; justify-content: center;">
				        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-camera" viewBox="0 0 16 16">
				          <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
				          <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
				        </svg>
				      </div>
				    </button>
				  </div>
				</div>
				
				<!-- 바디 본문 -->
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" id="" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- | 프로필 사진을 찍기 위한 모달 | 끝 -->

<!-- | 사진 확인용 모달 | 시작 -->
<div class="modal fade" id="profileCheck-modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document"
		style="max-width: 800px">
		<div class="modal-content position-relative">
			<div class="position-absolute top-0 end-0 mt-2 me-2 z-1">
			</div>
			<div class="modal-body p-0">
				<div class="rounded-top-3 py-3 ps-4 pe-6 bg-body-tertiary">
					<h4 class="modalHeader mb-1" id="modalExampleDemoLabel">사진 확인</h4>
				</div>
				<!-- 바디 본문 -->
				<div class="row mt-3" style="display: flex; justify-content: center;">
				
					<div class="col-12 d-flex flex-center" id="captureImgDiv" style="width: 360px;">
					<!-- 캡처 이미지  출력 부분 -->
					</div>
					
					<!-- 예제에서 이곳에 img 데이터 값 넣어두라고 함. -->
					<input type="hidden" name="imgSrc" id="imgSrc" />
					<input type="hidden" name="profileFlag" id="profileFlag">

					
				</div>
				
				<!-- 바디 본문 -->
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" id="uploadProfileBtn">등록</button>
				<button class="btn btn-primary" type="button" id="" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- | 사진 확인용 모달 | 끝 -->	
<sec:csrfInput />

</form>
	<input type="hidden" id="empPwOrg" name="empPwOrg" value="${employeeVO.empPw }"/>	




<script src="../../../vendors/popper/popper.min.js"></script>
<script src="../../../vendors/bootstrap/bootstrap.min.js"></script>
<script src="../../../vendors/anchorjs/anchor.min.js"></script>
<script src="../../../vendors/is/is.min.js"></script>
<script src="../../../vendors/inputmask/inputmask.min.js"></script>
<script src="../../../vendors/prism/prism.js"></script>
<script src="../../../vendors/fontawesome/all.min.js"></script>
<script src="../../../vendors/lodash/lodash.min.js"></script>
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="../../../vendors/list.js/list.min.js"></script>
<script src="../../../assets/js/theme.js"></script>
<script src="/resources/assets/js/flatpickr.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		
// 		$(document).ready(function() {
// 		    var contextPath = ${pageContext.request.contextPath};
// 		    var empProfile = ${customUser.employee.empProfile};
// 		    console.log("contextPath : " + contextPath);
// 		    console.log("empProfile : " + empProfile);

// 		    // 이미지의 src 속성 설정
// 		    $("#thumbnail").attr("src", contextPath + empProfile);
// 		  });
		
		/* 프로필 촬영 script 시작 */
		
		var profileDiv = $('#profileDiv');
		var profileImage = $('#profileImage');
		
		// 출력할 공간
		var myCam = $('#myCam');
		// 촬영 버튼
		var captureBtn = $('#captureBtn');
		var localStream;
		
		var getUserMedia = navigator.mediaDevices.getUserMedia || navigator.webkitGetUserMedia || 
		    navigator.mozGetUserMedia || navigator.mzGetUserMedia;
		
		
		profileDiv.on('click', function() {
		
		    Swal.fire({
		      icon: 'info',
		      title: '프로필 사진 등록',
		      text: '프로필 사진을 어떻게 등록하시겠습니까?',
		      confirmButtonColor: 'blue',
		      showCancelButton: true,
		      showCloseButton: true, 	// 닫기버튼임. 삭제해도 됨
		      confirmButtonText: '촬영',
		      cancelButtonText: '내 컴퓨터에서 찾기',
		    }).then((result) => {
		      if (result.isConfirmed) {
		        // '촬영' 버튼이 클릭되었을 때 실행할 코드
		        $('#profile-modal').modal('show');
		        getUserMedia({ video: true, audio: false })
			        .then((stream) => {
			            localStream = stream;
			            myCam[0].srcObject = localStream; // 내 화면 출력
			        }).catch((err) => {
			        	Swal.fire({
						      icon: 'error',
						      title: '오류 발생',
						      text: '카메라 또는 마이크를 찾을 수 없습니다.',
						      confirmButtonColor: 'blue'
						    }).then((result) => {
							      if (result.isConfirmed) {
							    	  $('#profile-modal').modal('hide');
//	 						    	  console.log("error났슈");
								      } 
								    });
			        });
		        
		        
		        
		      } else if (result.dismiss === Swal.DismissReason.cancel) {
		        // '내 컴퓨터에서 찾기' 버튼이 클릭되었을 때 input 요소를 클릭하도록 함
		        profileImage.click();
		      }
		    });
		
		});
		
		// 모달창이 닫히면 영상 실행 종료
		$('#profile-modal').on('hide.bs.modal', function (e) {
		  // 모달이 숨겨질 때 실행할 코드
		  if (localStream) {
	                localStream.getTracks().forEach(track => {
	                    track.stop();
	                });
	            }
	            myCam[0].srcObject = null; // 비디오 스트림을 중지시킴
		});
		
		
		
		// 사진 촬영
		captureBtn.on('click', function () {
			  var canvasContainer = document.getElementById("captureImgDiv");

			  // 이미지를 생성하기 전에 기존 자식 요소를 모두 지우기
			  while (canvasContainer.firstChild) {
			    canvasContainer.removeChild(canvasContainer.firstChild);
			  }

			  html2canvas($("#myCam").get(0)).then(function (canvas) {
			    var canvasWrapper = document.createElement("div");
			    canvasWrapper.appendChild(canvas);
			    canvasContainer.appendChild(canvasWrapper);
			  });

			  $('#profileCheck-modal').modal('show');
			});

		// 확인된 사진을 등록하는 버튼
		var uploadProfileBtn = $('#uploadProfileBtn');
		uploadProfileBtn.on('click', function(){
			//console.log("click...!");
			
			html2canvas($("#captureImgDiv").get(0)).then(function (canvas) {
				// 데이터 형식의 파일(?)
				$('#imgSrc').val(canvas.toDataURL("image/png"));
				// 해당 내역(썸네일에 추가)
				$("#thumbnail").attr("src",canvas.toDataURL("image/png"));
				
				// 사진을 찍었을 때의 flag
				$('#profileFlag').val("1");
				$("#profileCheck-modal").modal("hide");
				$("#profile-modal").modal("hide");
			  });
			
			
			
			
		});
		/* 프로필 촬영 script 끝 */
		

		var updateBtn = $("#updateBtn");
		var updateForm = $("#updateForm");
		var profileImage = $("#profileImage");
		var pwBefore = $("#pwBefore");
		var empPwOrg = $("#empPwOrg");
		
		
		
		updateBtn.on("click", function() {
			
			var empPwCheck = $("#empPwCheck").val();
			var empPw = $("#empPw").val();
			
			//console.log("새비밀번호 >>>>> " + empPw);
		//	console.log("비밀번호 확인 >>>>> " + empPwCheck);
			
			if(empPw != empPwCheck){
				Swal.fire({
				      icon: 'error',
				      title: '비밀번호 오류',
				      text: '비밀번호가 다릅니다',
				      confirmButtonText: '확인',
				      confirmButtonColor: 'midnightblue',
				    })
				
				return false;
			}
			
			
			updateForm.submit();
		});

		profileImage.on("change", function() {
			var file = event.target.files[0];

			if (isImageFile(file)) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#thumbnail").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			} else {
				alert("이미지 파일을 선택해주세요");
			}
			
			// 컴퓨터에서 파일을 골랐을 때 flag
			$('#profileFlag').val("2");
		});

	})

	function isImageFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 꺼낸다
		return ($.inArray(ext, [ "jpg", "jpeg", "gif", "png" ]) === -1 ? false
				: true);
	}

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
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('empZip').value = data.zonecode;
				document.getElementById("empAdres1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("empAdres2").focus();
			}
		}).open();
	}
</script>




