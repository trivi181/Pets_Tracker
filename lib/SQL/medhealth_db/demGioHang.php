<?php
    require "config.php";
    header("Access-Control-Allow-Origin: *");
    $response = array();
    $id = $_GET['id'];

    $query_select_cart = mysqli_query($connection, "SELECT COUNT(*) as dem FROM giohang WHERE id = '$id'");

    While($row = mysqli_fetch_array($query_select_cart)){

        $key['dem'] = $row['dem'];
        array_push($response, $key);
    }
    echo json_encode($response);


?>