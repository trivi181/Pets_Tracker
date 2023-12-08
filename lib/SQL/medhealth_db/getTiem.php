<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $userID = $_GET['userID'];
    $query_cek_user = mysqli_query($connection, "SELECT * FROM tiem WHERE userID = '$userID'");//WHERE userID = '$userID'"          
        while ($row_tiem = mysqli_fetch_array($query_cek_user)) {
            $key['maTiem'] = $row_tiem['maTiem'];
            $key['tenTiem'] = $row_tiem['tenTiem'];

            //$dateTime = $row_tiem['ngayTiem'];         
            //$date = date("Y-m-d", strtotime($dateTime));
            //$time = date("H:i:s", strtotime($dateTime));
        
            $key['ngayTiem'] = $row_tiem['ngayTiem']; // Ngày
            $key['gioTiem'] = $row_tiem['gioTiem']; // Giờ

            array_push($response, $key);
        }
        echo json_encode($response);

?>