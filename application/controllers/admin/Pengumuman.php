<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengumuman extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct(){
		parent::__construct();
		$this->load->model('Pengumuman_model', 'pengumuman');
	}

	public function index()
	{
		$data["pengumuman"] = $this->pengumuman->get();
		$this->load->view('admin/pengumuman/index', $data);
	}

	public function tambah(){
		$this->load->view('admin/pengumuman/tambah');
	}

	public function simpan(){
		// $new_name = time().$_FILES["foto"]['name'];
		$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);

		$config['file_name'] = time().".".$ext;
		$config['upload_path']          = './gambar/';
		$config['allowed_types']        = 'gif|jpg|png';
		// $config['max_size']             = 100;
		// $config['max_width']            = 1024;
		// $config['max_height']           = 768;
 
		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('foto')){
			$error = array('error' => $this->upload->display_errors());
			echo "<pre>";
			print_r($error);
		}else{
			$_POST["foto"] = $config['file_name'];
			$this->pengumuman->save($_POST);

			echo "<script>
			alert('Data pengumuman berhasil ditambahkan!');
			window.location.href='".base_url('admin/pengumuman')."';
			</script>";
		}
	}

	public function edit($id){
		$data["pengumuman"] = $this->pengumuman->get_by_id($id);		
		$this->load->view('admin/pengumuman/edit', $data);
	}

	public function update($id){
		
		if ( $_FILES["foto"]["name"] !== "" ) {	// jika ada gambar
			$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);

			$config['file_name'] = time().".".$ext;
			$config['upload_path']          = './gambar/';
			$config['allowed_types']        = 'gif|jpg|png';
			// $config['max_size']             = 100;
			// $config['max_width']            = 1024;
			// $config['max_height']           = 768;
	 
			$this->load->library('upload', $config);
	 
			if ( ! $this->upload->do_upload('foto')){
				$error = array('error' => $this->upload->display_errors());
				echo "<pre>";
				print_r($error);
			}else{
				$_POST["foto"] = $config['file_name'];
				$this->pengumuman->update($_POST, $id);
			}
		} else{
			$this->pengumuman->update($_POST, $id);
		}

		echo "<script>
			alert('Data pengumuman berhasil diubah!');
			window.location.href='".base_url('admin/pengumuman')."';
			</script>";
	}

	public function hapus($id){
		$this->pengumuman->delete($id);

		echo "<script>
			alert('Data pengumuman berhasil dihapus!');
			window.location.href='".base_url('admin/pengumuman')."';
			</script>";
	}
}
