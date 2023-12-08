<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $response = array();
       
        
        $ngay = $_POST['ngay'];
        $gio = $_POST['gio'];
        $madv = $_POST['madv'];
        $userID = $_POST['id'];

            $insertToDV="INSERT INTO datlich(ngay, gio, trangthai, madv, id, ngaytao) VALUE('$ngay','$gio','0', '$madv','$userID', NOW())";
            if(mysqli_query($connection,$insertToDV)){
                $response['value']=1;
                $response['message']="Bạn đã thêm dịch vụ cho thú cưng thành công!";
                echo json_encode($response);
            } else{
                $response['value']=0;
                $response['message']="Xin lỗi thêm dịch vụ cho thú cưng thất bại!";
                echo json_encode($response);
            }
        
    }

?>
