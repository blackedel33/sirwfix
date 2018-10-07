<div id="sidebar" class="sidebar responsive ace-save-state">
  <script type="text/javascript">
    try{ace.settings.loadState('sidebar')}catch(e){}
  </script>

  <ul class="nav nav-list">
    <li class="active">
      <a href="index.html">
        <i class="menu-icon fa fa-tachometer"></i>
        <span class="menu-text"> Beranda </span>
      </a>

      <b class="arrow"></b>
    </li>

    <li class="">
      <a href="#" class="dropdown-toggle">
        <i class="menu-icon fa fa-desktop"></i>
        <span class="menu-text">
          Warga
        </span>

        <b class="arrow fa fa-angle-down"></b>
      </a>

      <b class="arrow"></b>

      <ul class="submenu">
        <li class="">
          <a href="<?= base_url() ?>warga/pengumuman">
            <i class="menu-icon fa fa-caret-right"></i>
            Lihat Pengumuman
          </a>

          <b class="arrow"></b>
        </li>

        <li class="">
          <a href="<?= base_url() ?>warga/kritik">
            <i class="menu-icon fa fa-caret-right"></i>
            Kritik/Saran
          </a>

          <b class="arrow"></b>
        </li>
        
      </ul>
    </li>

  </ul><!-- /.nav-list -->

  <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
    <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
  </div>
</div>
