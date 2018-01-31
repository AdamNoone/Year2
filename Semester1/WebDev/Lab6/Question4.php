<html>
<body>




<title>Question 4</title>

</head>

<body>
<?php


echo '<table border="1">'."\n";
$database = mysqli_connect('localhost', 'root', '') or
die(mysqli_error());
mysqli_select_db($database,"LabDb") or die(mysqli_error());
$result = mysqli_query($database,"SELECT ProductID, PName,Description,Price,Stock
FROM product");
while ( $row = mysqli_fetch_row($result) ) {
echo "<tr><td>";
echo($row[0]);
echo("</td><td>");
echo($row[1]);
echo("</td><td>");
echo($row[2]);
echo("</td><td>");
echo($row[3]);
echo("</td><td>");
echo($row[4]);
echo("</tr>\n");


}
echo "</table>\n";
mysqli_close($LabDB);


?>

</body>
</html>