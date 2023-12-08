<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $tipe = $_POST['tipe'];
    if($tipe == "TatCa"){    
        $query_cek_user = mysqli_query($connection, "SELECT * FROM dichvu JOIN datlich ON datlich.madv = dichvu.madv JOIN user  ON datlich.id = user.id");
        while ($row_datlich = mysqli_fetch_array($query_cek_user)) {
            $key['madl'] = $row_datlich['madl'];
            $key['fullname'] = $row_datlich['fullname'];
            $key['tendv'] = $row_datlich['tendv'];
            $key['ngay'] = $row_datlich['ngay']; 
            $key['gio'] = $row_datlich['gio']; 
            $key['trangthai'] = $row_datlich['trangthai']; 
            array_push($response, $key);
        }
        echo json_encode($response);
    }
    else{
        $query_cek_user = mysqli_query($connection, "SELECT * FROM dichvu JOIN datlich ON datlich.madv = dichvu.madv JOIN user  ON datlich.id = user.id WHERE datlich.trangthai = '$tipe'");
            while ($row_datlich = mysqli_fetch_array($query_cek_user)) {
            $key['madl'] = $row_datlich['madl'];
            $key['fullname'] = $row_datlich['fullname'];
                $key['tendv'] = $row_datlich['tendv'];
                $key['ngay'] = $row_datlich['ngay']; 
                $key['gio'] = $row_datlich['gio']; 
                $key['trangthai'] = $row_datlich['trangthai']; 
                array_push($response, $key);
            }
        echo json_encode($response);
    }
?>