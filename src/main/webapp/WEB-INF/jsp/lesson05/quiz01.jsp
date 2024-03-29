<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<h2>1. JSTL core 변수</h2>
	<c:set var="num1" value="36" />
	<c:set var="num2" value="3" />
	<b>첫번째 숫자: ${num1}</b><br>
	<b>두번째 숫자: ${num2}</b><br>
	
	<h2>2. JSTL core 연산</h2>
	<b>더하기 : ${num1 + num2}</b><br>
	<b>빼기 : ${num1 - num2}</b><br>
	<b>곱하기 : ${num1 * num2}</b><br>
	<b>나누기 : ${num1 / num2}</b><br>
	
	<h2>3. JSTL core out</h2>
	<c:out value="<title>core out</title>" />
	
	<h2>4. JSTL core if</h2>
	<c:set var="avg" value="${(num1 + num2) / 2}" />
	<c:if test="${avg >= 10}"> 
		<h1>${avg}</h1>
	</c:if>
	<c:if test="${avg < 10}"> 
		<h3>${avg}</h3>
	</c:if>
	
	<c:set var="mul" value="${num1 * num2}" />
	<c:if test="${mul > 100}"> 
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
</body>
</html>