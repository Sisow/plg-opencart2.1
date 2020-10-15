<?php

include 'sisow.php';

class ControllerPaymentSisowKlaAcc extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowklaacc');
	}

	public function notify() {
		$this->_notify('sisowklaacc');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowklaacc');
	}
}
?>
