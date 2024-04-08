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
		<section>
			<div class="mt-5 mb-2 d-flex justify-content-center">
				<h2>예약 하기</h2>
			</div>
			<div class="d-flex justify-content-center">
				<div class="form-group col-4">
					<label for="name">이름</label> 
					<div class="pb-2">
						<input type="text" id="name" name="name" class="form-control">
					</div>
					<label for="date">예약날짜</label> 
					<div class="pb-2">
						<input type="text" id="date" name="date" class="form-control">
					</div>
					<label for="day">숙박일수</label> 
					<div class="pb-2">
						<input type="text" id="day" name="day" class="form-control">
					</div>
					<label for="headcount">숙박인원</label> 
					<div class="pb-2">
						<input type="text" id="headcount" name="headcount" class="form-control">
					</div>
					<label for="phoneNumber">전화번호</label> 
					<div class="pb-2">
						<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
					</div>
					<div class="pb-2">
						<input type="button" id="reserveBtn" value="예약하기" class="mt-2 btn btn-warning col-12">
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {
			$("#date").datepicker({
				dateFormat: "yy-mm-dd"
	            , monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
	            , monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ] 
	            , dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ]
				, minDate: 0
			});
			
			$('#reserveBtn').on('click', function() {
				
				let name = $("input[name=name]").val().trim();
				if (!name) {
					alert("이름을 입력하세요");
					return;
				}
				
				let date = $("input[name=date]").val().trim();
				if (!date) {
					alert("예약날짜를 입력하세요");
					return;
				}
				
				let day = $("input[name=day]").val().trim();
				if (!day) {
					alert("숙박일수를 입력하세요");
					return;
				}
				
				let headcount = $("input[name=headcount]").val().trim();
				if (!headcount) {
					alert("숙박인원을 입력하세요");
					return;
				}
				
				let phoneNumber = $("input[name=phoneNumber]").val().trim();
				if (!phoneNumber) {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type: "POST"
					, url: "/booking/make-booking"
					, data: {"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					, success: function(data) {
						if (data.is_make) {
							alert("예약이 완료되었습니다.")
							location.href="/booking/check-booking-view";
						}
					}
					, error:function(error) {
						alert(error);
					}
				});
			});
		});
	</script>
</body>
</html>