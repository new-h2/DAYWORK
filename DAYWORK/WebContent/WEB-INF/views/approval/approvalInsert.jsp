<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무기안서</title>


</head>
<body>
	<div class="main-king">
<%@ include file="../common/mainLeft.jsp"%>

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/approval.css">
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>

<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>



<!-- 오른쪽 내용 박스 -->
	<div class="div-main-right">
		<form class="form-magin" action="goInsert2.ap" method="post">
			
		<div class="toolbar">
			<button class="goInsert" >결재요청</button>
<!-- 			<button onclick="goBack(); return false;">취소</button> -->
			<button type="button" class="select-ap">결재자선택</button>
		</div>
			<section class="content_wrap">
				<div class="report_type">
					<div class="form_content">
						<div class="style_form_table">
<!-- 							<form class="form-magin" action="goInsert2.ap" method="post"> -->
								<table class="table-line">
<!-- 								<input type="submit" id="goInsert" value="결재"> -->
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
											<input type="hidden" value="${approvalForm.afCate}" id="cate" name="apCate">
											<td class="style-pay-title" colspan="2">${ approvalForm.afTitle }</td>
											<input type="hidden" name="apTitle" value="${ approvalForm.afTitle }">
											<td class="top-right-pay" colspan="4">
												<br>
												
													<span class="sign-wrap new-sign">
														<table class="tb-sgin" >
															<tbody>
																<tr>
																	<th class="sign-t">결재</th>
																	<td class="sign-td">
																		<table class="sign-type1">
																			<tbody>
																				<tr>
																					<td class="sign-name-wrap">
																						<span class="sign-name"></span>
																						<input type="hidden" class="sign-mNo" name="apReceiver">
																						<input type="hidden" name="apLine" value="11">
																					</td>
																				</tr>
																				<tr>
																					<td>
																						<span class="sign-rank"></span>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																
															</tbody>
														</table>
													</span>
												<br>
											</td>
										</tr>
										<tr>
											<td class="writer-box">기안소속</td>
											<td class="writer-input"><input class="input-box" value="${ loginUser.dName} " readonly></td>
											
											<td class="writer-box">기안일</td>
											<td class="writer-input"><input class="input-box" readonly></td>
											
											<td class="writer-box">문서번호</td>
											<td class="writer-input"><input class="input-box" readonly></td>
											
											</tr>
											<tr>
												<td class="writer-box">기안자</td>
												<td class="writer-input "><input class="input-box sender" value= "${ loginUser.mName }" readonly></td>
												<input type="hidden" name ="apSender" value= "${ loginUser.mNo }" readonly>
												
												<td class="writer-box">보존연한</td>
												<td class="writer-input"><input class="input-box"  name="apKeep" value="5년" readonly></td>
											
												<td class="writer-box">비밀등급</td>
												<td class="writer-input"><input class="input-box" value="1등급" readonly></td>
											</tr>
											<tr>
												<td class="con-cate" style="width:120px" colspan="2" >제 목 </td>
												<td class="con-title" style="width:230" colspan="4" ><input type="text"  name ="apCtitle" class="input-box" value="제목을 입력해주세요"> </td>
												<input type="hidden" name ="apCtitle" value= "${ ap.apCtitle }" readonly>
											</tr>
									</tbody>
								</table>
								<p>&nbsp;</p>
			<!-- 내용박스 -->
								<div id="ap-contents">
									<textarea id="summernote" name="apContent">${ approvalForm.afContent }</textarea>
								</div>
						</div>
					</div>
			</section>
		</form>
	</div>

<!-- 모달 -->
				<div class="ap-king">
					<div class="overlay">
						<div class="go_popup layer_normal" id="popup" style="width: 700px; height: 370px; top: 210px; position: fixed; left: 400px; z-index: 99;">				
						<header>	
								<h1>결재자 선택</h1>
						</header>
							<div class="ap_pop_content">
						<!-- 결재자 선택 -->
						<hr style="border:1px color= silver;">
						<div class="ap-search-wrap">
								<input onkeyup="filter()" type="text" class="ap-search" id="ap-search" placeholder="이름을 입력하세요">
								<button type="submit" class="sap-btn">검색</button>
								<span class="tit_type">결재자선택</span>
						</div>
						<!-- 조직도트리 -->
						<div class="set_wrap">
							<div class="set_nav" id="appr_form_searchTree">
								<div class="content_tab_wrap">
									<div id="apTree" class="jstree">
										<ul>
											<li title="인사관리팀" class="jstree-open hr" id="d1">
												인사관리팀
												<ul class="jstree-test">
													<li class="jstree-leaf" id="hr-team1">
														문미미 부장
													</li>
													<li class="jstree-leaf" id="hr-team2">
														류라라 차장
													</li>
													<li class="jstree-leaf" id="hr-team3">
														도대담 과장
													</li>
													<li class="jstree-leaf" id="hr-team4">
														남나눔 대리
													</li>
													<li class="jstree-leaf" id="hr-team5">
														강건강 팀원
													</li>
												</ul>
											</li>
											<li title="회계관리팀" class="jstree-open " id="d2">
												회계관리팀
												<ul>
													<li class="jstree-leaf" id="ac-team1">
														박하선 부장
													</li>
													<li class="jstree-leaf" id="ac-team2">
														김대호 차장
													</li>
													<li class="jstree-leaf" id="ac-team3">
														최관우 과장
													</li>
													<li class="jstree-leaf" id="ac-team4">
														이다름 대리
													</li>
													<li class="jstree-leaf" id="ac-team5">
														박가람 팀원
													</li>
												</ul>
											</li>
											<li title="마케팅팀" class="jstree-open" id="d3">
												마케팅팀
												<ul>
													<li class="jstree-leaf" id="mk-team1">
														박겨울 부장
													</li>
													<li class="jstree-leaf" id="mk-team2">
														최여름 차장
													</li>
													<li class="jstree-leaf" id="mk-team3">
														장가을 과장
													</li>
													<li class="jstree-leaf" id="mk-team4">
														김봄 대리
													</li>
													<li class="jstree-leaf" id="mk-team5">
														이바다 팀원
													</li>
												</ul>
											</li>
											<li title="국내영업팀" class="jstree-open ds" id="d4">
												국내영업팀
												<ul>
													<li class="jstree-leaf" id="ds-team1">
														남산 부장
													</li>
													<li class="jstree-leaf" id="ds-team2">
														한강 차장
													</li>
													<li class="jstree-leaf" id="ds-team3">
														박마루 과장
													</li>
													<li class="jstree-leaf" id="ds-team4">
														김우빈 대리
													</li>
													<li class="jstree-leaf" id="ds-team5">
														윤건 팀원
													</li>
												</ul>
											</li>
											<li title="해외영업팀" class="jstree-open os" id="d5">
												해외영업팀
												<ul>
													<li class="jstree-leaf" id="os-team1">
														박초록 부장
													</li>
													<li class="jstree-leaf" id="os-team2">
														이하얀 차장
													</li>
													<li class="jstree-leaf" id="os-team3">
														오파랑 과장
													</li>
													<li class="jstree-leaf" id="os-team4">
														박보라 대리
													</li>
													<li class="jstree-leaf" id="os-team5">
														강노랑 팀원
													</li>
												</ul>
											</li>
											<li title="기술지원팀" class="jstree-open tc" id="d6">
												기술지원팀
												<ul>
													<li class="jstree-leaf" id="tc-team1">
														윤가람 부장
													</li>
													<li class="jstree-leaf" id="tc-team2">
														유하나 차장
													</li>
													<li class="jstree-leaf" id="tc-team3">
														이샛별 과장
													</li>
													<li class="jstree-leaf" id="tc-team4">
														김소리 대리
													</li>
													<li class="jstree-leaf" id="tc-team5">
														표우빈 팀원
												</ul>
											</li>
											<li title="총무팀" class="jstree-open ad" id="d7">
												총무팀
												<ul>
													<li class="jstree-leaf" id="ad-team1">
														이건희 부장
													</li>
													<li class="jstree-leaf" id="ad-team2">
														유제니 차장
													</li>
													<li class="jstree-leaf" id="ad-team3">
														이시영 과장
													</li>
													<li class="jstree-leaf" id="ad-team4">
														서현진 대리
													</li>
													<li class="jstree-leaf" id="ad-team5">
														이지은 팀원
													</li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
								
								<!-- 결재자선택칸 -->
							<div class="doc_info">
									<form>
										<div class="doc-detail">
											<div class="ap-person-table">
											<table class="dnd-table" id="dnd-table">
												<tr class="ap-select-bar">
													<th class="th1">번호</th>
													<th class="th1">분류</th>
													<th class="th1">이름</th>
													<th class="th1">부서</th>
												</tr>
												<tr>
												<th colspan="4" class="th1">승인</th>
												</tr>
												<tr class="ap-select1" id="1">
													<th class="th1">1</th>
													<th class="th1">기안</th>
													<th class="th1">${ loginUser.mName}</th>
													<th class="th1">영업팀</th>
												</tr>
												<tr>
													<th colspan="4" class="th1" >결재</th>
												</tr>
												</table>
											</div>
										</div>
									</form>
							</div>
						</div>
					</div>
						
						<footer class="btn_layer_wrap">
							<div class="go-ap-btn">
								<span><button class="ap-btn">확인</button></span>
								<span><button class="cancel-btn">취소</button></span>
							</div>				
						</footer>
					</div>
				</div>
			</div>
		</div>

<script>

		
		
</script>
<script>
	$(document).ready(function(){

		var mList=[ ];
		
		function mInfo() {
	         this.id = '';
	         this.parent = "#";
	         this.text = '';
	      }
		
		$.ajax({
			url:"selectMemebers.ap",
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			error:function(data){
			},
			success: function(data){
                var mList = [];
                
          if(data != null){
//            alert("성공");
          }
          
             for (var i in data){

                var member = new mInfo();
                member.id = data[i].mNo;
                member.text = data[i].mName;
                mList.push(member);

                }
             test(mList);
      		 }
	});

		
		
		
		function test(mList) {
		      $('#apTree').jstree({
		          "plugins" : ["wholerow","checkbox" ,"dnd", "search"],
				"checkbox": {
                    "keep_selected_style": false,
                },
		      'core' : { 
		         "check_callback" :true ,
		         
		         'data' : mList
		            
		      },
		      "search": {
		         "show_only_matches": true,
		         "show_only_matches_children" : true,
		      }
		   
		      
		   })
		   };
	});
		

	
 	
		   $("#apTree").on("changed.jstree", function(e,data){
			if(data.selected.length){
				var i = data.selected.length;
				//console.log(i);
				
				var $tr = $('<tr class="ap-select2 draggable" id="2">');
				var $th1 = $('<th>').addClass('th1').text(data.selected.length);
				var $th2 = $('<th>').addClass('th1').text('결재');
				var $th3 = $('<th>').addClass('th1 select1');
				var $th4 = $('<th>').addClass('th1 select11');
				
				
				$(data.selected).each(function(idx){
					 var node= data.instance.get_node(data.selected[idx]);						
					//console.log('the selected node is:' + node.text);
					
					$th3.text(node.text);
					$th4.text(node.id);
					
				});
				
				$tr.append($th1);
				$tr.append($th2);
				$tr.append($th3);
				$tr.append($th4);
				$('.dnd-table').append($tr);
 					
			};	
		
		});	
	
		   $('.ap-btn').on('click',function addPerson(event){
				
				var select = $('.select1');
				var select2 = $('.select11');
				
				var co = $('.new-sign').clone();
				
				if(select.length != 0){
					$('.new-sign').remove();

					for(var i = 0; i < select.length; i++){
						$('.top-right-pay').append(co.clone());
						$('.sign-name')[i].innerText = select[i].innerText;
						$('.sign-mNo')[i].innerText = select2[i].innerText;
					
 						var he = select2[i].innerText;
 						//console.log(he);
						//$('input[name= apReceiver]').attr("value", he);
						var she =$('input[name= apReceiver]').val(he);
 						console.log(she);
 						$('.ap-king').hide();
					}
					
				}
				
			});	
		   
	</script>	
	<script>
	$(document).ready(function(){
	$('#summernote').summernote({
		height: 500,
		lang:"ko-KR"
		});
	});
	
	function goBack(){
		if(confirm("작성을 취소하시겠습니까?") == true){
			window.history.back();
		}
	}
	
	
	</script>
	<script>
	$(document).ready(function(){
		$('.ap-king').hide();
		$modal = $('.ap-king');
			
			$('.select-ap').on('click', function(){
				$('.ap-king').addClass('active');
				$('.go_popup').addClass('active');
				$('.ap_pop_content').addClass('stop-scroll');
				$modal.show();
			});
			
			$('.cancel-btn').on('click', function(){
				$('.ap-king').removeClass('active');
				$('.go_popup').removeClass('active');
				$('.ap_pop_content').addClass('stop-scroll');
				$('.ap-select2').empty();
			
				$('.new-sign').remove();
				$modal.hide();
			});
			
		});
	
	</script>

	
	


</body>
</html>