<?php

$mysql_host = 'localhost';
$mysql_username = 'root';
$mysql_password = '1234';

mysql_connect($mysql_host, $mysql_username, $mysql_password)or
		die("Could not connect: " . mysql_error());
		mysql_select_db("db");

?>
