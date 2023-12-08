<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $query_cek_user = mysqli_query($connection, "SELECT * FROM dichvu ");//WHERE userID = '$userID'"          
        while ($row_tiem = mysqli_fetch_array($query_cek_user)) {
            $key['madv'] = $row_tiem['madv'];
            $key['tendv'] = $row_tiem['tendv'];

            //$dateTime = $row_tiem['ngayTiem'];         
            //$date = date("Y-m-d", strtotime($dateTime));
            //$time = date("H:i:s", strtotime($dateTime));
        
            $key['gia'] = $row_tiem['gia']; // Ngày
            $key['mota'] = $row_tiem['mota']; // Giờ

            array_push($response, $key);
        }
        echo json_encode($response);

?>