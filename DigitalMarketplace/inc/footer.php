<script>
  $(document).ready(function(){
    $('.list-group').each(function(){
      if(String($(this).html()).trim() == ""){
        $(this).html("")
      }
    })
    
     window.viewer_modal = function($src = ''){
      start_loader()
      var t = $src.split('.')
      t = t[1]
      if(t =='mp4'){
        var view = $("<video src='"+$src+"' controls autoplay></video>")
      }else{
        var view = $("<img src='"+$src+"' />")
      }
      $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
      $('#viewer_modal .modal-content').append(view)
      $('#viewer_modal').modal({
              show:true,
              backdrop:'static',
              keyboard:false,
              focus:true
            })
            end_loader()  

  }
    window.uni_modal = function($title = '' , $url='',$size=""){
        start_loader()
        $.ajax({
            url:$url,
            error:err=>{
                console.log()
                alert("An error occured")
            },
            success:function(resp){
                if(resp){
                    $('#uni_modal .modal-title').html($title)
                    $('#uni_modal .modal-body').html(resp)
                    if($size != ''){
                        $('#uni_modal .modal-dialog').addClass($size+'  modal-dialog-centered')
                    }else{
                        $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
                    }
                    $('#uni_modal').modal({
                      show:true,
                      backdrop:'static',
                      keyboard:false,
                      focus:true
                    })
                    end_loader()
                }
            }
        })
    }
    window._conf = function($msg='',$func='',$params = []){
       $('#confirm_modal #confirm').attr('onclick',$func+"("+$params.join(',')+")")
       $('#confirm_modal .modal-body').html($msg)
       $('#confirm_modal').modal('show')
    }
  })
</script>
<br>
<br>
<footer class="main-footer text-sm">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <!-- Payment Methods -->
        <h5>Payment Methods</h5>
        <div class="payment-methods">
          <img src="img/gcash.jpg" width="60px"  height="50px" alt="GCash">
          <img src="img/maya.jpg" width="60px"  height="50px" alt="Maya">
        </div>
      </div>
      <div class="col-md-4">
        <!-- Quick Links -->
        <h5>Quick Links</h5>
        <ul class="list-unstyled quick-links">
          <li><a href="./" class=" nav-link <?= isset($page) && $page =='home' ? "active" : ""?>">Home</a></li>
          <li><a href="./?page=about" class="nav-link <?= isset($page) && $page =='about' ? "active" : "" ?>">About</a></li>
          <li><a href="./?page=about" class="nav-link <?= isset($page) && $page =='about' ? "active" : "" ?>">Services</a></li>
          <li><a href="./?page=about" class="nav-link <?= isset($page) && $page =='about' ? "active" : "" ?>">Contact</a></li>
        </ul>
      </div>
      <div class="col-md-4">
        <!-- Additional Information -->
        <h5>Contact Us</h5>
        <p>Nabua Camarines Sur</p>
        <p>ejsexmart@gmail.com</p>
        <p>090407822921</p>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <!-- Copyright Information -->
        <strong>&copy; <?php echo date('Y') ?>. All rights reserved.</strong>
        <div class="float-right d-none d-sm-inline-block">
          <b><?php echo $_settings->info('short_name') ?> (by: <a href="mailto:EjsExmart@gmail.com" target="blank">OnePunchMan</a> )</b> v1.0
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- Additional Scripts -->
<div id="libraries">
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <script>
    $.widget.bridge('uibutton', $.ui.button)
  </script>
  <!-- Bootstrap 4 -->
  <script src="<?php echo base_url ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- ChartJS -->
  <script src="<?php echo base_url ?>plugins/chart.js/Chart.min.js"></script>
  <!-- Sparkline -->
  <script src="<?php echo base_url ?>plugins/sparklines/sparkline.js"></script>
  <!-- Select2 -->
  <script src="<?php echo base_url ?>plugins/select2/js/select2.full.min.js"></script>
  <!-- JQVMap -->
  <script src="<?php echo base_url ?>plugins/jqvmap/jquery.vmap.min.js"></script>
  <script src="<?php echo base_url ?>plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
  <!-- jQuery Knob Chart -->
  <script src="<?php echo base_url ?>plugins/jquery-knob/jquery.knob.min.js"></script>
  <!-- daterangepicker -->
  <script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
  <script src="<?php echo base_url ?>plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="<?php echo base_url ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
  <!-- Summernote -->
  <script src="<?php echo base_url ?>plugins/summernote/summernote-bs4.min.js"></script>
  <script src="<?php echo base_url ?>plugins/datatables/jquery.dataTables.min.js"></script>
  <script src="<?php echo base_url ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
  <script src="<?php echo base_url ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
  <script src="<?php echo base_url ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
  <script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
  <script src="<?php echo base_url ?>plugins/fullcalendar/main.js"></script>
  <!-- overlayScrollbars -->
  <!-- <script src="<?php echo base_url ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script> -->
  <!-- AdminLTE App -->
  <script src="<?php echo base_url ?>dist/js/adminlte.js"></script>
</div>

<script>
  $(function(){
    $('.wrapper>.content-wrapper').css("min-height",$(window).height() - $('#top-Nav').height() - $('#login-nav').height() - $("footer.main-footer").height())
  })
</script>
