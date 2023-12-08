<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $response = array();
       
        $tenTiem = $_POST['tenTiem'];
        $ngayTiem = $_POST['ngayTiem'];
        $gioTiem = $_POST['gioTiem'];
        $userID = $_POST['userID'];

            $insertToTiem="INSERT INTO tiem(tenTiem, ngayTiem, gioTiem, userID) VALUES('$tenTiem','$ngayTiem','$gioTiem','$userID')";
            if(mysqli_query($connection,$insertToTiem)){
                $response['value']=1;
                $response['message']="Bạn đã thêm mũi tiêm thành công!";
                echo json_encode($response);
            } else{
                $response['value']=0;
                $response['message']="Xin lỗi thêm mũi tiêm thất bại!";
                echo json_encode($response);
            }
        
    }

?>
