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
	   	 $( "#datepicker").datepicker({dateFormat: "yy-mm-dd"});
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

	<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>"	method="post">
		<fieldset>
			<label form="rental_shop">Magasin de location :</label>
			<select name="rental_shop" id="rental_shop">
				<?php
				$bdd = dbconnect();
				
				$query = "SELECT name_shop from shop";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($shop = mysqli_fetch_assoc($result)){
					echo"<option value=".$shop["name_shop"].">".$shop["name_shop"]."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label for="movies_name">Film :</label>
			<select name="movies_name" id="movies_name">
			<?php
				$bdd = dbconnect();
				
				$query = "SELECT title FROM movie";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($movie = mysqli_fetch_assoc($result)){
					echo "<option value=\"".$movie['title']."\">".$movie['title']."</option>";
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
			<input type="date" id="datepicker" name="start_date_rental" /><br />
			<label for="firstname">Prénom :</label>
			<input type="text" id="firstname" name="firstname" /><br />
			<label for="lastname">Nom :</label>
			<input type="text" id="lastname" name="lastname" /><br />
			<label for="adress">Adresse :</label>
			<input type="text" id="adress" name="adress" /><br />
			<input type="submit" name="valider" value="Valider" />
			</fieldset>
			
		</fieldset>
	</form>
	<?php
		if(!empty($_POST)){
			extract($_POST);
				
			$bdd = dbconnect();
			
			/*
$start_d = $start_date_rental;
			
			$start_date_rental = str_replace("/", "-", $start_d);
			
			$end_d = $end_date_rental;
			
			$end_date_rental = str_replace("/", "-", $end_d);
*/
			

			$request_id_booking = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'movies_rental' AND TABLE_NAME = 'booking';";


			$res = mysqli_query($bdd, $request_id_booking);
			$donnee = mysqli_fetch_assoc($res);
			$lastIdBooking = $donnee['AUTO_INCREMENT'];
			

			$request_id_member = "SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'movies_rental' AND TABLE_NAME = 'member';";


			$res = mysqli_query($bdd, $request_id_member);
			$donnee = mysqli_fetch_assoc($res);
			$lastIdMember = $donnee['AUTO_INCREMENT'];
			
			$request = "SELECT * FROM movie JOIN contents_in_sup USING (id_movie) JOIN support USING (id_support) JOIN occupied USING (id_support) JOIN booking USING (id_booking) WHERE booking.id_movie!=movie.id_movie AND support.type='".$support_movie."' AND movie.title='".$movies_name."' AND end_date_rental IS NOT NULL";
			
			$request = "INSERT INTO booking(start_date_rental, end_date_rental, rental_shop, restitution_shop, name_movie, categorie_movie, type) VALUES('$start_date_rental', '$end_date_rental', '$rental_shop', '$restitution_shop', '$movies_name', '$type_movie', '$support_movie')";
			
			mysqli_query($bdd, $request);
			
			$request = "INSERT INTO member(firstname, lastname, adress) VALUES('$firstname', '$lastname', '$adress')";
			
			mysqli_query($bdd, $request);
			
			$request = "INSERT INTO reserved(id_booking, id_member) VALUES('$lastIdBooking', '$lastIdMember')";
			
			mysqli_query($bdd, $request);
			
			mysqli_close($bdd);
			
			echo "La location est enregistrée.";
			
		}
	?>
</body>
</html>
