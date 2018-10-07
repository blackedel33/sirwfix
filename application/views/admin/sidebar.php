<?php
if ($this->ion_auth->logged_in()){
  $user = $this->ion_auth->user()->row();
  $user_groups = $this->ion_auth->get_users_groups($user->id)->result();
  $hak_akses = $user_groups[0]->name;
} else{
	$hak_akses = "warga";
}
// print_r($user_groups[0]->name);
?>

<?php
if ($hak_akses == "admin"){
  include 'menu/admin.php';
} else if ($hak_akses == "rw"){
  include 'menu/rw.php';
} else if ($hak_akses == "warga"){
  include 'menu/warga.php';
}
?>