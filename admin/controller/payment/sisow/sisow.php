<?php 

class ControllerPaymentSisow extends Controller {
	public $error = array(); 

	public function _index($payment) {		
		$this->load->language('payment/sisow'); // . $payment);
		$this->load->model('setting/setting');

		$this->document->setTitle($this->language->get('heading_title_' . $payment));

		// Sisow ecare payment fee tonen bij checkout
		if ($payment == 'sisowfocum' || $payment == 'sisowklarna' || $payment == 'sisowpp') {
			$do = false;
			$this->load->model('extension/extension');
			
			$totals = $this->model_extension_extension->getInstalled('total');
			foreach ($totals as $total) {
				if ($total == $payment . 'fee') {
					$do = true;
					break;
				}
			}
			if (!$do) {
				$this->model_extension_extension->install('total', $payment . 'fee');
				//$this->load->model('setting/setting');
				$post[$payment . 'fee_sort_order'] = 4;
				$post[$payment . 'fee_status'] = 1;
				$this->model_setting_setting->editSetting($payment . 'fee', $post);
			}
		}

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$this->model_setting_setting->editSetting($payment, $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			if (substr(VERSION, 0, 3) == '1.4') {
				if (substr(VERSION, 0, 5) == '1.4.8' || substr(VERSION, 0, 5) == '1.4.9') {
					$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token']);
				}
				else {
					$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/payment');
				}
			}
			else {
				$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title_' . $payment);

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_version'] = $this->language->get('text_version');

		$data['entry_merchantid'] = $this->language->get('entry_merchantid');
		$data['entry_merchantkey'] = $this->language->get('entry_merchantkey');
		$data['entry_shopid'] = $this->language->get('entry_shopid');
		$data['entry_success'] = $this->language->get('entry_success');
		$data['entry_testmode'] = $this->language->get('entry_testmode');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_totalmax'] = $this->language->get('entry_totalmax');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_version_status'] = $this->language->get('entry_version_status');
		
		if($payment == 'sisowafterpay')
			$data['entry_useb2b'] = $this->language->get('entry_useb2b');
		
		if ($payment == 'sisowecare' || $payment == 'sisowklarna' || $payment == 'sisowklaacc' || $payment == 'sisowfocum') {
			$data['entry_makeinvoice'] = $this->language->get('entry_makeinvoice');
			$data['entry_mailinvoice'] = $this->language->get('entry_mailinvoice');
			$data['text_none'] = 'Geen'; //$this->language->get('text_none');
			if ($payment != 'sisowklaacc') {
				$data['entry_paymentfee'] = $this->language->get('entry_paymentfee');
				$data['entry_'.$payment.'fee_tax'] = $this->language->get('entry_'.$payment.'fee_tax');
				$this->load->model('localisation/tax_class');
				$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
			}
			if ($payment != 'sisowecare') {
				$data['entry_paymentfee'] = $this->language->get('entry_klarnapaymentfee');
				$data['entry_pending'] = $this->language->get('entry_pending');
				$data['entry_klarnaid'] = $this->language->get('entry_klarnaid');
			}
		}
		else if ($payment == 'sisowovb') {
			$data['entry_businessonly'] = $this->language->get('entry_businessonly');
			$data['entry_days'] = $this->language->get('entry_days');
			$data['entry_paylink'] = $this->language->get('entry_paylink');
			$data['entry_ovbprefix'] = $this->language->get('entry_ovbprefix');
		}
		else if ($payment == 'sisowpp') {
			$data['entry_paymentfee'] = $this->language->get('entry_paymentfee');
			$data['entry_sisowppfee_tax'] = $this->language->get('entry_sisowppfee_tax');
			$data['text_none'] = 'Geen'; //$this->language->get('text_none');
			$this->load->model('localisation/tax_class');
			$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		}

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['username'])) {
			$data['error_username'] = $this->error['username'];
		}
		else {
			$data['error_username'] = '';
		}

		$data['breadcrumbs'] = array();

		if (substr(VERSION, 0, 3) == '1.4') {
			if (substr(VERSION, 0, 5) == '1.4.8' || substr(VERSION, 0, 5) == '1.4.9') {
				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
					'text' => $this->language->get('text_home'),
					'separator' => false
					);

				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'],
					'text' => $this->language->get('text_payment'),
					'separator' => ' :: '
					);

				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . "index.php?route=payment/$payment&token=" . $this->session->data['token'],
					'text' => $this->language->get('heading_title_' . $payment),
					'separator' => ' :: '
					);
						
				$data['action'] = HTTPS_SERVER . "index.php?route=payment/$payment&token=" . $this->session->data['token'];

				$data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];
			}
			else {
				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . 'index.php?route=common/home',
					'text' => $this->language->get('text_home'),
					'separator' => false
					);

				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . 'index.php?route=extension/payment',
					'text' => $this->language->get('text_payment'),
					'separator' => ' :: '
					);

				$data['breadcrumbs'][] = array(
					'href' => HTTPS_SERVER . 'index.php?route=payment/' . $payment,
					'text' => $this->language->get('heading_title_' . $payment),
					'separator' => ' :: '
					);
						
				$data['action'] = HTTPS_SERVER . 'index.php?route=payment/' . $payment;

				$data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/payment';
			}
		}
		else {
			$data['breadcrumbs'][] = array(
				'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'text' => $this->language->get('text_home'),
				'separator' => false
				);

			$data['breadcrumbs'][] = array(
				'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
				'text' => $this->language->get('text_payment'),
				'separator' => ' :: '
				);

			$data['breadcrumbs'][] = array(
				'href' => $this->url->link("payment/$payment", 'token=' . $this->session->data['token'], 'SSL'),
				'text' => $this->language->get('heading_title_' . $payment),
				'separator' => ' :: '
				);
					
			$data['action'] = $this->url->link("payment/$payment", 'token=' . $this->session->data['token'], 'SSL');

			$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		}

		// Merchant ID
		if (isset($this->request->post[$payment . '_merchantid'])) {
			$data[$payment . '_merchantid'] = $this->request->post[$payment . '_merchantid'];
		}
		else {
			$data[$payment . '_merchantid'] = $this->config->get($payment . '_merchantid');
		}

		// Order status
		if (isset($this->request->post[$payment . '_status_success'])) {
			$data[$payment . '_status_success'] = $this->request->post[$payment . '_status_success'];
		}
		else {
			$data[$payment . '_status_success'] = $this->config->get($payment . '_status_success'); 
		} 

		// Test mode
		if (isset($this->request->post[$payment . '_testmode'])) {
			$data[$payment . '_testmode'] = $this->request->post[$payment . '_testmode'];
		}
		else {
			$data[$payment . '_testmode'] = $this->config->get($payment . '_testmode');
		} 

		// Minimum
		if (isset($this->request->post[$payment . '_total'])) {
			$data[$payment . '_total'] = $this->request->post[$payment . '_total'];
		} else {
			$data[$payment . '_total'] = $this->config->get($payment . '_total'); 
		} 

		// Maximum
		if (isset($this->request->post[$payment . '_totalmax'])) {
			$data[$payment . '_totalmax'] = $this->request->post[$payment . '_totalmax'];
		} else {
			$data[$payment . '_totalmax'] = $this->config->get($payment . '_totalmax'); 
		} 

		// Merchant Key
		if (isset($this->request->post[$payment . '_merchantkey'])) {
			$data[$payment . '_merchantkey'] = $this->request->post[$payment . '_merchantkey'];
		}
		else {
			$data[$payment . '_merchantkey'] = $this->config->get($payment . '_merchantkey'); 
		} 
		
		// ShopID
		if (isset($this->request->post[$payment . '_shopid'])) {
			$data[$payment . '_shopid'] = $this->request->post[$payment . '_shopid'];
		}
		else {
			$data[$payment . '_shopid'] = $this->config->get($payment . '_shopid'); 
		} 
		
		// Geo Zone
		$this->load->model('localisation/geo_zone');
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post[$payment . '_geo_zone_id'])) {
			$data[$payment . '_geo_zone_id'] = $this->request->post[$payment . '_geo_zone_id'];
		} else {
			$data[$payment . '_geo_zone_id'] = $this->config->get($payment . '_geo_zone_id'); 
		} 

		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		// Active y/n
		if (isset($this->request->post[$payment . '_status'])) {
			$data[$payment . '_status'] = $this->request->post[$payment . '_status'];
		}
		else {
			$data[$payment . '_status'] = $this->config->get($payment . '_status');
		}

		// Sort order
		if (isset($this->request->post[$payment . '_sort_order'])) {
			$data[$payment . '_sort_order'] = $this->request->post[$payment . '_sort_order'];
		}
		else {
			$data[$payment . '_sort_order'] = $this->config->get($payment . '_sort_order');
		}
		
		if($payment == 'sisowafterpay')
		{
			// Test mode
			if (isset($this->request->post[$payment . '_useb2b'])) {
				$data[$payment . '_useb2b'] = $this->request->post[$payment . '_useb2b'];
			}
			else {
				$data[$payment . '_useb2b'] = $this->config->get($payment . '_useb2b');
			} 
		}
		
		if ($payment == 'sisowecare' || $payment == 'sisowklarna' || $payment == 'sisowklaacc' || $payment == 'sisowfocum') {
			// Make invoice
			if (isset($this->request->post[$payment . '_makeinvoice'])) {
				$data[$payment . '_makeinvoice'] = $this->request->post[$payment . '_makeinvoice'];
			}
			else {
				$data[$payment . '_makeinvoice'] = $this->config->get($payment . '_makeinvoice');
			}
			// Mail invoice
			if (isset($this->request->post[$payment . '_mailinvoice'])) {
				$data[$payment . '_mailinvoice'] = $this->request->post[$payment . '_mailinvoice'];
			}
			else {
				$data[$payment . '_mailinvoice'] = $this->config->get($payment . '_mailinvoice');
			}
			if ($payment != 'sisowklaacc') {
				// Payment fee
				if (isset($this->request->post[$payment . '_paymentfee'])) {
					$data[$payment . '_paymentfee'] = $this->request->post[$payment . '_paymentfee'];
				}
				else {
					$data[$payment . '_paymentfee'] = $this->config->get($payment . '_paymentfee');
				}
				// Payment fee tax class
				if (isset($this->request->post[$payment . 'fee_tax'])) {
					$data[$payment . 'fee_tax'] = $this->request->post[$payment . 'fee_tax'];
				}
				else {
					$data[$payment . 'fee_tax'] = $this->config->get($payment . 'fee_tax');
				}
			}
			if ($payment == 'sisowklarna' || $payment == 'sisowklaacc') {
				// Pending status
				if (isset($this->request->post[$payment . '_status_pending'])) {
					$data[$payment . '_status_pending'] = $this->request->post[$payment . '_status_pending'];
				}
				else {
					$data[$payment . '_status_pending'] = $this->config->get($payment . '_status_pending'); 
				}
				// Klarna Merchant ID
				if (isset($this->request->post[$payment . '_klarnaid'])) {
					$data[$payment . '_klarnaid'] = $this->request->post[$payment . '_klarnaid'];
				}
				else {
					$data[$payment . '_klarnaid'] = $this->config->get($payment . '_klarnaid'); 
				}
			}
		}
		else if ($payment == 'sisowovb') {
			// Business only
			if (isset($this->request->post[$payment . '_businessonly'])) {
				$data[$payment . '_businessonly'] = $this->request->post[$payment . '_businessonly'];
			}
			else {
				$data[$payment . '_businessonly'] = $this->config->get($payment . '_businessonly');
			}
			// Dagen
			if (isset($this->request->post[$payment . '_days'])) {
				$data[$payment . '_days'] = $this->request->post[$payment . '_days'];
			}
			else {
				$data[$payment . '_days'] = $this->config->get($payment . '_days');
			}
			// Paylink
			if (isset($this->request->post[$payment . '_paylink'])) {
				$data[$payment . '_paylink'] = $this->request->post[$payment . '_paylink'];
			}
			else {
				$data[$payment . '_paylink'] = $this->config->get($payment . '_paylink');
			}
			// Prefix
			if (isset($this->request->post[$payment . '_prefix'])) {
				$data[$payment . '_prefix'] = $this->request->post[$payment . '_prefix'];
			}
			else {
				$data[$payment . '_prefix'] = $this->config->get($payment . '_prefix');
			}
		}
		else if ($payment == 'sisowpp') {
			// Payment fee
			if (isset($this->request->post[$payment . '_paymentfee'])) {
				$data[$payment . '_paymentfee'] = $this->request->post[$payment . '_paymentfee'];
			}
			else {
				$data[$payment . '_paymentfee'] = $this->config->get($payment . '_paymentfee');
			}
			// Payment fee tax class
			if (isset($this->request->post[$payment . 'fee_tax'])) {
				$data[$payment . 'fee_tax'] = $this->request->post[$payment . 'fee_tax'];
			}
			else {
				$data[$payment . 'fee_tax'] = $this->config->get($payment . 'fee_tax');
			}
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$this->response->setOutput($this->load->view("payment/$payment.tpl", $data));
	}

	public function _validate($payment) {
		if (!$this->user->hasPermission('modify', "payment/$payment")) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!@$this->request->post[$payment . '_merchantid']) {
			$this->error['merchantid'] = $this->language->get('error_merchantid');
		}

		if (!@$this->request->post[$payment . '_merchantkey']) {
			$this->error['merchantkey'] = $this->language->get('error_merchantkey');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
