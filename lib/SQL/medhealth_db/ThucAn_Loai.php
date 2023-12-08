<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");

    $response = array();

    $cek_category = mysqli_query($connection, "SELECT * FROM loaiTA WHERE status='on'");

    while($row_category = mysqli_fetch_array($cek_category)){

        $maLoaiTA = $row_category['maLoaiTA'];
        $key['maLoaiTA'] = $maLoaiTA;
        $key['hinhLoai'] = $row_category['hinhLoai'];
        $key['tenLoai'] = $row_category['tenLoai'];
        $key['status'] = $row_category['status'];

        $key['thucAn'] = array();
        $cek_sanPham = mysqli_query($connection, "SELECT * FROM thucAn WHERE maLoaiTA = '$maLoaiTA'");
        while($row_sanPham = mysqli_fetch_array($cek_sanPham)){
            $key['thucAn'][] = array(
                'maTA' => $row_sanPham['maTA'],
                'tenTA' => $row_sanPham['tenTA'],
                'gia' => $row_sanPham['gia'],
                'danhGia' => $row_sanPham['danhGia'],
                'mieuTa' => $row_sanPham['mieuTa'],
                'soLuong' => $row_sanPham['soLuong'],
                'maloaiTA' => $row_sanPham['maloaiTA'],
                'status' => $row_sanPham['status'],

            );
        }
        array_push($response, $key);
    }
echo json_encode($response);
?>