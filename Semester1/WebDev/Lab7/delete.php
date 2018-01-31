<?php
include 'config.php';
var_dump($_GET['product_id']);
$blah = (int)$_GET['product_id']; //now has the ProductID

$sql = "DELETE FROM Product WHERE productID = $blah ";

if($db->query($sql) ===TRUE){
  echo "Record deleted successfully";
    Echo "<a href=main.php>Click here to go back to product list</a>";
}
else {
  echo "Error in deletion" . $db->error;
}


 ?>
