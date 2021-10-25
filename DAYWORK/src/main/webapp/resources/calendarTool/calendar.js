/**
 * 
 */


//	캘린더 일정에 시간 표시
	function getTimeTemplate(schedule, isAllDay) {
		var html = [];
		var start = moment(schedule.start.toUTCString());
		if (!isAllDay) {
			html.push('<strong>' + start.format('HH:mm') + '</strong> ');
		}
		if (schedule.isPrivate) {
	        html.push('<span class="calendar-font-icon ic-lock-b"></span>');
	        html.push(' Private');
	    } else {
	        if (schedule.isReadOnly) {
	            html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
	        } else if (schedule.recurrenceRule) {
	            html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
	        } else if (schedule.attendees.length) {
	            html.push('<span class="calendar-font-icon ic-user-b"></span>');
	        } else if (schedule.location) {
	            html.push('<span class="calendar-font-icon ic-location-b"></span>');
	        }
	        html.push(' ' + schedule.title);
	    }
		return html.join('');
	}

	



	var ScheduleList = [];
	
	function ScheduleInfo() {
	    this.id = null;
	    this.calendarId = null;

	    this.title = null;
	    this.isAllday = false;
	    this.start = null;
	    this.end = null;
	    this.category = '';
	    this.dueDateClass = '';
		this.isReadOnly = false;
		this.raw = {
	            memo: '',
	    }


	    this.color = null;
	    this.bgColor = null;
	    this.dragBgColor = null;
	    this.borderColor = null;
	}
	
	
	
	
	
//	카테고리에 따른 기본 설정
	var CalendarList = [];

	function CalendarInfo() {
	    this.id = null;
	    this.name = null;
	    this.checked = true;
	    this.color = null;
	    this.bgColor = null;
	    this.borderColor = null;
	    this.dragBgColor = null;
	}
	
	(function() {
	    var calendar;

	    calendar = new CalendarInfo();
	    calendar.id = 0;
	    calendar.name = 'Company';
	    calendar.color = '#ffffff';
	    calendar.bgColor = '#00a9ff';
	    calendar.dragBgColor = '#00a9ff';
	    calendar.borderColor = '#00a9ff';
	    CalendarList.push(calendar);

	    calendar = new CalendarInfo();
	    calendar.id = 1;
	    calendar.name = 'Team';
	    calendar.color = '#ffffff';
	    calendar.bgColor = '#bbdc00';
	    calendar.dragBgColor = '#bbdc00';
	    calendar.borderColor = '#bbdc00';
	    CalendarList.push(calendar);

	    calendar = new CalendarInfo();
	    calendar.id = 2;
	    calendar.name = 'Personal';
	    calendar.color = '#ffffff';
	    calendar.bgColor = '#ff5583';
	    calendar.dragBgColor = '#ff5583';
	    calendar.borderColor = '#ff5583';
	    CalendarList.push(calendar);
	    
	    calendar = new CalendarInfo();
	    calendar.id = 3;
	    calendar.name = 'Vacation';
	    calendar.color = '#000000';
	    calendar.bgColor = '#a6a6a6';
	    calendar.dragBgColor = '#a6a6a6';
	    calendar.borderColor = '#a6a6a6';
	    CalendarList.push(calendar)
	})();

	
	
	
	
// 	달력 오른쪽 상단 년/월 표시
	function setRenderRangeText() {
		var renderRange = document.getElementById('renderRange');
		var options = cal.getOptions();
		var viewName = cal.getViewName();
		var html = [];
		
		if (viewName === 'month' && (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
			html.push(moment(cal.getDate().getTime()).format('YYYY.MM'));
		} 
		
		renderRange.innerHTML = html.join('');
	}
			
	
	
	$('#todayBtn').on('click', function(){
		cal.today();
		setRenderRangeText();
	});

	$('#prevBtn').on('click', function(){
		cal.prev();
		setRenderRangeText();
	});

	$('#nextBtn').on('click', function(){
		cal.next();
		setRenderRangeText();
	});
	
	
	
	
	
// 	일정 모달 일시 Picker
	function datePicker(e) {
		if(e.schedule == null) {
		    var startDate = new tui.DatePicker('#startpicker-container', {
		        date: e.start._date,
		        input: {
		          element: '#startpicker-input',	          
		          format: 'yyyy-MM-dd HH:mm'
		        },
		        timePicker: true
		    });
		    
		    var endDate = new tui.DatePicker('#endpicker-container', {
		        date: new Date(),
		        input: {
		          element: '#endpicker-input',
		          format: 'yyyy-MM-dd HH:mm'
		        },
		        timePicker: true
			});
	    
		} else {
			var startDate = new tui.DatePicker('#startpicker-container-update', {
		        date: e.schedule.start._date,
		        input: {
		          element: '#startpicker-input-update',	          
		          format: 'yyyy-MM-dd HH:mm'
		        },
		        timePicker: true
		    });
		    
		    var endDate = new tui.DatePicker('#endpicker-container-update', {
		        date: e.schedule.end._date,
		        input: {
		          element: '#endpicker-input-update',
		          format: 'yyyy-MM-dd HH:mm'
		        },
		        timePicker: true
			});
		}
	        
	};	        
	
	
	
	
	function setSchedules() {
		  cal.clear();
		  cal.createSchedules(ScheduleList);
//		  refreshScheduleVisibility();
	}
	
	
	
	
	
	$(function() {		
 		setRenderRangeText();
		selectCalendar();	
		setSchedules();
 	});
	