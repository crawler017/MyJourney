<?php
if (!session_id())session_start ();
if (isset ( $_SESSION ["code"] )) { //判断code存不存在，如果不存在，说明异常登录
?>
<?php include('header.php'); ?>
<?php include('navbar_main.php');?>
<?php include('slide.php');?>
<?php include('footer.php') ?>
<?php
} else { //code不存在，调用Main/esc 退出登录
?>
    <script type="text/javascript">
        alert("请先登录");
        window.location.href = "<?php echo site_url('Login/index'); ?>";
    </script>
    <?php
}
?>