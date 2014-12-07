<!DOCTYPE HTML>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Movie Rental</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script>
		$(function() {
	   	 $( "#datepicker" ).datepicker();
	  	});
	  	$(function() {
	   	 $( "#datepicker2" ).datepicker();
	  	});
  	</script>
</head>
<body>
	<?php

	define("DB_IP", "localhost");

	define("DB_LOGIN", "root");

	define("DB_PASS", "root");

	define("DB_BDD", "movies_rental");

	function dbconnect() {
		return mysqli_connect(DB_IP , DB_LOGIN , DB_PASS , DB_BDD); // Connexion a la BD
	}

?>

	<form action="rental.php"	method="post">
		<fieldset>
			<label for="movies_name">Film :</label>
			<select name="movies_name" id="movies_name">
			<?php
				$bdd = dbconnect();
				
				$query = "SELECT title from movie";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($movie = mysqli_fetch_assoc($result)){
					echo"<option value=".$movie["title"].">".$movie["title"]."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label form="type_movie">Catégorie :</label>
			<select name="type_movie" id="type_movie">
				<?php
				$bdd = dbconnect();
				
				$query = "SELECT categorie from movie";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($categorie = mysqli_fetch_assoc($result)){
					echo"<option value=".$categorie["categorie"].">".$categorie["categorie"]."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label form="support_movie">Support :</label>
			<select name="support_movie" id="supprot_movie">
				<option value="DVD">DVD</option>
				<option value="VCD">VCD</option>
				<option value="VHS">VHS</option>
			</select><br />
			<label for="start_date_rental">Date de location :</label>
			<input type="text" id="datepicker" /><br />
			<label for="end_date_rental">Date limite de location :</label>
			<input type="text" id="datepicker2" /><br />
			<label for="firstname">Prénom :</label>
			<input type="text" id="firstname" /><br />
			<label for="lastname">Nom :</label>
			<input type="text" id="lastname" /><br />
			<input type="submit" name="valider" value="Valider" />
			</fieldset>
			
		</fieldset>
	</form>
</body>
</html>
