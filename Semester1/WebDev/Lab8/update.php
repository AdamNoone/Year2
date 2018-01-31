
Mail 
COMPOSE
Labels
Inbox (91)
Starred
Sent Mail
Drafts (1)
More 
Hangouts

 
 
 
  More 
1 of 582  
 
Expand all Print all In new window
Dream Team 
Inbox
x 

Adam Noone		Attachments9 Nov (8 days ago)
 

Lauren Byrne		Attachments9 Nov (8 days ago)
2017-11-09 15:50 GMT+00:00 Adam Noone <c16448216@mydit.ie>: > > > > This emai...

Lauren Byrne		Attachments9 Nov (8 days ago)
xoxox

Sharon O Malley <c16469614@mydit.ie>
Attachments14:27 (0 minutes ago)

to Adam, Lauren 
Irish
English   Translate message
Turn off for: Irish

Attachments area
	
Click here to Reply, Reply to all or Forward
Using 0.2 GB
Programme Policies
Powered by Google
Last account activity: 1 hour ago
Details

<?php
include 'config.php';
$blah = (int)$_GET['product_id'];

$ProdNameH =($_POST['PName']);
$ProdDescH = ($_POST['Description']);
$ProdPriceH =($_POST['Price']);
$ProdStockH =($_POST['STOCK']);
$sql = "UPDATE Product SET PName = '$ProdNameH', Description ='$ProdDescH', Price ='$ProdPriceH', STOCK ='$ProdStockH' WHERE productID = '$blah'";

//$result = mysqli_query("SELECT ProdName, ProdDesc, ProdPrice, ProdStock
//FROM Product WHERE productID = '$blah'");
//$row = mysql_fetch_row($sql);
//$ProdNameH  = htmlentities($row[0]);
//$ProdDescH = htmlentities($row[1]);
//$ProdPriceH = htmlentities($row[2]);

if($db->query($sql)===TRUE){
  echo "Record updated successfully";
    Echo "<a href=main.php>Click here to go back to product list</a>";
}
else{
  echo "error on updating " . $db->error;
}
echo 
<<< _END
<p>Update Product</p>
<form method="post">
<p>ProductName:
<input type="text" name="PName" value="$ProdNameH"></p>
<p>ProductID:
<input type="text" name="ProdID" value="$blah"></p>
<p>Product Description:
<input type="text" name="Description" value="$ProdDescH"></p>
<p>Product Price:
<input type="number" name="Price" value="$ProdPriceH">
</p><p>Product Stock:
<input type="number" name="STOCK" value="$ProdStockH"></p>
<p><input type="submit" value="Update"/>
</form>

_END



 ?>
