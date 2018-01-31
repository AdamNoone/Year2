<html>
<body>




<title>Question 1</title>

</head>

<body>
<?php

$city = array('Tokyo', 'Mexico City', 'New York City', 'Mumbai', 'Seoul','Shanghai', 'Lagos', 'Buenos Aires', 'Cairo', 'London');
 
 
 foreach ($city as $value) {
    echo "$value ,";
}

echo "</br> ";
sort($city);

 foreach ($city as $value) {
    echo "$value ,";
}

$city[10] = 'Los Angeles';
$city[11] = 'Calcutta';
$city[12] = 'Osaka';
$city[13] = 'Beijing';


echo "</br> ";

 foreach ($city as $value) {
    echo "$value ,";
}

echo "</br> ";
sort($city);

 foreach ($city as $value) {
    echo "$value ,";
}

?>




</body>
</html>