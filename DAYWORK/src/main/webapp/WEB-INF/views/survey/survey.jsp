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
		<div class="main-right" style="height: 1000px;">
			<br>

			<form id="survey" action="participateSurvey.su" onsubmit="return enroll();">
				<input type="hidden" name="sNo" value="${ Survey.sNo }">

				<div style="font-size: 25px;">${ Survey.sTitle }</div>
				
				<br>
				
				<table class="Survey-table" style="font-size: 14px;">
					<tr>
						<td class="td-margin">작성자</td>
						<td>${ Survey.mName }&nbsp;${Survey.jName }</td>
					</tr>
					<tr>
						<td>설문 기간</td>
						<td>${ Survey.sStartDate }~${ Survey.sEndDate }</td>
					</tr>
					<tr>
						<td>설문 결과 공개 여부</td>
						<td><c:if test="${ Survey.sPublic == 'Y' }">공개</c:if> <c:if
								test="${ Survey.sPublic == 'N' }">비공개</c:if></td>
					</tr>
				</table>

				<br> <br>

				<div class="border">${ Survey.sContent }</div>

				<br> <br>

				<div id="questions">
					<c:forEach var="num" items="${ Question }" varStatus="vs">
						<div class="question">
							<div style="margin-bottom: 10px; font-size: 18px;">${ vs.count }.${ num.question }</div>
							<input type="hidden" name="qNo" value="${ num.qNo }">

							<c:forTokens var="opt" items="${ num.option }" delims="@" varStatus="vs2">
								<c:if test="${ opt != 'null' }">
									<c:if test="${ Survey.ongoing == '0' }">
									&nbsp;&nbsp;&nbsp;&nbsp;${ vs2.count }.<span style="margin: 0px 10px;" class="answer">${ opt }</span><br>
									</c:if>
									<c:if test="${ Survey.ongoing == '1' }">
										<input type="radio" style="margin: 7px;" class="answer"	name="answer${ vs.count }" value="${ vs2.count }">${ opt }<br>
									</c:if>
								</c:if>

								<c:if test="${ opt == 'null' }">
									<c:if test="${ Survey.ongoing == '0' }">
									&nbsp;&nbsp;&nbsp;&nbsp;주관형 설문
								</c:if>
									<c:if test="${ Survey.ongoing == '1' }">
										<textarea rows="5" cols="70" class="answer"	name="answer${ vs.count }" value=""></textarea>
									</c:if>
									<br>
								</c:if>
							</c:forTokens>
							<br>
						</div>
					</c:forEach>
				</div>

				<!-- <br> -->
				<div class="br">&nbsp;</div>

				<br> <br>

				<div class="center-button">
					<c:if test="${ Survey.ongoing ==  '0'}">
						<c:if test="${ Survey.mNo == loginUserNo }">
							<div>
								<button type="button" class="button button-margin" onclick="deleteSurvey();">삭제하기</button>
							</div>			
						</c:if>
						<div>
							<button type="button" class="button button-margin" onclick="history.back();">목록</button>
						</div>
					</c:if>
					<c:if test="${ Survey.ongoing !=  '0'}">
						<div>
							<button type="submit" class="button point button-margin">제출하기</button>
						</div>
						<c:if test="${ Survey.sPublic == 'Y' || Survey.mNo == loginUserNo}">
							<div>
								<button type="button" class="button point button-margin" 
									onclick="location.href='resultSurvey.su?sNo=${Survey.sNo}'">결과보기</button>
							</div>						
						</c:if>
						
						<c:if test="${ Survey.mNo == loginUserNo }">
							<div>
								<button type="button" class="button button-margin" onclick="deleteSurvey();">삭제하기</button>
							</div>			
						</c:if>
						<div>
							<button type="button" class="button button-margin" onclick="history.back();">목록</button>
						</div>
					</c:if>
				</div>
			</form>
		</div>
	</div>

	<script>
		// 설문 등록하기 전에 작성하지 않은 답변 확인하기
		function enroll() {
			var que = document.getElementsByClassName("question");

			for (var i = 0; i < que.length; i++) {
				var result = 0;
				var check = que[i].children;

				for (var j = 0; j < check.length; j++) {
					if (check[j].tagName == "INPUT") {
						if (check[j].checked) {
							result++;
						}
					} else if (check[j].tagName == "TEXTAREA") {
						if (check[j].value != "") {
							result++;
						}
					}
				}

				if (result == 0) {
					alert("작성하지 않은 설문이 있습니다.");
					que[i].scrollIntoView();
					return false;
				}
			}

			return true;
		}
		
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