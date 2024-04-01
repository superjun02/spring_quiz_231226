<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz05</title>
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
</head>
<body>
	<div class="container">
		<h1>1. 회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="col-1">No</th>
					<th class="col-1">이름</th>
					<th class="col-3">전화 번호</th>
					<th class="col-2">국적</th>
					<th class="col-2">이메일</th>
					<th class="col-3">자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members}" var="member" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${member.name}</td>
						<c:choose>
							<c:when test="${fn:startsWith(member.phoneNumber, '010')}">
								<td>${member.phoneNumber}</td>
							</c:when>
							<c:otherwise>
								<td>유효하지 않은 전화번호</td>
							</c:otherwise>
						</c:choose>
						<td>
							${fn:replace(member.nationality, '삼국시대 ', '삼국 - ')}
						</td>
						<td>
							<b>${fn:split(member.email, '@')[0]}</b>@${fn:split(member.email, '@')[1]}
						</td>
						<c:choose>
							<c:when test="${fn:length(member.introduce) > 15}">
								<td class="text-left">${fn:substring(member.introduce, 0, 15)} ...</td>
							</c:when>
							<c:otherwise>
								<td class="text-left">${member.introduce}</td>
							</c:otherwise>							
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>