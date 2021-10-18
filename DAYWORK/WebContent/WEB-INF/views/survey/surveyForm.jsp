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
			<div class="title">설문 작성</div>

			<br>
			<form id="surveyForm" action="insertSurvey.su" onsubmit="return checkQuestion();">
				<div class="border">
					<table class="main-table">
						<tr>
							<td class="td-margin">설문 제목</td>
							<td><input type="text" class="suvey-question" id="sTitle" name="sTitle"></td>
						</tr>
						<tr>
							<td>설문 내용</td>
							<td><textarea rows="5" cols="69" id="sContent" name="sContent"></textarea></td>
						</tr>
						<tr>
							<td>설문 기간</td>
							<td><input type="date" id="sStartDate" name="sStartDate">&nbsp;~&nbsp;
							<input type="date" id="sEndDate" name="sEndDate"></td>
						</tr>
						<tr>
							<td>결과 공개 여부</td>
							<td><input type="radio" id="sPublic" name="sPublic"	value="Y">공개 &nbsp;&nbsp;&nbsp;
							<input type="radio"	name="sPublic" value="N">비공개
						</tr>
					</table>
				</div>

				<br>

				<div id="question">
					<div class="MC border">
						<table class="formTable">
							<tr>
								<td class="td-margin">질문</td>
								<td><input type="text" name="q" class="question-length"></td>
							</tr>
							<tr>
								<td>보기</td>
								<td><input type="text" name="o" class="option"><span
									class="deleteopt">삭제</span></td>
							</tr>
							<tr>
								<td>보기</td>
								<td><input type="text" name="o" class="option"><span
									class="deleteopt">삭제</span></td>
							</tr>
						</table>
						<br>
						<div class="add-opt">
							<div></div>
							<div>
								<button type="button" class="opt button">보기 추가</button>
							</div>
							<div>
								<button type="button" class="delete button">삭제</button>
							</div>
						</div>
					</div>

					<!-- <br> -->
					<div class="br">&nbsp;</div>

					<div class="essay border">
						<table class="formTable">
							<tr>
								<td class="td-margin">질문</td>
								<td><input type="text" name="q" class="question-length"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="o" class="option" value="null"></td>
							</tr>
						</table>

						<div class="deleteArea">
							<div>
								<button type="button" class="delete button">삭제</button>
							</div>
						</div>
					</div>


					<!-- <br> -->
					<div class="br">&nbsp;</div>

				</div>

				<input type="hidden" id="questionsKey" name="questionsKey">
				<input type="hidden" id="optionsKey" name="optionsKey">

				<div class="center-button">
					<div>
						<button type="button" class="long-button">질문 추가하기</button>
					</div>
				</div>

				<br> <br>

				<div class="center-button">
					<div>
						<button type="button" class="button point button-margin"
							onclick="enroll();">작성 완료</button>
					</div>
					<div>
						<button type="button" class="button button-margin"
							onclick="history.back();">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		// 객관식 보기 삭제
		$(document).on('click', '.deleteopt', function() {

			$(this).parent().parent().remove();
		});

		// 객관식 보기 추가
		$(document).on('click', '.opt', function() {

			$(this).parent().parent().prev().prev().append(getopt());
		});

		// 질문 삭제
		$(document).on('click', '.delete', function() {

			$(this).parent().parent().parent().next().remove();
			$(this).parent().parent().parent().remove();
		});

		// 질문 추가
		$('.long-button').click(function() {
			var type = window.prompt("1.객관식  2.주관식");

			if (type == 1) {
				$('#question').append(getMC());
			} else if(type == 2){
				$('#question').append(getessay());
			}
		});

		// 객관식 질문 코드
		function getMC() {

			var result = "";

			result = "<div class='MC border'>"
					+ "<table class='formTable'>"
					+ "<tr>"
					+ "<td class='td-margin'>질문</td>"
					+ "<td><input type='text' name='q' class='question-length'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>보기</td>"
					+ "<td><input type='text' name='o' class='option'><span class='deleteopt'>삭제</span></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td>보기</td>"
					+ "<td><input type='text' name='o' class='option'><span class='deleteopt'>삭제</span></td>"
					+ "</tr>"
					+ "</table>"
					+ "<br>"
					+ "<div class='add-opt'>"
					+ "<div></div>"
					+ "<div><button type='button' class='opt button'>보기 추가</button></div>"
					+ "<div><button type='button' class='delete button'>삭제</button></div>"
					+ "</div>" + "</div>" + "<div class='br'>&nbsp;</div>";

			return result;
		}

		// 주관식 질문 코드
		function getessay() {

			var result = "";

			result = "<div class='essay border'>"
					+ "<table class='formTable'>"
					+ "<tr>"
					+ "<td class='td-margin'>질문</td>"
					+ "<td><input type='text' name='q' class='question-length'></td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td><input type='hidden' name='o' class='option' value='null'></td>"
					+ "</tr>" + "</table>" + "<div class='deleteArea'>"
					+ "<div>"
					+ "<button type='button' class='delete button'>삭제</button>"
					+ "</div>" + "</div>" + "</div>"
					+ "<div class='br'>&nbsp;</div>";

			return result;
		}

		// 객관식 보기 코드
		function getopt() {

			var result = "";

			result = "<tr>"
					+ "<td>보기</td>"
					+ "<td><input type='text' name='o' class='option'><span class='deleteopt'>삭제</span></td>"
					+ "</tr>"

			return result;
		}

		// 질문 개수 확인
		function checkQuestion() {
			var questions = document.getElementsByName("q");
			var options = document.getElementsByName("o");
			var sTitle = document.getElementById("sTitle");
			var sContent = document.getElementById("sContent");
			var sStartDate = document.getElementById("sStartDate");
			var sEndDate = document.getElementById("sEndDate");
			var sPublic = document.getElementsByName("sPublic");
			var num = $('#question').children();

			if (num.length == 0) {
				alert("질문 한개 이상이어야 설문을 등록할 수 있습니다.");
				return false;
			}

			if (sTitle.value == "") {
				alert("설문 제목을 입력해주세요");
				sTitle.focus();
				return false;
			}

			if (sContent.value == "") {
				alert("설문 내용을 입력해주세요");
				sContent.focus();
				return false;
			}

			if (sEndDate.value == "") {
				alert("마감일 입력해주세요");
				sEndDate.focus();
				return false;
			}

			if (sStartDate.value > sEndDate.value) {
				alert("기간 설정이 잘못 되었습니다.");
				sStartDate.focus();
				return false;
			}

			var result = 0;
			for (var i = 0; i < sPublic.length; i++) {
				console.log(sPublic);
				if (sPublic[i].checked) {
					result++;
				}
			}
			if (result == 0) {
				alert("결과 공개여부를 선택해주세요. ");
				document.getElementById("sPublic").focus();
				return false;
			}

			for (var i = 0; i < questions.length; i++) {
				if (questions[i].value == "") {
					alert("질문 제목을 입력해주세요");
					questions[i].focus();
					return false;
				}
			}

			for (var i = 0; i < options.length; i++) {
				if (options[i].value == "") {
					alert("보기를 입력해주세요");
					options[i].focus();
					return false;
				}
			}

			return true;
		}

		// 오늘 날짜 가져오기
		$(function() {
			document.getElementById('sStartDate').value = new Date().toISOString().substring(0, 10);
		});

		// 설문 제출시 답변 정보 담아서 컨트롤러에 보내주기
		function enroll() {
			var questions = document.getElementsByName("q");
			var questionKey = "";
			var tables = document.getElementsByClassName("formTable");
			var optionKey = "";

			for (var i = 0; i < questions.length; i++) {
				questionKey += questions[i].value + "@";
			}

			if (questionKey != null) {
				document.getElementById("questionsKey").value = questionKey;
			}

			for (var j = 0; j < tables.length; j++) {
				var subKey = "";
				var options = tables[j].querySelectorAll(".option");

				for (var a = 0; a < options.length; a++) {
					subKey += options[a].value + "@";
				}
				optionKey += subKey + "/";
			}

			document.getElementById("optionsKey").value = optionKey;

			$('#surveyForm').submit();
		}
	</script>
</body>
</html>