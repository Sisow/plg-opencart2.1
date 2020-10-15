<?php

include 'sisow.php';

class ControllerPaymentSisowCbc extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowcbc');
	}
	
	public function notify() {
		$this->_notify('sisowcbc');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowcbc');
	}
}
?>
