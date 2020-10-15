<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowpp_payment" class="checkout-content">
  <img src="https://www.sisow.nl/Sisow/images/ideal/paypal.gif" border="0" />
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowpp_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowpp_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowpp/redirectbank',
		data: $('#sisowpp_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowpp_confirm').button('loading');
		},
		complete: function() {
			$('#sisowpp_confirm').button('reset');
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

