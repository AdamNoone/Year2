<?php
include 'config.php';
$sql = "SELECT ProductID , PName , Description,Price,Stock From Product";
$result = $db->query($sql);
?>

<table>
  <tr>
    <th>ProductID</th>
    <th>Product Name</th>
    <th>Product Description</th>
    <th>Product Price</th>
    <th>Product stock</th>

  </tr>
  <?php

    while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
    //var_dump($row);
    echo "<tr>";
    echo "<td>" . $row['ProductID'] . "</td>";
    echo "<td>" . $row['PName'] . "</td>";
    echo "<td>" . $row['Description'] . "</td>";
    echo "<td>" . $row['Price'] . "</td>";
    echo "<td>" . $row['Stock'] . "</td>";
    echo "<td><a href = 'delete.php?product_id=" . $row['ProductID'] . " '>Delete</a></td> " ;
    echo "<td><a href = 'show.php?product_id=" . $row['ProductID'] . " '>Show</a></td> " ;
    echo "<td><a href = 'update.php?product_id=" . $row['ProductID'] . " '>update</a></td> " ;
    echo "</tr>";
    }


    ?>
</table>

<a href="add.php"> add new table</a>
