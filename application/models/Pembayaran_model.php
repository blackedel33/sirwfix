<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class pembayaran_model extends CI_Model {

	public function get(){
		$this->db->order_by('id_bayar');
		$query = $this->db->get('tabel_pembayaran');
		return $query->result();
		// $query->free_result();
	}

	public function get_by_id($id){
		$this->db->order_by('id_bayar');
		$this->db->where('id_bayar', $id);
		$query = $this->db->get('tabel_pembayaran');
		return $query->result();
		// $query->free_result();
	}

	public function get_by_warga_tahun($id_warga, $tahun){
		$this->db->order_by('id_bayar');
		$this->db->where('id_warga', $id_warga);
		$this->db->where('tahun', $tahun);
		$query = $this->db->get('tabel_pembayaran');
		return $query->result();
		// $query->free_result();
	}

	public function save($data){
		$this->db->insert('tabel_pembayaran', $data);
	}

	public function update($data, $id){
		$this->db->where('id_bayar', $id);
		$this->db->update('tabel_pembayaran', $data);
	}

	public function delete($id){
		$this->db->where('id_bayar', $id);
		$this->db->delete('tabel_pembayaran');
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
