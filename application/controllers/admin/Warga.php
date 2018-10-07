<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Warga extends CI_Controller {

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


		// cek jika bukan rw, maka tidak bisa akses
		$user = $this->ion_auth->user()->row();
		$user_groups = $this->ion_auth->get_users_groups($user->id)->result();
		// print_r($user_groups[0]->name);
		if ( $user_groups[0]->name != "admin" ) {
			redirect('/');
		}

		$this->load->model('Warga_model', 'warga');
		// $this->load->library('upload');
	}

	public function index()
	{
		$data["warga"] = $this->warga->get();
		$this->load->view('admin/admin/warga/index', $data);
	}

	public function tambah(){
		$this->load->view('admin/admin/warga/tambah');
	}

	public function simpan(){
		// echo "<pre>";
		$_POST["password"] = md5($_POST["password"]);
		// print_r($_POST);

		// simpan data ke database
		$this->warga->save($_POST);

		echo "<script>
		alert('Data warga berhasil ditambahkan!');
		window.location.href='".base_url('admin/warga')."';
		</script>";
	}

	public function edit($id){
		$data["warga"] = $this->warga->get_by_id($id);		
		$this->load->view('admin/admin/warga/edit', $data);
	}

	public function update($id){
		
		if ( $_POST["password"] !== "" ) {	// jika ada password
			$_POST["password"] = md5($_POST["password"]);
		} else{
			unset($_POST["password"]);
		}

		$this->warga->update($_POST, $id);

		echo "<script>
			alert('Data warga berhasil diubah!');
			window.location.href='".base_url('admin/warga')."';
			</script>";
	}

	public function hapus($id){
		$this->warga->delete($id);

		echo "<script>
			alert('Data warga berhasil dihapus!');
			window.location.href='".base_url('admin/warga')."';
			</script>";
	}	
}
