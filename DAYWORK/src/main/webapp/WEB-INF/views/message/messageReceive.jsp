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
					<div class="message-menu" onclick="location.href='msgAllList.msg'">전체메세지</div>
					<div class="message-middle-menu selected" onclick="location.href='msgReceiveList.msg'">받은메세지</div>
					<div class="message-menu" onclick="location.href='msgSendList.msg'">보낸메세지</div>
				</div>
				
				<div class="message-search-box">
					<input type="text" class="message-search">
<!-- 					<button class="message-search-btn">검색</button> -->
					<i class="fas fa-search"></i>
					<div class="message-write-btn" onclick="location.href='goMessageWrite.msg'">글쓰기</div>
				</div>
				
				<div class="line"></div>
				
				<c:forEach var="m" items="${ msgList }" varStatus="i">
						<c:url var="msgDetail" value="msgDetail.msg">
							<c:param name="msgNo" value="${ m.msgNo }"/>
							<c:param name="msgSecNo" value="${ m.msgSecNo }"/>
							<c:param name="currentPage" value="${ currentPage }"/>
							<c:param name="msgRead" value="${ m.msgRead }"/>
						</c:url>
						<div class="message-list" onclick="location.href='${ msgDetail }'">
							<c:if test="${ m.msgRead eq 'N' }">
								<div class="message-list-N">
									<div class="message-status"><i class="fas fa-envelope"></i></div>
							</c:if>
							<c:if test="${ m.msgRead eq 'Y' }">
								<div class="message-list-Y">
									<div class="message-status"><i class="far fa-envelope-open"></i></div>
							</c:if>
								<div class="message-sender">${ m.msgWriter }</div>
								<div class="message-title">${ m.msgTitle }</div>
								<div class="message-date">${ m.msgDate }</div>
							</div>
						</div>
				</c:forEach>
				
				<div class="pages_box">
					<c:if test="${ currentPage ne startPage }">
						<div class="left-arrow" onclick="location.href='msgList.msg?page=${ startPage }'">&lt;&lt;</div>
					</c:if>
					<c:if test="${ currentPage ne 1 }">
						<div class="left-arrow" onclick="location.href='msgList.msg?page=${ currentPage - 1 }'">&lt;</div>
					</c:if>
					<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ p eq currentPage }">
							<div class="pages-selected">${ p }</div>
						</c:if>
						
						<c:if test="${ p ne currentPage }">
							<div class="pages" onclick="location.href='msgList.msg?page=${ p }'">${ p }</div>
						</c:if>
					</c:forEach>
					<c:if test="${ currentPage ne maxPage }">
						<div class="right-arrow" onclick="location.href='msgList.msg?page=${ currentPage + 1 }'">&gt;</div>
					</c:if>
					<c:if test="${ currentPage ne endPage }">
						<div class="right-arrow" onclick="location.href='msgList.msg?page=${ endPage }'">&gt;&gt;</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>