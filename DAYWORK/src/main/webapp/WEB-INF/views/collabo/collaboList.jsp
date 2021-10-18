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
			<div class="collabo-create">
				<div class="collabo-create-box" >
<!-- 					<form action="insertCollabo.co" method="post"> -->
						<div class="collabo-crate-box-top">
							<div class="create-box-top-margin">업무요청하기</div>
							<input  type="hidden" name="cMNo" value="${ loginUser.mNo }">
							<input  type="hidden" name="bMNo" value="${ loginUser.mNo }">
							<input  type="hidden" name="bDept" value="${ loginUser.dCode }">
						</div>
						<div class="collabo-crate-box-content">
							<div class="create-content-title">
								<input class="new-title" type="text" placeholder="제목을 작성하세요" style="border:none;" name="bTitle">
							</div>
							<div class="create-content-add">
								<label>시작일자  :  <input class="new-date-s" type="date" name="cStartDate" value="${dat }"> </label>
								<label>마감일자  :  <input class="new-date-e" type="date" name="cEndDate"> </label>
								<div class="input-people">
									<i class="fas fa-user-check"></i>
									<div id="plus-box"></div>
									<input class="new-people" type="text" placeholder="참여자를 선택하세요" name="cPeople">
								</div>
								<div class="selectMemberList"></div>
							</div>
							<div class="create-content-content">
								<textarea class="new-content" rows="10" cols="96" placeholder="글을 작성하세요" name="bContent"></textarea>
							</div>
						</div>
						<div class="collabo-crate-box-bottom">
							<div class="create-box-bottom-margin">
								<div class="box-bottom-btn-status">
									<input type='radio' class="new-cBctNo" name = 'cBctNo' value='C1'>요청
									<input type='radio' class="new-cBctNo" name = 'cBctNo' value='C2'>진행중
									<input type='radio' class="new-cBctNo" name = 'cBctNo' value='C3'>완료
									<input type='radio' class="new-cBctNo" name = 'cBctNo' value='C4'>피드백
									<input type='radio' class="new-cBctNo" name = 'cBctNo' value='C5'>대기
								</div>
								<div class="box-bottom-btn-ab">
									<button id="box-bottom-btn-a" >임시저장</button>
									<button id="box-bottom-btn-b" >작성하기</button>
								</div>
							</div>
						</div>
<!-- 					</form> -->
				</div>
				
				<div class="collabo-workList-cate">
						<input type='hidden' value='${ loginUser.mNo }'>
						<input type='hidden' value='${ loginUser.mName }'>
						<button class="cateBtn" name = 'cMNo' value='${ loginUser.mNo }'>내가 쓴 글</button>
						<button class="cateBtn" name = 'cBctNo' value='C1'>요청</button>
						<button class="cateBtn" name = 'cBctNo' value='C2'>진행중</button>
						<button class="cateBtn" name = 'cBctNo' value='C3'>완료</button>
						<button class="cateBtn" name = 'cBctNo' value='C4'>피드백</button>
						<button class="cateBtn" name = 'cBctNo' value='C5'>보류</button>
				</div>
				
				<c:if test="${ cList == null }">
					확인할 업무협업 게시글이 존재하지 않습니다.
				</c:if>
				<c:if test="${ cList != null }">
					<div class="dd">
						<c:forEach var="c" items="${ cList }">
<%-- 							<a type="hidden" class="cNoBox" value="${ cNoBox }"> --%>
								<div class="collabo-list-box" id="${c.cNo}" >
									<div class="collabo-list-box-top">
										<div class="list-box-top-margin">
											<c:if test="${c.cBctNo eq 'C1' }">
												<button id="call">요청</button>
											</c:if>
											<c:if test="${c.cBctNo eq 'C2' }">
												<button id="progress">진행중</button>
											</c:if>
											<c:if test="${c.cBctNo eq 'C3' }">
												<button id="finish">완료</button>
											</c:if>
											<c:if test="${c.cBctNo eq 'C4' }">
												<button id="feedback">피드백</button>
											</c:if>
											<c:if test="${c.cBctNo eq 'C5' }">
												<button id="postpone">보류</button>
											</c:if>
										</div>
										<div class="list-box-top-right">
											<div class="box-top-createDate">
												${ c.bModifyDate }
											</div>
											<div class="box-top-writer">
												${ c.bWriter }
											</div>
										</div>
									</div>
									<div class="collabo-list-box-content">
										<div class="list-content-title">
											<div class="list-title">${ c.bTitle }</div>
										</div>
										<div class="list-content-add">
												<label style="margin-right:10px;">시작일자  :  ${ c.cStartDate } </label>
												<label style="margin-right:50px;">마감일자  :  ${ c.cEndDate } </label>
												<label>
													<i class="fas fa-user-check"></i>
												<span class="list-people" >${ c.cPeople }</span></label>
										</div>
										<div class="list-content">
											${c.bContent }
										</div>
									</div>
									<div class="collabo-list-box-bottom">
										<div class="list-box-bottom-margin">
											<div class="box-bottom-btn-update">
												<input type="hidden" id="whatcNo" value ="${ c.cNo }">
												<input type="hidden" id="whatcNo" value ="${ c.cBNo }">
												<button class="b_call updateBtn" value="C1">요청</button>
												<button class="b_progress updateBtn" value="C2">진행중</button>
												<button class="b_finish updateBtn" value="C3">완료</button>
												<button class="b_feedback updateBtn" value="C4">피드백</button>
												<button class="b_postpone updateBtn" value="C5">보류</button>
											</div>
											<div class="box-bottom-btn-ab">
												<c:if test="${c.fbStatus == 'Y' }">
													<div class="feedback-yn">N</div>
												</c:if>
													<button class="box-bottom-fdbk">피드백</button>
												<c:if test="${c.bWriter == loginUser.mName }">
													<button class="box-bottom-btn-up">수정하기</button>
													<button class="box-bottom-btn-de">삭제하기</button>
												</c:if>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<a href="#${cNoBox}" id="cNoBox" style="display:none;"></a>
	
	<!-- feedback modal -->
	<div class='ee'>
	<div class='feedback-zone'>
		<div class='feedback-background'></div>
		<div class='feedback-main'>
			<div class='feedback-notice'>
				피드백을 확인하세요
			</div>
			<div class='feedback-view'>
<!-- 				<div class='view-gori'>ㄴ</div> -->
<!-- 				<div class='view-image'></div> -->
<!-- 				<div class='view-dept'></div> -->
<!-- 				<div class='view-name'></div> -->
<!-- 				<div class='view-job'></div> -->
<!-- 				<div class='view-cotent'></div> -->
<!-- 				<div class='view-date'></div> -->
			</div>
			<div class='feedback-write'>
<!-- 				<input type='text' name='fContent'> -->
<!-- 				<button class='feedback-btn'>등록하기</button> -->
			</div>
		</div>
	</div>
	</div>
	
	
</body>

<script>

	window.onload = function(){
			document.getElementById('cNoBox').click();
	}

	var inputMember = [];
	$('#box-bottom-btn-b').on('click',function(){
		var bTitle = $('.new-title').val();
		var cStartDate = $('.new-date-s').val();
		var cEndDate = $('.new-date-e').val();
		var cPeople = $('.new-people').val();
		var bContent = $('.new-content').val();
		var cBctNo = $('input[name="cBctNo"]:checked').val();
		var bDept = '${loginUser.dCode}';
		var bMNo = ${loginUser.mNo};
		var cMNo = ${loginUser.mNo};
		
		$.ajax({
			url:'insertCollabo.co',
			data: {bTitle:bTitle,
				   cStartDate:cStartDate,
				   cEndDate:cEndDate,
				   cPeople:cPeople,
				   bContent:bContent,
				   cBctNo:cBctNo,
				   bDept:bDept,
				   bMNo:bMNo,
				   cMNo:cMNo,
				   inputMember:inputMember},
			dataType: 'text',
			success: function(data){
				if(data == 'success'){
					$('.new-title').val('');
					$('.new-date-e').val('');
					$('.new-people').val('');
					$('.new-content').val('');
					$('#plus-box').html('');
					$('input[name="cBctNo"]').prop("checked",false);
					getCollaboList();
					inputMember = [];
				}
			}
		});
	});
	
	function getCollaboList(){
		
		$.ajax({
			url:'gocollaboListAjax.co',
			success: function(data){
			$('.dd').html('');
				
				for(var i=0; i< data.length; i++){
					var c = data[i];
					
					var addHtml = "";
						
						addHtml += "<div class='collabo-list-box' id=box"+c.cNo+">";
						addHtml += "<div class='collabo-list-box-top'>";
						addHtml += "<div class='list-box-top-margin'>";
							if(c.cBctNo == 'C1'){
						addHtml +=	"<button id='call'>요청</button>";
								} else if(c.cBctNo == 'C2'){
						addHtml +=	"<button id='progress'>진행중</button>";
								} else if(c.cBctNo == 'C3'){
						addHtml +=	"<button id='finish'>완료</button>";			
								} else if(c.cBctNo == 'C4'){
						addHtml +=	"<button id='feedback'>피드백</button>";			
								} else if(c.cBctNo == 'C5'){
						addHtml +=	"<button id='postpone'>보류</button>";			
								}
						addHtml += "</div>";
						addHtml += "<div class='list-box-top-right'>";
						addHtml += "<div class='box-top-createDate'>" + c.bModifyDate + "</div>";
						addHtml += "<div class='box-top-writer'>" + c.bWriter + "</div>";
						addHtml += "</div>";
						addHtml += "</div>";
						
						addHtml += "<div class='collabo-list-box-content'>";
						addHtml += "<div class='list-content-title'>";
						addHtml += "<div class='list-title'>" + c.bTitle + "</div>";
						addHtml += "</div>"; 
								
						addHtml += "<div class='list-content-add'>";
						addHtml += "<label style='margin-right:10px;'>시작일자  :  " + c.cStartDate + "</label>";
						addHtml += "<label style='margin-right:50px;'>마감일자  :  " + c.cEndDate + "</label>";
						addHtml += "<label><i class='fas fa-user-check'></i><span class='list-people' >" + c.cPeople + "</span></label>";
						addHtml += "</div>";
						
						addHtml += "<div class='list-content'>";
						addHtml += c.bContent;
						addHtml += "</div>";
						addHtml += "</div>";
						
						addHtml += "<div class='collabo-list-box-bottom'>";
						addHtml += "<div class='list-box-bottom-margin'>";
						addHtml += "<div class='box-bottom-btn-status' >";
						addHtml += "<input type='hidden' id='whatcNo' value ='" + c.cNo + "'>";
						addHtml += "<input type='hidden' id='whatcBNo' value ='" + c.cBNo + "'>";
						addHtml += "<button class='b_call updateBtn' value='C1'>요청</button>";
						addHtml += "<button class='b_progress updateBtn' value='C2'>진행중</button>";
						addHtml += "<button class='b_finish updateBtn' value='C3'>완료</button>";
						addHtml += "<button class='b_feedback updateBtn' value='C4'>피드백</button>";
						addHtml += "<button class='b_postpone updateBtn' value='C5'>보류</button>";
						addHtml += "</div>";
						
						addHtml += "<div class='box-bottom-btn-ab'>";
						
						if(c.fbStatus == 'Y'){
							addHtml += "<div class='feedback-yn'>N</div>";
						}
						addHtml += "<button class='box-bottom-fdbk'>피드백</button>";
						if(c.bWriter == '${loginUser.mName}'){
							addHtml += "<button class='box-bottom-btn-up'>수정하기</button>";
							addHtml += "<button class='box-bottom-btn-de'>삭제하기</button>";
						}
						addHtml += "</div>";
						addHtml += "</div>";
						addHtml += "</div>";
						addHtml += "</div>";
						
						$('.dd').append(addHtml);
					}
			}
		});
	};
	
	$(document).on('click', '.updateBtn', function(){
		var cNo = $(this).parent().children().eq(0).val();
		var btn = $(this).val();
		
		if(btn == 'C1'){
			var bool = window.confirm("'요청'으로 상태변경 하시겠어요?");
		} else if(btn == 'C2'){
			var bool = window.confirm("'진행중'으로 상태변경 하시겠어요?");
		} else if(btn == 'C3'){
			var bool = window.confirm("'완료'로 상태변경 하시겠어요?");
		} else if(btn == 'C4'){
			var bool = window.confirm("'피드백'으로 상태변경 하시겠어요?");
		}	else if(btn == 'C5'){
			var bool = window.confirm("'보류'로 상태변경 하시겠어요?");
		}
		
		if(bool){
			$.ajax({
				url : 'updateBtn.co',
				data : {cNo:cNo,
						cBctNo:btn},
				success : function(data){
					if(data == 'success'){
						getCollaboList();		
					}
				}
			});
		};
	});
	
	$(document).on('click', '.box-bottom-btn-up', function(){
		var cNo = $(this).parent().parent().children().eq(0).children().eq(0).val();
		var empty = $(this).parent().parent().parent().parent();
		
		$.ajax({
			url:'gocollaboListAjax.co',
			success: function(data){
				console.log(data);
						empty.html('');
				
				for(var i=0; i< data.length; i++){
					var c = data[i];
					
					if(cNo == c.cNo){
					
						var addHtml = "";
							
							addHtml += "<div class='collabo-list-box-top'>";
							addHtml += "<div class='list-box-top-margin'>";
								if(c.cBctNo == 'C1'){
							addHtml +=	"<button id='call'>요청</button>";
									} else if(c.cBctNo == 'C2'){
							addHtml +=	"<button id='progress'>진행중</button>";
									} else if(c.cBctNo == 'C3'){
							addHtml +=	"<button id='finish'>완료</button>";			
									} else if(c.cBctNo == 'C4'){
							addHtml +=	"<button id='feedback'>피드백</button>";			
									} else if(c.cBctNo == 'C5'){
							addHtml +=	"<button id='postpone'>보류</button>";			
									}
							addHtml += "</div>";
							addHtml += "<div class='list-box-top-right'>";
							addHtml += "<div class='box-top-createDate'>" + c.bModifyDate + "</div>";
							addHtml += "<div class='box-top-writer'>" + c.bWriter + "</div>";
							addHtml += "</div>";
							addHtml += "</div>";
							
							addHtml += "<div class='collabo-list-box-content'>";
							addHtml += "<div class='list-content-title'>";
							addHtml += "<div class='list-title'>"
							addHtml += "<input class='new2-title' type='text' name='bTitle' value='"+ c.bTitle + "'>"; 
							addHtml += "</div>";
							addHtml += "</div>"; 
									
							addHtml += "<div class='list-content-add'>";
							addHtml += "<label><input class='new2-date-s' type='date' name='cStartDate' value='" + c.cStartDate + "'></label>";
							addHtml += "<label><input class='new2-date-e' type='date' name='cEndDate' value='" + c.cEndDate + "'></label>";
							addHtml += "<label><i class='fas fa-user-check'></i><input class='new2-people' type='text' name='cPeople' value='"+ c.cPeople + "' readonly></label>";
							addHtml += "</div>";
							
							addHtml += "<div class='list-content'>";
							addHtml += "<textarea class='new2-content' rows='10' cols='96' name='bContent'>"+ c.bContent +"</textarea>";
							addHtml += "</div>";
							addHtml += "</div>";
							
							addHtml += "<div class='collabo-list-box-bottom'>";
							addHtml += "<div class='list-box-bottom-margin'>";
							
							addHtml += "<div class='box-bottom-btn-status'>";
							addHtml += "<input type='hidden' id='whatcNo' value ='" + c.cNo + "'>";
							addHtml += "<input type='hidden' id='whatcBNo' value ='" + c.cBNo + "'>";
							if(c.cBctNo == 'C1'){
							addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C1' checked>요청";
							addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C2' >진행중";
							addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C3' >완료";
							addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C4' >피드백";
							addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C5' >보류";
							} else if(c.cBctNo == 'C2'){
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C1' >요청";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C2' checked>진행중";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C3' >완료";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C4' >피드백";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C5' >보류";
							} else if(c.cBctNo == 'C3'){
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C1' >요청";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C2' >진행중";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C3' checked>완료";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C4' >피드백";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C5' >보류";
							} else if(c.cBctNo == 'C4'){
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C1' >요청";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C2' >진행중";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C3' >완료";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C4' checked>피드백";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C5' >보류";
							} else if(c.cBctNo == 'C5'){
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C1' >요청";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C2' >진행중";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C3' >완료";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C4' >피드백";
								addHtml += "<input type='radio' class='new2-cBctNo' name = 'cBctNo' value='C5' checked>보류";
							}
							addHtml += "</div>";
							
							addHtml += "<div class='box-bottom-btn-ab'>";
							addHtml += "<button class='box-bottom-btn-end'>완료</button>";
							addHtml += "</div>";
							addHtml += "</div>";
							addHtml += "</div>";
							
							empty.append(addHtml);
					}
				}
			}
		});
	});
	
	
	$(document).on('click', '.box-bottom-btn-end', function(){
		var cNo = $(this).parent().parent().children().eq(0).children().eq(0).val();
		var cBNo = $(this).parent().parent().children().eq(0).children().eq(1).val();
		var bTitle = $(this).parent().parent().parent().parent().children().eq(1).children().children().children().val();
		var cStartDate = $(this).parent().parent().parent().parent().children().eq(1).children().eq(1).children().eq(0).children().val();
		var cEndDate = $(this).parent().parent().parent().parent().children().eq(1).children().eq(1).children().eq(1).children().val();
		var cPeople = $(this).parent().parent().parent().parent().children().eq(1).children().eq(1).children().eq(2).children().eq(1).val();
		var bContent = $(this).parent().parent().parent().parent().children().eq(1).children().eq(2).children().val();
		var cBctNo = $(this).parent().parent().parent().children().eq(0).children().find('input:radio:checked').val();
		
		$.ajax({
			url:'updateCollabo.co',
			data: {cNo:cNo,
				   cBNo:cBNo,
				   bTitle:bTitle,
				   cStartDate:cStartDate,
				   cEndDate:cEndDate,
				   cPeople:cPeople,
				   bContent:bContent,
				   cBctNo:cBctNo},
			success: function(data){
					if(data == 'success'){
						getCollaboList();
					}
			}
		});
		
	});
	
	
	$(document).on('click', '.cateBtn', function(){
		var btn =  $(this).val();
		var cMNo = $(this).parent().children().eq(0).val();
		var cPeople = $(this).parent().children().eq(1).val();
		var cBctNo = btn;
	
		$.ajax({
			url:'selectCollaboCate.co',
			data:{cMNo:cMNo,
				  cBctNo:cBctNo,
				  cPeople:cPeople},
			success: function(data){
				$('.dd').html('');
		
			for(var i=0; i< data.length; i++){
				var c = data[i];
				
				var addHtml = "";
					
					addHtml += "<div class='collabo-list-box' id=box"+c.cNo+">";
					addHtml += "<div class='collabo-list-box-top'>";
					addHtml += "<div class='list-box-top-margin'>";
						if(c.cBctNo == 'C1'){
					addHtml +=	"<button id='call'>요청</button>";
							} else if(c.cBctNo == 'C2'){
					addHtml +=	"<button id='progress'>진행중</button>";
							} else if(c.cBctNo == 'C3'){
					addHtml +=	"<button id='finish'>완료</button>";			
							} else if(c.cBctNo == 'C4'){
					addHtml +=	"<button id='feedback'>피드백</button>";			
							} else if(c.cBctNo == 'C5'){
					addHtml +=	"<button id='postpone'>보류</button>";			
							}
					addHtml += "</div>";
					addHtml += "<div class='list-box-top-right'>";
					addHtml += "<div class='box-top-createDate'>" + c.bModifyDate + "</div>";
					addHtml += "<div class='box-top-writer'>" + c.bWriter + "</div>";
					addHtml += "</div>";
					addHtml += "</div>";
					
					addHtml += "<div class='collabo-list-box-content'>";
					addHtml += "<div class='list-content-title'>";
					addHtml += "<div class='list-title'>" + c.bTitle + "</div>";
					addHtml += "</div>"; 
							
					addHtml += "<div class='list-content-add'>";
					addHtml += "<label style='margin-right:10px;'>시작일자  :  " + c.cStartDate + "</label>";
					addHtml += "<label style='margin-right:50px;'>마감일자  :  " + c.cEndDate + "</label>";
					addHtml += "<label><i class='fas fa-user-check'></i><span class='list-people' >" + c.cPeople + "</span></label>";
					addHtml += "</div>";
					
					addHtml += "<div class='list-content'>";
					addHtml += c.bContent;
					addHtml += "</div>";
					addHtml += "</div>";
					
					addHtml += "<div class='collabo-list-box-bottom'>";
					addHtml += "<div class='list-box-bottom-margin'>";
					addHtml += "<div class='box-bottom-btn-status' >";
					addHtml += "<input type='hidden' id='whatcNo' value ='" + c.cNo + "'>";
					addHtml += "<input type='hidden' id='whatcBNo' value ='" + c.cBNo + "'>";
					addHtml += "<button class='b_call updateBtn' value='C1'>요청</button>";
					addHtml += "<button class='b_progress updateBtn' value='C2'>진행중</button>";
					addHtml += "<button class='b_finish updateBtn' value='C3'>완료</button>";
					addHtml += "<button class='b_feedback updateBtn' value='C4'>피드백</button>";
					addHtml += "<button class='b_postpone updateBtn' value='C5'>보류</button>";
					addHtml += "</div>";
					
					addHtml += "<div class='box-bottom-btn-ab'>";
					if(c.fbStatus == 'Y'){
						addHtml += "<div class='feedback-yn'>N</div>";
					}
					addHtml += "<button class='box-bottom-fdbk'>피드백</button>";
					if(c.bWriter == '${loginUser.mName}'){
						addHtml += "<button class='box-bottom-btn-up'>수정하기</button>";
						addHtml += "<button class='box-bottom-btn-de'>삭제하기</button>";
					}
					addHtml += "</div>";
					addHtml += "</div>";
					addHtml += "</div>";
					addHtml += "</div>";
					
					$('.dd').append(addHtml);
				}
			}
		
		});
	});
	
	$('.feedback-background').click(function() {
		$('.feedback-background').removeClass('active');
		$('.feedback-main').removeClass('active');
	});
	
	$(document).on('click', '.box-bottom-fdbk', function(){
		 $('.feedback-background').addClass('active');
         $('.feedback-main').addClass('active');
        	
         var fCNo = $(this).parent().parent().children().eq(0).children().eq(0).val();
         
		 console.log(fCNo);
		 
	     $.ajax({
	    	url:'selectFeedback.co',
	    	data:{fCNo:fCNo},
	    	success: function(data){
	    	
	    		$('.feedback-view').html('');
	    		$('.feedback-write').html('');
	    		
					for(var i=0; i<data.length; i++){
						var f = data[i];
						var addHtml = "";
					
						if(f.fWriter != '${loginUser.mName}'){
						addHtml += "<div class='your-feedback'>";
								addHtml += "<div class='feedback-profile'>";
								addHtml += "<img class='view-image' src='resources/mProfileFiles/"+f.mRenameProfile+"'>"; 
								addHtml += "</div>";
								addHtml += "<div class='your-feedback-message'>";
								addHtml += "<div class='message-who'>";
									addHtml += "<div class='view-dept'>"+ f.dName +"</div>";
									addHtml += "<div class='view-name'>"+ f.fWriter +"</div>";
									addHtml += "<div class='view-job'>"+ f.jName +"</div>";
								addHtml += "</div>";
								addHtml += "<span class='your-message-content'>";
									addHtml += "<span class='view-cotent'>"+ f.fContent +"</span>";
								addHtml += "</span>";
								addHtml += "<div class='message-date'>";
									addHtml += "<div class='view-date'>"+ f.fCreateDate +"</div>";
								addHtml += "</div>";
						addHtml += "</div>";
						} else {
							addHtml += "<div class='my-feedback'>";
								addHtml += "<div class='my-feedback-message'>";
									addHtml += "<span class='my-message-content'>";
										addHtml += "<span class='view-cotent'>"+ f.fContent +"</span>";
									addHtml += "</span>";
									addHtml += "<div class='message-date'>";
										addHtml += "<div class='view-date'>"+ f.fCreateDate +"</div>";
									addHtml += "</div>";
								addHtml += "</div>";
							addHtml += "</div>";
						}
						$('.feedback-view').append(addHtml);
					}
				
					var addHtml2 = "";
					
					addHtml2 += "<input type='hidden' value='"+fCNo+"'>";
					addHtml2 += "<input class='input-fContent' type='text' name='fContent'>";
					addHtml2 += "<button class='feedback-btn'>등록</button>";
					
					$('.feedback-write').append(addHtml2);
	    		}
	     });
	});
	
	$(document).on('click', '.feedback-btn', function(){
	
		var fCNo = $(this).parent().children().eq(0).val();
		var fContent = $(this).parent().children().eq(1).val();
		
		console.log(fCNo);
		console.log(fContent);
		
		$.ajax({
			url: 'insertFeedback.co',
			data: {fCNo : fCNo,
				   fContent : fContent},
			success : function(data){

				$('.feedback-view').html('');
	    		$('.feedback-write').html('');
	    		
					for(var i=0; i<data.length; i++){
						var f = data[i];
						var addHtml = "";
					
						if(f.fWriter != '${loginUser.mName}'){
						addHtml += "<div class='your-feedback'>";
								addHtml += "<div class='feedback-profile'>";
								addHtml += "<img class='view-image' src='resources/mProfileFiles/"+f.mRenameProfile+"'>"; 
								addHtml += "</div>";
								addHtml += "<div class='your-feedback-message'>";
								addHtml += "<div class='message-who'>";
									addHtml += "<div class='view-dept'>"+ f.dName +"</div>";
									addHtml += "<div class='view-name'>"+ f.fWriter +"</div>";
									addHtml += "<div class='view-job'>"+ f.jName +"</div>";
								addHtml += "</div>";
								addHtml += "<span class='your-message-content'>";
									addHtml += "<span class='view-cotent'>"+ f.fContent +"</span>";
								addHtml += "</span>";
								addHtml += "<div class='message-date'>";
									addHtml += "<div class='view-date'>"+ f.fCreateDate +"</div>";
								addHtml += "</div>";
						addHtml += "</div>";
						} else {
							addHtml += "<div class='my-feedback'>";
								addHtml += "<div class='my-feedback-message'>";
									addHtml += "<span class='my-message-content'>";
										addHtml += "<span class='view-cotent'>"+ f.fContent +"</span>";
									addHtml += "</span>";
									addHtml += "<div class='message-date'>";
										addHtml += "<div class='view-date'>"+ f.fCreateDate +"</div>";
									addHtml += "</div>";
								addHtml += "</div>";
							addHtml += "</div>";
						}
						$('.feedback-view').append(addHtml);
					}
				
					var addHtml2 = "";
					
					addHtml2 += "<input type='hidden' value='"+fCNo+"'>";
					addHtml2 += "<input class='input-fContent' type='text' name='fContent'>";
					addHtml2 += "<button class='feedback-btn'>등록</button>";
					
					$('.feedback-write').append(addHtml2);
	    		}
		});
	});
	
	$(document).on('keyup', '.new-people', function(){
		$('.selectMemberList').addClass('active');
		
		var inputString = $(this).val();
		
		$.ajax({
			url:'selcetMemberList.co',
			data:{inputString: inputString},
			success:function(data){
				
				$('.selectMemberList').html('');
				
				for(var i=0; i<data.length; i++){
					var m = data[i];
					addHtml = '';
					
					addHtml += "<div class='list-padding-box'>";
						addHtml += "<div class='selectMemberList-ajax'>";
							addHtml += "<div style='font-weight:bold;'>"+m.mName+"</div>";
							addHtml += "<div  style='margin:0px 3px;'>("+m.dName+")</div>";
							addHtml += "<input type='hidden' value='"+m.mNo+"'>";
							addHtml += "<div>/ "+m.jName+"</div>";
					addHtml += "</div></div>";
					
					$('.selectMemberList').append(addHtml);
					}
				
					
				}
		})
	});
	
	
	$(document).on('click', '.list-padding-box', function(){
		var mName = $(this).children().eq(0).children().eq(0).text();
		inputMember.push(mName + " ");
		
		var addHtml = "<div class='plus-people'>"+mName+", </div>"; 
		$('#plus-box').append(addHtml);
		$('.new-people').val('');
		$('.selectMemberList').removeClass('active');
		$('.new-people').focus();
	});
	
	$(document).on('keydown', '.new-people', function(e){
		if(e.keyCode == 8){
			$(this).prev().children().last().remove();
			inputMember.pop();
		};
		
		
	});
	
	
	$(document).on('click', '.box-bottom-btn-de', function(){
		var cBNo = $(this).parent().parent().children().eq(0).children().eq(1).val();
		console.log(cBNo);
		var bool = window.confirm("업무게시글을 삭제하시겠어요?");
		
		if(bool){
			$.ajax({
				url:'deleteCollabo.co',
				data:{cBNo:cBNo},
				success:function(data){
					if(data == 'success'){
						alert("삭제가 완료되었어요.");
						getCollaboList();		
					}	
				}
			});
		}
	});
	
</script>
</html>
