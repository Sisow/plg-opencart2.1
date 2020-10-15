<?php
include 'sisow.php';

class ControllerPaymentSisowVVV extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowvvv');
	}

	public function notify() {
		$this->_notify('sisowvvv');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowvvv');
	}
}
?>
