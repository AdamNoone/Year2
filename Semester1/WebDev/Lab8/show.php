<?php
include 'config.php';

echo '<table border="1">'."\n";
$blah = (int)$_GET['product_id'];
$sql= "SELECT * FROM Product where productID = $blah ";
$result = $db->query($sql);
//var_dump($result);

     while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
    //var_dump($row);
    echo "<tr>";
    echo "<td>" . $row['ProductID'] . "</td>";
    echo "<td>" . $row['PName'] . "</td>";
    echo "<td>" . $row['Description'] . "</td>";
    echo "<td>" . $row['Price'] . "</td>";
    echo "<td>" . $row['Stock'] . "</td>";
    echo "</tr>";
	
	Echo "<a href=main.php>Click here to go back to product list</a>";
	
}
 ?>
