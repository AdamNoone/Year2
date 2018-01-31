

<?php
// Include config file
require_once 'config.php';



$UserID = $_POST['UserID'];
$UserName = $_POST['Username'];
$Password = $_POST['Password'];
$FirstName = $_POST['FirstName'];
$SurName = $_POST['LastName'];


$sql = "INSERT INTO User(UserID,Username , Password , FirstName ,LastName)
VALUES('$UserID','$UserName' , '$Password' , '$FirstName' , '$SurName' )";
if($db->query($sql)===TRUE){
  
  echo "<a href='Login.php'>Login here</a>";
}
else{
  echo "Error" . $db->error;

}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>

     <h1>Registration Form</h1>
    <form action="SignUp.php" method="post">
	
	<p>
      UserID: <input type="text" name="UserID"/>
    </p>
      <p>
      Username: <input type="text" name="Username"/>
    </p>
	  <p>
      Password: <input type="password" name="Password"/>
    </p>
    <p>
      First Name: <input type="text" name="FirstName"/>
    </p>
	<p>
       Surname: <input type="text" name="LastName"/>
    </p>
	
   
<input type="submit"/>  
</body>
</html>