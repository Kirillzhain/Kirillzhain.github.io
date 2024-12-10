<?php
	/*
	Контакты
	*/
	header('Content-type: text/html; charset=utf-8');
	error_reporting(E_ALL);
	include('auth.php');
	include('func.php');
	$title='Реквизиты';
?>
<html>
<head>
	<meta charset="utf-8">
	<title><?php echo $title;?></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<table id="main_table" border="0">
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
		<td width="270px" class="menu" style="vertical-align:top;">
			<?php
				include('menu.php');
				include('showcase.php');
			?>
		</td>

		<!-- контент -->
		<td width="900px"   style="vertical-align:top;">

<h1>Реквизиты</h1>
<p>
ООО "Семена"
</p>

<p>
Юридический адрес: 123456, Москва, ул. Садовая, дом 10, офис 203
</p>

<p>
ИНН: 77 65 432 109
</p>

<p>
КПП: 98 76 54 321
</p>

<p>
ОГРН: 9876543210987
</p>            </div>

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