/**
 * 
 */
$( function() {
    $( "#datepicker" ).datepicker(
	{
		dateFormat : 'yy-mm-dd',
		monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		showMonthAfterYear : true,
		yearSuffix : '년', // 2018년 7월
		showOtherMonths : true, //다른 달도 화면에 출력
		dayNamesMin : ['월','화','수','목','금','토','일'],
		onSelect : function(dateText, inst){
			$('button').attr('disabled',false).css('opacity','1'); 
			$('#timeResult').html(''); // 시간에 관련된 부분 초기화
			$('#dateResult').html(dateText);
			$('#mBirth').attr('value', dateText); // 선택한 값을  input hidden의 값으로
			var date = new Date(); // 시스템 시간을 받아옴
			
			var year = date.getFullYear(); // 2018
			var month = date.getMonth()+1; // 7
			if ((""+month).length == 1){
				month = "0"+month; // "07"
			}
			var day = date.getDate(); // 4
			if ((""+day).length == 1){
				day = "0"+day; // "04"
			}
			
			var nowDate = year+'-'+month+'-'+day;
			if (dateText == nowDate) { // 오늘을 선택한경우
				var hour = date.getHours();
    			for (var i = 9; i <= hour; i++){
    				$('#'+i).attr('disabled','disabled'); // 버튼을 disabled 한다.	
    			}
    			
    			/* for (var i = hour+1; i <= 18; i++){
    				$('#'+i).attr('enabled','enabled'); // 버튼을 enabled 한다.	
    			} */
			} // 오늘을 선택하면 지금 시간 이후만 클릭가능하게 한다.
		}
		// minDate : 0 // 지나간 날은 선택이 안됨
	}); // datepicker
	    
  });