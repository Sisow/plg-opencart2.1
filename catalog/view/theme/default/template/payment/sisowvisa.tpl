<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowvisa_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/visa.png" height="50px"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowvisa_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowvisa_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowvisa/redirectbank',
		data: $('#sisowideal_payment :input'),
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

