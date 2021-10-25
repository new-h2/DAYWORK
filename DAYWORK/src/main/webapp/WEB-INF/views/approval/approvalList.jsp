<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% int count = 0; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재리스트</title>

<!-- <script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="resources/js/jstree.min.js"> -->
<!-- <link rel="stylesheet" href="resources/js/jstree.js"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" /> -->
<!-- <link rel="stylesheet" href="resources/css/approval.css"> -->
<!-- <link rel="stylesheet" href="resources/css/index.css"> -->
</head>
<body>

<div class="main-king">

<%@ include file="../common/mainLeft.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="resources/css/approval.css">
<link rel="stylesheet" href="resources/css/index.css">

<!-- 오른쪽 내용 박스 -->
		<div class="div-main-right">
			<div class="ap-main-title"></div>
			<button class= "writeBtn" id="writeBtn">결재</button>
			
				<hr style="margin-bottom:50px; border:1px color= silver;">
			<div class="board-header"> <!-- 제목 -->
				<div class="ap-box-line">
					<input type='hidden' name="mNo" value="${ loginUser.mNo }">
							<c:forEach var="ap" items="${list }">
<%-- 								<c:if test="${ap.apReceiver == loginUser.mNo  && ap.apStatus ne '0'}"> --%>
<!-- 									<div class="empty"> 결재할 문서가 없습니다.</div> -->
<%-- 								</c:if> --%>
									<c:url var="apDetail" value="apDetail.ap">
										<c:param name="apNo" value="${ap.apNo}"></c:param>
									</c:url>	
								<c:if test="${ap.apReceiver == loginUser.mNo && ap.apStatus eq '0' }">
									<div class="ap-box" id="ap-box" onclick="location.href='${apDetail}'">
										<div class="af-title">제목 : <c:out value="${ap.apTitle }"></c:out> </div>
										<div class="ap-date">기안일:<c:out value="${ap.apDate }"></c:out></div>
										<div class="ap-sender">기안자:<c:out  value="${ sender.mName}"></c:out></div>
									</div>
									<% count++; %>
								</c:if>
							</c:forEach>
							<% if(count == 0) { %>
								<div class="empty"> 결재할 문서가 없습니다.</div>
							<% } %>
						
				</div>
					<div class="board-title-wrap">
					</div>
			</div>
				<div class="board-content">
			<div class="ap-main-title">진행결재리스트</div>
			<hr style="margin-bottom:20px; border:1px color= silver;">
			<div class="board-body">
			<!-- 결재진행문서 테이블-->
				<table class="ap-table type_nomal">
					<thead>
						 <tr class="title_sort">
							<td class="th2">
								<span>기안일</span>
							</td>
							<td class="th2">
								<span>제목</span>
							</td>
							<td class="th2">
								<span>기안자</span>
							</td>
							<td class="th2">
								<span>문서번호</span>
							</td>
							<td class="th2">
								<span>결재상태</span>
							</td>
						</tr>
					</thead>
					<!-- 결재진행문서 내용 -->
					<tbody>
						<c:forEach var="ap" items="${list}">
							<c:if test="${ap.apStatus == '0' }">
							<c:url var="apDetail" value="apDetail.ap">
								<c:param name="apNo" value="${ap.apNo}"/>
							</c:url>
						<tr id="gogo" onclick="location.href='${apDetail}'">
							<td class="th2">
								<span><c:out value="${ ap.apDate }"></c:out></span>
							</td>
							<td class="th2">
								<span><c:out value="${ap.apCtitle}"></c:out></span>
							</td>
							<td class="th2">
							<span><c:out  value="${ sender.mName}"></c:out></span>
							</td>
							<td class="th2">
								<span><c:out value="${ap.apNo}"></c:out></span>
								<input type='hidden' name="apNo" value="${ap.apNo }">
							</td>
							<td class="th2">
								<span><button type="submit" class="ap-not-btn" readonly>진행</button></span>
							</td>
						</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
			<div class="ap-footer">
				<div class="ap-main-title">완료결재리스트</div>
				<hr style="margin-bottom:20px; border:1px color= silver;">
				<div class="board-body">
				<table class="ap-table type_nomal">
					<thead>
						 <tr class="title_sort">
							<td class="th2">
								<span>기안일</span>
							</td>
							<td class="th2">
								<span>제목</span>
							</td>
							<td class="th2">
								<span>기안자</span>
							</td>
							<td class="th2">
								<span>문서번호</span>
							</td>
							<td class="th2">
								<span>결재상태</span>
							</td>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="ap" items="${list}" >
					<div onclick="location.href='${apDetail}'">
						<c:if test="${ap.apStatus == '1'}">
							<c:url var="apDetail" value="apDetail.ap">
								<c:param name="apNo" value="${ap.apNo}"/>
							</c:url>
								<tr onclick="location.href='${apDetail}'">
									<td class="th2">
										<span><c:out value="${ap.apDate}"></c:out></span>
									</td>
									<td class="th2">
										<span><c:out value="${ap.apCtitle}"></c:out></span>
									</td>
									<td class="th2">
										<span><c:out  value="${ sender.mName}"></c:out>
										</span>
									</td>
									<td class="apNo">
										<span><c:out value="${ap.apNo}"></c:out></span>
									</td>
									<td class="th2">
										<span><button class="fin-btn" readonly>완료</button></span>
									</td>
								</tr>
						</c:if>
						</div>
					</c:forEach>
					</tbody>
				</table> 
				</div>
		</div>
	</div>
	<!-- 모달 -->
	
		<div class="ap-king">
		<div class="overlay">
		<div class="go_popup layer_normal" id="popup" style="width: 700px; height: 370px; top: 190px; position: fixed; left: 600px; z-index: 99;">
			<header>
				<h1>결재양식 선택</h1>
			</header>
			<div class="ap_pop_content">
				<!-- 결재 양식 선택 -->
				<div class="ap-search-wrap">
						<input type="text" class="ap-search" placeholder="양식제목">
						<button type="submit" class="ap-btn">검색</button>
						<span class="tit_type" >상세정보</span>
				</div>
				<!-- 문서양식 -->
				<div class="set_wrap">
					<div class="set_nav" id="appr_form_searchTree">
						<div class="content_tab_wrap">
							<div id="formTree" class="jstree">
								<ul>
									<li title="일반" class="jstree-open" id="general">일반
										 <ul>
											<li title="업무협조" class="jstree-leaf" id="g1">
												업무협조 
											</li>
											<li title="기안서" class="jstree-leaf" id="g2">
												기안서
											</li>
											<li title="기안서" class="jstree-leaf" id="g3">
												품의서
											</li>
										</ul>
									</li>
									
									<li title="총무" class="jstree-open" id="paid">총무
										<ul>
											<li title="지출결의서" class="jstree-leaf" id="p1">
												지출결의서
											</li>
											<li title="품의서" class="jstree-leaf" id="p2">
												지출품의서
											</li>
										</ul>
									</li>
									
									<li title="지원" class="jstree-open" id="apply">지원
										<ul>
											<li title="증명서신청" class="jstree-leaf" id="a1">
												증명서신청
											</li>
										</ul>
									</li>
									
									<li title="인사" class="jstree-open" id="hr">인사
										<ul>
											<li title="사유서" class="jstree-leaf" id="h1">
												지각사유서
											</li>
<!-- 											<li title="경위서" class="jstree-leaf" id="h2"> -->
<!-- 												경위서 -->
<!-- 											</li> -->
										</ul>
									</li>	
								</ul>
							</div>
						</div>
					</div>
					
					<!-- 문서정보 form_detail -->
				<div class="doc_info">
						<form>
							<div class="doc-detail">
							<fieldset>
								<table class="form_detail" class="form_type tb_doc_info">
									<tbody id="form_detail_tbody">
										<tr>
											<th><span class="title">제목</span></th>
											<td class="select-title"></td>
										</tr>
										<tr>
											<th><span class="title">보존연한</span></th>
											<td>5년</td>
										</tr>
										<tr>
											<th><span class="title">기안부서</span></th>
											<td> 
											<select class="select-team">
											<option>경영지원팀</option>
											<option>연구개발팀</option>
											<option>개발1팀</option>
											<option>개발2팀</option>
											<option>영업팀</option>
											<option>마케팅팀</option>
											<option>인사팀</option>
											</select>
											</td>
										</tr>
									</tbody>
								</table>
								</fieldset>
								</div>
							</form>
						</div>
					</div>
				</div>
			
			<footer class="btn_layer_wrap">
				<div class="go-ap-btn">
					<span><button class="ap-btn" id="apSubmit">다음</button></span>
					<span><button class="cancel-btn">취소</button></span>
				</div>				
			</footer>
		</div>
	</div>
</div>	
	
	
	
<script type="text/javascript">
	$(document).on('click','#apSubmit', function(){
		var title = $('.select-title').text();
		location.href="goInsert.ap?title="+ title;	
	});

	$(document).ready(function(){
		$('.ap-king').hide();
		$modal = $('.ap-king');
			
			$('.writeBtn').on('click', function(){
				$('.ap-king').addClass('active');
				$('.go_popup').addClass('active');
				$('.ap_pop_content').addClass('stop-scroll');
				$modal.show();
			});
			
			$('.cancel-btn').on('click', function(){
				$('.ap-king').removeClass('active');
				$('#popup').removeClass('active');
				$('.ap_pop_content').addClass('stop-scroll');
				$modal.hide();
			});
			
		});
		
	$(document).ready(function(){
		$('#formTree').jstree({
 			"plugins" : ["dnd"],
		'core' : { 
			"check_callback" :true ,
			'data' : [ 
				{ "id" : "general", "parent" : "#", "text" : "일반" },
				{ "id" : "paid", "parent" : "#", "text" : "총무" },
				{ "id" : "apply", "parent" : "#", "text" : "지원" },
				{ "id" : "hr", "parent" : "#", "text" : "인사" },
				
				{ "id" : "g1", "parent" : "general", "text" : "업무협조" },
				{ "id" : "g2", "parent" : "general", "text" : "기안서" },
				{ "id" : "g3", "parent" : "general", "text" : "품의서" },
				{ "id" : "p1", "parent" : "paid", "text" : "지출결의서" },
				{ "id" : "p2", "parent" : "paid", "text" : "지출품의서" },
				{ "id" : "a1", "parent" : "apply", "text" : "증명서신청" },
				{ "id" : "h1", "parent" : "hr", "text" : "지각사유서" }

				] 
			}
		
		});
		
		
		
	});
	
	$(document).on('click','.jstree-leaf', function(){
		var get= $(this).text();
// 		var cate= $(this).attr('id');
		console.log(get);
		$('.select-title').text(get);
		
		
	});
</script>
<script>
$(document).ready(function(){
	
	$('.ap-box').hover(function(){
			$(this).css("background-color","#6495ed5e");
		
		},function(){
			$(this).css("background-color","#eeeeee");
		});
	
		
	});
</script>
		
</body>
</html>