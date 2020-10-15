<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowcbc_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/cbc.png" height="100px"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowcbc_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowcbc_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowcbc/redirectbank',
		data: $('#sisowcbc_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowcbc_confirm').button('loading');
		},
		complete: function() {
			$('#sisowcbc_confirm').button('reset');
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
