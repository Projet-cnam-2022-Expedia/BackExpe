<?php
   // Se connecter à la base de données
  include("bd.php");
  
  getVol();


  function GetVol(){
    global $conn;
      $query = "SELECT DISTINCT nom_compagnie, ville_depart, ville_arrivee FROM `compagnies aériennes` NATURAL JOIN  vols LEFT JOIN escales ON vols.id_vol = escales.id_vol";
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