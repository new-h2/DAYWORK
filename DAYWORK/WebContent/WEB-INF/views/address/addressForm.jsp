<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/address.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

		<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right" style="height: 750px;">
			<div class="address-title">주소록 등록</div>

			<br> <br> <br>

			<form action="insertAddress.ad" onsubmit="return checkList();"
				enctype="multipart/form-data" method="post">
				<table id="address-enroll" class="table-form">
					<tr>
						<td class="address-table-margin">사진</td>
						<td>
							<div class="photo" id="imgArea">
								<img class="basic-photo" id="img" style="cursor: pointer;" src="resources/image/기본이미지.png"></img>
								<input type="file" id="fileArea" multiple="multiple" name="profil" onchange="LoadImg(this);">
							</div>
						</td>
					</tr>
					<tr>
						<td>이름*</td>
						<td><input type="text" name="name" id="name"></td>
					</tr>
					<tr>
						<td>회사</td>
						<td><input type="text" name="comName"></td>
					</tr>
					<tr>
						<td>부서</td>
						<td><input type="text" name="dept"></td>
					</tr>
					<tr>
						<td>직위</td>
						<td><input type="text" name="job"></td>
					</tr>
					<tr>
						<td>이메일*</td>
						<td><input type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td>전화번호*</td>
						<td><input type="text" name="phone" id="phone"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address"></td>
					</tr>
					<tr>
						<td>회사전화번호</td>
						<td><input type="text" name="comPhone"></td>
					</tr>
					<tr>
						<td>회사 주소</td>
						<td><input type="text" name="comAddress"></td>
					</tr>
					<tr>
						<td>메모</td>
						<td><textarea cols="50" rows="7" name="memo"></textarea></td>
					</tr>
				</table>

				<br>

				<div>
					<button type="submit" class="button point button-margin">등록</button>
					<button type="button" class="button" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		/* 필수 입력 사항 확인 */
		function checkList() {

			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;

			if (name == '' || name.length == 0) {
				alert("이름은 필수 입력사항입니다.");
				document.getElementById("name").focus();
				return false;
			} else if (email == '' || email.length == 0) {
				alert("이메일은 필수 입력사항입니다.");
				document.getElementById("email").focus();
				return false;
			} else if (phone == '' || phone.length == 0) {
				alert("전화번호는 필수 입력사항입니다.");
				document.getElementById("email").focus();
				return false;
			}

			return true;
		}
	
		/* 이미지 미리 보기 함수 */
		$(function() {
			$("#fileArea").hide();

			$("#img").click(function() {
				$("#fileArea").click();
			});
		});

		function LoadImg(value) {
			if (value.files && value.files[0]) {

				var reader = new FileReader();

				reader.onload = function(e) {
					$('#img').attr("src", e.target.result);
				}

				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>