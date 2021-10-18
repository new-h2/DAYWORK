<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/index.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<link rel="stylesheet" type="text/css" href="resources/calendarTool/tui-calendar.css">
<link rel="stylesheet" type="text/css" href="resources/calendarTool/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/calendarTool/calendar.css">
<script src ="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.vac_text{font-size: 11pt;}

#acceptVac {margin-top: 1em;}

</style>
</head>
<body>
	<div class="main-king">
	<%@ include file="../common/mainLeft.jsp"%>

		<!-- 오른쪽 내용 박스 -->
		<div class="main-right">
			<span id="renderRange" class="render-range"></span>
				
			<div>	
				<div id="cateNavi">
					<div class="color" style="background-color:#00a9ff; border-color: #00a9ff"></div> Company 
					<div class="color" style="background-color:#bbdc00; border-color: #bbdc00"></div> Team 
					<div class="color" style="background-color:#ff5583; border-color: #ff5583"></div> Personal</div>
				<div id="menu-navi" align="right">
					<button id="todayBtn">TODAY</button>
					<span class="moveBtn" id="prevBtn">&#60;</span>
					<span class="moveBtn" id="nextBtn">&#62;</span>
				</div>
			</div>
		
			<div id="calendar"></div>			
		</div>
	</div>





	<!-- input 모달 -->
	<div class="modal fade" id="calendarInputModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="inputModalCenterTitle">일정 등록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
			<!-- 일정 등록 form 시작 -->
	      	<form action="insertCal.ca" id="insertCalendar" method="post">
				<!-- 캘린더 카테고리 고르기 -->
	      		<select name="calCate" id="calCate" class="cal_input">
	      			<option value=0>Company</option>
	      			<option value=1>Team</option>
	      			<option value=2>Personal</option>
	      		</select>      		
	      		<input type="checkbox" name="calAllDay" class="cal_input" value="Y"> All Day
	      		
	      		<br>
	      		
	      		
	      		<input type="text" name="calContent" id="calContent" class="cal_input" placeholder="일정">
	      			      		
	      		<br>
		      					
		      	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="startpicker-input" type="text" aria-label="Date" name="calStart">
		        	<span class="tui-ico-date"></span>
		        	<div id="startpicker-container" style="margin-left: -1px;"></div>
		    	</div>
		    	<span>_</span>
		    	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="endpicker-input" type="text" aria-label="Date" name="calEnd">
		        	<span class="tui-ico-date"></span>
		        	<div id="endpicker-container" style="margin-left: -1px;"></div>
		    	</div>			
				
	      	</form>
	      	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="document.getElementById('insertCalendar').submit();">등록</button>
	      </div>
	      
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">휴가 신청</h5>
	      
	      </div>
	      <div class="modal-body">
	      
	     	 <!-- 휴가 등록 form 시작 -->
	      	<form action="insertVac.ca" id="insertVac">
	      		   
	      		<select name="vacCate" id="vacCate" class="cal_input">
	      			<option value="연차">연차</option>
	      			<option value="병가">병가</option>
	      			<option value="특별">특별</option>
	      			<option value="기타">기타</option>
	      		</select>      		
	      		
	      		<input type="text" name="calContent" id="vacContent" class="cal_input" placeholder="사유">
	      		<br>
	      		<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="vac-startpicker-input" type="text" aria-label="Date" name="calStart">
		        	<span class="tui-ico-date"></span>
		        	<div id="vac-startpicker-container" style="margin-left: -1px;"></div>
		    	</div>
		    	<span>_</span>
		    	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="vac-endpicker-input" type="text" aria-label="Date" name="calEnd">
		        	<span class="tui-ico-date"></span>
		        	<div id="vac-endpicker-container" style="margin-left: -1px;"></div>
		    	</div>
		    	
		    	<h5 align="center">위와 같은 내용으로 휴가를 신청함.</h5>		    	
	      	
	      	</form>
	      	
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="document.getElementById('insertVac').submit();">신청</button>
	      </div>
	    </div>
	  </div>
	</div>





	<!-- 일정  update 모달 -->
	<div class="modal fade" id="calendarUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">일정 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="updateCal.ca" id="updateCalendar" method="post">
				<input type="hidden" name="calNo" id="calNo">
	      		<select name="calCate" id="calUpdateCate" class="cal_input">
	      			<option value=0>Company</option>
	      			<option value=1>Team</option>
	      			<option value=2>Personal</option>
	      		</select>      		
	      		<input type="checkbox" name="calAllDay" class="cal_input" id="calUpdateAllDay" value="Y"> All Day
	      		
	      		<br>	      		
	      		
	      		<input type="text" name="calContent" id="calUpdateContent" class="cal_input" placeholder="일정">
	      		
	      		<br>
		      	
		      	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="startpicker-input-update" type="text" aria-label="Date" name="calStart">
		        	<span class="tui-ico-date"></span>
		        	<div id="startpicker-container-update" style="margin-left: -1px;"></div>
		    	</div>
		    	<span>_</span>
		    	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="endpicker-input-update" type="text" aria-label="Date" name="calEnd">
		        	<span class="tui-ico-date"></span>
		        	<div id="endpicker-container-update" style="margin-left: -1px;"></div>
		    	</div>			
				
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="document.getElementById('updateCalendar').submit();">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	
	<!-- 휴가 결재 모달 -->
	<div class="modal fade" id="vacAcceptModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="modalLabel">휴가 결재</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="acceptVac.ca" id="acceptVac" method="post">
				<input type="hidden" name="calNo" id="vacNo">
				<input type="hidden" name="calContent" id="paramContent">
				
				<span class="vac_text" id="vacStart"></span> -     		   		
				<span class="vac_text" id="vacEnd"></span>      		   		
	      		
	      		<br>	      		
	      		
	      		<div class="vac_text" id="vacAccCate"></div>
	      		<div class="vac_text" id="vacAccName"></div>
	      		<div class="vac_text" id="vacAccContent"></div>
	      		   
	      		<h5 align="center">위와 같은 내용으로 휴가를 신청함.</h5>   	
				
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="document.getElementById('acceptVac').submit();">결재</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	
	<!-- 휴가 수정 모달 -->
	<div class="modal fade" id="vacUpdateModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="updateModalLabel">휴가 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="updateVac.ca" id="updateVac">
	      		
	      		<input type="hidden" name="calNo" id="vacUpdateNo">   
	      		<select name="vacCate" id="vacUpdatecCate" class="cal_input">
	      			<option value="연차">연차</option>
	      			<option value="병가">병가</option>
	      			<option value="특별">특별</option>
	      			<option value="기타">기타</option>
	      		</select>      		
	      		
	      		<input type="text" name="calContent" id="vacUpdateContent" class="cal_input" placeholder="사유">
	      		<br>
	      		<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="vacUpdate-startpicker-input" type="text" aria-label="Date" name="calStart">
		        	<span class="tui-ico-date"></span>
		        	<div id="vacUpdate-startpicker-container" style="margin-left: -1px;"></div>
		    	</div>
		    	<span>_</span>
		    	<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
		        	<input id="vacUpdate-endpicker-input" type="text" aria-label="Date" name="calEnd">
		        	<span class="tui-ico-date"></span>
		        	<div id="vacUpdate-endpicker-container" style="margin-left: -1px;"></div>
		    	</div>
		    	
		    	<h5 align="center">위와 같은 내용으로 휴가를 신청함.</h5>		    	
	      	
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" onclick="document.getElementById('updateVac').submit();">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" 
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
<script src="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.min.js"></script>
<script src="https://uicdn.toast.com/tui.date-picker/v4.0.3/tui-date-picker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
<script src="resources/calendarTool/tui-calendar.js"></script>
<script src="resources/calendarTool/bootstrap.js"></script>
<script src="resources/calendarTool/calendar.js"></script>

<script type="text/javascript" class="code-js">



	//캘린더 생성
	var cal = new tui.Calendar('#calendar', {
		defaultView: 'month',
		useCreationPopup: false,
		useDetailPopup: true,
		timezones: {
	   		timezoneOffset: 540,
	//     	displayLabel: 'GMT+09:00',
	    	tooltip: 'Seoul'        	
	    },
	    template: {
	       allday: function(schedule) {
	            return getTimeTemplate(schedule, true);
	        },
	        time: function(schedule) {
	            return getTimeTemplate(schedule, false);
	        }
	    }      
	});
	
	
	
	
	
	// Calendar 데이터 가져오기
	function selectCalendar() {
		$.ajax({
			url: 'selectCal.ca',
			dataType: "json",
			success: function(data) {
// 				console.log(data);
				
				for(var i in data) {								
					
					var calColor = CalendarList[data[i].calCate];
					
					var schedule = new ScheduleInfo();
					var readCheck = true;
					
					if(data[i].mNo === ${loginUser.mNo}) {
						if(data[i].jCode != null && data[i].calCate === 1) {
							readcheck = true;
						} else {
							readCheck = false;
						}
					} else if(data[i].jCode === "${loginUser.jCode}" && data[i].calCate === 3) {
						readCheck = false;
					}					
					
					
					
					schedule.id = data[i].calNo;
					schedule.calendarId = data[i].calCate;
					schedule.title = data[i].calContent;
					schedule.isAllday = data[i].calAllDay == "Y" ? true : false;
					schedule.start = data[i].calStart;
					schedule.end = data[i].calEnd;
					schedule.category = schedule.isAllday ? 'allday' : 'time';
					schedule.isReadOnly = readCheck;
					schedule.color = calColor.color;
					schedule.bgColor = calColor.bgColor;
					schedule.dragBgColor = calColor.dragBgColor;
					schedule.borderColor = calColor.borderColor;
					schedule.raw.memo = data[i]. jCode != "${loginUser.jCode}" ? 0 : 1;
					
					ScheduleList.push(schedule);
					
				}				
				
				cal.createSchedules(ScheduleList);
				
			},
			error: function(data) {
				console.log(data);
				console.log("fail");
			}
		});
	}
	
	
	
	
	var today = new Date();
	var picker = tui.DatePicker.createRangePicker({
		startpicker: {
		    date: today,
		    input: '#vac-startpicker-input',
		    container: '#vac-startpicker-container'
	    },
	    endpicker: {
		    date: today,
		    input: '#vac-endpicker-input',
		    container: '#vac-endpicker-container'
	    },
// 	    selectableRanges: [
// 	    	[today, today.getFullYear() + 1, today.getMonth(), today.getDate()]
// 	    ]
	});
	
	function vacUpdateDate(schedule) {
		var picker = tui.DatePicker.createRangePicker({
			startpicker: {
			    date: schedule.start._date,
			    input: '#vacUpdate-startpicker-input',
			    container: '#vacUpdate-startpicker-container'
		    },
		    endpicker: {
			    date: schedule.end._date,
			    input: '#vacUpdate-endpicker-input',
			    container: '#vacUpdate-endpicker-container'
		    }
		});
	}
	
	
	
	cal.on({
		'beforeCreateSchedule': function(e) {
			console.log('beforeCreateSchedule', e);
	        // open a creation popup
				$('#calendarInputModal').modal('show');
				datePicker(e);
	        	
	        // then close guide element(blue box from dragging or clicking days)
	        e.guide.clearGuideElement();
	    },
        'beforeUpdateSchedule': function(e) {
            console.log('beforeUpdateSchedule', e);

            var schedule = e.schedule;
            
            $('#calUpdateCate').val(schedule.calendarId == "" ? 0 : schedule.calendarId);          
            
            if(schedule.raw.memo === 1) {
            	
                $('#vacNo').val(Number(schedule.id));
//                 $('#vacStart').text("기간 : " + moment(schedule.start).format('YYYY-MM-DD'));
//                 $('#vacEnd').text(moment(schedule.end).format('YYYY-MM-DD'));
				$('#vacStart').text("기간 : " + moment(schedule.start._date).format('YYYY-MM-DD'));
                $('#vacEnd').text(moment(schedule.end._date).format('YYYY-MM-DD'));

                
                var nameEnd = schedule.title.substring(5).indexOf(" ") + 8;                
                var cate = schedule.title.substring(nameEnd + 1, nameEnd + 3);
                var name = schedule.title.substring(5, nameEnd);
                var content = schedule.title.substring(nameEnd + 6);
                
                $('#vacAccCate').text("구분 : " + cate);
                $('#vacAccName').text("이름 : " + name);
                $('#vacAccContent').text("사유 : " + content);
                
                $('#paramContent').val(name + " " + cate);
                               
            	$('#vacAcceptModal').modal('show');
            	
            } else if(schedule.raw.memo === 0 && schedule.calendarId == 3) {
            	
            	$('#vacUpdateNo').val(Number(schedule.id));
            	$('#vacUpdateCate').val
             	
            	var nameEnd = schedule.title.substring(5).indexOf(" ") + 8;            	
            	var cate = schedule.title.substring(nameEnd + 1, nameEnd + 3);
            	var content = schedule.title.substring(nameEnd + 6);            	
				
            	$('#vacUpdatecCate').val(cate);
            	$('#vacUpdateContent').val(content);
            	
            	$('#vacUpdateModal').modal('show');      
            	vacUpdateDate(schedule);
            	
            	
            } else {
            	
            	$('#calNo').val(Number(schedule.id));
             	$('#calendarUpdateModal').modal('show');            	
 	            $('#calUpdateContent').val(schedule.title);
 	            
 	            if(schedule.isAllDay == true) {
 	            	$('#calUpdateAllDay').prop('checked', true);
 	            } 
 	            
 	            datePicker(e);
            }
        },
        'beforeDeleteSchedule': function(e) {
        	console.log('beforeDeleteSchedule', e);
       		if(confirm("정말 삭제하시겠습니까?")) {
       		 $('#calNo').val(Number(e.schedule.id));
       			$('#updateCalendar').prop('action', 'deleteCal.ca').submit();
       		}
        }
	});
	
	
</script>
</body>
</html>