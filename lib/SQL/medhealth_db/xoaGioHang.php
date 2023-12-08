<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $response = array();
        $maGioHang = $_POST['maGioHang'];

        $cek_cart = mysqli_query($connection, "SELECT * FROM giohang WHERE maGioHang = '$maGioHang'");
        $result = mysqli_fetch_array($cek_cart);


        if($result){
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
        } else{
            $response['value'] = 0;
            $response['message']="them so luong san pham that bai";
            echo json_encode($response);
        }
    }

?>