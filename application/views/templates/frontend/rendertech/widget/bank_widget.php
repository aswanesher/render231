<?php foreach ($bank as $img) { ?>    
<table width="18%" class="table table-bordered tbl-cart">
    <tbody>
        <tr>
            <td width="11%" rowspan="2" align="center" valign="middle" class="hidden-xs">
                <?php if ($img->thumb <> ""){ ?>
                    <img src="<?php echo $img->gambar;?>" alt="" width="160" height="100">
                <?php } else { ?>
                    <img src="<?php echo base_url()?>uploads/no_images.jpg" alt="" width="50" height="25">
                <?php } ?>
                </a>
            </td>
            <td width="25%" valign="middle"><strong><?php echo $img->nama?></strong><br><?php echo $img->keterangan;?></td>
        </tr>
    </tbody>
</table>
<?php } ?>