<?php

include 'sisow.php';

class ControllerPaymentSisowFocum extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowfocum');
	}

	public function notify() {
		$this->_notify('sisowfocum');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowfocum');
	}
}
?>
