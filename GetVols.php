<?php
   // Se connecter à la base de données
  include("bd.php");
  
  getVol();


  function GetVol(){
    global $conn;
      $query = "SELECT * FROM `compagnies aeriennes` JOIN vols ON `compagnies aeriennes`.`id` = vols.id_compagnie";
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