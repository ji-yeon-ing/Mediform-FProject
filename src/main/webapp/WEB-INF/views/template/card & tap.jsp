<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- 스크롤이 생기는 테이블 CSS - 테이블 head 상단 고정 css -->
<style>
.table thead {
  position: sticky;
  top: 0;
  z-index: 1; /* 다른 콘텐츠 위로 표시하기 위해 z-index를 설정합니다. */
}
</style>
<!--  -->



<!-- 카드  -->
<div class="card border border-secondary" style="height: 210px;">

	<!-- 카드 헤더 시작 -->
	<div class="card-header border-bottom p-2"
		style="height: 35px; background-color: midnightblue">
		<div class="row">
			<div class="col-12 align-self-center">
				<h5 class="text-center text-white mb-0 fw-semi-bold" id="header">
					501호</h5>
			</div>

		</div>
	</div>
	<!-- 카드 헤더 끝 -->

	<!-- 카드 바디 시작 -->
	<div class="row card-body pt-0">501호 병상</div>
	<!-- 카드 바디 끝 -->

</div>
<!-- 카드  끝 -->



<!-- ################################################################################################ -->


<!-- 탭이 있는 카드 시작 -->

<div class="card border border-secondary" style="height: 750px;">
	<!-- (실질적 카드 헤더) -->
	<div>
		<!-- 탭 메뉴's -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		
		
			<li class="nav-item text-center col-6">
				<a class="nav-link active fw-semi-bold" id="home-tab"
				data-bs-toggle="tab" href="#tab-home" role="tab"
				aria-controls="tab-home" aria-selected="true">진료실</a>
			</li>
				
				
			<li class="nav-item text-center col-6">
				<a class="nav-link fw-semi-bold" id="profile-tab" data-bs-toggle="tab"
				href="#tab-profile" role="tab" aria-controls="tab-profile"
				aria-selected="false">치료실</a>
			</li>
			
		</ul>
	</div>

	
	<div class="row card-body pt-0">
		<div class="tab-content border border-top-0 p-3" id="myTabContent">

			<!-- 탭 (탭 내용을 아래 div 영역에 입력) -->
			<div class="tab-pane fade show active" id="tab-home" role="tabpanel"
				aria-labelledby="home-tab">

			</div>


			<!-- 탭 (탭 내용을 아래 div 영역에 입력) -->
			<div class="tab-pane fade" id="tab-profile" role="tabpanel"
				aria-labelledby="profile-tab">가나다라마바사</div>

		</div>
	</div>

</div>









