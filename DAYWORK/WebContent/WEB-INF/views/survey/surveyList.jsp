<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/survey.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

		<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">

			<br>

			<form action="surveyList.su">
				<div class="top-menu">
					<div>
						<input type="text" id="search-input" value="${ key }" name="key" placeholder="제목 검색">
						<button type="submit" class="button">검색</button>
					</div>
					<div>
						<select id="status" name="status">
							<option value="zero">-전체-</option>
							<option value="1">진행중</option>
							<option value="2">마감</option>
						</select>
					</div>

					<div style="flex: 1"></div>

					<div>
						<button type="button" class="button point" onclick="location.href='surveyForm.su'">설문하기</button>
					</div>

				</div>
			</form>

			<br> <br> <br>

			<table class="surveyList">
				<tr>
					<th style="width: 50px;">번호</th>
					<th style="width: 450px;">설문 제목</th>
					<th style="width: 120px;">작성자</th>
					<th style="width: 100px;">시작일</th>
					<th style="width: 100px;">마감일</th>
					<th style="width: 100px;">상태</th>
					<th style="width: 100px;">참여</th>
					<th style="width: 100px;">결과공개</th>
				</tr>
				
				<c:forEach items="${ list }" var="l">
					<tr>
						<td>${ l.sNo }</td>
						<td class="surveyTitle">${ l.sTitle }</td>
						<td>${ l.mName }&nbsp; ${ l.jName }</td>
						<td>${ l.sStartDate }</td>
						<td>${ l.sEndDate }</td>
						<td><c:if test="${ l.ongoing == '0' }">시작전</c:if>
							<c:if test="${ l.ongoing == '1' }">진행중</c:if>
							<c:if test="${ l.ongoing == '2' }">마감</c:if></td>
						<td><c:if test="${ l.partiState == 'Y' }">참여완료</c:if>
							<c:if test="${ l.partiState == 'N' }">미참여</c:if></td>
						<input type="hidden" value="${ l.sPublic }">
						<td><c:if test="${ l.sPublic == 'N' }">비공개</c:if>
						 	<c:if test="${ l.sPublic == 'Y' }">공개</c:if></td>
						<input type="hidden" value="${ l.mNo }">
					</tr>
				</c:forEach>
				<c:if test="${ empty list }">
					<tr>
						<td colspan='7'>등록된 설문조사가 없습니다.
					</tr>
				</c:if>
			</table>

			<div style="height: 50px">&nbsp;</div>

			<!-- 페이징 -->
			<div style="text-align: center;">
				<!-- 맨 앞 -->
				<c:if test="${ pi.currentPage <= 1 }">
					&lt;&lt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="start" value="surveyList.su">
						<c:param name="page" value="1" />
						<c:param name="key" value="${ key }" />
						<c:param name="status" value="${ status }" />
					</c:url>
					<a href="${ start }" style="color: black;">&lt;&lt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 이전 -->
				<c:if test="${ pi.currentPage <= 1 }">
					&lt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="surveyList.su">
						<c:param name="page" value="${ pi.startPage - pi.pageLimit }"/>
						<c:param name="status" value="${ status }" />
						<c:param name="key" value="${ key }" />
					</c:url>
					<a href="${ before }" style="color: black;">&lt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ pi.currentPage != p }">
						<c:url var="address" value="surveyList.su">
							<c:param name="page" value="${ p }"/>
							<c:param name="status" value="${ status }" />
							<c:param name="key" value="${ key }" />
						</c:url>
						<a href="${ address }" style="color: black;">${ p }</a>&nbsp;&nbsp;
					</c:if>

					<c:if test="${ pi.currentPage == p }">
						<span
							style="font-weight: bold; font-size: 18px; color: cornflowerblue;">${ p }</span>&nbsp;&nbsp;
					</c:if>

				</c:forEach>

				<!-- 다음 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					&gt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="surveyList.su">
						<c:param name="page" value="${ pi.startPage + pi.pageLimit }"/>
						<c:param name="status" value="${ status }" />
						<c:param name="key" value="${ key }" />
					</c:url>
					<a href="${ after }" style="color: black;">&gt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 맨 뒤 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					&gt;&gt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="end" value="surveyList.su">
						<c:param name="page" value="${ pi.maxPage }" />
						<c:param name="status" value="${ status }" />
						<c:param name="key" value="${ key }" />
					</c:url>
					<a href="${ end }" style="color: black;">&gt;&gt;</a> &nbsp;&nbsp;
				</c:if>
			</div>

		</div>

	</div>

	<script>
		/* 검색 버튼 */
		function search() {
			var value = document.getElementById("search-input").value;

			if (value == "" || value.length == 0) {
				alert("검색할 설문 제목을 입력해주세요.");
				return false;
			} else {
				$('#suveyForm').submit();
			}
		}

		/* 검색조건 값을 유지하기 위해 만든 함수  */
		$(function() {
			var status = document.getElementById("status").children;
			var statusKey = "<c:out value='${status}'/>";

			for (var i = 0; i < status.length; i++) {
				if (status[i].value == statusKey) {
					status[i].setAttribute('selected', 'true');
				}
			}
		});

		// 설문의 상태와 로그인한 사람에 따라 설문 페이지가 다르게 보이게 함
		$('.surveyTitle').on('click', function() {
			var sNo = $(this).prev().html();
			var writer = $(this).next().next().next().next().next().next().next().next().val();
			var loginUser = "<c:out value='${loginUserNo}'/>";
			console.log($(this).next().next().next().next().text().trim());
			
			if ($(this).next().next().next().next().text().trim() == '마감') {
				if (writer == loginUser) {
					window.location.href = "resultSurvey.su?sNo="+sNo;
				} else if ($(this).next().next().next().next().next().next().next().text().trim() == '공개') {
					window.location.href = "resultSurvey.su?sNo="+sNo;
				} else {
					alert("설문 결과 비공개 설문조사 입니다.");
				}
			} else if ($(this).next().next().next().next().text().trim() == '진행중') {
				if ($(this).next().next().next().next().next().text().trim() == '참여완료') {
					if (writer == loginUser) {
						window.location.href = "resultSurvey.su?sNo="+sNo;
					} else if($(this).next().next().next().next().next().next().next().text().trim() == '비공개') {
						alert("설문 결과 비공개 설문조사 입니다.");						
					} else {
						window.location.href = "resultSurvey.su?sNo="+sNo;
					}
				} else {
					window.location.href = "detailSurvey.su?sNo="+sNo;
				}
			} else {
				window.location.href = "detailSurvey.su?sNo="+sNo;
			}
		});
	</script>

</body>
</html>