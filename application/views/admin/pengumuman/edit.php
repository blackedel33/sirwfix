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
						<li>Produk</li>
						<li class="active">Data Produk</li>
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
							Pengumuman
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								Edit pengumuman
							</small>
						</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-md-12">
							<form action="<?= base_url() ?>admin/pengumuman/update/<?= $pengumuman[0]->id ?>" class="form-horizontal" role="form" method="POST" enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Judul Pengumuman </label>

									<div class="col-sm-9">
										<input name="judul" value="<?= $pengumuman[0]->judul ?>" type="text" id="form-field-1" class="col-xs-10 col-sm-5" />
									</div>
								</div>

								<div class="space-4"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tanggal Posting </label>

									<div class="col-sm-9">
										<input value="<?= $pengumuman[0]->tgl_posting ?>" name="tgl_posting" type="text" id="form-field-1" class="col-xs-10 col-sm-5" />
									</div>
								</div>

								<div class="space-4"></div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Keterangan </label>

									<div class="col-sm-9">										
										<textarea name="keterangan" class="col-xs-10 col-sm-5"><?= $pengumuman[0]->keterangan ?></textarea>
									</div>
								</div>

								<div class="space-4"></div>
						
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Foto </label>

									<div class="col-sm-9">
										<img width="200px" src="<?= base_url()."gambar/".$pengumuman[0]->foto ?>"><br><br>
										<input name="foto" type="file" id="form-field-1" /><br>
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
