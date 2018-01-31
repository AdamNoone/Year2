<html>
<body>




<title>Question 1</title>

</head>

<body>

<?php

$ActaulTime = date("H");


if ($ActaulTime < 10 )
{
	echo "Have a good morning!" ;
}

else if ($ActaulTime > 10 && $ActaulTime < 20)
{
	echo "Have a good day!" ;
}

else
 {
 echo "Have a good night!" ;
 }
 
 include "header.php"
 

?>

</body>
</html>
