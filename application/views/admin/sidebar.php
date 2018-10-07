<?php
$user = $this->ion_auth->user()->row();
$user_groups = $this->ion_auth->get_users_groups($user->id)->result();
$hak_akses = $user_groups[0]->name;
// print_r($user_groups[0]->name);
?>

<?php
if ($hak_akses == "admin"){
  include 'menu/admin.php';
} else if ($hak_akses == "rw"){
  include 'menu/rw.php';
}
?>