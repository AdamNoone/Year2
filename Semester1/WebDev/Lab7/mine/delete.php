<!DOCTYPE html>
<html>
<body>


<title>Delete product from database</title>

<form  method='post'>
  ID:
  <input type="text" name="ID"><br>
</form> 

<?php
  $d = $_POST['ID'];
  $database = mysqli_connect('localhost', 'root','') or die (mysql_error());
  mysqli_select_db($database, "labdb") or die (mysql_error());
  $sql="DELETE FROM product WHERE ProductID=$d";

  #checking if the querry succeded
  if($database->query($sql) === TRUE) 
    echo "Record deleted sucessfully";
  else
    echo "Error: ".$database->error;
    

  
  mysqli_close($database);
?>
</body>
</html>