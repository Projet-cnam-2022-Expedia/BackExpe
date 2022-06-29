<?php
// Se connecter à la base de données
include("bd.php");

getUser();


function GetUser(){
    if(!existe()){
        global $conn;
        $query = "INSERT INTO `users`(`id_user`, `nom`, `prenom`, `email`, `password`, `statut`) VALUES (?,?,?,?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->execute(array(null,$_POST['nom'],$_POST['prenom'],$_POST['email'],password_hash($_POST['mdp'], PASSWORD_BCRYPT),'user'));
        $stmt->closeCursor();
        sendJSON(null);
    }else {
        sendJSON('0');
    }
}

function sendJSON($infos){
    header("Content-Type: application/json, charset=utf-8");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Origin: *");
    echo json_encode($infos,JSON_UNESCAPED_UNICODE);
}

function existe(){
    global $conn;
    $query = "SELECT * FROM `users` where email = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute(array($_POST['email']));
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if ($data == []) {
        return false;
    }
    else{
        return true;
    }
}
?>