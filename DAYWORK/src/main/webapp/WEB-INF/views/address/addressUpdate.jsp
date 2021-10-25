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
			<div class="address-title">주소록 수정</div>

			<br> <br> <br>

			<form action="updateAddress.ad" enctype="multipart/form-data" method="post">
				<!-- 수정할 주소록 번호 -->
				<input type="hidden" name="aNo" value="${ add.aNo }">
				<!-- 수정하지 않을 때 기존 사진을 저장하기 위해 만듬 -->
				<input type="hidden" name="renameFileName" value="${ add.renameFileName }">

				<table id="address-update" class="table-form">
					<tr>
						<td class="address-table-margin">사진</td>
						<td>
							<div class="photo" id="imgArea">
								<c:if test="${add.renameFileName != null}">
									<img class="basic-photo addImg" id="img" src="${ contextPath }/resources/addUploadFiles/${ add.renameFileName }" style="cursor: pointer;"></img> 
								</c:if>
								<c:if test="${add.renameFileName == null}">
									<img class="basic-photo" id="img" style="cursor: pointer;"></img>
								</c:if>
								<input type="file" id="fileArea" multiple="multiple" name="reloadFile" onchange="LoadImg(this);">
							</div>
						</td>
					</tr>
					<tr>
						<td>이름*</td>
						<td><input type="text" name="name" value="${ add.name }"></td>
					</tr>
					<tr>
						<td>회사</td>
						<td><input type="text" name="comName"
							value="${ add.comName }"></td>
					</tr>
					<tr>
						<td>부서</td>
						<td><input type="text" name="dept" value="${ add.dept }"></td>
					</tr>
					<tr>
						<td>직위</td>
						<td><input type="text" name="job" value="${ add.job }"></td>
					</tr>
					<tr>
						<td>이메일*</td>
						<td><input type="text" name="email" value="${ add.email }"></td>
					</tr>
					<tr>
						<td>전화번호*</td>
						<td><input type="text" name="phone" value="${ add.phone }"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address"
							value="${ add.address }"></td>
					</tr>
					<tr>
						<td>회사전화번호</td>
						<td><input type="text" name="comPhone"
							value="${ add.comPhone }"></td>
					</tr>
					<tr>
						<td>회사 주소</td>
						<td><input type="text" name="comAddress"
							value="${ add.comAddress }"></td>
					</tr>
					<tr>
						<td>메모</td>
						<td><textarea cols="50" rows="7" name="memo">${ add.memo }</textarea></td>
					</tr>
				</table>

				<br>

				<div>
					<button type="submit" class="button point button-margin">수정</button>
					<button type="button" class="button" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		/* 필수 입력사항 확인 */
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

		/* 이미지 미리 보기  */
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