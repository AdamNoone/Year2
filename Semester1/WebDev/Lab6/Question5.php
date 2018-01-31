<html>
<body>




<title>Question 4</title>

</head>

<body>


<form method="post" action="">
    <label for="UserID">UserID</label><input type="text" name="UserID" />
	<label for="UserName">UserName</label><input type="text" name="UserName" />
	<label for="Password">Password</label><input type="text" name="Password" />
	<label for="FirstName">FirstName</label><input type="text" name="FirstName" />
	<label for="LastName">Lastname</label><input type="text" name="LastName" />
    <input type="submit" name="submit" />
  </form>
<?php

$database = mysqli_connect('localhost', 'root', '') or
die(mysqli_error());
mysqli_select_db($database,"LabDb") or die(mysqli_error());


 
$sql="INSERT INTO user (UserID, UserName,Password,FirstName,LastName)
VALUES
('$_POST[UserID]','$_POST[UserName]','$_POST[Password],'$_POST[FirstName],'$_POST[LastName])";
 
mysqli_query($database,$sql);
?>

<p>Add A New User</p>



</body>
</html>