<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $id = $_GET['id'];
    $selectCart = mysqli_query($connection, "SELECT giohang.maGioHang, giohang.soLuong, giohang.gia, thucan.tenTA FROM giohang JOIN thucan on giohang.maTA = thucan.maTA WHERE giohang.id = '$id'");

    while($row = mysqli_fetch_array($selectCart)){
        $key['maGioHang'] = $row['maGioHang'];
        $key['soLuong'] = $row['soLuong'];
        $key['tenTA'] = $row['tenTA'];
        $key['gia'] = $row['gia'];
        array_push($response, $key);
    }
    echo json_encode($response);
?>