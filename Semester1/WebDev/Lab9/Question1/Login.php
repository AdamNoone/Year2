

<?php  //Start the Session
session_start();
 require('config.php');
//3. If the form is submitted or not.
//3.1 If the form is submitted
if (isset($_POST['username']) and isset($_POST['password'])){
//3.1.1 Assigning posted values to variables.
$username = $_POST['username'];
$password = $_POST['password'];
//3.1.2 Checking the values are existing in the database or not
$query = "SELECT * FROM `user` WHERE username='$username' and password='$password'";
 
$result = mysqli_query($db, $query) or die(mysqli_error($db));
$count = mysqli_num_rows($result);
//3.1.2 If the posted values are equal to the database values, then session will be created for the user.
if ($count == 1){
$_SESSION['username'] = $username;
}else{
//3.1.3 If the login credentials doesn't match, he will be shown with an error message.
echo "Login details incorrect,Please enter a valid Username and Pasword ";
echo" Or if you dont have an account sign up";
echo "<a href='SignUp.php'>SignUp</a>";
}
}
//3.1.4 if the user is logged in Greets the user with message
if (isset($_SESSION['username'])){
$username = $_SESSION['username'];
echo "Hello " . $username . " ,please enter you address";


 require('Address.php');

echo "<a href='Logout.php'>Logout</a>";

 
}
//3.2 When the user visits the page first time, simple login form will be displayed.

?>



<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	</head>
<body>

      <form method="POST">
        <h2>Please Login</h2>
        <div>
	  <span id="basic-addon1">@</span>
	  <input type="text" name="username" placeholder="Username" required>
	</div>
        <label for="inputPassword">Password</label>
        <input type="password" name="password" id="inputPassword" placeholder="Password" required>
        <button type="submit">Login</button>
      </form>

</body>
</html>