<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/member.css">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="main-king">
	<%@ include file="../common/mainLeft.jsp"%>

	<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<div class="mypage-logo">마이페이지</div>
			<div class='mypage-update'>
				<form action="update.me" method="post" id="joinForm" enctype="Multipart/form-data">
						<div class="myProfileImage">
							<c:if test="${m.mRenameProfile == null}">
								<img class="myProfileImage-size" src="resources/image/기본이미지.png">
							</c:if>
							<c:if test="${m.mRenameProfile != null}">
							<img class="myProfileImage-size" src="resources/mProfileFiles/${ m.mRenameProfile }">
							</c:if>
							<div class="myProfileImage-text1">이미지를 누르면 첨부파일로 수정이 가능합니다.</div>
							<div class="myProfileImage-text2">이미지 변경 후 아래 수정하기 버튼으로 수정 가능합니다!</div>
						</div>
						<div class="profiles">
							<input type="file" class="profileImg" name="uploadFile" value="${m.mOriginProfile }" onchange="LoadImg(this)">
						</div>
					<table>
						<tr>
							<th>사번</th>
							<td><input class='readmNo' name="mNo" value="${m.mNo }" readonly></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" class='readmNo' readonly name="mName" value="${m.mName }"></td>
						</tr>
						<tr>
							<th>팀</th>
							<td><input type="text" class='readmNo' readonly name="dName" value="${m.dName }"></td>
						</tr>
						<tr>
							<th>직급</th>
							<td><input type="text" class='readmNo' readonly name="jName" value="${m.jName }"></td>
						</tr>
						<tr>
							<th>생일</th>
							<td><input type="text" class='readmNo' readonly name="mBirthDay" value="${m.mBirthDay }"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" class='inputBorder' name="mPhone" value="${m.mPhone }"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" class='inputBorder' name="mEmail" value="${m.mEmail}"></td>
						</tr>
						
						<c:forTokens var="addr" items="${ m.mAddress }" delims="/" varStatus="status">
							<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
								<c:set var="post" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
								<c:set var="address1" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 1 }">
								<c:set var="address1" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 2 }">
								<c:set var="address2" value="${ addr }"/>
							</c:if>
					</c:forTokens>
				
						<tr>
							<th>우편번호</th>
							<td>
								<input type="text" class='inputBorder' name="post" class="postcodify_postcode5" value="${post }" size="6">
								<button type="button" id="postcodify_search_button">검색</button>
							</td>
						</tr>
						<tr>
							<th>도로명 주소</th>
							<td><input type="text" class='inputBorder' name="address1" class="postcodify_address" value="${address1 }"></td>
						</tr>
						<tr>
							<th>상세 주소</th>
							<td><input type="text" class='inputBorder' name="address2" class="postcodify_extra_info" value="${address2 }"></td>
						</tr>
						
						<!-- jQuery와 Postcodify를 로딩한다. -->
						<script type="text/javascript" src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
						</script>
						
						<script type="text/javascript">
							// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
							$(function(){
								$("#postcodify_search_button").postcodifyPopUp();
							});
						</script>
					</table>
					<button class='update-btn' onclick="validate();">수정하기</button>
				</form>
			</div>	
		</div>
	</div>
	
	<script>
		function validate(){
			alert("내 정보 수정이 완료되었습니다.");
		}
		
		$(function() {
        	$('.profiles').hide();
        	
        	$('.myProfileImage').click(function(){
        		$('.profileImg').click();
        		$('.myProfileImage-text1').addClass('active');
        		$('.myProfileImage-text2').addClass('active');
        	});
		});
		
		 function LoadImg(value) {
        	if(value.files && value.files[0]) {
        		var reader = new FileReader();
        		
        		reader.onload = function(e) {
        			$('.myProfileImage-size').attr('src', e.target.result);
               	}
        	}
	        	reader.readAsDataURL(value.files[0]);
		 }
		
		
	</script>
</body>
</html>