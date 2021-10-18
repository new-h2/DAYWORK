<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="board-write-title-font">글작성</div>
				<input type="text" class="board-write-title" name="bTitle" id="bTitle">
				<div class="board-write-middle">
					<span class="board-write-file-btn" id="selectFile">파일선택</span>
					<c:if test="${ loginUser.mAdmin eq 1 }">
						<select class="board-type-select" name="bType" id="bType">
							<option>전체공지</option>
							<option>일반공지</option>
							<option>이벤트공지</option>
						</select>
					</c:if>
					<c:if test="${ loginUser.mAdmin eq 0 }">
						<div style="float: right;"> 
							<input type="checkbox" id= "bTopFixed" name="bTopFixed" value="Y">상단고정
							<input type="text" class="board-write-dept" value="전체공지" name="bType" id="bType" readonly>
							<input type="hidden" id="bDept" name="bDept" value="관리자">
						</div>
					</c:if>
					<c:if test="${ loginUser.mAdmin eq 1 }">
						<input type="text" class="board-write-dept" value="${ loginUser.dName }" id="bDept" name="bDept" readonly>
					</c:if>
					<div class="board-write-filelist"></div>
				</div>
				<textarea class="board-write-content" name="bContent" id="bContent"></textarea>
				<button class="board-write-btn" onclick="submit();">작성하기</button>
<!-- 			</form> -->
			<input type="file" name="uploadFile" id="uploadFile" style="display: none;" multiple>
		</div>
	</div>
	<script>
		$('#selectFile').on('click', function(){
			$('#uploadFile').click();
		});
		
		var formData = new FormData();
		let filesNum = [];
		let deleteFiles = [];
		$('#uploadFile').on('change', function(){	
			filesNum.push(1);
			formData.append('uploadFiles', $(this)[0].files[0]);
			
			var addHtml = "<span class='board-write-file-name'>" + $(this)[0].files[0].name;
			addHtml += "<div class='board-write-file-delete-btn'>x";
			addHtml += "<input type='hidden' value='" + filesNum.length + "'></div></span>";
				
			$('.board-write-filelist').append(addHtml);
		});
		
		$(document).on('click', '.board-write-file-delete-btn', function(){
			var num = $(this).children().first().val() - 1;
			deleteFiles.push(num);
			formData.set('deleteFiles', deleteFiles);
			$(this).parent().remove();
		});
	
		const submit = () => {
// 			$('#board-form').submit();
// 			for(var value of formData.values()) {
// 				console.log(value);
// 			}
// 			for(var key of formData.keys()) {
// 				console.log(key);
// 			}
			var bTitle = $('#bTitle').val(); 
			var bType = $('#bType').val(); 
			var bDept = $('#bDept').val(); 
			var bContent = $('#bContent').val(); 
			let bTopFixed = 'N';
			if($('#bTopFixed').is(':checked') == true) {
				bTopFixed = 'Y';
			}
			
			formData.append('bTitle', bTitle);
			formData.append('bType', bType);
			formData.append('bDept', bDept);
			formData.append('bContent', bContent);
			formData.append('bTopFixed', bTopFixed);
			
			$.ajax({
			    url: 'binsert.bo',
			    type: 'post',
			    data: formData,
				contentType: false,
			    processData: false,
			    success: function(data) {
// 			    	console.log(data);
			    	location.href = "boardList.bo";
			    }
			});
		}
	</script>
		
</body>
</html>