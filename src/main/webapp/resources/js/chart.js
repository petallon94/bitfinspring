$(function(){
	var inflectionpeople = $('input[name=inflectionpeople]').val();
	inflectionpeople=inflectionpeople.replace("\[","");
	inflectionpeople=inflectionpeople.replace("\]","");
	inflectionpeople=inflectionpeople.split(",");
	
	var inflectiondate = $('input[name=inflectiondate]').val();
	inflectiondate=inflectiondate.replace("\[","");
	inflectiondate=inflectiondate.replace("\]","");
	inflectiondate=inflectiondate.split(",");
	
	var inflectgubunResult = $('input[name=inflectgubunResult]').val();
	inflectgubunResult=inflectgubunResult.replace("\[","");
	inflectgubunResult=inflectgubunResult.replace("\]","");
	inflectgubunResult=inflectgubunResult.split(",");
	
	var inflectmapResult = $('input[name=inflectmapResult]').val();
	inflectmapResult=inflectmapResult.replace("\[","");
	inflectmapResult=inflectmapResult.replace("\]","");
	inflectmapResult=inflectmapResult.split(",");

	var mychart = $('#line-chart');
	var myLineChart =  new Chart(mychart, {
		type:'line',
		data:{
			labels:inflectiondate,
			datasets:[
				{
					data:inflectionpeople,
					backgroundColor:'rgba(0,0,255,0.3)',
					borderColor:'rgba(64,71,96,1.0)',
					pointRadius:4,
					pointHoverRadius:8,
					pointBackgroundColor:'rgba(19,58,168,1.0)'
				}
			]
		},
		options:{
			maintainAspectRatio:false
		}
	});	
	
	var data = {
	    datasets: [{
	        data: inflectmapResult,
	        backgroundColor: [
	            "#eccc68",
	            "#ff7f50",
	            "#ff6b81",
	            "#a4b0be",
	            "#ffa502",
				"#ff6348",
				"#ff4757",
				"#7bed9f",
				"#70a1ff",
				"#5352ed",
				"#2ed573",
				"#1e90ff",
				"#3742fa",
				"",
				"",
				"",
				"",
				"",
	        ],
	        label: 'My dataset' // for legend
	    }],
	    labels: inflectgubunResult
	};
	var ctx = $("#polar-chart");
	new Chart(ctx, {
	    data: data,
	    type: 'polarArea'
	});
	
});


/*borderColor:'rgba(64,71,96,1.0)',
borderWidth:3,
fill:false,
pointRadius:4,
pointHoverRadius:8,
pointBorderColor:'rgba(19,58,168,1.0)',
pointBackgroundColor:'rgba(19,58,168,1.0)',
pointHoverBorderColor:'rgba(223,227,239,1.0)',
pointHoverBackgroundColor:'rgba(223,227,239,1.0)',*/

	


