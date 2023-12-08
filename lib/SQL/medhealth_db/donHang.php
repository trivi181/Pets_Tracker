<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $userID = $_GET['id'];
    $tipe = $_POST['tipe'];
    if($tipe == "TatCa"){
    $selectCart = mysqli_query($connection, "SELECT *  FROM hoadon JOIN user on hoadon.id = user.id WHERE hoadon.id = '$userID'");
        while($row = mysqli_fetch_array($selectCart)){
            $key['id'] = $row['id'];
            $key['hoaDon'] = $row['hoaDon'];
            $key['fullname'] = $row['fullname'];
            $key['phone'] = $row['phone'];
            $key['status'] = $row['status'];
            array_push($response, $key);
        }
    echo json_encode($response);

    }
    else{
    $selectCart = mysqli_query($connection, "SELECT *  FROM hoadon JOIN user on hoadon.id = user.id WHERE hoadon.id = '$userID' AND hoadon.status = '$tipe'");
        while($row = mysqli_fetch_array($selectCart)){
            $key['id'] = $row['id'];
            $key['hoaDon'] = $row['hoaDon'];
            $key['fullname'] = $row['fullname'];
            $key['phone'] = $row['phone'];
            $key['status'] = $row['status'];
            array_push($response, $key);
        }
    echo json_encode($response);

    }
?>