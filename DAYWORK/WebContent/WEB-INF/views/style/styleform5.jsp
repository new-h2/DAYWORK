<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출결의서</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/approval.css">
<link rel="stylesheet" href="resources/css/index.css">
<!-- <script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script> -->
<link rel ="stylesheet" href ="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
</head>
<body>
	<div class="main-king">
<%@ include file="../common/mainLeft.jsp"%>
<!-- 오른쪽 내용 박스 -->
	<div class="main-right">
			
		<div class="toolbar">
			<button>결재요청</button>
			<button>취소</button>
			<button>미리보기</button>
			<button>결재자선택</button>
		</div>
	<!-- 콘텐츠  큰 네모 -->
			<section class="content_wrap">
				<!-- 마진 -->
				<div class="report_type">
				<!-- 기안내용 -->
				
				<!-- 제목 -->
					<div class="form_content">
				<!-- 보낼내용들 -->
						<div class="style_form_table">
							<form class="form-magin">
								<table class="table-line-pay">
						<!-- 기안자박스  -->
									<colgroup>
										<col style="width:90px">
										<col style="width:180px">
										<col style="width:90px">
										<col style="width:120px">
										<col style="width:90px">
									</colgroup>
									<tbody>
										<tr>
											<td class="style-pay-title" colspan="2">지출결의서<br>(통신비지원)</td>
											<td class="top-right-pay" colspan="4">
												<br>
													<div class="sign-wrap">
														<table class="tb-sgin" >
															<tbody>
																<tr>
																	<th class="sign-t">신청</th>
																	<td class="sign-td">
																		<table class="sign-type1">
																			<tbody>
																				<tr class="sign-member">
																					<td class="sign-rank-wrap">
																						<span class="sign-rank">부장</span>
																					</td>
																				</tr>
																				<tr>
																					<td class="sign-name-wrap">
																						<span class="sign-name">도대담</span>
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<span class="sign-data"></span>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																
															</tbody>
														</table>
													</div>
												<br>
											</td>
										</tr>
										<tr>
												<td class="writer-box">기안소속</td>
												<td class="writer-input"><input class="input-box" value="영업1팀" readonly></td>
											
												<td class="writer-box">기안일</td>
												<td class="writer-input"><input class="input-box" value="2021-08-13(금)" readonly></td>
											
												<td class="writer-box">문서번호</td>
												<td class="writer-input"><input class="input-box" value="DW20210817003" readonly></td>
											
											</tr>
											<tr>
												<td class="writer-box">기안자</td>
												<td class="writer-input"><input class="input-box" value="강건강" readonly></td>
											
												<td class="writer-box">보존연한</td>
												<td class="writer-input"><input class="input-box" value="5년" readonly></td>
											
												<td class="writer-box">비밀등급</td>
												<td class="writer-input"><input class="input-box" value="1등급" readonly></td>
											</tr>
									</tbody>
								</table>
								
								<p>&nbsp;</p>	
						<!-- 내용박스 -->
								<table class="content-table">
									<colgroup>
										<col style="width:120">
										<col style="width:230">
										<col style="width:120">
										<col style="width:330">
									</colgroup>
									<tbody>
										<tr>
											<td class="con-cate">해당일</td>
											<td class="con-date"><input type="text" class="ipt-editor" value="2021-08-15"></td>
											<td class="con-cate">분류</td>
											<td class="con-dep"><input type="text" class="ipt-editor" value="통신비지원"></td>
										</tr>		
										<tr>
											<td class="con-cate">지출 총 금액</td>
											<td class="con-dep" colspan="3"><input type="text" class="ipt-editor" value="3.456.000원" readonly></td>
										</tr>		
										<tr>
											<td class="con-cate">제목</td>
											<td class="con-title" colspan="3"><input type="text" class="ipt-editor" value="영업1팀 8월 통신비 "></td>
										</tr>
											
									</tbody>
								</table>
									<br>
								<div>
								<table class="content-table content-input">
									<colgroup>
										<col style="width:120">
										<col style="width:120">
										<col style="width:100">
										<col style="width:100">
										<col style="width:100">
										<col style="width:330">
									</colgroup>
									<tbody>
										<tr>
											<td class="con-cate">번호</td>
											<td class="con-cate">소속</td>
											<td class="con-cate">사원번호</td>
											<td class="con-cate">직급/이름</td>
											<td class="con-cate">휴대폰번호</td>
											<td class="con-cate">금액</td>
											<td class="con-cate">비고</td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1001"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="강건강 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="2"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1002"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="도대담 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="3"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1003"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="남나눔 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="4"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1004"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="류라라 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="5"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1005"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="살려줘 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="6"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1006"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="또안돼 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="7"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1007"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="지친다 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="8"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="영업1팀"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="1008"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="힘들다 사원"></td>
											<td class="con-date"><input type="text" class="pay-table-td-insert" value="010-1234-5678"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="10.000원"></td>
											<td class="con-dep"><input type="text" class="pay-table-td-insert" value="-"></td>
										</tr>
										<tr>
											<td class="con-cate" colspan="5">합계</td>
											<td class="con-title"colspan="2"><input type="text" class="ipt-editor" value="3,456,000원"></td>
										</tr>
									</tbody>
								</table>
											<p>&nbsp;</p>	
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

</body>
</html>