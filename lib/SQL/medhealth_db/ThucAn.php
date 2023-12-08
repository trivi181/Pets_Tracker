<?php

    require "config.php";
    header("Access-Control-Allow-Origin: *");

    $response = array();

    $cek_product = mysqli_query($connection, "SELECT * FROM thucan WHERE status = '1'");

    while($row_product = mysqli_fetch_array($cek_product)){
        $key['maTA'] = $row_product['maTA'];
        $key['tenTA'] = $row_product['tenTA'];
        $key['gia'] = $row_product['gia'];
        $key['danhGia'] = $row_product['danhGia'];
        $key['mieuTa'] = $row_product['mieuTa'];
        $key['soLuong'] = $row_product['soLuong'];
        $key['maloaiTA'] = $row_product['maloaiTA'];
        $key['status'] = $row_product['status'];
        
        array_push($response, $key);
    }
echo json_encode($response);
?>