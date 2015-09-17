<?php
	$con = mysql_connect("SERVER","USERNAME","PASSWORD");
	if (!$con)
	  {
	   die('Could not connect: ' . mysql_error());
	  }
	mysql_select_db("matchmaker_db", $con);
?>
