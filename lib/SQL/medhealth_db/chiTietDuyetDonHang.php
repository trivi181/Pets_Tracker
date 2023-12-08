<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $hoaDon = $_GET['hoadon'];
    $selectCart = mysqli_query($connection, "SELECT thucan.tenTA as tenTA, chitiethoadon.soLuong as soLuong, chitiethoadon.gia as gia FROM chitiethoadon JOIN thucan on chitiethoadon.maTA = thucan.maTA WHERE chitiethoadon.hoadon = '$hoaDon'");

    while($row = mysqli_fetch_array($selectCart)){
        $key['tenTA'] = $row['tenTA'];
        $key['soLuong'] = $row['soLuong'];
        $key['gia'] = $row['gia'];
        array_push($response, $key);
    }
    echo json_encode($response);
?>