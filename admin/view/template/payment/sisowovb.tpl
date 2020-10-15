<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			  <div class="pull-right">
				<button type="submit" form="form-ppexpress" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a> </div>
			  <h1><?php echo $heading_title; ?></h1>
			  <ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			  </ul>
		</div>
	</div>
	<div class="container-fluid">
	<?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-ppexpress" class="form-horizontal">
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="entry_merchantid"><?php echo $entry_merchantid; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_merchantid" value="<?php echo $sisowovb_merchantid; ?>" id="entry_merchantid" class="form-control" maxlength="32" size = "32"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group required">
			<label class="col-sm-2 control-label" for="entry_merchantkey"><?php echo $entry_merchantkey; ?></label>
			<div class="col-sm-4">
				<input type="text" name="sisowovb_merchantkey" value="<?php echo $sisowovb_merchantkey; ?>" id="entry_merchantkey" class="form-control" maxlength="64" size = "64"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>	
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_shopid"><?php echo $entry_shopid; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_shopid" value="<?php echo $sisowovb_shopid; ?>" id="entry_shopid" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_success"><?php echo $entry_success; ?></label>
			<div class="col-sm-2">
				<select name="sisowovb_status_success" id="entry_success" class="form-control">
				<?php foreach ($order_statuses as $order_status) { ?>
				<?php if ($order_status['order_status_id'] == $sisowovb_status_success) { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
				<?php } ?>
				<?php } ?>
			  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_businessonly"><?php echo $entry_businessonly; ?></label>
			<div class="col-sm-2">
				<select name="sisowovb_businessonly" id="entry_businessonly" class="form-control"><?php if($entry_businessonly == "yes"){ ?>
				 <option value="true" selected="selected"><?php echo $text_yes; ?></option> 
					<option value="false"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="true"><?php echo $text_yes; ?></option>
					<option value="false" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_ovbprefix"><?php echo $entry_ovbprefix; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_prefix" value="<?php echo $sisowovb_prefix; ?>" id="entry_ovbprefix" class="form-control"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_days"><?php echo $entry_days; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_days" value="<?php echo $sisowovb_days; ?>" id="entry_days" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
	  
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_paylink"><?php echo $entry_paylink; ?></label>
			<div class="col-sm-2">
				<select name="sisowovb_paylink" id="entry_paylink" class="form-control">
				 <?php if($entry_paylink == "yes"){ ?>
				 <option value="true" selected="selected"><?php echo $text_yes; ?></option>
					<option value="false"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="true"><?php echo $text_yes; ?></option>
					<option value="false" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
			</div>
		</div>
				
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_testmode"><?php echo $entry_testmode; ?></label>
			<div class="col-sm-2">
					<select name="sisowovb_testmode" id="entry_testmode" class="form-control">
					<?php if ($sisowovb_testmode=="true") { ?>
					<option value="true" selected="selected"><?php echo $text_yes; ?></option>
					<option value="false"><?php echo $text_no; ?></option>
					<?php } else { ?>
					<option value="true"><?php echo $text_yes; ?></option>
					<option value="false" selected="selected"><?php echo $text_no; ?></option>
					<?php } ?>
				  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_total"><?php echo $entry_total; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_total" value="<?php echo $sisowovb_total; ?>" id="entry_total" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_totalmax"><?php echo $entry_totalmax; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_totalmax" value="<?php echo $sisowovb_totalmax; ?>" id="entry_totalmax" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_geo_zone"><?php echo $entry_geo_zone; ?></label>
			<div class="col-sm-2">
					<select name="sisowovb_geo_zone_id" id="entry_geo_zone" class="form-control">
					  <option value="0"><?php echo $text_all_zones; ?></option>
					  <?php foreach ($geo_zones as $geo_zone) { ?>
					  <?php if ($geo_zone['geo_zone_id'] == $sisowovb_geo_zone_id) { ?>
					  <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
					  <?php } else { ?>
					  <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
					  <?php } ?>
					  <?php } ?>
					</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_status"><?php echo $entry_status; ?></label>
			<div class="col-sm-2">
					<select name="sisowovb_status" id="entry_status" class="form-control">
						<?php if ($sisowovb_status) { ?>
						<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
						<option value="0"><?php echo $text_disabled; ?></option>
						<?php } else { ?>
						<option value="1"><?php echo $text_enabled; ?></option>
						<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
						<?php } ?>
					  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="entry_sort_order"><?php echo $entry_sort_order; ?></label>
			<div class="col-sm-2">
				<input type="text" name="sisowovb_sort_order" value="<?php echo $sisowovb_sort_order; ?>" id="entry_sort_order" class="form-control" maxlength="8" size = "8"/>
				<?php if (isset($error['username'])) { ?>
				<div class="text-danger"><?php echo $error['username']; ?></div>
				<?php } ?>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<?php echo $entry_version_status ?>: 
				<?php echo $text_version ?>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				Sisow B.V.<br />
				Email: <a href="mailto:support@sisow.nl">support@sisow.nl</a><br />
				Web: <a href="http://www.sisow.nl" target="_blank">http://www.sisow.nl</a><br />
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<img src="view/image/payment/sisow.png" alt="Sisow" title="Sisow" height="60" />
			</div>
		</div>
	</form>	
</div>
<?php echo $footer; ?> 

<?php echo $header; ?>

  
 
    
 
