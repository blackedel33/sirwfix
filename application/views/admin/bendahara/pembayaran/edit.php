<!DOCTYPE html>
<html lang="en">

<?php $this->load->view('admin/head') ?>

<body class="no-skin">
	<?php $this->load->view('admin/navbar') ?>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
			try{ace.settings.loadState('main-container')}catch(e){}
		</script>

		<?php $this->load->view('admin/sidebar') ?>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">Home</a>
						</li>
						<li><a href="<?= base_url()."warga/pembayaran" ?>">pembayaran</a></li>
						<li class="active">Edit pembayaran</li>
					</ul><!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div><!-- /.nav-search -->
				</div>

				<div class="page-content">

					<div class="page-header">
						<h1>
							pembayaran
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								Edit pembayaran
							</small>
						</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-md-12">
							<?php 
							$pembayaran = $pembayaran[0];
							// echo "<pre>";
							// print_r($pembayaran);
							// echo "</pre>";

							?>
							
							<form action="<?= base_url()."warga/pembayaran/update/".$pembayaran->id_bayar ?>" class="form-horizontal" role="form" method="POST" enctype="multipart/form-data">
								<!-- <input type="hidden" name="id_warga" value="<?= $id_warga ?>">
								<input type="hidden" name="bulan" value="<?= $bulan_ke ?>">
								<input type="hidden" name="tahun" value="<?= date("Y") ?>"> -->
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Pembayaran Bulan/Tahun ke </label>

									<div class="col-sm-9">
										<input value="<?= $bulan[$pembayaran->bulan] ?>" type="text" id="form-field-1" class="col-xs-3 col-sm-3" readonly />										
										<input value="<?= $pembayaran->tahun ?>" type="text" id="form-field-1" class="col-xs-2 col-sm-2" readonly />
									</div>
								</div>

								<div class="space-4"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tanggal Pembayaran </label>

									<div class="col-sm-9">
										<input name="tgl_bayar" type="text" id="form-field-1" class="col-xs-10 col-sm-5" value="<?= $pembayaran->tgl_bayar ?>" readonly />
									</div>
								</div>

								<div class="space-4"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Keterangan </label>

									<div class="col-sm-9">										
										<textarea name="keterangan" class="col-xs-10 col-sm-5"><?= $pembayaran->keterangan ?></textarea>
									</div>
								</div> 


								<div class="space-4"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Foto Bukti </label>

									<div class="col-sm-9">
										<?php if ($pembayaran->foto_bukti !== ""): ?>
											<img width="200px" src="<?= base_url()."assets/gambar/".$pembayaran->foto_bukti ?>"><br><br>
										<?php else: ?>
											<img width="200px" src="<?= base_url()."assets/gambar/noimage.png" ?>"><br><br>
										<?php endif; ?>
										<input name="foto_bukti" type="file" id="form-field-1" /><br>
										<b>Kosongkan jika tidak diubah. *)</b>
									</div>
								</div>
						
								<div class="space-4"></div>

								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i>
											Submit
										</button>

										&nbsp; &nbsp; &nbsp;
										<button class="btn" type="reset">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											Reset
										</button>
									</div>
								</div>

								<div class="hr hr-24"></div>

							</form>

						</div>
					</div>


					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div>
</div><!-- /.main-content -->

<?php $this->load->view('admin/footer') ?>
</body>
</html>
