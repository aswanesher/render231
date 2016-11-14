<style>
		#chart
		{
			z-index:-10;
		}
                    .box{
        display: none;
    }
    .sales{ background: none; }
    .year{ background: none; }
    .month{ background: none; }
		
</style>
<script src="<?php echo base_url(); ?>assets/backend/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('input[type="radio"]').click(function(){
        if($(this).attr("value")=="sales"){
            $(".box").not(".sales").hide();
            $(".sales").show();
        }
        if($(this).attr("value")=="year"){
            $(".box").not(".year").hide();
            $(".year").show();
        }
        if($(this).attr("value")=="month"){
            $(".box").not(".month").hide();
            $(".month").show();
        }/*
        if($(this).attr("value")=="date"){
            $(".box").not(".date").hide();
            $(".date").show();
        }*/
    });
});
</script>
<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
		</h1>
	</div><!-- /.page-header -->

	<div class="row">

		<div class="col-xs-12">
                                    <div class="widget-box">
        <label><input type="radio" name="mpenjulanRadio" value="sales"> Sales Target </label>
        <label><input type="radio" name="mpenjulanRadio" value="year"> Year Target</label>
        <label><input type="radio" name="mpenjulanRadio" value="month"> Month Target</label>
       <!-- <label><input type="radio" name="mpenjulanRadio" value="date"> Date Target</label> -->
                                    </div>
                    <div class="month box">
			<div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Month Target</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>salestarget/mpenjualan">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
                                                                            <select class="form-control" id="form-field-select-1" name="target" required="true">
                                                                                <option value="">-- Target --</option>
                                                                                			<?php
			foreach ($target as $m) {
			?>
			<option value="<?php echo $m->id_target?>"><?php echo ucfirst($m->month_target);?></option>
			 <?php } ?>
									</select>

									<!--<span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span> 
                                                                            <select class="form-control" id="form-field-select-1" name="sales">
										<option value="">-- Sales --</option>
			<?php
			foreach ($sales as $m) {
			?>
			<option value="<?php echo $m->id?>"><?php echo ucfirst($m->name);?></option>
			 <?php } ?>
									</select> -->
                                                                            <input type="hidden" name="status" id="status" value="1">
									<span class="input-group-btn">
									<button type="submit" class="btn btn-purple btn-sm">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
                        </div>
                    <div class="year box">
                    <div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Year Target</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>salestarget/mpenjualan">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
                                                                            <select class="form-control" id="form-field-select-1" name="target" required="true">
                                                                                <option value="">-- Year Target --</option>
                                                                                <?php
                                                                                                    foreach (range(2010, (int)date("Y")) as $years) {
                                                                                                        ?>
                                                                                <option value='<?php echo $years; ?>'> <?php echo $years; ?></option>
                                                                                <?php
                                                                                                    }
                                                                                ?>
									</select>
                                                                            <input type="hidden" name="status" id="status" value="2">
									<span class="input-group-btn">
									<button type="submit" class="btn btn-purple btn-sm">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
                    </div>
                    </div>
                    <div class="sales box">
                    <div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Sales Target</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>salestarget/mpenjualan">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
                                                                            <select class="form-control" id="form-field-select-1" name="target" required="true">
                                                                                <option value="">-- Year Target --</option>
                                                                                <?php
                                                                                                    foreach (range(2010, (int)date("Y")) as $years) {
                                                                                                        ?>
                                                                                <option value='<?php echo $years; ?>'> <?php echo $years; ?></option>
                                                                                <?php
                                                                                                    }
                                                                                ?>
									</select>
                                                                   <span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span> 
                                                                            <select class="form-control" id="form-field-select-1" name="sales" required="true">
										<option value="">-- Sales --</option>
			<?php
			foreach ($sales as $m) {
			?>
			<option value="<?php echo $m->id?>"><?php echo ucfirst($m->name);?></option>
			 <?php } ?>
									</select>
                                                                            <input type="hidden" name="status" id="status" value="3">
									<span class="input-group-btn">
									<button type="submit" class="btn btn-purple btn-sm">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
                    </div>
                    </div> <!--
                    <div class="date box">
                    <div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Date Target</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>salestarget/mpenjualan">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-calendar-o"></i>
									</span>
                                                                            <input type="text" class="form-control" name="dateawal" required="true" placeholder="Tanggal Awal e.g 2016-04-25">
                                                                   <span class="input-group-addon">
									<i class="ace-icon fa fa-calendar-o"></i>
									</span>
                                                                            <input type="text" class="form-control" name="dateakhir" required="true" placeholder="Tanggal Akhir e.g 2016-05-25">
                                                                            <input type="hidden" name="status" id="status" value="4">
									<span class="input-group-btn">
									<button type="submit" class="btn btn-purple btn-sm">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
                    </div>
                    </div> -->
		</div>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="row">
                        <div id="chart"></div>
                        
                        				<div class="col-xs-12">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
                                           <?php if($status == 1) { ?>
						<thead>
							<tr>
								<th>#</th>
                                                                <th>Sales</th>
                                                                <th>Sum (Jumlah Jual)</th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
                                                
						foreach ($isi as $row) {
                                                    
						?>
							<tr>

								<td><?php echo $a;?></td>
                                                                <td><?php echo  $row['user_login'];?></td>
                                                                <td><?php echo (float)$row['jumlah_jual'];?></td>

							</tr>
						<?php
						$a++;
						 }  
                                                 echo '</tbody>';
                                                }
                                                 
                                                 elseif ($status == 2) { ?>
						<thead>
							<tr>
								<th>#</th>
                                                                <th>Month</th>
                                                                <th>Sum (Jumlah Jual)</th>
							</tr>
						</thead>  
                                                     <tbody>
						<?php
						$a=1;
                                                
						foreach ($isi as $row) {
                                                    
						?>
							<tr>

								<td><?php echo $a;?></td>
                                                                <td><?php echo  $row['month_target'];?></td>
                                                                <td><?php echo (float)$row['jj'];?></td>

							</tr>
                                                 <?php
                                                }
                                                 echo '</tbody>'; }
                                                 ?>
						
					</table>
					<center><?php echo $this->pagination->create_links(); ?></center>
				</div><!-- /.span -->
                        
                        </div><!-- /.row -->




</div><!-- /.page-content -->
        <script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/highcharts.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/modules/exporting.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/highcharts/themes/skies.js"></script>
<?php 
if ($status == 1) { ?>
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
			categories: <?php echo json_encode($salesa); ?>
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
    <?php  
    
}
elseif($status == 2) {
    ?>
<script type="text/javascript">
jQuery(function(){
	new Highcharts.Chart({
		chart: {
			renderTo: 'chart',
			type: 'line',
		},
		title: {
			text: 'Data persentase Tahun <?php echo $tahun; ?>',
			x: -20
		},
		subtitle: {
			text: 'Grafik',
			x: -20
		},
		xAxis: {
			categories: <?php echo json_encode($month); ?>
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
<?php
}
elseif($status == 3) {
    ?>
<script type="text/javascript">
jQuery(function(){
	new Highcharts.Chart({
		chart: {
			renderTo: 'chart',
			type: 'line',
		},
		title: {
			text: 'Data persentase Tahun',
			x: -20
		},
		subtitle: {
			text: 'Grafik',
			x: -20
		},
		xAxis: {
			categories: <?php echo json_encode($month); ?>
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
<?php
}
?>
