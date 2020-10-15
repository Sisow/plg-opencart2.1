<!--<script src="https://cdn.klarna.com/public/kitt/core/v1.0/js/klarna.min.js" ></script>  
<script src="https://cdn.klarna.com/public/kitt/toc/v1.1/js/klarna.terms.min.js" ></script>-->
<!--<h2><?php echo $text_header; ?></h2>-->
<div id="sisowklaacc_payment" class="<?php echo substr(VERSION, 0, 3) == '1.4' ? '' : 'checkout-'; ?>content">
  <input type="hidden" id="sisowpclass" name="sisowpclass" value="<?php echo $text_pclass; ?>" />
  <img src="https://cdn.klarna.com/public/images/NL/badges/v1/account/NL_account_badge_std_blue.png?height=50&eid=<?php echo $text_klarnaid; ?>" alt="Klarna Account" title="Klarna Account" style="vertical-align: middle;" />
  <br/><br/>
  <!--<?php echo $text_description; ?>-->
  Klarna Acount - <?php echo $text_monthly; ?> / maand
  <br/>
  <img src="https://www.sisow.nl/images/betaallogos/lenenkostgeld.jpg" alt="Sisow Klarna Account" />
  <br/><br/>
  Aanhef&nbsp;&nbsp;<select name="sisowgender">
    <option value="">Kies aanhef</option>
	<option value="M">De heer</option>
	<option value="F">Mevrouw</option>
  </select>
  <br/><br/>
  Telefoonnummer&nbsp;&nbsp;<input type="text" id="sisowphone" name="sisowphone" style="width: 100px;" maxlength="12" value="" />
  <br/><br/>
  Geboortedatum (DD MM JJJJ)&nbsp;&nbsp;
  <input type="text" id="sisowday" name="sisowday" style="width: 25px;" maxlength="2" />
  <input type="text" id="sisowmonth" name="sisowmonth" style="width: 25px;" maxlength="2" />
  <input type="text" id="sisowyear" name="sisowyear" style="width: 50px;" maxlength="4" />
  <br/><br/>
  <div id="klarna_account"></div>
  <!--<script type="text/javascript">
             new Klarna.Terms.Account({
                 el: 'klarna_account',
                 eid: <?php echo $text_klarnaid; ?>,
                 country: 'nl'
             })
  </script>-->
  <a target="_blank" href="https://online.klarna.com/account_nl.yaws?eid=<?php echo $text_klarnaid; ?>">Lees meer!</a>
</div>
			<div style="text-align: right; width: 75%;">
				<a target="_blank" href="https://www.sisow.nl"><img src="https://www.sisow.nl/images/betaallogos/logo_sisow_klein.png" alt="Powered by Sisow" width="100px"/></a>
			</div>
<div class="buttons">
<?php if (substr(VERSION, 0, 3) == '1.4') { ?>
  <table>
    <tr>
      <td align="left"><a onclick="location = '<?php echo str_replace('&', '&amp;', $back); ?>'" class="button"><span><?php echo $button_back; ?></span></a></td>
      <td align="right"><a id="sisowklaacc_confirm" class="button"><span><?php echo $button_confirm; ?></span></a></td>  
    </tr>
  </table>
<?php } else { ?>
  <div class="right"><a id="sisowklaacc_confirm" class="button"><span><?php echo $button_confirm; ?></span></a></div>  
<?php } ?>
</div>
<script type="text/javascript"><!--
function sisowklaacc_click() {
	$.ajax({
		type: 'POST',
		timeout: 90000,
		url: 'index.php?route=payment/sisowklaacc/redirectbank',
		data: $('#sisowklaacc_payment :input'),
		dataType: 'json',
		error: function(par1, par2) {
<?php if (substr(VERSION, 0, 3) == '1.4') { ?>
			$('.wait').remove();
<?php } else { ?>
			$('.attention').remove();
<?php } ?>
			alert('error ' + par2);
			$('#sisowklaacc_confirm').attr('disabled', false);
		},
		beforeSend: function() {
			$('#sisowklaacc_confirm').attr('disabled', true);
			$('#sisowklaacc_confirm').unbind();
<?php if (substr(VERSION, 0, 3) == '1.4') { ?>
			$('#sisowklaacc_payment').before('<div class="wait"><img src="catalog/view/theme/default/image/loading_1.gif" alt="" /><?php echo $text_redirect; ?></div>');
<?php } else { ?>
			$('#sisowklaacc_payment').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /><?php echo $text_redirect; ?></div>');
<?php } ?>
		},
		success: function(json) {
			if (json['error']) {
<?php if (substr(VERSION, 0, 3) == '1.4') { ?>
				$('.wait').remove();
<?php } else { ?>
				$('.attention').remove();
<?php } ?>
				alert(json['error']);
				$('#sisowklaacc_confirm').attr('disabled', false);
				$('#sisowklaacc_confirm').bind('click', sisowklaacc_click);
			}
			if (json['success']) {
				location = json['success'];
			}
		}
	});
}
$('#sisowklaacc_confirm').bind('click', sisowklaacc_click);
//--></script> 
