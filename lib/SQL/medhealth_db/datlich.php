

<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $userID = $_GET['id'];
    $tipe = $_POST['tipe'];
    if($tipe == "TatCa"){
        $query_cek_user = mysqli_query($connection, "SELECT datlich.madl, dichvu.tendv, datlich.ngay, datlich.gio, datlich.trangthai FROM datlich JOIN dichvu ON datlich.madv = dichvu.madv WHERE datlich.id = '$userID'");
    while ($row_datlich = mysqli_fetch_array($query_cek_user)) {
        $key['madl'] = $row_datlich['madl'];
        $key['tendv'] = $row_datlich['tendv'];
        $key['ngay'] = $row_datlich['ngay']; 
        $key['gio'] = $row_datlich['gio']; 
        $key['trangthai'] = $row_datlich['trangthai']; 
        array_push($response, $key);
    }
        echo json_encode($response);
    
    }else{
    $query_cek_user = mysqli_query($connection, "SELECT datlich.madl, dichvu.tendv, datlich.ngay, datlich.gio, datlich.trangthai FROM datlich JOIN dichvu ON datlich.madv = dichvu.madv WHERE datlich.id = '$userID' AND datlich.trangthai = '$tipe'");
            while ($row_datlich = mysqli_fetch_array($query_cek_user)) {
                $key['madl'] = $row_datlich['madl'];
                $key['tendv'] = $row_datlich['tendv'];
                $key['ngay'] = $row_datlich['ngay']; 
                $key['gio'] = $row_datlich['gio']; 
                $key['trangthai'] = $row_datlich['trangthai']; 
                array_push($response, $key);
            }
        echo json_encode($response);
            
        }
?>
