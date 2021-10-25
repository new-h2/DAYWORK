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
<style>
 .table td {
	font-size: 13px;
} 
</style>
</head>
<body>

	<div class="main-king">

		<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right" style="height: 1000px;">
			<div class="title">설문 결과</div>

			<br> <br>

			<div class="sub-title">
				<div id="suvey-title">${ Survey.sTitle }</div>
				<div id="answer-num">설문자 수 : ${ participantCount }</div>
			</div>

			<br>

			<div class="border">${ Survey.sContent }</div>

			<br>
			<c:forEach var="q" items="${Question}" varStatus="vs">
				<div class="border">
					<div>${ q.question }</div>
					<hr class="hr-line">
					<table class="table">
						<c:forEach var="opt" items="${ q.list }">
							<c:if test="${ opt.option != 'null' }">
								<tr>
									<td>${ opt.option }</td>
									<td><div class="progress">
											<div class="prog-bar col_info" role="progressbar"
												aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
												style="width: ${ opt.answer / participantCount * 100 }%"></div>
										</div></td>
									<td>&nbsp;&nbsp;${ opt.answer }명 &nbsp;&nbsp; 
									<c:if test="${ participantCount == 0}">
									0
									</c:if>
									<c:if test="${ participantCount != 0}">
									<fmt:parseNumber var="result" value="${ opt.answer / participantCount * 100 }" integerOnly="true"/>${result}
									</c:if>%</td>
								</tr>
							</c:if>

							<c:if test="${ opt.option == 'null' }">
								<ul>
									<c:if test="${ opt.answer != '0' }">
										<c:forTokens var="list" items="${ opt.answer }" delims=",">
											<li class="essayList">${ list }</li>
										</c:forTokens>
									</c:if>
								</ul>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<br>
			</c:forEach>

			<div id="list">
				<c:if test="${ Survey.mNo == loginUserNo }">
					<div>
						<button type="button" class="button button-margin" onclick="deleteSurvey();">삭제하기</button>
					</div>			
				</c:if>
				<div>
					<button type="button" class="button button-margin" onclick="location.href='surveyList.su'">목록</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 설문 삭제하기
		function deleteSurvey() {
			var result = window.confirm("정말 삭제하시겠습니까?");
			var sNo = "<c:out value='${Survey.sNo}'/>";
		
			if(result) {
				window.location.href = "deleteSurvey.su?sNo="+sNo;
			} 
	}
	</script>
</body>
</html>