<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/workManagement.css">
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="main-king">
<%@ include file="../common/mainLeft.jsp"%>
	<!-- 오른쪽 내용 박스 -->
	<div class="main-right">
	<h3>근태 현황</h3>
	<div class="week-workTime-title">이번 주 잔여 근무 시간 
		<div class="week-workTime" id="week-work"></div>
	</div>
	
<!-- 일주일치 근무 테이블 -->
	<table class="workTime-table">
		<tr>
			<th>날짜</th>
			<th>출근</th>
			<th>퇴근</th>
			<th>근무시간</th>
			<th>초과근무</th>
			<th>비고</th>
		</tr>
		
		<tbody id="workTime-table-body"></tbody>	
	</table>
	<div id="chart"></div>		
	</div>
</div>


<script src="resources/js/workManagement.js"></script>
<script>
	var mNo = ${loginUser.getmNo()};
		
	$(function(){
		getData();
	});

</script>
</body>
</html>