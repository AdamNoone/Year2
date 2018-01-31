<!DOCTYPE html>
<html>
<body>


<title>update product in database</title>

<form  method='post'>
  ID:
  <input type="text" name="ID"><br>
</form> 

<?php
  $d = $_POST['ProductID'];
  $database = mysqli_connect('localhost', 'root','') or die (mysql_error());
  mysqli_select_db($database, "labdb") or die (mysql_error());
  $sql="UPDATE product ProductID= 44 WHERE id=$d";

  #checking if the querry succeded
  if($database->query($sql) === TRUE) 
    echo "Record updated sucessfully";
  else
    echo "Error: ".$database->error;
    

  
  mysqli_close($database);
?>
</body>
</html>