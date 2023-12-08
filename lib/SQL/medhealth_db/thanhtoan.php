<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $response = array();
        $invoice = date('YmdHis');
        $id = $_POST['id'];

        $query_cek_cart = mysqli_query($connection, "SELECT * FROM giohang WHERE id = '$id'");
        $result_cek_cart = mysqli_fetch_array($query_cek_cart);
        if($result_cek_cart){
            $insert_invoice = "INSERT INTO hoadon (hoaDon, id, ngayTao, status) VALUES('$invoice', '$id', NOW(), 1)";
            if(mysqli_query($connection, $insert_invoice)){
                $query_insert_cart_detail = mysqli_query($connection, "SELECT * FROM giohang WHERE id = '$id'");
                while($row_cart = mysqli_fetch_array($query_insert_cart_detail)){
                    $maTA = $row_cart['maTA'];
                    $soLuong = $row_cart['soLuong'];
                    $gia = $row_cart['gia'];
                    $insert_invoice_detail = mysqli_query($connection, "INSERT INTO chitiethoadon(hoadon, maTA, soLuong, gia) VALUES ('$invoice', '$maTA', '$soLuong', '$gia')");

                }
                $delete_tmp_cart = mysqli_query($connection, "DELETE FROM giohang WHERE id = '$id'");
                $response['value']=1;
                $response['message'] = "Thanh toan thanh cong";
                echo json_encode($response);
            }else{
                $response['value']=2;
                $response['message'] = "Thanh toan that bai";
                echo json_encode($response);
            }
        }else{
            $response['value']=2;
            $response['message'] = "San pham khong tim thay";
            echo json_encode($response);
        }
    }

?>