<!DOCTYPE HTML>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Movies Restitution</title>
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
				
				$query = "SELECT name_shop, id_shop from shop";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($shop = mysqli_fetch_assoc($result)){
					echo "<option value=\"".$shop['id_shop']."\">".$shop['name_shop']."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label form="booking_number">Réservation numéro :</label>
			<select name="booking_number" id="booking_number">
				<?php
				$bdd = dbconnect();
				
				$query = "SELECT * from booking";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($booking_n = mysqli_fetch_assoc($result)){
					echo "<option value=\"".$booking_n['id_booking']."\">".$booking_n['id_booking']."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label for="movies_name">Film :</label>
			<select name="movies_name" id="movies_name">
			<?php
				$bdd = dbconnect();
				
				$query = "SELECT id_support, title, type FROM movie JOIN contents_in_sup USING (id_movie) JOIN support USING (id_support)";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($movie = mysqli_fetch_assoc($result)){
					echo "<option value=\"".$movie['id_support']."\">".$movie['title']." on ".$movie['type']."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<label for="end_date_rental">Date de restitution :</label>
			<input type="date" id="datepicker" name="end_date_rental" /><br />
			<label for="lastname">Nom :</label>
			<select name="client_name" id="lastname">
				<?php
				$bdd = dbconnect();
				
				$query = "SELECT * FROM member";
				
				$result = mysqli_query($bdd, $query);
				
				
				while($member = mysqli_fetch_assoc($result)){
					echo "<option value=\"".$member['id_member']."\">".$member['firstname']." ".$member['lastname']."</option>";
				}
				
				mysqli_close($bdd);
			?>
			</select><br />
			<input type="submit" name="valider" value="Valider" />
			</fieldset>
			
		</fieldset>
	</form>
	<?php
		if(!empty($_POST)){
			extract($_POST);
				
			$bdd = dbconnect();
			
			
			$request = "UPDATE booking SET end_date_rental='".$end_date_rental."', id_restitution_shop='".$rental_shop."' WHERE id_booking='".$booking_number."'";
			
			mysqli_query($bdd, $request);
			
			mysqli_close($bdd);
			
			echo "La location a été restituée.";
			
		}
	?>
</body>
</html>
