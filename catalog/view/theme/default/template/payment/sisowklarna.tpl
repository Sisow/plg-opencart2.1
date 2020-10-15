<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowklarna_payment" class="checkout-content">
  <img src="https://cdn.klarna.com/public/images/NL/badges/v1/invoice/NL_invoice_badge_std_blue.png?height=50&eid=<?php echo $text_klarnaid; ?>" alt="Klarna Factuur" title="Klarna Factuur" style="vertical-align: middle;" />
  <br/><br/>
  <?php echo $text_description; ?>
  <br/>
  
  <div class="row">
	  <div class="form-group col-md-2">
		<label for="gender">Aanhef</label>
		<select name="sisowgender" id="gender" class="form-control">
			<option value="">Kies aanhef</option>
			<option value="M">De heer</option>
			<option value="F">Mevrouw</option>
	  </select>
	  </div>
  </div>
  <div class="row">
	  <div class="form-group col-md-2">
		<label for="sisowphone">Telefoonnummer</label>
		<input type="text" id="sisowphone" name="sisowphone" class="form-control" maxlength="12" value="" />
	  </div>
  </div>
  <div class="row">
		<label for="sisowday">Geboortedatum (DD MM JJJJ)</label>
	  <div class="form-group">
			<div class="col-md-1"><input type="text" id="sisowday" name="sisowday" maxlength="2" class="form-control" /></div>
			<div class="col-md-1"><input type="text" id="sisowmonth" name="sisowmonth" maxlength="2" class="form-control" /></div>
			<div class="col-md-1"><input type="text" id="sisowyear" name="sisowyear" maxlength="4" class="form-control" /></div>
	  </div>
  </div>
  
  <?php echo $text_paymentfee; ?>
  <br/><br/>
  <div id="klarna_invoice"></div>
  <a target="_blank" href="https://online.klarna.com/villkor_nl.yaws?eid=<?php echo $text_klarnaid; ?>&charge=<?php echo round($text_fee, 2); ?>">Klarna factuurvoorwaarden</a>
</div>
<div class="row">
<div class="pull-right">
	<a target="_blank" href="https://www.sisow.nl"><img src="https://www.sisow.nl/images/betaallogos/logo_sisow_klein.png" alt="Powered by Sisow" height="25px"/></a>
</div>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowvisa_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowvisa_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowklarna/redirectbank',
		data: $('#sisowklarna_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowvisa_confirm').button('loading');
		},
		complete: function() {
			$('#sisowvisa_confirm').button('reset');
		},		
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}
		}		
	});
});
//--></script> 





