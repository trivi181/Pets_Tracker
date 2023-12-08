<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $response = array();
        $maGioHang = $_POST['hoaDon'];
        $tipe = $_POST['tipe'];

        $cek_cart = mysqli_query($connection, "SELECT * FROM hoadon WHERE hoaDon = '$maGioHang'");
        $result = mysqli_fetch_array($cek_cart);
        $qty = $result['status'];

        if($result){
            if($tipe == "dangChuanBi"){
                $update_tambah = mysqli_query($connection, "UPDATE hoadon set status = 2 where hoaDon = '$maGioHang'");
                if($update_tambah){
                    $response['value'] = 1;
                    $response['message'] = "";
                    echo json_encode($response);
                } else{
                    $response['value'] = 0;
                    $response['message'] = "Khong the duyet";
                    echo json_encode($response);
                }
            }else{
                
                    if($tipe == "daGiao"){
                        $update_tambah = mysqli_query($connection, "UPDATE hoadon set status = 3 where hoaDon = '$maGioHang'");
                        if($update_tambah){
                            $response['value'] = 1;
                            $response['message'] = "";
                            echo json_encode($response);
                        } else{
                            $response['value'] = 0;
                            $response['message'] = "Khong the duyet";
                            echo json_encode($response);
                        }
                }
            }
        } else{
            $response['value'] = 0;
            $response['message']="them so luong san pham that bai";
            echo json_encode($response);
        }
    }

?>