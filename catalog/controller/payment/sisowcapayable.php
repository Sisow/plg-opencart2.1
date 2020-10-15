<?php

include 'sisow.php';

class ControllerPaymentSisowCapayable extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowcapayable');
	}
	
	public function notify() {
		$this->_notify('sisowcapayable');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowcapayable');
	}
}
?>
