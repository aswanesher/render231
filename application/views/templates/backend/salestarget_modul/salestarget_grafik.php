<style>
		#chart
		{
			z-index:-10;
		}
		
</style>

	
<div id="chart"></div>


<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/highcharts.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/modules/exporting.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/themes/skies.js"></script>
<script type="text/javascript">
jQuery(function(){
	new Highcharts.Chart({
		chart: {
			renderTo: 'chart',
			type: 'column',
		},
		title: {
			text: '<?php echo $nama_target->month_target; ?>',
			x: -20
		},
		subtitle: {
			text: 'Total yang Terjual <?php echo $sum->a; ?> dalam Target <?php echo $nama_target->qty_target; ?>',
			x: -20
		},
		xAxis: {
			categories: <?php echo json_encode($sales); ?>
		},
		yAxis: {
			title: {
				text: 'Penjualan'
			}
		},
		series: [{
			name: 'Penjualan',
			data: <?php echo json_encode($grafik); ?>
		}]
	});
}); 
</script>

</body>
</html>