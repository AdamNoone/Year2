<?php
include 'config.php';
$blah = (int)$_GET['product_id'];
$sql = "UPDATE Product SET stock = '100' WHERE productID = $blah";
if($db->query($sql)===TRUE){
  echo "Record updated successfully";
    Echo "<a href=main.php>Click here to go back to product list</a>";
}
else{
  echo "error on updating" . $db->error;
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
    <p>ProductPrice:<input type="number" min="1" max="500" step="1"  name="ProdPrice" pattern="\d+"></p>
    <p>ProductStock <input type="text" name="ProdStock" /> </p>
<input type="submit"/>
    </form>
  </body>
</html>