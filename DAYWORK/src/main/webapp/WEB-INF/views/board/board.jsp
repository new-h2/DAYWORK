<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

	<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<div class="board-title">공지사항</div>
			<div class="board-middle">
				<select class="board-search-select">
					<option class="board-search-item">제목</option>
					<option class="board-search-item">부서</option>
					<option class="board-search-item">글 종류</option>
				</select>
				<input type="text" class="board-search">
				<div class="board-search-btn" onclick="searchBoard()">검색</div>
				<div class="board-write-btn" onclick="location.href='goBoardWrite.bo'">글쓰기</div>
			</div>
			<div class="line"/>
			<div class="board-list">
				<c:forEach var="b" items="${ bListTop2 }" varStatus="i">
					<c:url var="bdetail" value="bdetail.bo">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="currentPage" value="${ currentPage }"/>
					</c:url>
						<div class="board-list-item" onclick="location.href='${ bdetail }'">
							<div class="board-item-title">${ b.bTitle }</div>
							<div class="board-item-content">
								<div class="board-type">${ b.bType }</div>
								<div class="board-writer">${ b.bDept }</div>
								<div class="board-date" id="dateA${ i.index }">${ b.bCreateDate }</div>
								<div class="board-comment-num"><i class="far fa-comment" style="margin-right: 5px"></i>${ b.bReply }</div>
								<c:if test="${ b.boardNew eq 1 }">
									<div class="board-new">N</div>
								</c:if>
							</div>
						</div>
				</c:forEach>
				<c:forEach var="b" items="${ bList2 }" varStatus="i">
					<c:url var="bdetail" value="bdetail.bo">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="currentPage" value="${ currentPage }"/>
					</c:url>
						<div class="board-list-item2" onclick="location.href='${ bdetail }'">
							<div class="board-item-title">${ b.bTitle }</div>
							<div class="board-item-content">
								<div class="board-type">${ b.bType }</div>
								<div class="board-writer">${ b.bDept }</div>
								<div class="board-date" id="dateB${ i.index }">${ b.bCreateDate }</div>
								<div class="board-comment-num"><i class="far fa-comment" style="margin-right: 5px"></i>${ b.bReply }</div>
								<c:if test="${ b.boardNew eq 1 }">
									<div class="board-new">N</div>
								</c:if>
							</div>
						</div>
				</c:forEach>

				<div class="pages_box">
					<c:if test="${ currentPage ne startPage }">
						<div class="left-arrow" onclick="location.href='boardList.bo?page=${ startPage }'">&lt;&lt;</div>
					</c:if>
					<c:if test="${ currentPage ne 1 }">
						<div class="left-arrow" onclick="location.href='boardList.bo?page=${ currentPage - 1 }'">&lt;</div>
					</c:if>
					<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
						<c:if test="${ p eq currentPage }">
							<div class="pages-selected">${ p }</div>
						</c:if>
						
						<c:if test="${ p ne currentPage }">
							<div class="pages" onclick="location.href='boardList.bo?page=${ p }'">${ p }</div>
						</c:if>
					</c:forEach>
					<c:if test="${ currentPage ne maxPage }">
						<div class="right-arrow" onclick="location.href='boardList.bo?page=${ currentPage + 1 }'">&gt;</div>
					</c:if>
					<c:if test="${ currentPage ne endPage }">
						<div class="right-arrow" onclick="location.href='boardList.bo?page=${ endPage }'">&gt;&gt;</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
// 		var date = $('.board-date').text().substring(5, 10);
// 		$('.board-date').text(date);

		for(let i = 0; i < ${ fn:length(bList2) }; i++) {
			let date = $('#dateA' + i).text().substring(5, 10);
			$('#dateA' + i).text(date);
		}
		for(let i = 0; i < ${ fn:length(bList2) }; i++) {
			let date = $('#dateB' + i).text().substring(5, 10);
			$('#dateB' + i).text(date);
		}

		
		const searchBoard = () => {
			const type = $('.board-search-select').val();
			const search = $('.board-search').val();
			
			location.href='searchBoardList.bo?' + "type=" + type + "&search=" + search;
		}
		
// 		console.log(${bList});
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
		
</body>
</html>