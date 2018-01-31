<html>
<body>




<title>Question 1</title>

</head>

<body>

<?php

$numbers = array("5", "10", "15", "20","25","30","35","40"); 




//while loop 



		$x = 5; 

		while($x < 45) 
		{
			if ($x != 40)
			{
				if ($x == 25)
				{
					$x += 5;
				}
				echo "$x, ";
				$x += 5;
			}
			else
			{
				echo "$x.";
				break;
			}
			
		}


//do while loop 

 $x = 5; 

		do
		{
			if ($x != 40)
			{
				if ($x == 25)
				{
					$x += 5;
				}
				echo "$x, ";
				$x += 5;
			}
			else
			{
				echo "$x.";
				break;
			}
		}while($x < 45);

//foreach loop
foreach ($numbers as $value) {
    echo "$value <br>";
}

include "header.php"



?>

</body>
</html>
