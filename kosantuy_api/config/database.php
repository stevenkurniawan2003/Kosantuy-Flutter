<?php

$host = "localhost";
$username = "root";
$password = "";
$database = "kosantuy_db";

$conn = mysqli_connect(
    $host,
    $username,
    $password,
    $database
);

if (!$conn) {

    die(
        json_encode([
            "success" => false,
            "message" => "Koneksi database gagal"
        ])
    );
}