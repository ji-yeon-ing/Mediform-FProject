<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imgPPT{
	width: 99vw;
	height: 99vh;
}
</style>
</head>
	 <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath }/resources/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath }/resources/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath }/resources/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="${pageContext.request.contextPath }/resources/assets/js/config.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/simplebar/simplebar.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/assets/css/theme-rtl.css" rel="stylesheet" id="style-rtl">
    <link href="${pageContext.request.contextPath }/resources/assets/css/theme.css" rel="stylesheet" id="style-default">
    <link href="${pageContext.request.contextPath }/resources/assets/css/user-rtl.css" rel="stylesheet" id="user-style-rtl">
    <link href="${pageContext.request.contextPath }/resources/assets/css/user.css" rel="stylesheet" id="user-style-default">
    
    <link href="${pageContext.request.contextPath }/resources/vendors/swiper/swiper-bundle.min.css" rel="stylesheet" id="user-style-default">
    
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

<body style="height: 100vh; width: 100vw; overflow-x: none; overflow-y: none;">
	
	
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="${pageContext.request.contextPath }/resources/vendors/popper/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/anchorjs/anchor.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/is/is.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/echarts/echarts.min.js"></script> 
    <script src="${pageContext.request.contextPath }/resources/vendors/fontawesome/all.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="${pageContext.request.contextPath }/resources/vendors/list.js/list.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/vendors/swiper/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.js.map"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.min.js.map"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/theme.min.js"></script>
    
	<div class="card p-0 ms-1" style="height: 100vh; width: 100vw; overflow-x: none; overflow-y: none;">
		<div class="row p-0 m-0">
			<div class="col-12 p-0 m-0">
				<div class="swiper-container theme-slider m-0" data-swiper='{"autoplay":false,"spaceBetween":1,"loop":true,"loopedSlides":1}'>
					<div class="swiper-wrapper">
						<div class="swiper-slide"><img class="rounded-1 img-fluid imgPPT" src="${pageContext.request.contextPath }/resources/image/ppt/ppt12.png" alt="" /></div>
						<div class="swiper-slide"><img class="rounded-1 img-fluid imgPPT" src="${pageContext.request.contextPath }/resources/image/ppt/ppt10.png" alt="" /></div>
					</div>
					<div class="swiper-nav">
						<div class="swiper-button-next swiper-button-white" style=""></div>
						<div class="swiper-button-prev swiper-button-white"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>