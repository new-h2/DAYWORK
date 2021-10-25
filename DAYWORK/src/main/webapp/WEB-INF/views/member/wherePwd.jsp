<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member.css">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="input-wrap">
		<div class="title">비밀번호 찾기</div>
		<div class="wherePwdArea">
				<form action="wherePwd.me" method="post">
					<div class="wherePwd-input">
						<input type="text" name="mNo" id="inputmNo" placeholder="사번을 입력하세요">
						<input type="email" name="mEmail" id="inputmEmail" placeholder="이메일을 입력하세요">
						<div class="wherePwd-btn"><button id="wherePwd-btn">비밀번호 찾기</button></div>
					</div>
				</form>
		</div>
	</div>
	
	<script>
		if("${ msg }" != "") {
			alert("${ msg }");
		};		
	</script>

</body>
</html>