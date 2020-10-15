<?php

include 'sisow.php';

class ControllerPaymentSisowBunq extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowbunq');
	}
	
	public function notify() {
		$this->_notify('sisowbunq');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowbunq');
	}
}
?>
