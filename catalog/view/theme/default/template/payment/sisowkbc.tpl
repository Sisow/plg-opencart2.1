<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowkbc_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/kbc.png" height="100px"/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowkbc_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowkbc_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowkbc/redirectbank',
		data: $('#sisowkbc_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowkbc_confirm').button('loading');
		},
		complete: function() {
			$('#sisowkbc_confirm').button('reset');
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
