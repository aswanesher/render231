<section class="h_top_part">
	<div class="container">
		<div class="row clearfix">
			<div class="col-lg-12 col-md-12 col-sm-5 t_xs_align_c">
				<ul class="d_inline_b horizontal_list clearfix f_size_small users_nav">
					<marquee>
					<?php foreach ($runningtext as $row) { ?>
					<li><b><?php echo $row->post_content;?></b></li>
					<?php } ?>
					</marquee>
				</ul>
			</div>
		</div>
	</div>
</section>