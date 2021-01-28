$(function(){
	var inflectionpeople = $('input[name=inflectionpeople]').val();
	inflectionpeople=inflectionpeople.replace("\[","");
	inflectionpeople=inflectionpeople.replace("\]","");
	inflectionpeople=inflectionpeople.split(",");
	
	var inflectiondate = $('input[name=inflectiondate]').val();
	inflectiondate=inflectiondate.replace("\[","");
	inflectiondate=inflectiondate.replace("\]","");
	inflectiondate=inflectiondate.split(",");

	var mychart = $('#line-chart');
	var myLineChart =  new Chart(mychart, {
		type:'line',
		data:{
			labels:inflectiondate,
			datasets:[
				{
					label:"코로나 일일 발병현황",
					data:inflectionpeople, //데이터
					backgroundColor:'rgba(0,0,255,0.3)', //그래프밑 색
					borderColor:'rgba(64,71,96,1.0)', // 선 색
					pointRadius:4, //포인트 크기
					pointHoverRadius:8, //호버시 포인트 크기
					pointBackgroundColor:'rgba(19,58,168,1.0)' //포인트 색
				}
			]
		},
		options:{
			maintainAspectRatio:false
		}
	});	
	
	$(document).ready(function () {
	    $('.menu_bar').mouseover(function(){
	        $(this).css('opacity','1');
	    }, function() {
	        $(this).css('opacity','1');
	    });
		$('.slideno1Content h1').css({
			"margin-left":"0",
			"opacity":"1"
		});
		$('.slideno1Content h3').css({
			"margin-left":"0",
			"opacity":"1"
		});




	});
	
});

	


