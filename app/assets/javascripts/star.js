$(document).ready(function() {
	$(".star-piechart").each(function(){
		var spatial = $(this).data('spatial');
		var tactile = $(this).data('tactile');
		var auditory = $(this).data('auditory');
		var reading = $(this).data('reading');
		
		var data = [{
			value: spatial,
			color: "#2293CC",
			label: 'Spatial',
			labelColor: '#111',
			labelFontSize: '18'
		}, {
			value: tactile,
			color: "#477E99",
			label: 'Tactile',
			labelColor: '#111',
			labelFontSize: '18'
		}, {
			value: auditory,
			color: "#FF6551",
			label: 'Auditory',
			labelColor: '#111',
			labelFontSize: '18'
		}, {
			value: reading,
			color: "#11FFCE",
			label: 'Reading',
			labelColor: '#111',
			labelFontSize: '18'
		}];
		new Chart($(this).get(0).getContext("2d")).Pie(data, {labelAlign: 'center'});
	});
});
