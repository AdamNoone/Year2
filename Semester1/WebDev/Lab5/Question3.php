<html>
<body>




<title>Question 1</title>

</head>

<body>
<?php
$myfile1 = fopen("lab5.txt", "r") or die("Unable to open file!");
echo fread($myfile1,filesize("lab5.txt"));
fclose($myfile1);





$myfile1 = fopen("lab5.txt", "a+") or die("Unable to open file!");
$myfile2 = fopen("lab5_2.txt", "a+") or die("Unable to open file!");

/*fwrite( $myfile1, "lab5_2.txt" );
echo fread($myfile1,filesize("lab5.txt"));
*/

$file1 = file_get_contents("lab5.txt");
$path2 = "lab5_2.txt";
$file2 = file_get_contents($path2);

 file_put_contents($path2, $file1);
 
 echo fread($myfile1,filesize("lab5.txt"));
 
 fclose($myfile1);
 fclose($myfile2);


?>

</body>
</html>