<?php

include 'sisow.php';

class ControllerPaymentSisowOvb extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowovb');
	}

	public function notify() {
		$this->_notify('sisowovb');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowovb');
	}
}
?>
