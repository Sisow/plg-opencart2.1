<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowmastercard_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/homepay.png"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowmastercard_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowmastercard_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowhomepay/redirectbank',
		data: $('#sisowideal_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowmastercard_confirm').button('loading');
		},
		complete: function() {
			$('#sisowmastercard_confirm').button('reset');
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
