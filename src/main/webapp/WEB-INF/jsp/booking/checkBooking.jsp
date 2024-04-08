<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<%-- bootstrap(datepicker 쓰려면 jquery 원본으로) --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<%-- AJAX --%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/booking/style.css">
</head>
<body>
	<div id="wrap" class="container">
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		<section class="banner">
			<img src="/img/test06_banner1.jpg" alt="banner" id="bannerImage" class="w-100">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="text-white mt-3">
					<span class="reserve-confirm">예약 확인</span>
				</div>
				
				<div class="mr-3">
					<div class="d-flex align-items-center justify-content-end mt-3">
						<span class="text-white mr-2">이름</span> <input type="text"
							id="name" class="form-control col-9">
					</div>
					<div class="d-flex align-items-center justify-content-end mt-3">
						<span class="text-white mr-2">전화번호</span> <input type="text"
							id="phoneNumber" class="form-control col-9">
					</div>

					<div class="d-flex justify-content-end mt-3">
						<button type="button" id="reserveChkBtn" class="btn btn-success">조회하기</button>
					</div>
				</div>
			</section>
			<section
				class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>
						010-<br>0000-1111
					</h1>
				</div>
			</section>
		</section>
		<jsp:include page="footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {
			$('#reserveChkBtn').on('click', function() {
				let name = $('#name').val().trim();
				if (!name) {
					alert("이름을 입력하세요");
					return;
				}
				
				let phoneNumber = $('#phoneNumber').val().trim();
				if (!phoneNumber) {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type: "POST"
					, url: "/booking/check-booking"
					, data: {"name":name, "phoneNumber":phoneNumber}
					, success: function(data) {
						if (!data.reserveInfo.id) {
							alert("예약 내역이 없습니다.");
						} else {
							var formatDate = data.reserveInfo.date.substring(0, 10);
							alert("이름:" + data.reserveInfo.name + 
									"\n날짜:" + formatDate + 
									"\n일수:" + data.reserveInfo.day +
									"\n인원:" + data.reserveInfo.headcount +
									"\n상태:" + data.reserveInfo.state);
						}
					}
					, error:function(error) {
						alert(error);
					}
				});
			});


			let bannerSrcArr = [ '/img/test06_banner1.jpg', '/img/test06_banner2.jpg',
					'/img/test06_banner3.jpg', '/img/test06_banner4.jpg' ];
			let currentIndex = 0;
			setInterval(function() {
				$('#bannerImage').attr('src',
						bannerSrcArr[currentIndex]);
				currentIndex++;

				if (currentIndex > bannerSrcArr.length) {
					currentIndex = 0;
				}
			}, 3000); // 3초에 한번씩 함수 실행
		});
	</script>
</body>
</html>