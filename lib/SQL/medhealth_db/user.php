<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $response = array();
        $fullname = $_POST['fullname'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $password = md5($_POST['password']);

        $query_cek_user = mysqli_query($connection, "SELECT * FROM user WHERE email = '$email'");
        $cek_user_result=mysqli_fetch_array($query_cek_user);
        if($cek_user_result){
            $response['value']=0;
            $response['message'] = "Tài khoản đã tồn tại!";
            echo json_encode($response, JSON_UNESCAPED_UNICODE);
        }else{
            $query = "INSERT INTO user(fullname,email,phone,password,dateCreate,role_id) VALUES('$fullname','$email','$phone', '$password', NOW(), 2)";

            $query_insert_user=mysqli_query($connection,$query);
            if($query_insert_user){
                $response['value']=1;
                $response['message'] = "Đăng ký thành công!";
                echo json_encode($response, JSON_UNESCAPED_UNICODE);
            }else{
                $response['value']=2;
                $response['message'] = "Đăng ký thất bại!";
                echo json_encode($response, JSON_UNESCAPED_UNICODE);
            }
        }
    }

?>
