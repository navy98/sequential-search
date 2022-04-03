<?php
//session_start();
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "import/excel_reader2.php";
?>
<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="assets/css/bootstrap-colorpicker.min.css" />


<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-white"><i class="fas fa-fw fa-money-bill-wave"></i> Data Pinjaman</h1>

    <div class="text-right">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalupload">
            <i class="fa fa-upload"></i> Upload Data
        </button>
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modaladd">
            <i class="fa fa-plus"></i> Tambah Data
        </button>
    </div>
</div>

<?php
$db_object = new database();

$pesan_error = $pesan_success = "";
if (isset($_GET['pesan_error'])) {
    $pesan_error = $_GET['pesan_error'];
}
if (isset($_GET['pesan_success'])) {
    $pesan_success = $_GET['pesan_success'];
}

if (isset($_POST['submit'])) {
    $data = new Spreadsheet_Excel_Reader($_FILES['file_data_transaksi']['tmp_name']);

    $baris = $data->rowcount($sheet_index = 0);
    $column = $data->colcount($sheet_index = 0);

    for ($i = 2; $i <= $baris; $i++) {
        for ($c = 1; $c <= $column; $c++) {
            $value[$c] = $data->val($i, $c);
        }

        $table = "transaksi";
        // $produkIn = get_produk_to_in($temp_produk);
        $temp_date = format_date($value[1]);
        $produkIn = $value[2];

        //mencegah ada jarak spasi
        $produkIn = str_replace(" ,", ",", $produkIn);
        $produkIn = str_replace("  ,", ",", $produkIn);
        $produkIn = str_replace("   ,", ",", $produkIn);
        $produkIn = str_replace("    ,", ",", $produkIn);
        $produkIn = str_replace(", ", ",", $produkIn);
        $produkIn = str_replace(",  ", ",", $produkIn);
        $produkIn = str_replace(",   ", ",", $produkIn);
        $produkIn = str_replace(",    ", ",", $produkIn);
        $sql = "INSERT INTO transaksi (transaction_date, produk) VALUES ";
        $value_in = array();
        $sql .= " ('$temp_date', '$produkIn')";
        $db_object->db_query($sql);
    }
?>
    <script>
        location.replace("?menu=data_transaksi&pesan_success=Data berhasil disimpan");
    </script>
<?php
}

if (isset($_POST['simpan'])) {
    $transaction_date = $_POST['transaction_date'];
    $produk = $_POST['produk'];
    $sql = "INSERT INTO transaksi (id,transaction_date,produk) VALUES ('','$transaction_date','$produk')";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data berhasil disimpan'); </script>";
    } else {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data gagal disimpan'); </script>";
    }
}


if (isset($_POST['delete'])) {
    $sql = "TRUNCATE transaksi";
    $db_object->db_query($sql);
?>
    <script>
        location.replace("?menu=data_transaksi&pesan_success=Data transaksi berhasil dihapus");
    </script>
<?php
}

if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];
    $sql = "DELETE FROM transaksi WHERE id='$id'";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=data_transaksi&pesan_success=Data transaksi berhasil dihapus'); </script>";
    }
}

$sql = "SELECT
        *
        FROM
         transaksi";
$query = $db_object->db_query($sql);
?>



<div style="background-image :  url('img/2.jpeg'); background-size: cover; "class="modal fade" id="modalupload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" enctype="multipart/form-data" action="index.php?menu=cari">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fas fa-fw fa-upload"></i> Upload Data Transaksi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Upload</span>
                        </div>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="file_data_transaksi" id="inputGroupFile01" required />
                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                    <button name="submit" type="submit" class="btn btn-success"><i class="fas fa-fw fa-upload"></i> Upload</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modaladd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" enctype="multipart/form-data" action="index.php?menu=cari">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fas fa-fw fa-plus"></i> Tampah Data Transaksi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="col-12">
                        <label for="" class="font-weight-bold">Tanggal</label>
                        <div class="form-group">
                            <input type="date" name="transaction_date" class="form-control" required="" />
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="" class="font-weight-bold">Produk</label>
                        <div class="form-group">
                            <textarea class="form-control" name="produk" rows="3" required=""></textarea>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">kategori</label>
                        <div class="form-group">
                            <textarea class="form-control" name="kategori" rows="3" required=""></textarea>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                    <button name="simpan" type="submit" class="btn btn-success"><i class="fas fa-fw fa-save"></i> Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php
$conn = mysqli_connect("localhost", "root", "", "dm_apriori");
if (!$conn) {
    echo "koneksi gagal" . mysqli_connect_error();
}

?>


<?php

if (isset($_POST['submit-cari-akun'])) {
    $_SESSION['session_pencarian'] = $_POST['keyword'];
    $keyword = $_SESSION['session_pencarian'];
    $query = mysqli_query($conn, "SELECT * FROM transaksi WHERE produk  LIKE '%$keyword%' ORDER BY produk ASC");
} else {
    $keyword = ['session_pencarian'];
    $query = "SELECT * FROM transaksi ORDER BY id ";
}


$result = mysqli_query($conn, $query);

//kalau ini melakukan foreach atau perulangan
while ($row = mysqli_fetch_assoc($result)) {
    $query = mysqli_query($conn, "SELECT * FROM transaksi  ORDER BY produk DESC");
}

?>

<!-- SELECT akun.*, jurusan.nama_jurusan, statusakun.nama_statusakun FROM akun, jurusan, statusakun WHERE akun.id_jurusan = jurusan.id AND id_statusakun = statusakun.id AND akun.username LIKE '%$keyword%' ORDER BY akun.username ASC"); -->

<!-- sumber: https://www.posciety.com/cara-membuat-sistem-pencarian-search-data-database-php-mysqli-statement/ -->

<nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
        <form class="d-flex me-14" role="search" method="post" action="index.php?menu=cari">
            <input class="form-control me-2" name="keyword" type="search" placeholder="Cari judul buku disini..." aria-label="Search">

            <button class="btn btn-dark active" type="submit" name="submit-cari-akun">Search</button>
        </form>
    </div>
</nav>

<!-- sumber: https://www.posciety.com/cara-membuat-sistem-pencarian-search-data-database-php-mysqli-statement/ -->

<table class="table table-bordered bg-light" width="100%" cellspacing="0">
    <thead class="bg-dark text-white">
        <th class="text-center">ID</th>
        <th class="text-center">Tanggal</th>
        <th class="text-center">kategori</th>
        <th class="text-center">Jurusan</th>
        <th colspan="2"></th>
    </thead>
    <tbody style="height: 100vh;">
        <?php 
        
        if (mysqli_num_rows($query)) { ?>
            <?php while ($row = mysqli_fetch_array($query)) { ?>
                <tr>
                    <td class="text"><?php echo $row['id'] ?></td>
                    <td class="text"><?php echo $row['transaction_date'] ?></td>
                    <td class="text padding-right: 80px;"><?php echo $row['kategori'] ?></td>
                    <td class="text"><?php echo $row['produk'] ?></td>
                    <td class='text'>
                        <div class='btn-group' role='group'>
                            <a href="?menu=edit_transaksi&id=<?= $row['id'] ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
                            <a href="?menu=data_transaksi&hapus=<?= $row['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm ('Apakah anda yakin untuk meghapus data ini')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>

                        </div>
                    </td>
                </tr>
            <?php } ?>
        <?php } ?>
    </tbody>
</table>
<!-- sumber: https://www.posciety.com/cara-membuat-sistem-pencarian-search-data-database-php-mysqli-statement/ -->