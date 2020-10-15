<!--<h2><?php echo $text_header; ?></h2>-->
<form id="sisowbillink_payment" class="checkout-content">
	<fieldset>
  <img src="catalog/view/theme/default/image/billink.png"/>
  <br/><br/>
  
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
		<label>Geboortedatum (DD MM JJJJ)</label>
		  <div class="form-group">
				<div class="col-md-1"><input type="text" id="sisowday" name="sisowday" maxlength="2" class="form-control" /></div>
				<div class="col-md-1"><input type="text" id="sisowmonth" name="sisowmonth" maxlength="2" class="form-control" /></div>
				<div class="col-md-1"><input type="text" id="sisowyear" name="sisowyear" maxlength="4" class="form-control" /></div>
		  </div>
  </div>
  
	<div class="form-group">
		<input type="checkbox" id="bilterms" name="bilterms"/>
		<label for="bilterms">Ik ga akkoord met de <a href="https://www.billink.nl/docs/gebruikersvoorwaarden.pdf" target="_blank">Billink voorwaarden</a></label>
	</div>
  
  <?php echo $text_paymentfee; ?>
  </fieldset>
</div>
<div class="row">
<div class="pull-right">
	<a target="_blank" href="https://www.sisow.nl"><img src="https://www.sisow.nl/images/betaallogos/logo_sisow_klein.png" alt="Powered by Sisow" height="25px"/></a>
</div>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowbillink_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowbillink_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowbillink/redirectbank',
		data: jQuery('#sisowbillink_payment').serializeArray(),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowbillink_confirm').button('loading');
		},
		complete: function() {
			$('#sisowbillink_confirm').button('reset');
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





