<?php
include 'config.php';

$ProdNameH = $_POST['ProdName'];
$ProdIDH= $_POST['ProdID'];
$ProdDescH = $_POST['ProdDesc'];
$ProdPriceH = $_POST['ProdPrice'];
$ProdStockH = $_POST['ProdStock'];



$sql = "INSERT INTO Product(productID , pName , description , price , stock)
VALUES('$ProdIDH' , '$ProdNameH' , '$ProdDescH' , '$ProdPriceH' , '$ProdStockH')";

if (ctype_digit($testcase)) {
        echo "The string $testcase consists of all digits.\n";
    }
if($db->query($sql)===TRUE){
  echo "new Record created!!!";
  Echo "<a href=main.php>Click here to go back to product list</a>";
  
}
else{
  echo "Error" . $db->error;
}
 ?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <h1>add new table</h1>
    <form action="add.php" method="post">
      <p>
      ProductName: <input type="text" name="ProdName"/>
    </p>
    <p>
      productID: <input type="text" name="ProdID"/>
    </p>
    <p>ProductDescription: <input type="text" name="ProdDesc" /></p>
    
    <p>ProductStock <input type="text" name="ProdStock" /> </p>
<input type="submit"/>
    </form>
  </body>
</html>
