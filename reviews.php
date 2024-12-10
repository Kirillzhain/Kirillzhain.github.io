<?php
	header('Content-type: text/html; charset=utf-8');
	include "auth.php";
	error_reporting(E_ALL);
	if (!in_array($_SESSION['level'], array(10, 2))) { // доступ разрешен только группе пользователей
		header("Location: login.php"); // остальных просим залогиниться
		exit;
	};

	/*
	Скрипт-редактор
	*/
	include "database.php";
	include "func.php";
	include "scripts.php";
	$con=connect();
	$title='Отзывы';
	$table='reviews';
	$edit=in_array($_SESSION['level'], array(10, 2)) ? true : false;

?>
<html>
<head>
	<meta charset="utf-8">
	<title><?php echo $title;?></title>
	<link rel="stylesheet" type="text/css" href="style.css">

<style>
	input{
		width:100%;
	}
</style>

</head>

<body>
<table id="main_table">
	<!-- баннер -->
	<tr>
		<td colspan=2 style="text-align:center">
			<?php
				include('top.php');
			?>
		</td>
	</tr>

	<tr>
		<!-- меню -->
		<td width="300px" class="menu2">
			<?php
				include('menu.php');
			?>
		</td>

		<!-- контент -->
		<td width="900px" class="content">

<h1><?php echo $title;?></h1>
<?php
	// если надо удалить
	if (!empty($_GET['delete_id'])) {
		$id=intval($_GET['delete_id']);		$query="
			DELETE FROM `$table`
			WHERE id=$id
		";
		mysqli_query($con, $query) or die(mysqli_error($con));
	};

	// если надо редактировать, загружаем данные
	if (!empty($_GET['edit_id'])) {
		$id=intval($_GET['edit_id']);
		$query="
			SELECT
				`user_id`, `dt`, `name`, `content`
			FROM `$table`
			WHERE id=$id
		";
		$res=mysqli_query($con, $query) or die(mysqli_error($con));
		$row=mysqli_fetch_array($res);
		$user_id=$row['user_id'];
		$dt=$row['dt'];
		$name=$row['name'];
		$content=$row['content'];
	};

	// если надо сохранить (если не пусто)
	if (isset($_POST['name']) && !empty($_POST['user_id'])) {
		$user_id=abs(intval(trim($_POST['user_id'])));
		$dt=mysqli_real_escape_string($con, trim($_POST['dt']));
		$dt=str_replace('.', '-', $dt);
		$name=mysqli_real_escape_string($con, trim($_POST['name']));
		$content=mysqli_real_escape_string($con, trim($_POST['content']));

		$fields="
			`user_id`='$user_id',
			`dt`='$dt',
			`name`='$name',
			`content`='$content'
		";

		// если надо сохранить отредактированное
		if (!empty($_REQUEST['hidden_edit_id'])) {
			$id=intval($_REQUEST['hidden_edit_id']);			$query="
				UPDATE `$table`
				SET
					$fields
				WHERE
					id=$id
			";
		}
		else { // добавление новой строки
			$query="
				INSERT INTO `$table`
				SET
					$fields
			";
		};

		mysqli_query($con, $query) or die(mysqli_error($con));
		if (!$id) $id=mysqli_insert_id($con);


	};

	if (isset($_POST['btn_submit'])) // была нажата кнопка сохранить - не надо больше отображать id
		$id=0;

	// добавляем возможность удаления админам
	$delete_confirm="onClick=\"return window.confirm(\'Подтверждаете удаление?\');\"";
	$admin_delete=$edit ? ", CONCAT('<a href=\"$table.php?delete_id=', `$table`.id, '\" $delete_confirm>', 'удалить&nbsp;#', `$table`.id, '</a>') AS 'Удаление'" : '';
	// добавляем возможность редактирования админам
	$admin_edit=$edit ? ", CONCAT('<a href=\"$table.php?edit_id=', `$table`.id, '\">', 'редактировать&nbsp;#', `$table`.id, '</a>') AS 'Редактирование'" : '';
	$query="
		SELECT
			`users`.`login` AS 'логин пользователя',
			`$table`.`dt` AS 'Дата',
			`reviews`.`name` AS 'Наименование',
			`reviews`.`content` AS 'Содержимое отзыва'
			$admin_delete
			$admin_edit
		FROM
			`$table`
		LEFT JOIN
			`users` ON `users`.`id`=`$table`.`user_id`
		WHERE 1
	";

	echo SQLResultTable($query, $con, '');
?>

<?php
	// доступ к редактированию только админу
	if ($edit) { // if (admin)
?>
<form name="form" action="<?php echo $table?>.php" method="post">
	<table width="900px">
		<tr>
			<th colspan="2">
				<p>Редактор <?php if (!empty($id)) echo "(редактируется строка с кодом $id)";?></p>
			</th>
		</tr>

		<tr>
			<td>Дата</td>
			<td>
				<input id="dt" name="dt" class="datepicker_air" type="text" value="<?php if (!empty($dt)) echo $dt; else echo date('Y.m.d H:i:s');?>">
			</td>
		</tr>

		<tr>
			<td>Наименование отзыва</td>
			<td>
				<input id="name" name="name" type="text" value="<?php if (!empty($name)) echo $name;?>">
			</td>
		</tr>

		<tr>
			<td>Содержимое отзыва</td>
			<td>
				<textarea id="content" name="content"><?php if (!empty($name)) echo $name;?></textarea>
			</td>
		</tr>

		<tr>
			<td>Пользователь</td>
			<td>
				<select id="user_id" name="user_id">
					<?php
						$query="
							SELECT `id`, `login`
							FROM `users`
							ORDER BY `login`
						";
						$res=mysqli_query($con, $query) or die(mysqli_error($con));
						while ($row=mysqli_fetch_array($res, MYSQLI_ASSOC)) {
							$selected= ($status==$row['id']) ? 'selected' : '';
							echo "
								<option value='$row[id]' $selected>$row[login]</option>
							";
						};
					?>
				</select>
			</td>
		</tr>




	<input name="hidden_edit_id" type="hidden" value="<?php if (!empty($id)) echo $id;?>">

	<tr>
		<td colspan='2'>
			<button id="btn_reset" type="reset">Очистить поля</button>
			<button id="btn_submit" name="btn_submit" type="submit">Сохранить</button>
		</td>
	</tr>
	</table>

</form>
<?php
	}; // if (admin)
?>

		</td>
	</tr>

	<!-- подвал -->
	<tr>
		<td colspan=2>
			<?php
				include('footer.php');
			?>
		</td>
	</tr>

</table>

</body>
</html>