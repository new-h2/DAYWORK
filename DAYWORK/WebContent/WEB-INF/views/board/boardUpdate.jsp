<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

	<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
<!-- 			<form action="binsert.bo" method="post" id="board-form" enctype="Multipart/form-data"> -->
				<div class="board-write-title-font">글수정</div>
				<input type="text" class="board-write-title" name="bTitle" id="bTitle" value="${ b.bTitle }">
				<div class="board-write-middle">
					<span class="board-write-file-btn" id="selectFile">파일추가</span>
	<!-- 				<input type="file" class="board-write-file"> -->
					<select class="board-type-select" name="bType" id="bType">
						<option>전체공지</option>
						<option>일반공지</option>
						<option>이벤트공지</option>
					</select>
					<select class="board-type-select" name="bDept" id="bDept">
						<option>개발1팀</option>
						<option>개발2팀</option>
						<option>디자인팀</option>
						<option>마케팅팀</option>
					</select>
					<div class="board-write-filelist">
						<c:if test="${ !empty files }">
							<c:forEach var="f" items="${ files }" varStatus="i">
								<div>
									<span class="board-update-file-text">
										${ f.fOrigin }
										<input type="hidden" value="${ f.fRename }">
									</span>
									<div class="board-write-file-delete-btn">x</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<textarea class="board-write-content" name="bContent" id="bContent">${ b.bContent }</textarea>
				<button class="board-write-btn" onclick="submit();">수정하기</button>
<!-- 			</form> -->
			<input type="file" name="uploadFile" id="uploadFile" style="display: none;" multiple>
		</div>
	</div>
	<script>
		if(${ b.bType eq "전체공지" }) {
			$('#bType option:eq(0)').prop('selected', true);
		} else if(${ b.bType eq "일반공지" }) {
			$('#bType option:eq(1)').prop('selected', true);
		} else {
			$('#bType option:eq(2)').prop('selected', true);
		}
		
		if(${ b.bDept eq "개발1팀" }) {
			$('#bDept option:eq(0)').prop('selected', true);
		} else if(${ b.bDept eq "개발2팀" }) {
			$('#bDept option:eq(1)').prop('selected', true);
		} else if(${ b.bDept eq "디자인팀" }) {
			$('#bDept option:eq(2)').prop('selected', true);
		} else {
			$('#bDept option:eq(3)').prop('selected', true);
		}
		
		$('#selectFile').on('click', function(){
// 			bool = false;
			let check1 = 1;
			addFile(check1);
		});
	
// 		var bool;
		var formData = new FormData();
		var clicked;
		var beforeFile;
		$(document).on('click', '.board-update-file-text', function(){
// 			$('#uploadFile').click();
// 			if($('#uploadFile')[0].files[0].name != null) {
// 				$(this).text(('#uploadFile')[0].files[0].name);
// 			formData.append('beforeFile', $(this).children().eq(0).val());
// 			}

			clicked = $(this);
			beforeFile = $(this).children().eq(0).val();
// 			bool = true;
			let check2 = 2;
			addFile(check2);
		});
		
// 			$('#uploadFile').off().on('change', function() {		
// 				if(bool == true) {
// 					console.log("dd");
// 					formData.append('uploadFiles', $(this)[0].files[0]);
					
// 					$(clicked).html($(this)[0].files[0].name);
// 					formData.append('beforeFile', beforeFile);
// 				}
// 			});
		
// 		let filesNum = [];
		let deleteFiles = [];
		const addFile = (check) => {
			$('#uploadFile').click();
			$('#uploadFile').off().on('change', function() {
				var fileName = $(this)[0].files[0].name;
				
				if(check == 1) {
// 					console.log("11");
// 					filesNum.push(1);
					formData.append('uploadFiles', $(this)[0].files[0]);
					
					var addHtml = "<div><span class='board-update-file-text'>" + fileName + "</span>";
					addHtml += "<div class='board-write-file-delete-btn added'>x</div></div>";
// 					addHtml += "<input type='hidden' value='" + filesNum.length + "'></div></div>";
					
					$('.board-write-filelist').append(addHtml);
// 					for(let value of formData.values()) {
// 						console.log(value);
// 					}
				} else if(check == 2) {
// 					console.log("22");
					if($(clicked).next().hasClass('added')) {
						let prev = $(clicked).parent();
						$(clicked).next().click();
						
						formData.append('uploadFiles', $(this)[0].files[0]);
						
// 						filesNum.push(1);
						var addHtml = "<span class='board-update-file-text'>" + fileName + "</span>";
						addHtml += "<div class='board-write-file-delete-btn added'>x</div>";
// 						addHtml += "<input type='hidden' value='" + filesNum.length + "'></div>";
						
						prev.append(addHtml);
					} else {
						formData.append('uploadFiles', $(this)[0].files[0]);
						
// 						filesNum.push(1);
// 						var addHtml = "<input type='hidden' value='" + filesNum.length + "'>";
						
						$(clicked).html(fileName);
						$(clicked).next().addClass("added");
// 						$(clicked).next().append(addHtml);
						
						formData.append('beforeFile', beforeFile);						
					}
				}
			});
		}
		// 버블링 현상......
		// if문이 안먹힌다...
		
// 		$(document).on('click', '.board-write-file-delete-btn', function(e){
// 			formData.append("deleteFiles", $(this).prev().children().first().val());
// 			$(this).parent().html("");
// 			e.stopPropagation();
// 		});
		
		$(document).on('click', '.board-write-file-delete-btn', function(e){
// 			let input = $(this).children('input').length;
			
// 			if(input > 1) {
// 				let num1;
// 				for(var i = 0; i < input; i++) {
// 					num1 = $(this).children().eq(i).val() - 1;
// 					deleteFiles.push(num1);
// 				}
				
// 				formData.set('addedDeleteFiles', deleteFiles);
				
// 				$(this).parent().html("");
// 				e.stopPropagation();
// 			} else {
// 				let num = $(this).children().first().val() - 1;

				if($(this).hasClass('added')) {
					deleteFiles.push($(this).prev().text());
					formData.set('addedDeleteFiles', deleteFiles);
// 					console.log(deleteFiles);
					
					$(this).parent().html("");
// 					e.stopPropagation();					
				} else {
					formData.append("deleteFiles", $(this).prev().children().first().val());
		 			$(this).parent().html("");
// 		 			e.stopPropagation();
				}
// 			}
		});
		
		const submit = () => {
// 			$('#board-form').submit();
// 			for(var value of formData.values()) {
// 				console.log(value);
// 			}
// 			for(var key of formData.keys()) {
// 				console.log(key);
// 			}
			var bNo = ${ b.bNo };
			var currentPage = ${ currentPage };
			var bTitle = $('#bTitle').val(); 
			var bType = $('#bType').val(); 
			var bDept = $('#bDept').val(); 
			var bContent = $('#bContent').val(); 
			
			formData.append('bNo', bNo);
			formData.append('currentPage', currentPage);
			formData.append('bTitle', bTitle);
			formData.append('bType', bType);
			formData.append('bDept', bDept);
			formData.append('bContent', bContent);
			
			$.ajax({
			    url: 'bUpdate.bo',
			    type: 'post',
			    data: formData,
				contentType: false,
			    processData: false,
			    success: function(data) {
// 			    	console.log(data);
			    	location.href = "bdetail.bo?bNo=" + data.bNo + "&currentPage=" + data.currentPage;
			    }
			});
		}
	</script>
		
</body>
</html>