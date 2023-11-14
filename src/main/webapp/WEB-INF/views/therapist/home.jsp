<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body onload="printClock()">
<c:set var="customUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal}" />


	<div class="user-wrap">
		<div id="date"
			style="width: 600px; height: 250px; line-height: 150px; color: #666; font-size: 20px; text-align: left;">
			<script>
				const options = { weekday : 'long', month : 'long', day : 'numeric'
				};
				document.getElementById("date").innerHTML = new Date().toLocaleDateString('ko-KR', options);
			</script>
		</div>
		<div class="welcome" style="width: 600px; height: 400px; line-height: 400px; color: #666; font-size: 18px; text-align: left;">
			<span class="fw-semi-bold">${customUser.employee.empNm}</span>님. 환영합니다.
		</div>
		<div class="user-time" style="width: 600px; height: 250px; line-height: 230px; color: #666; font-size: 60px; text-align: left;" id="clock"></div>
		<div class="weather card mt-5" style="width: 300px; height: 180px; line-height: 200px; opacity: 0.7;"></div>
		<h6 class="mb-0 weather2 mt-5" style="line-height: 70px;">오늘의 날씨</h6>
		<div class="cicon mt-5" style="width: 110px; height: 110px; line-height: 160px;"></div>
		<h6 class="city mb-2 mt-5" style="width: 80px; height: 80px; line-height: 260px;">대전광역시</h6>
		<div class="condition text-warning mt-5" style="width: 50px; height: 30px; line-height: 300px;">맑음</div>
		<div class="ctemp mt-8 fs-4 fw-normal font-sans-serif text-primary mb-1 lh-1" style="line-height: 400px;"></div>
		<div class="chightemp fs--1 text-800 mt-6" style="width: 200px; height: 40px; line-height: 220px;"></div>
		<div class="clowtemp fs--1 text-800 mt-6" style="width: 200px; height: 40px; line-height: 260px;"></div>
		<div>
			<img class="main" src="../../resources/assets/img/main.png"  alt="" />
		</div>
		
	</div>
</body>
</html>
<script>
	function printClock() {

		var clock = document.getElementById("clock");
		var currentDate = new Date();
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate()
		var amPm = 'AM'; 
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) {
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}

		if (currentSeconds >= 50) {
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}
		clock.innerHTML = currentHours + ":" + currentMinute + ":"
				+ currentSeconds + " <span style='font-size:20px;'>" + amPm
				+ "</span>";

		setTimeout("printClock()", 1000);
	}

	function addZeros(num, digit) {
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>