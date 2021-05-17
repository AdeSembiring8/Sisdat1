-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 03:44 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin001', 'sayaAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(11) NOT NULL,
  `komentar` varchar(200) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `komentar`, `nama`, `id_produk`, `nama_produk`) VALUES
(5, 'Lumayan lah, ntapzz', 'hafazh', 39, 'Pink Lounge Chair');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `tarif` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `kota`, `tarif`) VALUES
(1, 'Medan', 7000),
(2, 'Binjai', 7500),
(3, 'Tanjung Morawa', 8000),
(4, 'P. Siantar', 12000),
(5, 'Tanjung Balai', 20000),
(6, 'P. Sidempuan', 21000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `password_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `nama_pelanggan`, `password_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(15, '', 'Zahran', '86b19a0013a70a10e5c46bfd2b0b8504', '081135791113', 'Medan'),
(16, 'a', 'Pujo', '0cc175b9c0f1b6a831c399e269772661', '08111111111', 'a'),
(17, 'hafazh@gmail.com', 'hafazh', '7af6c72970ac5e6556ca0ec8195e0b82', '081263334193', 'Medan');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` int(11) NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `tarif` int(22) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `kode_pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `kota`, `tarif`, `alamat_pengiriman`, `kode_pos`) VALUES
(37, 13, 1, 18, 457000, 'Medan', 7000, 'Medan', 20153),
(38, 13, 4, 18, 372000, 'P. Siantar', 12000, 'Medan', 20135),
(39, 13, 1, 18, 3157000, 'Medan', 7000, 'Medan', 20135),
(40, 13, 0, 18, 450000, '', 0, '', 0),
(41, 13, 0, 18, 450000, '', 0, '', 0),
(42, 13, 1, 18, 457000, 'Medan', 7000, 'Medan', 20135),
(43, 13, 1, 19, 2797000, 'Medan', 7000, 'hbfjashfjasfha', 20154),
(44, 17, 1, 20, 457000, 'Medan', 7000, 'Medan', 20154);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(15) NOT NULL,
  `subharga` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `subharga`) VALUES
(8, 37, 39, 1, 'Pink Lounge Chair', 450000, 450000),
(9, 38, 40, 1, 'White Wooden Chair', 360000, 360000),
(10, 39, 39, 7, 'Pink Lounge Chair', 450000, 3150000),
(11, 40, 39, 1, 'Pink Lounge Chair', 450000, 450000),
(12, 41, 39, 1, 'Pink Lounge Chair', 450000, 450000),
(13, 42, 39, 1, 'Pink Lounge Chair', 450000, 450000),
(14, 43, 39, 3, 'Pink Lounge Chair', 450000, 1350000),
(15, 43, 40, 4, 'White Wooden Chair', 360000, 1440000),
(16, 44, 39, 1, 'Pink Lounge Chair', 450000, 450000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi`, `stok_produk`) VALUES
(38, 'White Side Chair', 520000, 2, 'putih.jpg', '<p>Kondisi: Baru</p>\r\n\r\n<p>Berat: 125 Gram</p>\r\n\r\n<p>Kategori: Kursi</p>\r\n\r\n<p>Material : Bahan Polyester</p>\r\n\r\n<p>Ukuran tinggi sandaran : 45-60 cm</p>\r\n\r\n<p>Ukuran Panjang dan lebar dudukan : 40-50 cm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Kursi ini adalah pilihan mudah dan murah untuk membuat kursi rumah anda terlihat lebih mewah dan menawan.</p>\r\n\r\n<p>Terbuat dari bahan Polyester berkualitas tinggi,lembut,dan nyaman untuk di duduki serta sangat Elastis.</p>\r\n\r\n<p>Mudah dicuci, sehingga memudahkan dalam perawatannya.</p>\r\n\r\n<p>Cocok untuk digunakan di rumah anda untuk membuat tampilan ruang makan semakin mewah. Cocok juga digunakan di restoran, maupun di aula atau gedung pertemuan.</p>\r\n', 50),
(39, 'Pink Lounge Chair', 450000, 35, 'pink.jpg', '<p>Kondisi:&nbsp;Baru</p>\r\n\r\n<p>Berat:&nbsp;14.500 Gram</p>\r\n\r\n<p>Kategori: Kursi</p>\r\n\r\n<p>Material :&nbsp;Dudukan Polypropylene,Kaki Solid Wood<br />\r\nUkuran: 55 x 46 x 81.5</p>\r\n\r\n<p>Kursi lounge hadir dengan desain modern yang dapat memperkuat aksen dekoratif di dalam ruangan.</p>\r\n\r\n<p>Penggunaan material-material pilihan menghasilkan kursi dengan kualitas daya tahan yang baik.</p>\r\n\r\n<p>Cocok untuk digunakan di ruang makan, ruang kerja, hingga kafe.<br />\r\n<br />\r\n&nbsp;</p>\r\n', 99),
(40, 'White Wooden Chair', 360000, 15, 'bngku_cafe.jpg', '<p>Kondisi : Baru</p>\r\n\r\n<p>Kategori : Kursi</p>\r\n\r\n<p>Ukuran produk<br />\r\nDiuji untuk: 100 kg<br />\r\nLebar dudukan: 40 cm<br />\r\nTinggi dudukan: 50 cm</p>\r\n\r\n<p>Bahan<br />\r\nKeseluruhan bagian: Pewarna, Lacquer akrilik bening</p>\r\n\r\n<p><br />\r\nFitur utama</p>\r\n\r\n<p>Deskripsi</p>\r\n\r\n<p>Miliki satu gaya yang sama untuk seluruh bagian rumah. Seri ini terlihat sama menariknya di dapur dan ruang makan seperti di kamar tidur atau koridor.</p>\r\n\r\n<p>Konstruksi kayu solidnya tahan benturan dan pukulan.</p>\r\n\r\n<p>Bahan<br />\r\nKeseluruhan bagian: Pewarna, Lacquer akrilik bening</p>\r\n\r\n<p>Tempat duduk: Kayu pinus solid<br />\r\nBahan dasar: Kayu pinus solid, Perekat</p>\r\n\r\n<p>Petunjuk perawatan<br />\r\nLap bersih dengan larutan sabun lembut.<br />\r\nLap hingga kering dengan kain bersih.</p>\r\n\r\n<p>Kelebihan<br />\r\nKayu solid adalah bahan alami tahan pakai.</p>\r\n', 73),
(41, 'Sectional Sofa', 1100000, 15, 'blue.jpg', '<p>Kondisi:&nbsp;Baru</p>\r\n\r\n<p>Kategori: Sofa</p>\r\n\r\n<p>Spesifikasi<br />\r\n&nbsp;RANGKA KAYU {ALBASIAH anti rayap}<br />\r\n&nbsp;BAHAN {KAIN MIDILY FLAMENCO &amp; SINTESIS PREMIUM}<br />\r\n&nbsp;UKURAN { P310,cm &times;. L210,cm &times; T80,cm}<br />\r\n&nbsp;BUSA {REBONDIT INOAC SUPER BALL&trade;}<br />\r\n&nbsp;BAHAN KAKI {SITENLIS,PLASTIC &amp;,KAYU}</p>\r\n', 145),
(42, 'Chesterfield Sofa', 1210000, 65, 'sofa.jpg', '<p>Kondisi:&nbsp;Baru</p>\r\n\r\n<p>Berat:&nbsp;10 Gram</p>\r\n\r\n<p>Kategori:&nbsp;<a href=\"https://www.tokopedia.com/p/rumah-tangga/furniture/sofa\" target=\"_blank\">S</a>ofa</p>\r\n\r\n<p>Barang Ready bisa dikirim esok hari.<br />\r\n<br />\r\nSPESIFIKASI :<br />\r\n1. Rangka kayu pilihan yang melalui proses pengovenan sehingga kayu kering dan kuat<br />\r\n2. Memakai busa berkualitas tinggi dengan density tinggi, yang menjamin kenyamanan dan daya tahan lama.<br />\r\n3. Sistem karet yang kuat, awet dan nyaman.<br />\r\n4. Bahan Fabric berkualitas<br />\r\n5. Dimensi/Ukuran : 115x70x85</p>\r\n', 93),
(43, 'Simple Wooden Shelf', 780000, 22, 'desk.jpg', '<p>Kondisi:&nbsp;Baru</p>\r\n\r\n<p>Berat:&nbsp;22 Kilogram</p>\r\n\r\n<p>Kategori: Laci</p>\r\n\r\n<p>&bull; Ukuran: 69cm x 39.8cm x 72.2cm<br />\r\n&bull; Jumlah Laci: 3 Laci<br />\r\n&bull; Kondisi Produk: Butuh Perakitan<br />\r\n&bull; Style: Scandinavian<br />\r\n&bull; Warna: Cokelat<br />\r\n&bull; Material: PB board, Paper lamination<br />\r\n<br />\r\nDidesain dengan style Japandi yang netral namun cantik, lemari laci ini cocok untuk Anda yang membutuhkan penyimpanan ekstra dan bisa juga menjadi lemari pakaian.<br />\r\n<br />\r\nDilengkapi dengan 2 buah laci buka tutup, lemari serbaguna ini dapat menjadi lemari kabinet, lemari organizer sekaligus bisa berfungsi sebagai lemari tempat penyimpanan beragam perlengkapan rumah tangga.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
