<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    if($_SERVER["REQUEST_METHOD"] == 'POST'){
        $response = array();
        $madl = $_POST['madl'];
        $tipe = $_POST['tipe'];

        $cek_cart = mysqli_query($connection, "SELECT * FROM datlich WHERE madl = '$madl'");
        $result = mysqli_fetch_array($cek_cart);
        $qty = $result['status'];

        if($result){
            if($tipe == "duyet"){
                $update_tambah = mysqli_query($connection, "UPDATE datlich set trangthai = 1 where madl = '$madl'");
                if($update_tambah){
                    $response['value'] = 1;
                    $response['message'] = "";
                    echo json_encode($response);
                } else{
                    $response['value'] = 0;
                    $response['message'] = "Khong the duyet";
                    echo json_encode($response);
                }
            }else{
                
                    if($tipe == "khongDuyet"){
                        $query_delete = mysqli_query($connection, "DELETE FROM datlich WHERE madl = '$madl'");
                        if($query_delete){
                            $response['value'] = 1;
                            $response['message']="";
                            echo json_encode($response);
                        
                        } else{
                            $response['value'] = 0;
                            $response['message'] = "Khong the xoa";
                            echo json_encode($response);
                        }
                }
            }
        } else{
            $response['value'] = 0;
            $response['message']="them so luong san pham that bai";
            echo json_encode($response);
        }
    }

?>