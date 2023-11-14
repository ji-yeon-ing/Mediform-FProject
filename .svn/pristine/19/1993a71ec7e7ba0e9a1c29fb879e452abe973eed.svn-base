<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메디폼 │ 행정관리자</title>
<style type="text/css">
#header{
	font-weight: bold;
}

.text-nowrap{
	cursor: pointer;
}

.subMenu:hover {
	border-color: #3f51b5;
  	background-color: rgba(63, 81, 181, 0.1);
}

.subMenu {
	font-size: 16px;
	margin-left : 20px;
	margin-right : 20px; 
}

#searchBtn, #spanCss{
	display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%; /* 부모 요소의 높이를 100%로 설정하여 세로 가운데 정렬합니다. */
}
</style>
</head>
<body>
<!-- 서브 메뉴 -->            
<ul class="navbar-nav d-flex flex-row" style="margin-bottom: 15px; border-bottom: 1px solid #ededed; border-top: 1px solid #ededed;">
	<li style="margin-left:15px;"></li>
    <li class="subMenu nav-item">
      <a class="nav-link" href="/mediform/manager/receive/list/select" role="button" id="employeeManagementBtn"> 　수납 내역　</a>
    </li>
    <li class="subMenu nav-item">
      <a class="nav-link" href="/mediform/manager/receive/unpaidList/list/select" role="button" id="employeeOrganizationChartBtn">　미수납 내역　</a>
    </li>
</ul>
<!-- 서브 메뉴 -->


<div class="row" >
	<div class="col-lg-5" >
		<div class="card" style="height: 680px;">
	       <div class="card-header border-bottom" style="background-color: midnightblue">
	         <div class="row flex-between-end">
	           <div class="col-auto align-self-center">
	             <h5 class="mb-0 text-white fw-semi-bold" id="header">상세보기</h5>
	           </div>
	           <div class="col-auto ms-auto">
	           </div>
	         </div>
	       </div>
	       <div class="card-body pt-0">
	         <div class="tab-content">
	           <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-1123d529-5101-4101-b597-dac496b93923" id="dom-1123d529-5101-4101-b597-dac496b93923">
	             
	             <!-- THIS -->
	             	<br>
					<div class="row card-body pt-0">
						<div class="tab-content">
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle-subtle text-black text-center form-control"
											id="" name="" type="text" value="이름" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntNm" name="patntNm"
												type="text" value="조제 알도" disabled />
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="성별" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntSexdstn" name="patntSexdstn"
												type="text" value="남성" disabled />
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="생년월일" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntRrno1" name="patntRrno1"
												type="text" value="1984-08-01" disabled />
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="나이" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntAge" name="patntAge"
												type="text" value="38" disabled />
										</div>
									</div>
								</div>
							</div>	
							<br>
							<div class="row">
								<div class="col-12">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-3 mb-2 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="주소" disabled />
										<div class="col-9 input-group-append p-0 m-0">
											<input class="text-black form-control bg-white" id="patntAdres1" name="patntAdres1"
												type="text" value="브라질 상파울로 오호랜드" disabled />
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="row input-group">
										<div class="col-3"></div>
										<div class="col-9 input-group-append p-0 m-0">
											<input class="text-black form-control bg-white" id="patntAdres2" name="patntAdres2"
												type="text" value="오호리 31-1" disabled />
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="전화번호" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntTelno" name="patntTelno"
												type="text" value="010-1111-2222" disabled />
										</div>
									</div>
								</div>
								
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="보험 구분" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input
												class="text-black text-center form-control px-0 bg-white"
												id="patntHlthinsAt" name="patntHlthinsAt" type="text" value="건강보험" disabled />
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="수납 구분" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="" name=""
												type="text" value="미수납" disabled />
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="수납 총액" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="" name=""
												type="text" value="380,000원" disabled />
										</div>
									</div>
								</div>
							</div>
		
							<br>
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="수진자 부담액" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="" name=""
												type="text" value="258,000원" disabled />
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="누적 수납 금액" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="" name=""
												type="text" value="0원" disabled />
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-6">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-6 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="미수 금액" disabled />
										<div class="col-6 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="" name=""
												type="text" value="258,000원" disabled />
										</div>
									</div>
								</div>
								
								
								
								
								
								
							</div>
							<br>
							<div class="row">
								<div class="col-12">
									<div class="row input-group">
										<input
											class="fw-semi-bold col-2 bg-secondary-subtitle text-black text-center form-control"
											id="" name="" type="text" value="메모" disabled />
										<div class="col-10 input-group-append p-0 m-0">
											<input class="text-black text-center form-control bg-white" id="patntMemo" name="patntMemo"
												type="text" value="" disabled />
										</div>
									</div>
								</div>
							</div>
							<br>
						</div>
					</div>
	           </div>
	         </div>
	       </div>
	     </div>
	</div>
	
	<!-- 미수납list -->
	<div class="col-lg-7">
		<div class="card" style="height: 680px;">
	       <div class="card-header border-bottom" style="background-color: midnightblue">
	         <div class="row flex-between-end">
	           <div class="col-auto align-self-center">
	             <h5 class="mb-0 text-white fw-semi-bold" id="header">미수납 내역</h5>
	           </div>
	           <div class="col-auto ms-auto">
	           </div>
	         </div>
	       </div>
	       <div class="card-body pt-0">
	         <div class="row" style="margin-top:5px;">
			    <form action="/mediform/manager/receive/select" method="post" id="empListForm" style="display: flex;">
				   <div style="display: flex; margin-left: 50px;">    
				        <select class="form-select form-select-sm" aria-label=".form-select-sm example" id="" name="searchType" style="width: initial; ">
				            <option value="com" >전체</option>
				            <option value="com" >미수납</option>
				            <option value="part">부분수납</option>
				        </select>
			        	<div class="search-box" id="empSearchBox" style="display: flex;">
			            <input class="searchInput form-control search-input fuzzy-search" type="search" placeholder="수진자명을 입력해 주세요." 
			            aria-label="Search" id=""  value="" name="searchWord"/>
			            <span class="fas fa-search search-box-icon"></span>
			            <div class="btn-close-falcon-container position-absolute end-0 top-50 translate-middle shadow-none" data-bs-dismiss="search">
			                <button class="btn btn-link btn-close-falcon p-0" aria-label="Close"></button>
			            </div>
			        	</div>
			       </div>
			       &nbsp; 
         			<div style="display: flex; justify-content: flex-end;">
         				<input type="date" id="selectDate1" name=""> 
         				<span id="spanCss">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
         				<input type="date" id="selectDate2" name="">
         				&nbsp;
         				<button class="btn btn-outline-secondary me-1 mb-1"  type="button" id="searchBtn">검색</button> 
					</div>
			        <sec:csrfInput />
			    </form>
	         </div>
	         <div class="tab-content">
	           <div class="tab-pane preview-tab-pane active" role="tabpanel" aria-labelledby="tab-dom-1123d529-5101-4101-b597-dac496b93923" id="dom-1123d529-5101-4101-b597-dac496b93923">
	             <div class="table-responsive scrollbar">
	               <table class="table table-hover table-striped overflow-hidden">
	                 <thead>
	                   <tr>
	                     <th class="col-2 text-center" scope="col">수납번호</th>
	                     <th class="col-2 text-center" scope="col">수진자명</th>
	                     <th class="col-2 text-center" scope="col">성별</th>
	                     <th class="col-2 text-center" scope="col">입원여부</th>
	                     <th class="col-2 text-center" scope="col">수납일시</th>
	                     <th class="col-2 text-center" scope="col">미수금액</th>
	                   </tr>
	                 </thead>
	                 <tbody>
	                   <tr class="align-middle">
	                     <td class="text-nowrap text-center">OSJ0001</td>
	                     <td class="text-nowrap text-center">남민주</td>
	                     <td class="text-nowrap text-center">여성</td>
	                     <td class="text-nowrap text-center">X</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">908,000원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                   <tr class="align-middle">
	                   	 <td class="text-nowrap text-center">OSJ0851</td>
	                     <td class="text-nowrap text-center">임찬빈</td>
	                   	 <td class="text-nowrap text-center">남성</td>
	                     <td class="text-nowrap text-center">O</td>
	                     <td class="text-nowrap text-center">2023/09/26</td>
	                     <td class="text-nowrap text-center">312,800원</td>
	                   </tr>
	                 </tbody>
	               </table>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	
	/* 검색 x버튼 누르면 검색창 초기화 */
	var searchXbtn = $('.btn-close-falcon-container');
	searchXbtn.on('click', function(){
		event.preventDefault();
		$('.fuzzy-search').val("");
	});
	
	// 날짜 유효성 검사
	$('#selectDate1').on('change', function() {
        var date1 = new Date($(this).val());
        var date2 = new Date($('#selectDate2').val());

        if (date1 > date2) {
        	Swal.fire({
			      icon: 'error',
			      title: 'error',
			      html: '입력한 날짜 범위가 올바르지 않습니다. <br> 시작 날짜는 종료 날짜보다 이전이어야 합니다.',
			      confirmButtonColor: 'blue'
			    });
            $(this).val(''); // 값을 변경하지 않음
        }
    });

    // selectDate2 값 변경 감지
    $('#selectDate2').on('change', function() {
        var date1 = new Date($('#selectDate1').val());
        var date2 = new Date($(this).val());

        if (date2 < date1) {
        	Swal.fire({
			      icon: 'error',
			      title: 'error',
			      html: '입력한 날짜 범위가 올바르지 않습니다. <br> 종료 날짜는 시작 날짜보다 이후여야 합니다.',
			      confirmButtonColor: 'blue'
			    });
            $(this).val(''); // 값을 변경하지 않음
        }
    });	
});
</script>
</body>
</html>