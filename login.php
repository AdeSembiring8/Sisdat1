<?php
session_start();
include 'koneksi.php';

if (isset($_SESSION['pelanggan'])) {
	echo "<script>location='index.php';</script>";
}
?>


<!DOCTYPE html>
<html lang="en">

  <head>
  <?php include 'navigasi2.php'; ?>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b478bc8168.js" crossorigin="anonymous"></script>

    <title>Login page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="style.css">
  </head>

  <body>
  <?php include 'navigasi3.php'; ?>
    <div class="login">
      <div class="avatar">
        <i class="fa fa-user"></i>
      </div></br>

      <h2>Login Form</h2></br>

      <form method="POST">

      <div class="box-login">
        <i class="fas fa-user"></i>
        <input type="email" placeholder="Email..." name="email" name="email" required>
			
			</div>

      <div class="box-login">
        <i class="fas fa-lock"></i>
        <input type="password" placeholder="Password..." name="password" required>
      </div>  

      <button name="login" class="btn btn-success"><b>LOGIN</b></button></br></br>
      <p>Belum punya akun?<a href="daftar.php">
			<b>Silahkan daftar disini</b></a></p>    

      </form>

    </div>
    	<?php
			if (isset($_POST['login'])) {
				$email = $_POST['email'];
				$password = $_POST['password'];
				$password=md5($password);
				$ambil = $koneksi->query("SELECT * FROM pelanggan WHERE email_pelanggan =
					'$email' AND password_pelanggan = '$password'");
				$cocok = $ambil->num_rows;

				if ($cocok == 1) {
					$akun = $ambil->fetch_assoc();

					$_SESSION['pelanggan'] = $akun;
					echo "<div class='alert alert-success text-center'>
					Login Berhasil</div>";
					echo "<meta http-equiv='refresh' content='1,url=index.php'>";
				}
				else {
					echo "<div class='alert alert-danger text-center'>
					Login Gagal, Periksa kembali akun anda</div>";
				}
			}
			?>
		</div>
		   
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  

  </body>
</html>