<html>
	<head>
		<title>Database</title>
	</head>
	<body>
<?php
	// check if PDO has been installed
	if(!defined('PDO::ATTR_DRIVER_NAME')){
		echo 'PDO unavailable';
	}

	// connect database
	try{
		$hostname = 'localhost';
		$databasename = 'employees';
		$username = 'root';
		$password = 'mysql';
		$DBH = new PDO("mysql:host=$hostname; dbname=$databasename; charset=utf8mb4", $username, $password);
		//$DBH->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT);
		//$DBH->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
		$DBH->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		echo 'Connected';
	}
	catch(PDOException $e){
		echo $e->getMessage();
	}

	// prepare query and fetch
	try{
		$stmt = $DBH->prepare("select * from employees where gender = ?");
		$stmt->bindParam(1, $gen);
		$gen = 'M';

		//$stmt=$DBH->prepare("select * from departments");
		$stmt->execute();
		while($row = $stmt->fetch())
		{
			echo "<li>".$row['first_name'].' '.$row['last_name'].'</li>';

			//print_r($row);
		}
	}
	catch(PDOException $e){
		echo $e->getMessage();
	}

	// remove connection
	$DBH = NULL;

?>
	</body>
</html>
