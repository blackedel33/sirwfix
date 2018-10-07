<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Warga_model extends CI_Model {

	public function get(){
		$this->db->order_by('id');
		$query = $this->db->get('warga');
		return $query->result();
		// $query->free_result();
	}

	public function get_by_id($id){
		$this->db->order_by('id');
		$this->db->where('id', $id);
		$query = $this->db->get('warga');
		return $query->result();
		// $query->free_result();
	}

	public function save($data){
		$this->db->insert('warga', $data);
	}

	public function update($data, $id){
		$this->db->where('id', $id);
		$this->db->update('warga', $data);
	}

	public function delete($id){
		$this->db->where('id', $id);
		$this->db->delete('warga');
	}


	public function get_login($email, $password){		
		$this->db->where('email', $email);
		$this->db->where('password', md5($password));
		$query = $this->db->get('warga');
		return $query->result();
		// $query->free_result();
	}

	// public function save_barang($data){
	// 	$this->db->insert('barang', $data);

	// 	return true;
	// }

	// public function get_barang($from, $to){
	// 	/*
	// 	DROP VIEW IF EXISTS barang_jenis_vw;
	// 	CREATE VIEW barang_jenis_vw
	// 	AS
	// 	SELECT barang.id_barang, barang.nama, barang.warna, jenis_barang.nama AS jenis
	// 	FROM barang
	// 	INNER JOIN jenis_barang ON barang.id_jenis = jenis_barang.id_jenis;
	// 	*/		
	// 	$this->db->order_by('id_barang');
	// 	$query = $this->db->get('barang_jenis_vw', $to, $from);
	// 	return $query->result();
	// 	$query->free_result();
	// }

	// public function get_barang_id($id){
	// 	$this->db->where('id_barang', $id);
	// 	$query = $this->db->get('barang');
	// 	return $query->result();
	// 	$query->free_result();	
	// }

	// public function get_barang_count(){		
	// 	$query = $this->db->get('barang')->num_rows();
	// 	return $query;
	// 	$query->free_result();		
	// }

	// public function edit_barang($data, $id){
	// 	$this->db->where('id_barang', $id);
	// 	$this->db->update('barang', $data);
	// 	return true;
	// }

	// public function delete_barang($id){
	// 	$this->db->where('id_barang', $id);
	// 	$this->db->delete('barang');

	// 	return true;
	// }
}
