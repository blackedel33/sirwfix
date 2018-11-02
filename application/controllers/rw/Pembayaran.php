<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pembayaran extends CI_Controller {

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
		if ( $user_groups[0]->name != "rw" ) {
			redirect('/');
		}

		$this->load->model('pembayaran_model', 'pembayaran');
		$this->load->model('Warga_model', 'warga');
		$this->load->library('upload');

		$this->bulan = [
			1 => "Januari",
			2 => "Februari",
			3 => "Maret",
			4 => "April",
			5 => "Mei",
			6 => "Juni",
			7 => "Juli",
			8 => "Agustus",
			9 => "September",
			10 => "Oktober",
			11 => "November",
			12 => "Desember",
		];

		$this->nominal = 50000;
		$this->denda = 10000;
	}

	public function index($th = null)
	{
		if (isset($th)) {
			$tahun = $th;
		} else{
			$tahun = date("Y");
		}		

		$data["warga"] = $this->warga->get();

		// echo "<pre>";
		// print_r( $data["warga"] );
		// echo "</pre>";

		foreach ($data["warga"] as $w) {
			$p[$w->id] = $this->pembayaran->get_by_warga_tahun( $w->id, $tahun );
		}

		// echo "<pre>";
		// print_r($p);
		// echo "</pre>";

		$data["pembayaran"] = $p;
		$data["tahun"] = $tahun;
		
		$this->load->view('admin/rw/Pembayaran/index', $data);
	}

	public function perwarga(){
		
		$data["id_warga"] = $this->uri->segment("4");		
		$data['warga_by_id'] = $this->warga->get_by_id($data["id_warga"]);
		$data["pembayaran"] = $this->pembayaran->get_by_warga_tahun( $data["id_warga"], date("Y") );

		// echo "<pre>";
		// print_r($tes);
		$data["bulan"] = $this->bulan;
		$data['warga'] = $this->warga->get();
		$this->load->view('admin/rw/pembayaran/warga', $data);
	}

	// public function tambah(){
	// }

	public function simpan(){
		// jika ada gambar yang diupload
		if ($_FILES["foto_bukti"]['name'] !== "") {
			$ext = pathinfo($_FILES["foto_bukti"]['name'], PATHINFO_EXTENSION);
			$filename = time().".".$ext;
			$this->upload_image("foto_bukti", $filename);
			$_POST["foto_bukti"] = $filename;	
		}

		// simpan data ke database
		$this->pembayaran->save($_POST);

		echo "<script>
		alert('Data pembayaran berhasil ditambahkan!');
		window.location.href='".base_url('rw/pembayaran')."';
		</script>";
	}

	public function edit($id){
		$data["pembayaran"] = $this->pembayaran->get_by_id($id);		
		$this->load->view('admin/rw/pembayaran/edit', $data);
	}

	public function update($id){
		
		if ( $_FILES["foto"]["name"] !== "" ) {	// jika ada gambar
			$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);
			$filename = time().".".$ext;
			$this->upload_image("foto", $filename);
			$_POST["foto"] = $filename;		
		}

		$this->pembayaran->update($_POST, $id);

		echo "<script>
			alert('Data pembayaran berhasil diubah!');
			window.location.href='".base_url('rw/pembayaran')."';
			</script>";
	}

	public function hapus($id){
		$this->pembayaran->delete($id);

		echo "<script>
			alert('Data pembayaran berhasil dihapus!');
			window.location.href='".base_url('rw/pembayaran')."';
			</script>";
	}

	function upload_image($fileinput, $filename){
		$config['file_name'] = $filename;
        $config['upload_path'] = './assets/gambar/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan

        // $config['encrypt_name'] = TRUE; //Enkripsi nama yang terupload
 
        $this->upload->initialize($config);
        if(!empty($_FILES[$fileinput]['name'])){
 
            if ($this->upload->do_upload($fileinput)){
                $gbr = $this->upload->data();
                //Compress Image
                $config['image_library']='gd2';
                $config['source_image']='./assets/gambar/'.$gbr['file_name'];
                $config['create_thumb']= FALSE;
                $config['maintain_ratio']= TRUE;
                $config['quality']= '50%';
                $config['width']= 600;
                $config['height']= 400;
                $config['new_image']= './assets/gambar/'.$gbr['file_name'];
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();
 
                // $gambar=$gbr['file_name'];
                // $judul=$this->input->post('xjudul');
                // $this->m_upload->simpan_upload($judul,$gambar);
                // echo "Image berhasil diupload";
                return $filename;
            } else{

				$error = array('error' => $this->upload->display_errors());
				echo "<pre>";
				print_r($error);            	
            }
                      
        }else{
            // echo "Image yang diupload kosong";
            return "error";
        }
                 
    }
}
