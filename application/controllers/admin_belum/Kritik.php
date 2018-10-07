<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kritik extends CI_Controller {

	

	public function __construct(){
		parent::__construct();
		$this->load->model('Kritik_model', 'kritik');
	}

	public function index()
	{
		$data["kritik"] = $this->kritik->get();
		$this->load->view('admin/admin/kritik/index', $data);
	}

	public function tambah(){
		$this->load->view('admin/admin/kritik/tambah');
	}

	public function simpan(){
	// // 	// $new_name = time().$_FILES["foto"]['name'];
	// // 	$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);

	// // 	$config['file_name'] = time().".".$ext;
	// // 	$config['upload_path']          = './gambar/';
	// // 	$config['allowed_types']        = 'gif|jpg|png';
	// // 	// $config['max_size']             = 100;
	// // 	// $config['max_width']            = 1024;
	// // 	// $config['max_height']           = 768;
 
	// // 	$this->load->library('upload', $config);
 
	// // 	if ( ! $this->upload->do_upload('foto')){
	// // 		$error = array('error' => $this->upload->display_errors());
	// // 		echo "<pre>";
	// // 		print_r($error);
	// // 	}else{
	// // 		$_POST["foto"] = $config['file_name'];
		$this->kritik->save($_POST);

	 		echo "<script>
	 		alert('Data kritik berhasil ditambahkan!');
			window.location.href='".base_url('admin/kritik')."';
	 		</script>";
	 	}
	 

	public function edit($id){
		$data["kritik"] = $this->kritik->get_by_id($id);		
		$this->load->view('admin/admin/kritik/edit', $data);
	}

	public function update($id){
		
		// if ( $_FILES["foto"]["name"] !== "" ) {	// jika ada gambar
		// 	$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);

		// 	$config['file_name'] = time().".".$ext;
		// 	$config['upload_path']          = './gambar/';
		// 	$config['allowed_types']        = 'gif|jpg|png';
		// 	// $config['max_size']             = 100;
		// 	// $config['max_width']            = 1024;
		// 	// $config['max_height']           = 768;
	 
		// 	$this->load->library('upload', $config);
	 
		// 	if ( ! $this->upload->do_upload('foto')){
		// 		$error = array('error' => $this->upload->display_errors());
		// 		echo "<pre>";
		// 		print_r($error);
		// 	}else{
		// 		$_POST["foto"] = $config['file_name'];
		 		$this->kritik->update($_POST, $id);
		// 	}
		// } else{
		// 	$this->pengumuman->update($_POST, $id);
		// }

		echo "<script>
			alert('Data Kritik berhasil diubah!');
			window.location.href='".base_url('admin/kritik')."';
			</script>";
	}

	public function hapus($id){
		$this->kritik->delete($id);

		echo "<script>
			alert('Data kritik berhasil dihapus!');
			window.location.href='".base_url('admin/kritik')."';
			</script>";
	}
}
