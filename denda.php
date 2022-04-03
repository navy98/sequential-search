<?php
//session_start();
if (!isset($_SESSION['apriori_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "import/excel_reader2.php";
?>


<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 style="background-color: grey;" class="h3 mb-0 text-white"><i class="fas fa-fw fa-money-bill-wave"></i> Denda Buku</h1>

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
    $data = new Spreadsheet_Excel_Reader($_FILES['file_denda']['tmp_name']);

    $baris = $data->rowcount($sheet_index = 0);
    $column = $data->colcount($sheet_index = 0);

    for ($i = 2; $i <= $baris; $i++) {
        for ($c = 1; $c <= $column; $c++) {
            $value[$c] = $data->val($i, $c);
        }

        $table = "denda";
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
        $sql = "INSERT INTO denda (no_pinjam, nama, judul, tgl_pinjam, tgl_kembali, denda) VALUES ";
        $value_in = array();
        $sql .= " ('$temp_date', '$produkIn')";
        $db_object->db_query($sql);
    }
?>
    <script>
        location.replace("?menu=denda&pesan_success=Data berhasil disimpan");
    </script>
<?php
}

if (isset($_POST['simpan'])) {
    $no_pinjam = $_POST['no_pinjam'];
    $nama = $_POST['nama'];
    $judul = $_POST['judul'];
    $tgl_pinjam = $_POST['tgl_pinjam'];
    $tgl_kembali = $_POST['tgl_kembali'];
    $member = $_POST['member'];
    $denda = $_POST['denda'];
    $sql = "INSERT INTO denda (id, tgl_pinjam, judul, nama, no_pinjam, tgl_kembali, denda, member) VALUES ('','$judul','$nama','$tgl_pinjam','$denda','$no_pinjam','$tgl_kembali','$member')";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=denda&pesan_success=Data berhasil disimpan'); </script>";
    } else {
        echo "<script> location.replace('?menu=denda&pesan_success=Data gagal disimpan'); </script>";
    }
}


if (isset($_POST['delete'])) {
    $sql = "TRUNCATE denda";
    $db_object->db_query($sql);
?>
    <script>
        location.replace("?menu=denda&pesan_success=Data transaksi berhasil dihapus");
    </script>
<?php
}

if (isset($_GET['hapus'])) {
    $id = $_GET['hapus'];
    $sql = "DELETE FROM denda WHERE id='$id'";
    $db_object->db_query($sql);
    if ($sql) {
        echo "<script> location.replace('?menu=denda&pesan_success=Data transaksi berhasil dihapus'); </script>";
    }
}

$sql = "SELECT
        *
        FROM
        denda";
$query = $db_object->db_query($sql);
?>



<div class="modal fade" id="modalupload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" enctype="multipart/form-data" action="">
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
                            <input type="file" class="custom-file-input" name="file_denda" id="inputGroupFile01" required />
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
            <form method="post" enctype="multipart/form-data" action="">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fas fa-fw fa-plus"></i> Tampah Data Transaksi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Nomor Pinjaman</label>
                        <div class="form-group">
                            <input name="no_pinjam" class="form-control" />
                        </div>
                    </div>


                    <div class="col-12">
                        <label for="" class="font-weight-bold">Nama</label>
                        <div class="form-group">
                            <input name="nama" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Judul Buku</label>
                        <div class="form-group">
                            <input name="judul" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Tempat Lahir</label>
                        <div class="form-group">
                            <input name="tempat_lahir" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Nama Member</label>
                        <div class="form-group">
                            <input name="member" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Studi Program</label>
                        <div class="form-group">
                            <input name="studi" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Tanggal lahir</label>
                        <div class="form-group">
                            <input type="date" name="tgl_lahir" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Tanggal Pinjam</label>
                        <div class="form-group">
                            <input type="date" name="tgl_pinjam" class="form-control" />
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="" class="font-weight-bold">Tanggal Kembali</label>
                        <div class="form-group">
                            <input type="date" name="tgl_kembali" class="form-control" />
                            <div class="col-12">
                                <label for="" class="font-weight-bold">denda</label>
                                <div class="form-group">
                                    <input name="denda" class="form-control" />
                                </div>
                            </div>
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



<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Daftar Pinjaman</h6>

        <form method="post" enctype="multipart/form-data" action="">
            <button name="delete" type="submit" class="btn btn-app btn-dark btn-sm" onclick="return confirm('Are you sure?')"><i class="fas fa-fw fa-trash"></i> Delete All Data</button>
        </form>
    </div>

    <div class="card-body">


        <?php
        if (!empty($pesan_error)) {
            display_error($pesan_error);
        }
        if (!empty($pesan_success)) {
            display_success($pesan_success);
        }
        ?>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead class="bg-dark text-white">
                <tr align="center">
                    <th>No</th>
                    <th>Nomor Pinjaman</th>
                    <th>Nama</th>
                    <th>Judul Buku</th>
                    <th>Tanggal Pinjaman</th>
                    <th>Tanggal kembali</th>
                    <th>Denda</th>

                    <th width="15%">Aksi</th>
                </tr>
            </thead>
            <?php
            $no = 1;
            while ($row = $db_object->db_fetch_array($query)) {
            ?>
                <tr>
                    <td class='text-center'>
                        <?= $no ?></td>



                    <td> <?= $row['tgl_kembali'] ?></td>
                    <td> <?= $row['judul'] ?></td>
                    <td> <?= $row['tgl_pinjam'] ?></td>
                    <td> <?= $row['nama'] ?></td>
                    <td> <?= $row['denda'] ?></td>
                    <td> <?= $row['no_pinjam'] ?></td>


                    <td class='text-center'>
                        <div class='btn-group' role='group'>
                            <a href="?menu=edit_member&id=<?= $row['id'] ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i></a>
                            <a href="?menu=denda&hapus=<?= $row['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm ('Apakah anda yakin untuk meghapus data ini')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></a>
                        </div>
                    </td>
                </tr>

            <?php
                $no++;
            }
            ?>
        </table>
    </div>
</div>


<?php
function get_produk_to_in($produk)
{
    $ex = explode(",", $produk);
    //$temp = "";
    for ($i = 0; $i < count($ex); $i++) {

        $jml_key = array_keys($ex, $ex[$i]);
        if (count($jml_key) > 1) {
            unset($ex[$i]);
        }

        //$temp = $ex[$i];
    }
    return implode(",", $ex);
}

?>