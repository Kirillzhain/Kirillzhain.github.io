<?php
	$valuta=' р.';
	include 'database.php';
	function connect() {
		global $hostname;
		global $mysql_login;
		global $mysql_password;
		global $database;
		$con = mysqli_connect($hostname, $mysql_login, $mysql_password, $database) or die(mysqli_error($con));
		if (!$con) die('<h2>Ошибка подключения к серверу базы данных!</h2>');
		mysqli_set_charset($con,'utf8') or die(mysqli_error($con));
		return $con;
	};

// функция печатает результат запроса в виде html-таблицы
function SQLResultTable($Query, $con, $mask) {

	function mysqli_field_name($result, $field_offset) {
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->name : null;
	};

	$Table = "";  //initialize table variable

	$Table.= "<table id='myTable' border='1' style=\"border-collapse: collapse;\" class=\"tablesorter\">"; //Open HTML Table

	$Result = mysqli_query($con, $Query); //Execute the query
	if(mysqli_error($con)) {
		$Table.= "<tr><td>MySQL ERROR: " . mysqli_error($con) . "</td></tr>";
	}
	else {
		//Header Row with Field Names
		$NumFields = mysqli_num_fields($Result);
		$Table.= "<thead>";
		$Table.= "<tr style=\"background-color: #333399; color: #FFFFFF;\">";
		for ($i=0; $i < $NumFields; $i++)
		{
			$Table.= "<th>" . mysqli_field_name($Result, $i) . "</th>";
		}
		$Table.= "</tr>";
		$Table.= "</thead>";

		//Loop thru results
		$Table.= "<tbody>";
		$RowCt = 0; //Row Counter
		while($Row = mysqli_fetch_assoc($Result))
		{
			//Alternate colors for rows
			if($RowCt++ % 2 == 0) $Style = "background-color: #e2e2e2;";
			else $Style = "background-color: #f3ffbc;";

			$Table.= "<tr style=\"$Style\">";
			//Loop thru each field
			foreach($Row as $field => $value)
			{
				// делаем подсветку найденного
				$value=str_replace($mask, "<font color='red'>$mask</font>", $value);
				// отображаем значение
				$Table.= "<td>$value</td>";
			}
			$Table.= "</tr>";
		}
//		$Table.= "<tr style=\"background-color: #000066; color: #FFFFFF;\"><td colspan='$NumFields'>Найдено записей: " . mysqli_num_rows($Result) . "</td></tr>";
	}
	$Table.= "</tbody>";
	$Table.= "</table>";

	return $Table;
};


  function can_upload($file){
	// если имя пустое, значит файл не выбран
    if($file['name'] == '')
		return 'Вы не выбрали файл.';

	/* если размер файла 0, значит его не пропустили настройки
	сервера из-за того, что он слишком большой */
	if($file['size'] == 0)
		return 'Файл слишком большой.';

	// разбиваем имя файла по точке и получаем массив
	$getMime = explode('.', $file['name']);
	// нас интересует последний элемент массива - расширение
	$mime = strtolower(end($getMime));
	// объявим массив допустимых расширений
	$types = array('jpg', 'png', 'gif', 'bmp', 'jpeg');

	// если расширение не входит в список допустимых - return
	if(!in_array($mime, $types))
		return 'Недопустимый тип файла.';

	return true;
  }

	function make_upload($file, $id){
		// формируем уникальное имя картинки: случайное число и name
		$name = $id.'.jpg';
		copy($file['tmp_name'], 'upload/' . $name);
	}
error_reporting(0);
?>