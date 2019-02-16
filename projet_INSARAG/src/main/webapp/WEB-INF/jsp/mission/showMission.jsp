<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>INSARAG</title>


<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="Content-Language" content="fr" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

  	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="text/css" href="header.css"> -->
<link rel="stylesheet" type="text/css" href="normalize.css">

    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">

		<h1>Consulter Mission</h1>

		<br />

		 
		<div class="row">
			<label class="col-sm-2">ID</label>
			<div class="col-sm-10">${missionToShow.idMission}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-2">Lieu</label>
			<div class="col-sm-10">${missionToShow.lieu}</div>
		</div>		

		<div class="row">
			<label class="col-sm-2">Date de début</label>
			<div class="col-sm-10">${missionToShow.debut}</div>
		</div>

		<div class="row">
			<label class="col-sm-2">Date de fin</label>
			<div class="col-sm-10">${missionToShow.fin}</div>
		</div>
		
						
	</div>


</body>
</html>