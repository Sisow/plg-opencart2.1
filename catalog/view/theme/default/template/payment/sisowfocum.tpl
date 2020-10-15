<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowfocum_payment" class="checkout-content">
  <img src="https://www.achterafbetalen.nl/files/logo.png" alt="Achteraf Betalen" height="70px" title="Achteraf Betalen" style="vertical-align: middle;" />
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
	  <div class="form-group col-md-2">
		<label for="sisowiban">IBAN</label>
		<input type="text" id="sisowiban" name="sisowiban" class="form-control" maxlength="22" value="" />
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
</div>
<div class="row">
<div class="pull-right">
	<a target="_blank" href="https://www.sisow.nl"><img src="https://www.sisow.nl/images/betaallogos/logo_sisow_klein.png" alt="Powered by Sisow" height="25px"/></a>
</div>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowfocum_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowfocum_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowfocum/redirectbank',
		data: $('#sisowfocum_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowfocum_confirm').button('loading');
		},
		complete: function() {
			$('#sisowfocum_confirm').button('reset');
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





