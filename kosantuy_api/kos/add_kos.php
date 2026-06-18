<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json");

include_once __DIR__ . '/../config/database.php';

$owner_id = $_POST['owner_id'];
$nama_kos = $_POST['nama_kos'];
$harga = $_POST['harga'];
$alamat = $_POST['alamat'];
$deskripsi = $_POST['deskripsi'];
$jenis_kos = $_POST['jenis_kos'];
$fasilitas = $_POST['fasilitas'];
$jumlah_kamar = $_POST['jumlah_kamar'];
$kamar_tersedia = $_POST['kamar_tersedia'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];

$namaFile = null;

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
}

$query = mysqli_query(

    $conn,

    "INSERT INTO kos
    (
        owner_id,
        nama_kos,
        harga,
        alamat,
        deskripsi,
        jenis_kos,
        fasilitas,
        jumlah_kamar,
        kamar_tersedia,
        foto,
        latitude,
        longitude
    )

    VALUES
    (
        '$owner_id',
        '$nama_kos',
        '$harga',
        '$alamat',
        '$deskripsi',
        '$jenis_kos',
        '$fasilitas',
        '$jumlah_kamar',
        '$kamar_tersedia',
        '$namaFile',
        '$latitude',
        '$longitude'
    )"
);

if($query){

    echo json_encode([
        "success" => true,
        "message" => "Kos berhasil ditambahkan"
    ]);

}else{

    echo json_encode([
        "success" => false,
        "message" => "Gagal menambahkan kos"
    ]);
}