<html>
<body>




<title>Question 2</title>

</head>

<body>

<?php




//Identity

$vv = " Hello World! " ;
echo " First : " . strpos( $vv, " Wo" ) . " <br / >" ;
echo " Second: " . strpos( $vv, " He" ) . " <br / >" ;
echo " Third: " . strpos( $vv, " ZZ" ) . " <br / >" ;
if ( strpos( $vv, " He" ) ===FALSE ) echo " Wrong A<br / >" ;
if ( strpos( $vv, " ZZ" ) ===FALSE ) echo " Right B<br / >" ;
if ( strpos( $vv, " He" ) !== FALSE ) echo " Right C<br / >" ;
if ( strpos( $vv, " ZZ" ) == FALSE ) echo " Right D<br / >" ;
print_r ( FALSE) ; print FALSE;
echo " Where were they?<br / >"


/*   ==,==,!==,==.
First : 6 
Second: 0 
Third: 
Right B       
Right C
Right D
Where were they?

*/

?>


</html>
</body>