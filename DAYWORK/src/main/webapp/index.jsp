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
	<div class="login-king" >
		<div class="login-logo"><img src ="resources/image/데이워크로그인로고.png" ></div>
		<div class="loginArea">
			<c:if test="${ empty sessionScope.loginUser }">
				<form action="login.me" method="post">
					<div class="login-login">
						<input type="text" name="mNo" id="inputmNo" placeholder="사번을 입력하세요">
						<input type="password" name="mPwd" id="inputmPwd" placeholder="비밀번호를 입력하세요">
						<div><button id="login-btn" class="login-btn">로그인</button></div>
					</div>
				</form>
					<div class="login-line"><hr><span class="login-line-or">또는</span></div>
					<div class="login-service">
							<button onclick="location.href='joinMember.me'" class="login-service-btn">회원가입</button>
							<button onclick="location.href='gowhereMno.me'" class="login-service-btn">사번찾기</button>
							<button onclick="location.href='gowherePwd.me'" class="login-service-btn">비밀번호찾기</button>
					</div>
			</c:if>
<%-- 			<c:if test="${ !empty sessionScope.loginUser }"> --%>
<%-- 					<c:out value="${ loginUser.mName }님 환영합니다."/> <!-- c:out 활용 --> --%>
<%-- 					<c:url var="myinfo" value="myinfo.me"/> --%>
<%-- 					<c:url var="logout" value="logout.me"/> --%>
<%-- 					<button onclick="location.href='${myinfo}'">정보보기</button> --%>
<%-- 					<button onclick="location.href='${logout}'">로그아웃</button> --%>
<%-- 			</c:if> --%>
		</div>
	</div>
	<script>
		$('#inputmPwd').on('keyup', function(){
			if($('#inputmNo').val().length >= 4 && $(this).val().length >= 1) {
				$('#login-btn').addClass('active');
			} else {
				$('#login-btn').removeClass('active');
			}
		});
		
		if( "${msg}" != ""){
			alert("${msg}");
		}
	</script>
</body>
</html>

