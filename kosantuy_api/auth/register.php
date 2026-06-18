<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json");

include_once __DIR__ . '/../config/database.php';

if (!isset($conn)) {
    echo json_encode([
        "success" => false,
        "message" => "Koneksi database tidak tersedia."
    ]);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

$nama = $data['nama'];
$email = $data['email'];
$password = $data['password'];
$role = $data['role'];

$cek = mysqli_query(
    $conn,
    "SELECT * FROM users WHERE email='$email'"
);

if(mysqli_num_rows($cek) > 0){

    echo json_encode([
        "success"=>false,
        "message"=>"Email sudah digunakan"
    ]);

    exit;
}

$passwordHash = password_hash(
    $password,
    PASSWORD_DEFAULT
);

$query = mysqli_query(
    $conn,
    "INSERT INTO users(nama,email,password,role)
     VALUES(
     '$nama',
     '$email',
     '$passwordHash',
     '$role'
     )"
);

if($query){

    echo json_encode([
        "success"=>true,
        "message"=>"Register berhasil"
    ]);

}else{

    echo json_encode([
        "success"=>false,
        "message"=>"Register gagal"
    ]);
}