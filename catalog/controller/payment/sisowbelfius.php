<?php

include 'sisow.php';

class ControllerPaymentSisowBelfius extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowbelfius');
	}
	
	public function notify() {
		$this->_notify('sisowbelfius');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowbelfius');
	}
}
?>
