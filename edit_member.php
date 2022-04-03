<?php
//session_start();
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "import/excel_reader2.php";

$db_object = new database();

$id = $_GET['id'];
$sql = "SELECT * FROM denda WHERE id='$id'";
$query = $db_object->db_query($sql);


if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $no_pinjam = $_POST['no_pinjam'];
    $nama = $_POST['nama'];
    $judul = $_POST['judul'];
    $tgl_pinjam = $_POST['tgl_pinjam'];
    $tgl_kembali = $_POST['tgl_kembali'];
    $member = $_POST['member'];
    $denda = $_POST['denda'];
    $tgl_lahir = $_POST['tgl_lahir'];
    $tempat_lahir = $_POST['tempat_lahir'];
    $studi = $_POST['studi'];
    $sql = "UPDATE denda SET no_pinjam='$no_pinjam',nama='$nama', judul='$judul', tgl_pinjam='$tgl_pinjam', tgl_kembali='$tgl_kembali', member='$member', denda='$denda', tgl_lahir='$tgl_lahir', tempat_lahir='$tempat_lahir', studi='$studi'  WHERE id='$id'";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=denda&pesan_success=Data berhasil diupdate'); </script>";
    } else {
        echo "<script> location.replace('?menu=denda&pesan_success=Data gagal diupdate'); </script>";
    }
}

?>


<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-money-bill-wave"></i> Data Transaksi</h1>

    <a href="?menu=member" class="btn btn-secondary"><i class="fa fa-arrow-circle-left"></i> Kembali</a>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-danger"><i class="fas fa-fw fa-edit"></i> Edit Data Transaksi</h6>
    </div>


    <?php
    foreach ($query as $data) {
    ?>

        <form method="post" enctype="multipart/form-data" action="">
            <div class="card-body">

                <div class="modal-body">
                    <
                <div class="col-12">
                    <label for="" class="font-weight-bold">Nomor pinjam</label>
                    <div class="form-group">
                        <input type="hidden" name="id" class="form-control" value="<?= $data['id'] ?>">
						<input type="form-control" name="no_pinjam" value="<?= $data['no_pinjam'] ?>" class="form-control" required="" />
                    </div>
                </div>
				
				<div class="col-12">
                    <label for="" class="font-weight-bold">Tanggal Kembali</label>
                    <div class="form-group">
						<textarea class="form-control" name="nama" rows="3" required=""><?= $data['nama'] ?></textarea>
                    </div>
                </div>

                
				<div class="col-12">
                    <label for="" class="font-weight-bold">Tempat Lahir</label>
                    <div class="form-group">
						<textarea  class="form-control" name="tempat_lahir" rows="3" required=""><?= $data['tempat_lahir'] ?></textarea>
                    </div>
                </div>


				<div class="col-12">
                    <label for="" class="font-weight-bold">Program Studi</label>
                    <div class="form-group">
						<textarea class="form-control" name="studi" rows="3" required=""><?= $data['studi'] ?></textarea>
                    </div>
                </div>

				<div class="col-12">
                    <label for="" class="font-weight-bold">Tanggal Lahir</label>
                    <div class="form-group">
						<input  type="date" class="form-control" name="tgl_lahir" rows="3" required=""><?= $data['tgl_lahir'] ?></input>
                    </div>
                </div>
				
                <div class="col-12">
                    <label for="" class="font-weight-bold">Judul Buku</label>
                    <div class="form-group">
						<textarea class="form-control" name="judul" rows="3" required=""><?= $data['judul'] ?></textarea>
                    </div>
                </div>

                <div class="col-12">
                    <label for="" class="font-weight-bold">Tanggal Pinjam</label>
                    <div class="form-group">
						<textarea class="form-control" name="tgl_pinjam" rows="3" required=""><?= $data['tgl_pinjam'] ?></textarea>
                    </div>
                </div>
          
                <div class="col-12">
                    <label for="" class="font-weight-bold">No Pinjam</label>
                    <div class="form-group">
						<textarea class="form-control" name="tgl_kembali" rows="3" required=""><?= $data['tgl_kembali'] ?></textarea>
                    </div>
                </div>
          
                <div class="col-12">
                    <label for="" class="font-weight-bold">Nama member</label>
                    <div class="form-group">
						<textarea class="form-control" name="member" rows="3" required=""><?= $data['member'] ?></textarea>
                    </div>
                </div>

                <div class="card-footer text-right">
                    <button name="update" type="submit" class="btn btn-success"><i class="fa fa-save"></i> Update</button>
                    <button type="reset" class="btn btn-info"><i class="fa fa-sync-alt"></i> Reset</button>
                </div>
        </form>
</div>

<?php } ?>