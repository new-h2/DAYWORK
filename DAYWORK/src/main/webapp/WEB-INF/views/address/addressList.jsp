<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/address.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

	<div class="main-king">

		<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">

			<br>

			<form action="address.ad" id="addressForm">
			<!-- 위 검색창과 버튼들 -->
				<div id="top-menu">
					<div class="search">
						<input type="text" id="search-input" name="search" value="${ key }" placeholder="이름 검색">
						<button type="submit" class="button">검색</button>
					</div>
					
					<!-- 사내 주소록일 때 기능 버튼 -->
					<c:if test="${ code == 2 }">
						<div>
							<select id="dept" name="dept">
								<option value="zero">-부서-</option>
								<option value="D1">인사관리팀</option>
								<option value="D2">회계관리팀</option>
								<option value="D3">마케팅팀</option>
								<option value="D4">국내영업팀</option>
								<option value="D5">해외영업팀</option>
								<option value="D6">기술지원팀</option>
								<option value="D7">총무팀</option>
							</select>
						</div>

						<div>
							<select id="job" name="job">
								<option value="zero">-직급-</option>
								<option value="J5">부장</option>
								<option value="J4">차장</option>
								<option value="J3">과장</option>
								<option value="J2">대리</option>
								<option value="J1">팀원</option>
							</select>
						</div>
					</c:if>

					<div style="flex: 1"></div>

					<!-- 사외 주소록일 때 기능 버튼 -->
					<c:if test="${ code != 2}">
						<div>
							<button type="button" class="button" onclick="deleteAddress();">삭제하기</button>
						</div>
						<div>
							<button type="button" class="button button-margin" onclick="location.href='addressInsertForm.ad'">추가하기</button>
						</div>
						<button type="button" class="button point" onclick="location.href='address.ad?code=2&dept=zero&job=zero'">사내주소록</button>
					</c:if>

					<c:if test="${ code == 2 }">
						<div>
							<button type="button" class="button point" onclick="location.href='address.ad'">사외주소록</button>
						</div>
					</c:if>
				</div>

				<br> <br> <br>

				<table class="addressList">
				<!-- 사외 주소록 목록 -->
					<c:if test="${ code == null }">
						<tr>
							<th style="width: 50px;"><input type="checkbox" id="all"
								onclick="selectAll();" style="size: 20px;"></th>
							<th style="width: 150px;">이름</th>
							<th style="width: 150px;">직급</th>
							<th style="width: 250px;">이메일</th>
							<th style="width: 150px;">전화번호</th>
							<th style="width: 150px;">회사</th>
							<th style="width: 150px;">부서</th>
						</tr>
						<c:forEach items="${ list }" var="l" varStatus="vs">
							<tr class="list">
								<td><input type="checkbox" name="check" onclick="selectOne();"></td>
								<input type="hidden" value="${ l.aNo }">
								<td onclick="location.href='detailAddress.ad?aNo=${ l.aNo }'" style="cursor: pointer;" >${ l.name }</td>
								<td>${ l.job }</td>
								<td>${ l.email }</td>
								<td>${ l.phone }</td>
								<td>${ l.comName }</td>
								<td>${ l.dept }</td>
							</tr>
							<c:set var="listCount" value="${ vs.count }"></c:set>
						</c:forEach>
					</c:if>

					<!-- 사내 주소록 -->
					<c:if test="${ code == 2}">
						<tr>
							<th style="width: 70px;">사번</th>
							<th style="width: 150px;">이름</th>
							<th style="width: 150px;">직급</th>
							<th style="width: 250px;">이메일</th>
							<th style="width: 150px;">전화번호</th>
							<th style="width: 150px;">생일</th>
							<th style="width: 150px;">부서</th>
						</tr>
						<c:forEach items="${ list }" var="l" varStatus="vs">
							<tr class="list">
								<td>${ l.mNo }</td>
								<input type="hidden" value="${ l.mNo }">
								<td
									onclick="location.href='detailAddress.ad?mNo=${ l.mNo }&code=2'">${ l.mName }</td>
								<td>${ l.jCode }</td>
								<td>${ l.mEmail }</td>
								<td>${ l.mPhone }</td>
								<td>${ l.mBirthDay }</td>
								<td>${ l.dCode }</td>
							</tr>
							<c:set var="listCount" value="${ vs.count }"></c:set>
						</c:forEach>
					</c:if>

					<!-- 주소록 목록이 없을 때 -->
					<c:if test="${ empty list }">
						<tr>
							<td colspan="7">연락처가 없습니다.</td>
						</tr>
					</c:if>

				</table>
				
				<!-- 사외, 사내 구분 코드 -->
				<input type="hidden" name="code" value=${ code }>
				<!-- 삭제할 주소록 번호 저장 용도 -->
				<input	type="hidden" id="checkedList" name="checkedList" value="">

			</form>

			<!-- 테이블과 페이징 버튼 사이 공간  -->
			<div style="height: 50px">&nbsp;</div>

			<!-- 페이징 -->
			<div style="text-align: center;">
				<!-- 맨 앞 -->
				<c:if test="${ pi.currentPage <= 1 }">
					&lt;&lt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="start" value="address.ad">
						<c:param name="page" value="1" />
						<c:param name="search" value="${ key }" />
						<c:param name="code" value="${ code }" />
						<c:param name="dept" value="${ dept }" />
						<c:param name="job" value="${ job }" />
					</c:url>
					<a href="${ start }" style="color: black;">&lt;&lt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 이전 -->
				<c:if test="${ pi.currentPage <= 1 }">
					&lt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="address.ad">
						<c:param name="page" value="${ pi.startPage - pi.pageLimit }"></c:param>
						<c:param name="search" value="${ key }" />
						<c:param name="code" value="${ code }" />
						<c:param name="dept" value="${ dept }" />
						<c:param name="job" value="${ job }" />
					</c:url>
					<a href="${ before }" style="color: black;">&lt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ pi.currentPage != p }">
						<c:url var="address" value="address.ad">
							<c:param name="page" value="${ p }"></c:param>
							<c:param name="search" value="${ key }" />
							<c:param name="code" value="${ code }" />
							<c:param name="dept" value="${ dept }" />
							<c:param name="job" value="${ job }" />
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
					<c:url var="after" value="address.ad">
						<c:param name="page" value="${ pi.startPage + pi.pageLimit }"></c:param>
						<c:param name="search" value="${ key }" />
						<c:param name="code" value="${ code }" />
						<c:param name="dept" value="${ dept }" />
						<c:param name="job" value="${ job }" />
					</c:url>
					<a href="${ after }" style="color: black;">&gt;</a> &nbsp;&nbsp;
				</c:if>

				<!-- 맨 뒤 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					&gt;&gt; &nbsp;&nbsp;
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="end" value="address.ad">
						<c:param name="page" value="${ pi.maxPage }" />
						<c:param name="search" value="${ key }" />
						<c:param name="code" value="${ code }" />
						<c:param name="dept" value="${ dept }" />
						<c:param name="job" value="${ job }" />
					</c:url>
					<a href="${ end }" style="color: black;">&gt;&gt;</a> &nbsp;&nbsp;
				</c:if>
			</div>

		</div>
	</div>

	<script>
		/* 체크박스 전체 선택 */
		function selectAll() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");

			if (document.getElementById("all").checked) {
				for (var i = 0; i < check.length; i++) {
					check[i].checked = true;
				}
			} else {
				for (var i = 0; i < check.length; i++) {
					check[i].checked = false;
				}
			}
		}

		/* 체크박스 한개 선택 */
		function selectOne() {
			var check = document.getElementsByName("check");
			var all = document.getElementById("all");

			var count = 0;

			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					count++;
				}
			}

			if (count == 10) {
				all.checked = true;
			} else {
				all.checked = false;
			}
		}

		/* 삭제 버튼, 여러개의 연락처 삭제하기 */
		function deleteAddress() {
			
			var list = document.getElementsByName("check");
			var checkedList = '';
			
			for(var i = 0 ; i < ${ listCount } ; i++) {
				if(list[i].checked) {
					checkedList += list[i].parentNode.nextSibling.nextSibling.value +",";
				}
			}
			
			document.getElementById("checkedList").value = checkedList;

			if(document.getElementById("checkedList").value == '') {
				alert("연락처를 선택해주세요");
				return false;
			}
			
			var result = window.confirm("정말 삭제하시겠습니까?");

			if (result == false) {
				return false;
			} else {
				$('#addressForm').attr('action', 'deleteAddress.ad');
				$('#addressForm').submit();
			}
		}
		
		/* 검색조건 값을 유지하기 위해 만든 함수  */
		$(function() {
			var dept = document.getElementById("dept").children;
			var job = document.getElementById("job").children;
			var deptKey = "<c:out value='${dept}'/>";
			var jobKey = "<c:out value='${job}'/>";
			
			for(var i = 0 ; i < dept.length ; i++) {
				if(dept[i].value == deptKey){
					dept[i].setAttribute('selected', 'true');
				}  
			}
			
			for(var j = 0 ; j < job.length ; j++) {
				if(job[j].value == jobKey) {
					job[j].setAttribute('selected', 'true');
				} 
			}
		});
		
	</script>
</body>
</html>