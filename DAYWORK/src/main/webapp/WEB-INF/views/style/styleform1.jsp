<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무기안서</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/index.css">
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
<!-- 						<p class="style-title">업무 기안서</p> -->
				<!-- 보낼내용들 -->
						<div class="style_form_table">
							<form class="form-magin">
								<table class="table-line">
						<!-- 기안자박스  -->
									<colgroup>
										<col width="310">
										<col width="490">
									</colgroup>
									<tbody>
										<tr>
											<td class="style-title" colspan="2">업무기안서</td>
										</tr>
										<tr>
											<td class="top-left">
											<table>
												<tbody>
											<tr>
												<td class="writer-box">기안자</td>
												<td class="writer-input"><input class="input-box" value="강건강" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">소속</td>
												<td class="writer-input"><input class="input-box" value="영업팀" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">기안일</td>
												<td class="writer-input"><input class="input-box" value="2021-08-10(화)" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">문서번호</td>
												<td class="writer-input"><input class="input-box" value="DW20210810001" readonly></td>
											</tr>
												</tbody>
											</table>
											</td>
						<!-- 결재란  -->		
											<td class="top-right">
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
																						<span class="sign-name">남나눔</span>
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
									</tbody>
								</table>
								
								<p>&nbsp;</p>	
							<!-- 결재란 박스 -->
<!-- 									<tbody class="tbody sign-body"> -->
<!-- 										<tr> -->
<!-- 											<td class="sign-box"> -->
<!-- 												<span class="sign-type1"> -->
<!-- 													<span class="sign-titl-wrap"> -->
<!-- 														<span class="sign-titl"> -->
<!-- 															<strong>신청자</strong> -->
<!-- 														</span> -->
<!-- 													</span> -->
													
													
<!-- 													<span class="sign-member-wrap"> -->
<!-- 														<span class="sign-member"> -->
<!-- 															<span class="sign-rank-wrap"> -->
<!-- 																<span class="sign-rank">부장</span> -->
<!-- 															</span> -->
<!-- 															<span class="sign-name-wrap"> -->
<!-- 																<span class="sign-name">강건강</span> -->
<!-- 															</span> -->
<!-- 															<span class=""> -->
<!-- 																<span class="sign-data">사인</span> -->
<!-- 															</span> -->
<!-- 														</span> -->
<!-- 													</span> -->
<!-- 												</span> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</tbody> -->
<!-- 								</table> -->
<!-- 								<br> -->
						<!-- 내용박스 -->
								<table class="content-table">
									<colgroup>
										<col width="120">
										<col width="230">
										<col width="120">
										<col width="330">
									</colgroup>
									<tbody>
										<tr>
											<td class="con-cate">시행일자</td>
											<td class="con-date"><input type="text" class="ipt-editor" value="2021-08-11" style="width: 150px;"></td>
											<td class="con-cate">협조부서</td>
											<td class="con-dep"><input type="text" class="ipt-editor" value="영업팀" style="width: 150px;"></td>
										</tr>		
										<tr>
											<td class="con-cate">합의</td>
											<td class="con-dep" colspan="3"><input type="text" class="ipt-editor" value="합의하시죠" ></td>
										</tr>		
										<tr>
											<td class="con-cate">제목</td>
											<td class="con-title" colspan="3"><input type="text" class="ipt-editor" value="필수값입니다"></td>
										</tr>		
										<tr>
											<td colspan="4" class="editor-text">
												<div id="editor"></div>
											</td>
										</tr>		
									</tbody>
								</table>
								
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<script>
const Editor = toastui.Editor;

const editor = new Editor({
	  el: document.querySelector('#editor'),
	  height: '600px',
	  initialEditType: 'wysiwyg',
	  previewStyle: 'vertical'
	});
</script>
</body>
</html>