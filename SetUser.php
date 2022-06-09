<?php
// Se connecter à la base de données
include("bd.php");

getUser();


function GetUser(){
    global $conn;
    $query = "INSERT INTO `login` (`id`, `nom`, `prenom`, `email`, `mdp`) VALUES (NULL, ".$_POST['nom'].", ".$_POST['prenom'].", ".$_POST['email'].", ".$_POST['mdp'].");";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);


    $stmt->closeCursor();
    sendJSON($data);
}

function sendJSON($infos){
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json");
    echo json_encode($infos,JSON_UNESCAPED_UNICODE);
}
?>