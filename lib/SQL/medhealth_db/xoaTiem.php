<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");

    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $response = array();

        // Kiểm tra nếu có tham số 'maTiem' được gửi lên
        if (isset($_POST['maTiem'])) {
            $maTiem = $_POST['maTiem'];

            $deleteTiem = "DELETE FROM tiem WHERE maTiem = '$maTiem'";

            if (mysqli_query($connection, $deleteTiem)) {
                $response['value'] = 1;
                $response['message'] = "Bạn đã xóa mũi tiêm thành công!";
                echo json_encode($response);
            } else {
                $response['value'] = 0;
                $response['message'] = "Xin lỗi, xóa mũi tiêm thất bại!";
                echo json_encode($response);
            }
        }
    }
?>
