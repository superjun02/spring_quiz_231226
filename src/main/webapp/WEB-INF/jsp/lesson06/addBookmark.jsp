<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>즐겨 찾기 추가하기</h2>
		<div class="form-group">
			<label for="name">제목</label> <input type="text" id="name" name="name"
				class="form-control">
		</div>
		<div class="form-group">
			<label for="url">주소</label> <input type="text" id="url" name="url"
				class="form-control">
		</div>
		<input type="button" id="addBtn" value="추가" class="btn btn-success col-12">
	</div>
	<script>
		$(document).ready(function() {
			$("#addBtn").on('click', function() {
				let name = $("input[name=name]").val().trim();
				if (name.length < 1) {
					alert("제목를 입력허세요");
					return;
				}
				
				let url = $("input[name=url]").val().trim();
				if (url == "") {
					alert("주소를 입력허세요");
					return;
				}
				
				if (!url.startsWith("http") && !url.startsWith("https")) {
					alert("주소의 앞부분을 http 또는 https로 입력해주세요");
					return;
				}
				
				$.ajax({
					type: 'POST'
					, url: '/lesson06/quiz01/add-bookmark'
					, data: {"name":name, "url":url}
					, success:function(data) {
						if (data == "성공") {
							location.href="/lesson06/quiz01/bookmark-list-view";
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