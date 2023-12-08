<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $response = array();
        $email = $_POST['email'];
        $password = md5($_POST['password']);
    
        $query_cek_user = mysqli_query($connection, "SELECT * FROM user WHERE email = '$email'");
        $cek_user_result = mysqli_fetch_array($query_cek_user);
    
        if ($cek_user_result) {
            $query_login = mysqli_query($connection, "SELECT * FROM user WHERE email = '$email' && password = '$password'");
            $cek_login_result = mysqli_fetch_array($query_login);
    
            if ($cek_login_result) {
                $response['value'] = 1;
                $response['message'] = "Đăng nhập thành công!";
                $response['id'] = $cek_user_result['id'];
                $response['fullname'] = $cek_user_result['fullname'];
                $response['email'] = $cek_user_result['email'];
                $response['phone'] = $cek_user_result['phone'];
                $response['password'] = $cek_user_result['password'];
                $response['dateCreate'] = $cek_user_result['dateCreate'];
    
                $role_id = $cek_user_result['role_id'];
    
                $response['role_id'] = $role_id;
    
                echo json_encode($response, JSON_UNESCAPED_UNICODE);
            } else {
                $response['value'] = 2;
                $response['message'] = "Tài khoản hoặc mật khẩu sai!";
                echo json_encode($response, JSON_UNESCAPED_UNICODE);
            }
        } else {
            $response['value'] = 2;
            $response['message'] = "Tài khoản hoặc mật khẩu sai!";
            echo json_encode($response, JSON_UNESCAPED_UNICODE);
        }
    }
    
?>
