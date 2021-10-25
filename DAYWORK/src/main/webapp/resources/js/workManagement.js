/**
 * 
 */


	var today = new Date();
	var week = [];
	
	function getData() {
		
		$tableBody = $('#workTime-table-body');
		$tableBody.html('');
		
		$.ajax({
			url: 'selectComList.me',
			data: {mNo:mNo},
			success: function(data) {
				console.log(data);
				setTable(data);
						
			},
			error: function(data) {
				console.log(data);
			}
			
		});
		
	}
	
	
	
	

	// 테이블 만들기
	function setTable(data) {
		var $tr, $date, $start, $end, $sumTime, $overTimeTd, $etc;
		var thisWeek = []; 
		var workTimes = [0, 0, 0, 0, 0, 0, 0];
		var overTimes = [0, 0, 0, 0, 0, 0, 0];
		var vacTimes = [0, 0, 0, 0, 0, 0, 0];
		
		for(var i = 0; i < 7; i++) {
			$tr = $('<tr>');
			var resultDate = new Date(today.getFullYear(), today.getMonth(), today.getDate()-today.getDay()+i);
			var thisMM = String(resultDate.getMonth()+1);
			var thisDD = String(resultDate.getDate());
			var mm = thisMM.length == 1 ? '0' + thisMM : thisMM;
			var dd =  thisDD.length == 1 ? '0' + thisDD : thisDD;
			var dateInfo = mm + "." + dd;					
			thisWeek[i] = dateInfo;
			
			$date = $('<td>').text(dateInfo);
			
			$start =$('<td>').text("-");
		 	$end =$('<td>').text("-");;
		 	$sumTime =$('<td>').text("00h 00m");
		 	$overTimeTd =$('<td>').text("00h 00m");
		 	$etc =$('<td>').text("-");
			
			for(var j in data) {
				data[j].comStart = data[j].comStart.replaceAll("-", ".");
				if(dateInfo === data[j].comStart.substring(5, 10)) {
					var startTime = data[j].comStart.substring(11, 16);
					var endTime = data[j].comEnd.substring(11, 16);	
				
					var workTime = diffTime(data[j].comStart, data[j].comEnd);
					var workTimeHour = workTime.substring(0,2);				
					var workTimeMin =  workTime.substring(4, 6);
					
					week = weekWork(Number(workTimeHour), Number(workTimeMin));
					
					var overTimeHour = "00";
					var overTimeMin = "00";
					
	
					if(workTimeHour >= 8) {						
						
						overTimeHour = workTimeHour - 8;
						
						if(String(overTimeHour).length === 1) {
							overTimeHour = "0" + overTimeHour;
						}
						
						overTimeMin = workTimeMin;
						if(String(overTimeMin).length === 1) {
							overTimeMin = "0" + overTimeMin;
						}
					}
					
					workTimes[i] = Number(workTimeHour);
					overTimes[i] = Number(overTimeHour);
					
					
					$start =$('<td>').text(startTime);
		 			$end =$('<td>').text(endTime);;
			 		$sumTime =$('<td>').text(workTime);
			 		$overTimeTd =$('<td>').text(overTimeHour + "h " + overTimeMin + "m");
		 			$etc = $('<td>').text("-");
		 			
		 			// 휴가일 경우
		 			if(data[j].comVac != null){
		 				$sumTime =$('<td>').text("08h 00m");
		 				$etc = $('<td>').text(data[j].comVac);
		 				workTimes[i] = 0;
		 				vacTimes[i] = 8;
		 				week = weekWork(8, 0);
		 			}				 			
		 			
				} 
			}					
			
			$tr.append($date);
 			$tr.append($start);
 			$tr.append($end);
 			$tr.append($sumTime);
 			$tr.append($overTimeTd);
 			$tr.append($etc);
			$tableBody.append($tr);
		}
		
		// 잔여 근무 시간 text 넣어주기
		var textHour = 39 - week[0];
		var textMin = 60 - week[1];	
		
		if(textMin < 0) {
			textMin += 60;
			textHour--;
		}
		
		if(textMin == 60) {
			textHour++;
			textMin = 0;
		}
		
		if(textHour < 10 && textHour > 0) {
			textHour = "0" + textHour;
		}
				
		if(textMin < 10) {
			textMin = "0" + textMin;
		}
		
		if(textHour < 0) {
			$('#week-work').text("00h 00m 00s");
			
		} else if(isNaN(week[0]) && isNaN(week[1])) {
			$('#week-work').text("40h 00m 00s");
		} else {
			$('#week-work').text(textHour + "h " + textMin + "m 00s");
		}
		
		setChart(thisWeek, workTimes, overTimes, vacTimes);
	}
	
	
	
	
	
	// 근무시간 구하기
	function diffTime(start, end) {				
		var sy = start.substring(0, 4);
		var sm = start.substring(5, 7) - 1;
		var sd = start.substring(8, 10);
		var sh = start.substring(11, 13);
		var smm = start.substring(14, 16);
		var startDate = new Date(sy, sm, sd, sh, smm);
		
		var ey = end.substring(0, 4);
		var em = end.substring(5, 7) - 1;
		var ed = end.substring(8, 10);
		var eh = end.substring(11, 13) - 1;	
		var emm = end.substring(14, 16);
		var endDate = new Date(ey, em, ed, eh, emm);			
		var diff = (endDate.getTime() - startDate.getTime())/1000;
		
		return timeFormat(diff);		
		
	}
	
	
	
	
	
	// 시간 포맷 설정
	function timeFormat(time) {		
		
		var minutes = time % 3600 / 60;
		
		if(time < 0) {
//			time = time * (-1);
			minutes = 60 - (time % 3600) / 60;
		}
		var hours = time / 3600;
		
		if(minutes == 60) {
			hours++;
			minutes = 0;
		}		
		
		if(hours >= 00 && hours < 10) {
			hours = "0" + Math.floor(hours);
		} else if(hours < 0 || isNaN(hours)) {
			hours="00";
		} else {
			hours = Math.floor(hours);
		}
		
		if(minutes >= 0 && minutes < 10) {
			minutes = "0" + Math.floor(minutes);
		} else if(minutes < 0 || isNaN(minutes)) {
			minutes = "00";
		} else {
			minutes = Math.floor(minutes);
		}

	
		if(time <= 0) {
			return "00h 00m";
		}
		
		if(hours > 100 || minutes > 60) {
			return "00h 00m";
		}
		
		return hours + "h " + minutes + "m";
	}
	
	
	
	
	
	
	var weekHours = 0;		
	var weekMin = 0;
	
	// 이번 주 잔여 근무 시간 계산용
	function weekWork(hour, min) {
		
		
		weekHours += hour;
		weekMin += min;		
				
		week[0] = weekHours;
		week[1] = weekMin;
		
		return week;
	}
	
	
	
	
	
	// 차트 세팅
	function setChart(thisWeek, workTimes, overTimes, vacTimes) {
		var chart = toastui.Chart;
		var el = document.getElementById('chart');
		var data = {
			categories: thisWeek,
			series: [
			{
				name: '근무 시간',
				data: workTimes
				// visible: false => 차트에 데이터 표시하지 않음
			},
						    
			{
				name: '초과 근무 시간',
				data: overTimes
			},
						    
			{
				name: '휴가',
				data: vacTimes
			}
						    
			]
		};
	
		var options = {
			series: {
				stack: {
					type: 'normal'
					}
			},
			chart: {width:850, height:350}
		};
		
		var chart = chart.columnChart({el, data, options});
	}
	
	
	
	
	