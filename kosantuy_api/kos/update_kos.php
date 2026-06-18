<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json");

include_once __DIR__ . '/../config/database.php';

$id = $_POST['id'];

$nama_kos = $_POST['nama_kos'];
$harga = $_POST['harga'];
$deskripsi = $_POST['deskripsi'];
$jenis_kos = $_POST['jenis_kos'];
$alamat = $_POST['alamat'];
$jumlah_kamar = $_POST['jumlah_kamar'];
$kamar_tersedia = $_POST['kamar_tersedia'];
$fasilitas = $_POST['fasilitas'];

$fotoUpdate = "";

/*
|--------------------------------------------------------------------------
| Upload Foto Baru Jika Ada
|--------------------------------------------------------------------------
*/

if(isset($_FILES['foto'])){

    $ext = pathinfo(
        $_FILES['foto']['name'],
        PATHINFO_EXTENSION
    );

    $namaFile =
        time() . "." . $ext;

    move_uploaded_file(

        $_FILES['foto']['tmp_name'],

        "../uploads/" . $namaFile
    );

    $fotoUpdate =
        ", foto='$namaFile'";
}

/*
|--------------------------------------------------------------------------
| Update Data Kos
|--------------------------------------------------------------------------
*/

$query = mysqli_query(

    $conn,

    "UPDATE kos SET

    nama_kos='$nama_kos',
    harga='$harga',
    deskripsi='$deskripsi',
    jenis_kos='$jenis_kos',
    fasilitas='$fasilitas',
    alamat='$alamat',
    jumlah_kamar='$jumlah_kamar',
    kamar_tersedia='$kamar_tersedia'

    $fotoUpdate

    WHERE id='$id'"
);

if($query){

    echo json_encode([
        "success" => true,
        "message" => "Kos berhasil diperbarui"
    ]);

}else{

    echo json_encode([
        "success" => false,
        "message" => mysqli_error($conn)
    ]);
}