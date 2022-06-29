<?php


// Se connecter à la base de données
include("bd.php");
getUser();


function GetUser(){
    global $conn;
    $query = "Select * from users where email = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute(array($_POST['email']));
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);


    $stmt->closeCursor();
    if($data != []) {

        if (password_verify($_POST['mdp'],$data[0]['password'])) {
            sendJSON($data);
        } else {
            sendJSON("0");
        }
    }else{
        sendJSON("1");
    }

}

function sendJSON($infos){
    header("Content-Type: application/json, charset=utf-8");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Origin: *");
    echo json_encode($infos,JSON_UNESCAPED_UNICODE);
}
?>