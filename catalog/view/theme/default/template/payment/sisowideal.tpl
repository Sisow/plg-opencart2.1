<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowideal_payment" class="checkout-content">
  <img src="https://www.sisow.nl/Sisow/images/ideal/idealklein.gif" alt="iDEAL" title="iDEAL" style="vertical-align: middle;" />
  <?php echo $text_bank; ?>
  &nbsp;
  <select id="sisowbank" name="sisowbank">
    <option value="">Kies uw bank...</option>
<?php foreach ($banks as $bankid => $bankname) { ?>
    <option value="<?php echo $bankid; ?>"><?php echo $bankname; ?></option>
<?php } ?>
  </select>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowideal_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowideal_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowideal/redirectbank',
		data: $('#sisowideal_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowideal_confirm').button('loading');
		},
		complete: function() {
			$('#sisowideal_confirm').button('reset');
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
