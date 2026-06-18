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

$email = $data['email'];
$password = $data['password'];

$query = mysqli_query(
    $conn,
    "SELECT * FROM users WHERE email='$email'"
);

if(mysqli_num_rows($query) == 0){

    echo json_encode([
        "success"=>false,
        "message"=>"Email tidak ditemukan"
    ]);

    exit;
}

$user = mysqli_fetch_assoc($query);

if(
    password_verify(
        $password,
        $user['password']
    )
){

    echo json_encode([
        "success"=>true,
        "data"=>[
            "id"=>$user['id'],
            "nama"=>$user['nama'],
            "email"=>$user['email'],
            "role"=>$user['role']
        ]
    ]);

}else{

    echo json_encode([
        "success"=>false,
        "message"=>"Password salah"
    ]);
}