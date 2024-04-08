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
				<h2>예약 목록 보기</h2>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 dd일"/> </td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<c:choose>
								<c:when test="${booking.state == '대기중'}">
									<td class="text-info">${booking.state}</td>
								</c:when>
								<c:when test="${booking.state == '확정'}">
									<td class="text-success">${booking.state}</td>
								</c:when>
								<c:when test="${booking.state == '취소'}">
									<td class="text-danger">${booking.state}</td>
								</c:when>
							</c:choose>
							
							<td><button class="btn btn-danger deleteBtn" value="${booking.id}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<jsp:include page="footer.jsp" />
	</div>

	<script>
		$(document).ready(function() {
			$('.deleteBtn').on('click', function(e) {
				let id = $(this).val();
				
				$.ajax({
					type: "POST"
					, url: "/booking/delete-booking"
					, data: {"id":id}
					, success: function(data) {
						if (data.is_delete) {
							location.href="/booking/booking-list-view";
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