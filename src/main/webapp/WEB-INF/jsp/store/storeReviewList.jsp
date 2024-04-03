<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${storeName}리뷰</title>
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
				<div class="display-4 pt-2">${storeName}-리뷰</div>
			</div>
			<div>
				<c:choose>
					<c:when test="${fn:length(reviewList) == 0}">
						<div id="noReviewBox"
							class="d-flex justify-content-center align-items-center">
							<h1>작성된 리뷰가 없습니다.</h1>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${reviewList}" var="review">
							<div class="storeBox mt-3">
								<div class="p-3">
									<div>
										<span id="userNameBox">${review.userName}</span>
										<c:forEach begin="1" end="${review.point}" step="1">
											<img alt="꽉찬별" src="/img/star_fill.png" width="14px">
										</c:forEach>
										<c:if test="${review.point % 1 == 0.5}">
											<img alt="꽉찬별" src="/img/star_half.png" width="14px">
										</c:if>
										<c:forEach begin="1" end="${5 - review.point}" step="1">
											<img alt="꽉찬별" src="/img/star_empty.png" width="14px">
										</c:forEach>
									</div>
									<div class="pt-1">
										<span id="dateBox"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 dd일"/> </span>
									</div>
									<div class="pt-2">
										<span id="reviewBox">${review.review}</span>
									</div>
									<div class="pt-1">
										<span id="menuBox">${review.menu}</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<hr>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>