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
<meta name="Description" content="" />

<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<spring:url value="/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script>


</head>


<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
	
	<spring:url value="/utilisateur/update/${utilToShow.id}" var="updateUrl" />

		<h1>Consulter Utilisateur</h1>

		<br />

		 
		<div class="row">
			<label class="col-sm-2">Matricule</label>
			<div class="col-sm-10">${utilToShow.matricule}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-2">Nom et prénom</label>
			<div class="col-sm-10">${utilToShow.nom} ${utilToShow.prenom}</div>
		</div>	
		
		<div class="row">
			<label class="col-sm-2">Date de naissance </label>
			<div class="col-sm-10">${utilToShow.naissance}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-2">Email</label>
			<div class="col-sm-10">${utilToShow.email}</div>
		</div>	

		<div class="row">
			<label class="col-sm-2">Numéro de téléphone</label>
			<div class="col-sm-10">${utilToShow.telephone}</div>
		</div>

		<div>
		<button class="btn btn-warning"	onclick="location.href='${updateUrl}'">
						Modifier
						</button></div>
						
	</div>


</body>
</html>