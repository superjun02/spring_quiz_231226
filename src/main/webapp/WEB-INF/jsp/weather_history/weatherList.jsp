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

<link rel="stylesheet" href="/css/weather_history/style.css">
</head>
<body>
	<div class="wrap">
		<div id="main" class="d-flex">
			<jsp:include page="nav.jsp" />
			<section class="col-10">
				<div class="pt-3 pl-4 pb-4">
					<h2>과거날씨</h2>
					<div>
						<table class="table text-center">
							<thead>
								<tr>
									<th>날짜</th>
									<th>날씨</th>
									<th>기온</th>
									<th>강수량</th>
									<th>미세먼지</th>
									<th>풍속</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${weatherHistory}" var="weather">
									<tr>
										<td><fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 dd일" /></td>
										<c:choose>
											<c:when test="${weather.weather eq '비'}">
												<td><img alt="비" src="/img/rainy.jpg"></td>
											</c:when>
											<c:when test="${weather.weather eq '맑음'}">
												<td><img alt="맑음" src="/img/sunny.jpg"></td>
											</c:when>
											<c:when test="${weather.weather eq '흐림'}">
												<td><img alt="흐림" src="/img/cloudy.jpg"></td>
											</c:when>
											<c:when test="${weather.weather eq '구름조금'}">
												<td><img alt="구름조금" src="/img/partlyCloudy.jpg"></td>
											</c:when>
										</c:choose>
										<td>${weather.temperatures}°C</td>
										<td>${weather.precipitation}mm</td>
										<td>${weather.microDust}</td>
										<td>${weather.windSpeed}km/h</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>