<?php
	
	$database = mysqli_connect('localhost', 'root','') or die (mysql_error());
	mysqli_select_db($database, "labdb") or die (mysql_error());
	$inserted_data = "INSERT into Product (ProductID, PName, Description, Price, Stock)
								VALUES ('$_POST[ProductID]', '$_POST[Pname]', '$_POST[Description]', '$_POST[Price]', '$_POST[Stock]')";
								
	#checking if the querry succeded
	if(mysqli_query($database, $inserted_data))
		echo "Record entered sucessfully";
	else
		echo "Error: ". $inserted_data . "<br>" . mysqli_error($database);
		
	
	
	mysqli_close($database);
?>