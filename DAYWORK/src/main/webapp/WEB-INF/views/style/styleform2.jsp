<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>증명서신청폼</title>
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
											<td class="style-title" colspan="2">증명서신청</td>
										</tr>
										<tr>
											<td class="top-left">
											<table>
												<tbody>
											<tr>
												<td class="writer-box">기안자</td>
												<td class="writer-input"><input class="input-box" value="남나눔" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">소속</td>
												<td class="writer-input"><input class="input-box" value="영업팀" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">기안일</td>
												<td class="writer-input"><input class="input-box" value="2021-08-13(금)" readonly></td>
											</tr>
											<tr>
												<td class="writer-box">문서번호</td>
												<td class="writer-input"><input class="input-box" value="DW20210813001" readonly></td>
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
									</tbody>
								</table>
								
								<p>&nbsp;</p>	
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
											<td class="con-cate">발행일자</td>
											<td class="con-date"><input type="text" class="ipt-editor" value="2021-08-13"></td>
											<td class="con-cate">용도</td>
											<td class="con-dep"><input type="text" class="ipt-editor" value="은행체출용"></td>
										</tr>		
										<tr>
											<td class="con-cate">제출처</td>
											<td class="con-dep" colspan="3"><input type="text" class="ipt-editor" value="하나은행" ></td>
										</tr>		
										<tr>
											<td class="con-cate">제목</td>
											<td class="con-title" colspan="3"><input type="text" class="ipt-editor" value="재직/경력증명서신청합니다"></td>
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