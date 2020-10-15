<?php 

include 'sisow/sisow.php';

class ControllerPaymentSisowKlarna extends ControllerPaymentSisow {
	public function index() {
		$this->_index('sisowklarna');
	}

	public function validate() {
		return $this->_validate('sisowklarna');
	}
}
?>
