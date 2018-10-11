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


		// cek jika bukan rw, maka tidak bisa akses
		// $user = $this->ion_auth->user()->row();
		// $user_groups = $this->ion_auth->get_users_groups($user->id)->result();
		//  print_r($user_groups[0]->name);
		// if ( $user_groups[0]->name != "warga" ) {
		// 	redirect('/');
		// }

		$this->load->model('Pengumuman_model', 'pengumuman');
		$this->load->library('upload');
	}

	public function index()
	{
		$data["pengumuman"] = $this->pengumuman->get();
		$this->load->view('admin/warga/pengumuman/index', $data);
	}

	public function tambah(){
		$this->load->view('admin/rw/pengumuman/tambah');
	}

	public function simpan(){
		// jika ada gambar yang diupload
		if ($_FILES["foto"]['name'] !== "") {
			$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);
			$filename = time().".".$ext;
			$this->upload_image("foto", $filename);
			$_POST["foto"] = $filename;	
		}

		// simpan data ke database
		$this->pengumuman->save($_POST);

		echo "<script>
		alert('Data pengumuman berhasil ditambahkan!');
		window.location.href='".base_url('rw/pengumuman')."';
		</script>";
	}

	public function edit($id){
		$data["pengumuman"] = $this->pengumuman->get_by_id($id);		
		$this->load->view('admin/rw/pengumuman/edit', $data);
	}

	public function update($id){
		
		if ( $_FILES["foto"]["name"] !== "" ) {	// jika ada gambar
			$ext = pathinfo($_FILES["foto"]['name'], PATHINFO_EXTENSION);
			$filename = time().".".$ext;
			$this->upload_image("foto", $filename);
			$_POST["foto"] = $filename;		
		}

		$this->pengumuman->update($_POST, $id);

		echo "<script>
			alert('Data pengumuman berhasil diubah!');
			window.location.href='".base_url('rw/pengumuman')."';
			</script>";
	}

	public function hapus($id){
		$this->pengumuman->delete($id);

		echo "<script>
			alert('Data pengumuman berhasil dihapus!');
			window.location.href='".base_url('rw/pengumuman')."';
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
