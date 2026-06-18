<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");
header("Content-Type: application/json");

include_once __DIR__ . '/../config/database.php';

$owner_id = $_GET['owner_id'];

$query = mysqli_query(

    $conn,

    "SELECT * FROM kos
     WHERE owner_id = '$owner_id'
     ORDER BY id DESC"
);

$data = [];

while($row = mysqli_fetch_assoc($query)){

    $data[] = $row;
}

echo json_encode([
    "success" => true,
    "data" => $data
]);