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
	<div class="whereMno-king">
		<div class='whereMnoText'>사번찾기</div>
		<div class='whereMnoArea'>
			<c:if test="${ empty member }">
				<form action="whereMno.me" method="post">
					<div class="whereMno-input">
						<input type="text" name="mName" id="inputmName" placeholder="이름을 입력하세요">
						<input type="text" name="mPhone" id="inputmPhone" placeholder="연락처를 입력하세요">
						<div class="whereMno-btn"><button id="whereMno-btn">사번찾기</button></div>
					</div>
				</form>
			</c:if>
			<c:if test="${ !empty member }">
				<div class='mNo-yes'>
					<c:if test="${ member.mAdmin == 2 && member.mStatus == 'Y'}">
						${ member.mName }님의 사번은 담당자 확인이 필요합니다.
					</c:if>
					<c:if test="${ member.mAdmin == 1 && member.mStatus == 'Y'}">
						${ member.mName }님의 사번은 [${ member.mNo }] 입니다.
					</c:if>
					<c:if test="${ member.mStatus == 'N'}">
					  	입력하신 정보는 확인되지 않습니다.
					</c:if>
				</div>
					<button class='mNo-home-btn' onclick="location.href='home.do'">홈으로</button> 		
			</c:if>
		</div>
	</div>
</body>

<script>
	if( "${msg}" != ""){
		alert("${msg}");
	}
</script>
</html>