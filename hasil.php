<?php
//session_start();
if (!isset($_SESSION['apriori_toko_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "mining.php";
?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 style="background-color: grey; " class="h3 mb-0 text-white"><i class="fas fa-fw fa-coins"></i> Data Hasil</h1>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Daftar Data Hasil</h6>
    </div>

    <div class="card-body">
 


<?php
//object database class
$db_object = new database();

$pesan_error = $pesan_success = "";
if(isset($_GET['pesan_error'])){
    $pesan_error = $_GET['pesan_error'];
}
if(isset($_GET['pesan_success'])){
    $pesan_success = $_GET['pesan_success'];
}

$sql = "SELECT * FROM process_log";
$query=$db_object->db_query($sql);
?>

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
                <th>Start Date</th>
                <th>End Date</th>
                <th>Min Support</th>
                <th>Min Confidence</th>
                <th width="15%">Aksi</th>
                </tr>
				</thead>
                <?php
                    $no=1;
                    while($row=$db_object->db_fetch_array($query)){
					?>
                            
						<tr align='center'>
							<td> <?= $no ?></td>
                            <td> <?= format_date2($row['start_date']) ?></td>
                            <td> <?= format_date2($row['end_date']) ?></td>
							<td> <?= $row['min_support'] ?></td>
							<td> <?= $row['min_confidence'] ?></td>
							
							<td>
							<div class='btn-group' role='group'>
								<a href="?menu=view_rule&id_process=<?= $row['id'] ?>" class="btn btn-success btn-sm"><i class="fa fa-eye"></i></a>
								<a href="export/CLP.php?id_process=<?= $row['id'] ?>" class="btn btn-primary btn-sm" target='blank'><i class="fa fa-print"></i></a>
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
