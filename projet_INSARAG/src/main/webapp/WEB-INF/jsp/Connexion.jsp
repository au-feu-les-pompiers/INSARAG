<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connexion</title>
</head>
<body>

	<form action="submitConnexion" method="post">
	<label for="identifiant">Identifiant:</label>
	<input type="text" name="user_identifiant"><br>

	<label for="mdp">Mot de passe:</label>
	<input type="text"  name="user_mdp"><br>

	<input type="submit" value="Connexion">	
	</form>		
</body>
</html>