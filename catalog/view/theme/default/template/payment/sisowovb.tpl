<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowovb_payment" class="checkout-content">
  <img src="https://www.sisow.nl/Sisow/images/ideal/logo_sisow_klein.png" alt="Sisow OverBoeking" title="Sisow OverBoeking" style="vertical-align: middle;" />
  <br/>
  <?php echo $text_ovb; ?>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowovb_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowovb_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowovb/redirectbank',
		data: $('#sisowovb_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowovb_confirm').button('loading');
		},
		complete: function() {
			$('#sisowovb_confirm').button('reset');
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