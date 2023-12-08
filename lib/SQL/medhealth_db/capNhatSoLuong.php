<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");

    if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $response = array();
        $maGioHang = $_POST['maGioHang'];
        $tipe = $_POST['tipe'];

        $cek_cart = mysqli_query($connection, "SELECT * FROM giohang WHERE maGioHang = '$maGioHang'");
        $result = mysqli_fetch_array($cek_cart);
        $qty = $result['soLuong'];

        if($result){
            if($tipe == "tambah"){
                $update_tambah = mysqli_query($connection, "UPDATE giohang set soLuong = soLuong + 1 where maGioHang = '$maGioHang'");
                if($update_tambah){
                    $response['value'] = 1;
                    $response['message'] = "";
                    echo json_encode($response);
                } else{
                    $response['value'] = 0;
                    $response['message'] = "them so luong san pham that bai";
                    echo json_encode($response);
                }
            }else{
                if($qty == "1"){
                    $query_delete = mysqli_query($connection, "DELETE FROM giohang WHERE maGioHang = '$maGioHang'");
                    if($query_delete){
                        $response['value'] = 1;
                        $response['message']="";
                        echo json_encode($response);
                    }
                    else{
                        $response['value'] = 0;
                        $response['message']="them so luong san pham that bai";
                        echo json_encode($response);
                    }
                }else{
                    $update_kurang = mysqli_query($connection, "UPDATE giohang set soLuong = soLuong-1 WHERE maGioHang = '$maGioHang'");
                    if($update_kurang){
                        $response['value'] = 1;
                        $response['message']="";
                        echo json_encode($response);
                    }
                    else{
                        $response['value'] = 0;
                        $response['message']="them so luong san pham that bai";
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