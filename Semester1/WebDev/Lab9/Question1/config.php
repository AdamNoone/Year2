<?php
$serverName = "localhost";
$username = "root";
$password = "";
$dbname = "labdb";

$db = new mysqli($serverName , $username ,$password , $dbname);
if($db->connect_error){
  die("connection failed: " . $db->connect_error);
}
 ?>
