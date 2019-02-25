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

  	
<spring:url value="/css/bootstrap.min.css" var="bootstrap4Css" />
<link href="${bootstrap4Css}" rel="stylesheet" /> 

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 
<%-- 
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script> --%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>


</head>


<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
	<div class="row justify-content-center align-items-center">
	<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
		padding: 10px 30px;
		border: 1px solid grey;">
		
		<div class="row justify-content-center align-items-center">
			<h3 class="text-center">Consulter Mission</h3>
		</div>
		<br/>

		 
		<div class="row">
			<label class="col-sm-5">ID</label>
			<div class="col-sm-7">${missionToShow.idMission}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-5">Lieu</label>
			<div class="col-sm-7">${missionToShow.lieu}</div>
		</div>		

		<div class="row">
			<label class="col-sm-5">Date de début</label>
			<div class="col-sm-7">${missionToShow.debut}</div>
		</div>

		<div class="row">
			<label class="col-sm-5">Date de fin</label>
			<div class="col-sm-7">${missionToShow.fin}</div>
		</div>
		
	</div>
	</div>				
	</div>


</body>
</html>