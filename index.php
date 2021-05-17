<?php
session_start();
include 'koneksi.php';
?>

<?php 
if (!isset($_SESSION['pelanggan'])){
	echo "<script>location='login.php';</script>";
	header('location:login.php');
	exit();
}
?>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>Jual Beli Furniture</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
  </head>

  <body>

  

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand" href="index.php"><h2>Furniture Webstore<em>.</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.php">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Buy</a>
                
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="keranjang.php">Keranjang</a>
                  <a class="dropdown-item" href="checkout.php">Checkout</a>
                </div>
              </li>

              <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
                  
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="about.html">About Us</a>
                  </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="logout.php">Logout</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="main-banner header-text">
      <div class="container-fluid">
        <div class="owl-banner owl-carousel">
          <div class="item">
            <img src="assets/images/product-1-720x480.jpg" alt="">
            <div class="item-content">
              
              <div class="main-content">
                <div class="meta-category">
                  <span> Rp. 520.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>White Side Chair</h4></a>

              </div>
            
            </div>
          </div>
          <div class="item">
            <img src="assets/images/product-2-720x480.jpg" alt="">
            <div class="item-content">
              
              <div class="main-content">
                <div class="meta-category">
                  <span>Rp. 450.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>Pink Lounge Chair</h4></a>

              </div>
            
            </div>
          </div>
          <div class="item">
            <img src="assets/images/product-3-720x480.jpg" alt="">
            <div class="item-content">
              
              <div class="main-content">
                <div class="meta-category">
                  <span>Rp. 360.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>White Wooden Chair</h4></a>

              </div>
            
            </div>
          </div>
          <div class="item">
            <img src="assets/images/product-4-720x480.jpg" alt="">
            <div class="item-content">
              
              <div class="main-content">
                <div class="meta-category">
                  <span>Rp. 1.100.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>Sectional Sofa</h4></a>

              </div>
            
            </div>
          </div>
          <div class="item">
            <img src="assets/images/product-5-720x480.jpg" alt="">
            <div class="item-content">
              
              <div class="main-content">
                <div class="meta-category">
                  <span>Rp. 1.210.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>Chesterfield Sofa</h4></a>

              </div>
            
            </div>
          </div>
          <div class="item">
            <img src="assets/images/product-6-720x480.jpg" alt="">
            <div class="item-content">
              <div class="main-content">
                <div class="meta-category">
                  <span>Rp. 780.000,00</span>
                </div>

                <a href="vacation-details.html"><h4>Simple Wooden Shelf</h4></a>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

    <?php
			if (isset($_GET['halaman']) && $_GET['halaman']!="") {
				$halaman = $_GET['halaman'];
			}else{
				$halaman = 1;
			}

			$limit=6;

			if ($halaman>1) {
            //range data yang ditampilkan 
				$offset=($halaman*$limit)-$limit;
			}else $offset=0;

			$sebelumnya = $halaman-1;
			$selanjutnya=$halaman+1;

			$query = mysqli_query($koneksi,"SELECT * FROM produk");
			$jlh_data=mysqli_num_rows($query);

          //menghitung jumlah halaman
			$jlh_halaman=ceil($jlh_data/$limit);
			$hal_akhir = $jlh_halaman;

			$query2="SELECT * FROM produk LIMIT $offset, $limit";
			$hasil2= mysqli_query($koneksi, $query2); ?>
			
			<div class="row">
				<?php while ($data = $hasil2->fetch_assoc()) { ?>
					<div class="col-md-4">
						<div class="thumbnail">
							<img src="gambar_produk/<?php echo $data['foto_produk']; ?>" class="img-responsive" height="300" width="300">
							<div class="caption text-center">
								<h4><?php echo $data['nama_produk']; ?></h4>
								<h5>Rp <?php echo number_format($data['harga_produk']);?></h5>
								<a href="beli.php?id=<?php echo $data['id_produk']; ?>" class="btn btn-success"> Beli Sekarang </a>
								<a href="detail.php?id=<?php echo $data['id_produk']; ?>" class="btn btn-primary"> Detail Produk </a>
							</div>
						</div>
					</div>
				<?php }  ?>
      </div>
			</section>
		   	    
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="social-icons">
              <li><a href="https://www.facebook.com/Furniture-Webstore-105299234891836">Facebook</a></li>
              <li><a href="https://twitter.com/home">Twitter</a></li>
              <li><a href="https://www.instagram.com/furniturewebstore/">Instagram</a></li>
            </ul>
          </div>
          <div class="col-lg-12">
            <div class="copyright-text">
              <p>
              Copyright © 2021 Universitas Padjadjaran
                | Sistem Database I
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>

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