<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member.css">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="joinM-king">
		<div class="joinM-logo">＊ 회사에 필요한 간단한 인적사항을 작성해주세요.</div>
		<div class='joinM-insert'>
			<form action="insert.me" method="post" id="joinForm">
				<table>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class='inputBorder' name="mPwd"></td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td><input type="password" class='inputBorder' name="mPwd2"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class='inputBorder' name="mName"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="mGender" value="M">남
							<input type="radio" name="mGender" value="F">여
						</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>
							<select name="year">
								<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
							<select name="month">
								<c:forEach begin="1" end="12" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
							<select name="date">
								<c:forEach begin="1" end="31" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" class='inputBorder' name="mPhone"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class='inputBorder' name="mEmail"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<input type="text"name="post" class="postcodify_postcode5" value="" size="6">
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
					</tr>
					<tr>
						<th>도로명 주소</th>
						<td><input type="text"  name="address1" class="postcodify_address" value=""></td>
					</tr>
					<tr>
						<th>상세 주소</th>
						<td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
					</tr>
					<!-- jQuery와 Postcodify를 로딩한다. -->
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
					</script>
					
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					
				</table>
				<button class='join-btn' onclick="validate();">가입하기</button>
			</form>
		</div>	
	</div>
</body>



</html>