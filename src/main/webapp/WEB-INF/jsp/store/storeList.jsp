<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게 목록</title>
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

<link rel="stylesheet" href="/css/store/style.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp" />
		<section>
			<div>
				<div class="display-4 pt-2">우리동네 가게</div>
			</div>
			<div>
				<c:forEach items="${storeList}" var="store">
					<a href="/store/store-review?storeId=${store.id}&storeName=${store.name}" class="text-decoration-none">
						<div class="storeBox mt-3">
							<div class="p-3">
								<h3>${store.name}</h3>
								<div>전화번호 : ${store.phoneNumber}</div>
								<div>주소 : ${store.address}</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<hr>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>