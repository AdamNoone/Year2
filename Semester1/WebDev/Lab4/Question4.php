<html>
<body>




<title>Question 1</title>

</head>

<body>

<form method="post" action="">
    <input type="text" name="num" />
    <input type="submit" name="submit" />
  </form>

<?php

$num = $_POST["num"];

for($i = 8; $i <= $num; $i++)
{
   echo "<span style='font-size:{$i}pt'>Hello PHP</span><br />\n";
}







?>

</body>
</html>