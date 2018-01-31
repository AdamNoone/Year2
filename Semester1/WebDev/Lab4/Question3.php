<html>
<body>




<title>Question 1</title>

</head>

<body>

<form method="post" action="">
    <input type="text" name="hour" />
    <input type="submit" name="submit" />
  </form>

<?php

$hour = $_POST["hour"];

if ($hour < 10 )
{
	echo "Have a good morning!" ;
}

else if ($hour < 18)
{
	echo "Have a good day!" ;
}

else if ($hour < 23)
 {
 echo "Have a good night!" ;
 }
 else
 {
  echo "Switch off the computer!";
}




include "header.php"


?>

</body>
</html>
