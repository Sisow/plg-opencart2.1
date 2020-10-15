<?php

include 'sisow.php';

class ControllerPaymentSisowKlarna extends ControllerPaymentSisow {
	public function index() {
		return $this->_index('sisowklarna');
	}

	public function notify() {
		$this->_notify('sisowklarna');
	}

	public function redirectbank() {
		$this->_redirectbank('sisowklarna');
	}
}
?>
