<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/message.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class="main-king">

	<%@ include file="../common/mainLeft.jsp"%>

		<div class="main-right">
			<div class="message-menu-box">
				<div class="message-menu selected">전체메세지</div>
				<div class="message-middle-menu">받은메세지</div>
				<div class="message-menu">보낸메세지</div>
			</div>
			
			<div class="msg-write-title-font">
				메세지작성
				<div class="msg-send-btn" onclick="submit();">보내기</div>
			</div>
			<div class="msg-write-title">
				<div class="msg-write-receiver-box"></div>
				<input type="text" class="msg-write-receiver-input" id="msgReceiver" placeholder="받는사람">
			</div>
			<div class="msg-write-memberList">
			</div>
			<input type="text" class="msg-write-title" id="msgTitle" placeholder="제목입력">
			<div class="msg-write-middle">
				<span class="msg-write-file-btn" id="selectFile">파일선택</span>
				<div class="msg-write-filelist"></div>
			</div>
			<textarea class="msg-write-content" id="msgContent" placeholder="내용입력"></textarea>
			<input type="file" name="uploadFile" id="uploadFile" style="display: none;" multiple>
		</div>
	</div>
	<script>
		$('#selectFile').on('click', function(){
			$('#uploadFile').click();
		});
		
		var formData = new FormData();
		if("${mNo}" != "" && "${mWriter}" != "" && "${msgTitle}" != "") {
			let addHtml = "<div class='msg-write-receiver'>${mWriter}</div>";
			$('.msg-write-receiver-box').append(addHtml);
			formData.set('receiver', ${mNo});
	
			$('#msgTitle').val("[RE]" + "${msgTitle}");
		}
		
		let filesNum = [];
		let deleteFiles = [];
		$('#uploadFile').on('change', function(){		
			filesNum.push(1);
			formData.append('uploadFiles', $(this)[0].files[0]);
			
			var addHtml = "<span class='msg-write-file-name'>" + $(this)[0].files[0].name;
			addHtml += "<div class='msg-write-file-delete-btn'>x";
			addHtml += "<input type='hidden' value='" + filesNum.length + "'></div></span>";
				
			$('.msg-write-filelist').append(addHtml);
			
// 			for (let value of formData.values()) {
// 					console.log(value);
// 				}
		});
		
		$(document).on('click', '.msg-write-file-delete-btn', function(){
			var num = $(this).children().first().val() - 1;
			deleteFiles.push(num);
			formData.set('deleteFiles', deleteFiles);
			$(this).parent().remove();
		});
	
		const submit = () => {
			var msgTitle = $('#msgTitle').val(); 
			var msgContent = $('#msgContent').val(); 
			
			formData.append('msgTitle', msgTitle);
			formData.append('msgContent', msgContent);
			
			$.ajax({
			    url: 'msgInsert.msg',
			    type: 'post',
			    data: formData,
				contentType: false,
			    processData: false,
			    success: function(data) {
// 			    	console.log(data);
			    	location.href = "msgAllList.msg";
			    }
			});
		}
		
		$('#msgReceiver').on('keyup', function(e){
			var receiver = $(this).val();
			
			if(e.keyCode != 8) {
				$('.msg-write-memberList').addClass('active');
			}
			$('.msg-write-memberList').html('');
			
			$.ajax({
				url: 'msgSearchMember.msg',
				data: {receiver:receiver},
				success: function(data) {
					console.log(data);
					if(data == "일치하는 회원이 없습니다.") {
						var addHtml = '';
						
						addHtml += "<div class='msg-write-memberList-item'>일치하는 회원이 없습니다.</div>";
						$('.msg-write-memberList').append(addHtml);
					} else {
						for(var m in data) {
							var member = data[m];
							var addHtml = '';
							
							addHtml += "<div class='msg-write-memberList-item'>" + member.mName;
							addHtml += "(" + member.dName + " / " + member.jName + ")";
							addHtml += "<input type='hidden' value='" + member.mNo + "'>";
							addHtml += "</div>";
							
							$('.msg-write-memberList').append(addHtml);
						}						
					}
				}
			});
		});
		
		var mNo = [];
		$(document).on('click', '.msg-write-memberList-item', function(e){
			var member = $(this).text();
			mNo.push($(this).children().eq(0).val());		
// 			var receiver = $('#msgReceiver').val();
			if(member != "일치하는 회원이 없습니다.") {
				var addHtml = '';
				addHtml += "<div class='msg-write-receiver'>" + member + "</div>";
				$('.msg-write-receiver-box').append(addHtml);
				formData.set('receiver', mNo);
// 				for (let value of formData.values()) {
// 					  console.log(value);
// 				}
// 				for (let key of formData.keys()) {
// 					  console.log(key);
// 				}
// 				$('.msg-write-memberList').removeClass('active');
				$('.msg-write-receiver-input').focus();
				$('.msg-write-receiver-input').val('');
			}
		});
		
// 		$(document).on('click', function(e){
// 			if(!$(e.target).hasClass('msg-write-receiver-input')) {
// 				$('.msg-write-memberList').removeClass('active');				
// 			}
// 		});			
		// id값에 focusout을 줘서 실행했을 때에는 작동x
		// 1. click이벤트 실행순서가 class명이 지정되어있는게 먼저 실행되고 없는게 나중에 실행
		// 2. input 태그 html요소가 더 위에 있어서
		// 3. focusout이벤트가 click이벤트보다 실행순서가 빠르다
		
		$(document).on('keydown', '#msgReceiver', function(e){
			if(e.keyCode == 8) {
				$(this).parent().children().eq(0).children().last().remove();
	
				mNo.pop();
				formData.set("receiver", mNo);
				
// 				for (let value of formData.values()) {
// 					console.log(value);
// 				}
			}
		});
		
	</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>