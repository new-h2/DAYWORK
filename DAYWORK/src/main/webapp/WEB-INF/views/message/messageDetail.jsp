<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/message.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

	<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<div class="message-main">
				<div class="message-menu-box">
					<div class="message-menu selected" onclick="location.href='msgAllList.msg'">전체메세지</div>
					<div class="message-middle-menu" onclick="location.href='msgReceiveList.msg'">받은메세지</div>
					<div class="message-menu" onclick="location.href='msgSendList.msg'">보낸메세지</div>
				</div>
				
				<div class="message-search-box">
					<input type="text" class="message-search">
<!-- 					<button class="message-search-btn">검색</button> -->
					<i class="fas fa-search"></i>
					<c:url var="msgReply" value="goMessageWrite.msg">
						<c:param name="mNo" value="${ msg.msgWriterMNo }"/>
						<c:param name="mWriter" value="${ msg.msgWriter }"/>
						<c:param name="msgTitle" value="${ msg.msgTitle }"/>
					</c:url>
					<div class="message-write-btn" onclick="location.href='${msgReply}'">답장</div>
				</div>
				
				<div class="line"></div>
				
				<div class="msg-detail-header">
					<div class="msg-detail-title">
						${ msg.msgTitle }
						<div class="msg-detail-date">${ msg.msgDate }</div>
					</div>
					<div class="msg-detail-sender"><label>보낸사람 : </label>${ msg.msgWriter }</div>
					<div class="msg-detail-receiver"><label>받는사람 : </label>${ msg.msgReceiver }</div>
				</div>
				
				<div class="msg-detail-middle">
					<div class="msg-detail-file-box">
						<c:if test="${ !empty files }">
							<c:forEach var="f" items="${ files }">
								<a href="${ contextPath }/resources/msguploadFiles/${ f.fRename }" download="${ f.fOrigin }" class="msg-detail-file">
									${ f.fOrigin }
								</a>
							</c:forEach>
						</c:if>
					</div>
					<div class="msg-detail-content">${ msg.msgContent }</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>