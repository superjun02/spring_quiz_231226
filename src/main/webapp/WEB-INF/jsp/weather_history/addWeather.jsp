<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- js와 css의 순서는 상관 없음 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/weather_history/style.css">
</head>
<body>
	<script>
		$(document).ready(function() {
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd"
	            , monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	            , monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ] 
	            , dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ]
			});
		});
	</script>
	<div class="wrap">
		<div id="main" class="d-flex">
			<jsp:include page="nav.jsp" />
			<section class="col-10">
				<div class="pt-3 pl-4 pb-4">
					<h2>날씨 입력</h2>
					<div>
						<form method="post" action="/weather/add-weather">
							<div class="d-flex justify-content-between mt-5">
								<div class="d-flex align-items-center">
									<div class="input-label twoLetter">날짜</div>
									<input type="text" id="datepicker" class="form-control"
										id="date" name="date" autocomplete="off">
								</div>
								<div class="d-flex align-items-center col-3">
									<div class="input-label twoLetter">날씨</div>
									<select class="form-control" name="weather">
										<option>맑음</option>
										<option>구름조금</option>
										<option>흐림</option>
										<option>비</option>
									</select>
								</div>

								<div class="d-flex align-items-center">
									<div class="input-label fourLetter">미세먼지</div>
									<select class="form-control" name="microDust">
										<option>좋음</option>
										<option>보통</option>
										<option>나쁨</option>
										<option>최악</option>
									</select>
								</div>
							</div>

							<div class="d-flex justify-content-between mt-5">
								<div class="d-flex align-items-center">
									<div class="input-label twoLetter">기온</div>
									<div class="input-group">
										<input type="text" class="form-control" name="temperatures" autocomplete="off">
										<div class="input-group-append">
											<span class="input-group-text">℃</span>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<div class="input-label threeLetter">강수량</div>
									<div class="input-group">
										<input type="text" class="form-control" name="precipitation" autocomplete="off">
										<div class="input-group-append">
											<span class="input-group-text">mm</span>
										</div>
									</div>
								</div>

								<div class="d-flex align-items-center">
									<div class="input-label twoLetter">풍속</div>
									<div class="input-group">
										<input type="text" class="form-control" name="windSpeed" autocomplete="off">
										<div class="input-group-append">
											<span class="input-group-text">km/h</span>
										</div>
									</div>
								</div>
							</div>

							<div class="text-right mt-4 mb-5">
								<input type="submit" class="btn btn-success" value="저장">
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>