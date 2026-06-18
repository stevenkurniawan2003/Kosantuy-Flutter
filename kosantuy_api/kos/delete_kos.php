<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json");

include_once __DIR__ . '/../config/database.php';

$data = json_decode(
    file_get_contents("php://input"),
    true
);

$id = $data['id'];

$query = mysqli_query(

    $conn,

    "DELETE FROM kos
     WHERE id='$id'"
);

if($query){

    echo json_encode([
        "success"=>true,
        "message"=>"Kos berhasil dihapus"
    ]);

}else{

    echo json_encode([
        "success"=>false,
        "message"=>"Gagal menghapus kos"
    ]);
}