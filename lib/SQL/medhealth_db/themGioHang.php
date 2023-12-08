<?php
    require 'config.php';
    header("Access-Control-Allow-Origin: *");
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $response = array();
        $id = $_POST['id'];
        $maTA = $_POST['maTA'];

        $cekCart = mysqli_query($connection, "SELECT * FROM giohang WHERE id = '$id' AND maTA = '$maTA'");
        $resultCekCart = mysqli_fetch_array($cekCart);
        if($resultCekCart){
            $response['value'] = 2;
            $response['message'] = "Đã có sản phẩm trong giỏ hàng";
            echo json_encode($response);
        } else{
            $cekSP = mysqli_query($connection, "SELECT * FROM thucan WHERE maTA = '$maTA'");
            $fetchSP = mysqli_fetch_array($cekSP);
            $fetchGia = $fetchSP['gia'];
            $themGioHang = "INSERT INTO giohang(id, maTA, soLuong, gia, ngayTao) VALUES ('$id', '$maTA', 1, '$fetchGia', NOW())";

            if(mysqli_query($connection, $themGioHang)){
                $response['value'] = 1;
                $response['message'] = "Thêm sản phầm thành công";
                echo json_encode($response);
            } else{
                $response['value']= 0;
                $response['message'] = "Không thêm được sản phẩm";
                echo json_encode($response);
            }

        }
    }



?>