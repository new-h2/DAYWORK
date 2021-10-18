<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="org.springframework.ui.Model, java.util.ArrayList, com.kh.DAYWORK.common.BMsgFile"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/index.css">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="main-king">

<%@ include file="../common/mainLeft.jsp"%>

<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<div class="board-detail-header"> <!-- 제목 -->
				<div class="board-cate-btn">
					<button id="board-cate-btn">${ b.bType }</button>
					<button id="board-cate-btn">${ b.bDept }</button>
					<c:url var="boardUpdate" value="goBoardUpdate.bo">
						<c:param name="bNo" value="${ b.bNo }" />
						<c:param name="currentPage" value="${ currentPage }" />
					</c:url>
					<c:url var="boardDelete" value="bDelete.bo">
						<c:param name="bNo" value="${ b.bNo }" />
						<c:forEach var="f" items="${ files }">
							<c:param name="files" value="${ f.fRename }" />		
						</c:forEach>
					</c:url>
					<button class="board-delete">삭제</button>					
					<button class="board-update" onclick="location.href='${ boardUpdate }'">수정</button>
				</div>
				<div class="board-detail-title">${ b.bTitle }</div>
					<div class="board-detail-title-wrap">
						<div class="board-itsme">
							<image class="board-itsme-photo" src="resources/mProfileFiles/${ member.mRenameProfile }">
							<div class="board-itsme-name">${ b.mName }</div>
							<div class="board-itsme-position">(${ member.dName }&nbsp;</div>
							<div class="board-itsme-position">/ ${ member.jName })</div>
						</div>
						<div class="board-detail-num">
							<div class="board-num-date">${ b.bModifyDate }</div>
							<div class="board-detail-num-count">조회수 ${ b.bCount }</div>
						</div>
					</div>
			</div>
			<hr style="border:1px color= silver;">
			<div class="board-detail-file-box">
				<c:if test="${ !empty files }">
					<c:forEach var="f" items="${ files }">
						<a href="${ contextPath }/resources/buploadFiles/${ f.fRename }" download="${ f.fOrigin }" class="board-detail-file-text">${ f.fOrigin }</a><br>
					</c:forEach>
				</c:if>
			</div>
			<div class="board-detail-body"> <!-- 내용 -->
				<div class="board-detail-content">
					${ fn:replace(b.bContent, replaceChar, "<br>") }
				</div>
			</div>
			<div class="board-detail-footer"> <!-- 댓글 -->
				<div class="board-comment-title">댓글 ${ b.bReply }</div>
				<hr style="margin-bottom:30px; border:1px color= silver;">
				<div class="board-comment-new">
					<image class="board-comment-new-photo" src="resources/mProfileFiles/${ loginUser.mRenameProfile }">
					<div class="board-comment-new-text"><input type="text" id="new-text"></div>
					<div class="board-comment-new-btn"><button id="new-btn" disabled="disabled">등록</button></div>
				</div>
				<div class="board-comment-old">
				</div>
			</div>
		</div>
	</div>
	<script>
		var date = $('.board-num-date').text().substring(5, 10);
		$('.board-num-date').text(date);
		
		$('.board-delete').off().on('click', function(){
			let bool = confirm('게시글을 삭제하시겠습니까?');
			if(bool) {
				location.href='${boardDelete}';
			}
		});
		
		$('#new-text').on('keyup', function(){
			if($(this).val().length > 0) {
				$('#new-btn').addClass('active');
				$('#new-btn').attr('disabled', false);
			} else {
				$('#new-btn').removeClass('active');
				$('#new-btn').attr('disabled', true);
			}
		});
		
		const replyList = (rList) => {
			for(let i = 0; i < rList.length; i++) {
				let r = rList[i];
				
				let addHtml = "<div class='board-comment-old-itsme'>";
				addHtml += "<image class='board-comment-new-photo' src='resources/mProfileFiles/" + r.rMRenameProfile + "'>";
				addHtml += "<div class='board-comment-old-itsme-name'>" + r.mName + "</div>";
				addHtml += "<div class='board-comment-old-itsme-position'>(" + r.dName + " / " + r.jName + ")</div>";
				addHtml += "<div class='board-comment-old-itsme-date'>" + r.rCreateDate + "</div>";
				addHtml += "</div>";
				addHtml += "<div class='board-comment-old-text'>" + r.rContent + "</div>";
				$('.board-comment-old').append(addHtml);
			}	
		}
		
		replyList(${r});
		
		$('#new-btn').on('click', function(){
			let bNo = ${ b.bNo };
			let content = $('#new-text').val();
			$('.board-comment-old').html('');
			
			$.ajax({
				url: 'insertReply.bo',
				data: {bNo:bNo, content:content},
				success: function(data) {
// 					console.log(data);
// 					console.log(${r});
					$('.board-comment-title').html('');
					$('.board-comment-title').append("댓글" + data.length);
					
					$('#new-text').val('');
					$('#new-btn').removeClass('active');
					$('#new-btn').attr('disabled', true);
					replyList(data);
				}
			});
		});
		
	</script>
		
</body>
</html>