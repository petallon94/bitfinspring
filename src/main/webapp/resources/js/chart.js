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
					data:inflectionpeople,
					backgroundColor:'rgba(255,0,0,0.5)',
					borderColor:'rgb(200,0,0)',
					borderWidth:1,
					/*lineTension:0,*/
					/*borderDash:[10,10],*/
					fill:false,
					pointRadius:4,
					pointHoverRadius:8,
					pointBorderColor:'black',
					pointBackgroundColor:'yellow',
					pointHoverBorderColor:'yellow',
					pointHoverBackgroundColor:'black'
					
				}
			]
		},
		options:{
			maintainAspectRatio:false
		}
	});	
	
});
	

	


