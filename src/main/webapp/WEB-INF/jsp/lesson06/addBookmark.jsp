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
			<label for="url">주소</label> 
			<div class="d-flex">
				<input type="text" id="url" name="url" class="form-control">
				<input type="button" id="duplicateBtn" value="중복확인" class="btn btn-info ml-3">
			</div>
			<div id="urlStatusBar">
			</div>
		</div>
		<input type="button" id="addBtn" value="추가" class="btn btn-success col-12">
	</div>
	<script>
		$(document).ready(function() {
			let urlBuffer = "";
			$('#duplicateBtn').on('click', function() {
				$('#urlStatusBar').empty();
				let url = $("input[name=url]").val().trim();
				
				if (!url) {
					$('#urlStatusBar').append('<span class="text-danger">이름이 비어있습니다.</span>');
					return;
				}
				
				$.ajax({
					type: "GET"
					, url: "/lesson06/quiz01/is-duplication-url"
					, data: {"url":url}
					, success: function(data) {
						if (data.is_duplication) {
							$('#urlStatusBar').append('<span class="text-danger">이미 등록 되있는 주소입니다.</span>');
							$('#urlStatusBar').addClass('isDuplicateTrue');
						} else {
							$('#urlStatusBar').append('<span class="text-success">등록 가능한 주소입니다.</span>');
							$('#urlStatusBar').removeClass();
							urlBuffer = url;
						}
					}
				});
			});
			
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
				
				if ($('#urlStatusBar').children().length < 1) {
					alert("중복 확인을 해주세요");
					return;
				}
				
				if ($('#urlStatusBar').hasClass('isDuplicateTrue')) {
					alert("이미 등록 되있는 주소는 추가할 수 없습니다.");
					return;
				}
				
				if (url != urlBuffer) { // [등록 가능한 주소입니다.] 상태에서 다른 URL을 넣어서 중복확인 무시하는 방법 억제
					alert("중복 확인을 해주세요");
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