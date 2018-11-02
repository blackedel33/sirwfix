<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cek extends CI_Controller {

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



		if (!isset($_SESSION["group"]))
		{
			redirect('/auth/login');
		}

		// cek jika bukan rw, maka tidak bisa akses
		// $user = $this->ion_auth->user()->row();
		// $user_groups = $this->ion_auth->get_users_groups($user->id)->result();
		// // print_r($user_groups[0]->name);
		// if ( $user_groups[0]->name != "rw" ) {
		// 	redirect('/');
		// }

		$this->load->model('pembayaran_model', 'pembayaran');
		$this->load->model('Warga_model', 'warga');
		$this->load->library('upload');
	}

	public function index($th = null)
	{
		if (isset($th)) {
			$tahun = $th;
		} else{
			$tahun = date("Y");
		}

		$id_warga = $_SESSION["id"];


		// echo "<pre>";
		// print_r( $data["warga"] );
		// echo "</pre>";


		$data["pembayaran"] = $this->pembayaran->get_by_warga_tahun( $id_warga, $tahun );
		

		// echo "<pre>";
		// print_r($p);
		// echo "</pre>";

		// $data["pembayaran"] = $p;
				
		$this->load->view('admin/warga/Pembayaran/cek', $data);
	}

}
