<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowbelfius_payment" class="checkout-content">
  <img src="catalog/view/theme/default/image/belfius.png" alt="belfius" title="belfius" width="100px;" style="vertical-align: middle;" /><br/>
</div>
<div class="buttons pull-right">
  <input type="button" value="<?php echo $button_confirm; ?>" id="sisowbelfius_confirm" class="btn btn-primary" />
</div>

<script type="text/javascript"><!--
$('#sisowbelfius_confirm').on('click', function() {
	$.ajax({ 
		type: 'POST',
		url: 'index.php?route=payment/sisowbelfius/redirectbank',
		data: $('#sisowbelfius_payment :input'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#sisowbelfius_confirm').button('loading');
		},
		complete: function() {
			$('#sisowbelfius_confirm').button('reset');
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
