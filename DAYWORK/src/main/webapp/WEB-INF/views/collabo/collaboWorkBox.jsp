<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/collabo.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="main-king">
	<%@ include file="../common/mainLeft.jsp"%>

	<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<div class="collabo-workBox">
				<div class="collabo-workBox-top">
					<div class="collabo-workBox-top-text">WORKBOX</div>
					<div class="collabo-workBox-top-search"><input type="text" id="workBox-search" placeholder="검색"></div>
					<div class="collabo-workBox-top-new"><button id="new" onclick="location.href='gocollaboList.co'"> + </button></div>
				</div>
				<hr style="margin-top:20px; margin-bottom: 20px;">
				<div class="collabo-workBox-content">
					<div class="collabo-workBox-btns">
						<div class="collabo-workBox-btn"><button id="call">요청</button></div>
						<div class="collabo-workBox-btn"><button id="progress">진행중</button></div>
						<div class="collabo-workBox-btn"><button id="finish">완료</button></div>
						<div class="collabo-workBox-btn"><button id="feedback">피드백</button></div>
						<div class="collabo-workBox-btn"><button id="postpone">보류</button></div>
					</div>
					<div class="collabo-workBox-boxes" >
						<!-- 요청 -->
						<div class="collabo-workBox-box-column" ondragover="allowDrop()" ondrop="dropItem(Event)" id="C1">
							<c:forEach var="c" items="${ cList }">
								<c:if test="${ c.cBctNo eq 'C1' }">
									<div class="collabo-workBox-box" draggable=true ondragstart="dragStart(Event)" id="${ c.cNo }">
										<input type="hidden" value="${c.cNo }">
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="far fa-calendar-check"></i></div>
											<div class="collabo-workBox-box-b">${ c.bTitle }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="fas fa-users"></i></div>
											<div class="collabo-workBox-box-b">${ c.cPeople }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b">${ c.cEndDate }</div>
											<div class="collabo-workBox-box-b">까지</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<!-- 진행중 -->
						<div class="collabo-workBox-box-column" ondragover="allowDrop()" ondrop="dropItem(Event)" id="C2">
							<c:forEach var="c" items="${ cList }">
								<c:if test="${ c.cBctNo eq 'C2' }">
									<div class="collabo-workBox-box" draggable=true ondragstart="dragStart(Event)" id="${ c.cNo }">
										<input type="hidden" value="${c.cNo }">
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="far fa-calendar-check"></i></div>
											<div class="collabo-workBox-box-b">${ c.bTitle }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="fas fa-users"></i></div>
											<div class="collabo-workBox-box-b">${ c.cPeople }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b">${ c.cEndDate }</div>
											<div class="collabo-workBox-box-b">까지</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<!-- 완료 -->
						<div class="collabo-workBox-box-column" ondragover="allowDrop()" ondrop="dropItem(Event)" id="C3">
							<c:forEach var="c" items="${ cList }">
								<c:if test="${ c.cBctNo eq 'C3' }">
									<div class="collabo-workBox-box" draggable=true ondragstart="dragStart(Event)" id="${ c.cNo }">
										<input type="hidden" value="${c.cNo }">
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="far fa-calendar-check"></i></div>
											<div class="collabo-workBox-box-b">${ c.bTitle }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="fas fa-users"></i></div>
											<div class="collabo-workBox-box-b">${ c.cPeople }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b">${ c.cEndDate }</div>
											<div class="collabo-workBox-box-b">까지</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<!-- 피드백 -->
						<div class="collabo-workBox-box-column" ondragover="allowDrop()" ondrop="dropItem(Event)" id="C4">
							<c:forEach var="c" items="${ cList }">
								<c:if test="${ c.cBctNo eq 'C4' }">
									<div class="collabo-workBox-box" draggable=true ondragstart="dragStart(Event)" id="${ c.cNo }">
										<input type="hidden" value="${c.cNo }">
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="far fa-calendar-check"></i></div>
											<div class="collabo-workBox-box-b">${ c.bTitle }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="fas fa-users"></i></div>
											<div class="collabo-workBox-box-b">${ c.cPeople }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b">${ c.cEndDate }</div>
											<div class="collabo-workBox-box-b">까지</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<!-- 보류 -->
						<div class="collabo-workBox-box-column" ondragover="allowDrop()" ondrop="dropItem(Event)" id="C5">
							<c:forEach var="c" items="${ cList }">
								<c:if test="${ c.cBctNo eq 'C5' }">
									<div class="collabo-workBox-box" draggable=true ondragstart="dragStart(Event)" id="${ c.cNo }">
										<input type="hidden" value="${c.cNo }">
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="far fa-calendar-check"></i></div>
											<div class="collabo-workBox-box-b">${ c.bTitle }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b"><i class="fas fa-users"></i></div>
											<div class="collabo-workBox-box-b">${ c.cPeople }</div>
										</div>
										<div class="collabo-workBox-box-a">
											<div class="collabo-workBox-box-b">${ c.cEndDate }</div>
											<div class="collabo-workBox-box-b">까지</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
					</div>
				</div>
			</div>
	</div>
</div>


</body>

	<script>
		function allowDrop() {
		    event.preventDefault();
		}
	
		function dropItem() {
		    var dropele = event.target;
		    var dropid = event.dataTransfer.getData('text');
		    var moveEle = document.getElementById(dropid);
		    dropele.appendChild(moveEle);
		    
		    $.ajax({
		    	url: 'updateBtn.co',
		    	data: {cNo:dropid,
		    		   cBctNo:dropele.id},
		    	success: function(data){
		    	}
		    });
		}
		
		function dragStart() {
			 var selectEle = event.target;
			 var selectId = selectEle.id;
			 event.dataTransfer.setData('text/plain', selectId); 
		}		
		
		$('.collabo-workBox-box').on('click', function(){
			cNo = $(this).children().eq(0).val();
			location.href='goCollaboBox.co?cNo='+ cNo;
		});
	</script>
</html>