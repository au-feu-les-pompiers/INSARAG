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
	<div class="row justify-content-center align-items-center">
	<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
		padding: 10px 30px;
		border: 1px solid grey;">
	
	<spring:url value="/utilisateur/update/${utilToShow.id}" var="updateUrl" />

		<h1>Consulter Utilisateur</h1>

		<br />

		 
		<div class="row">
			<label class="col-sm-5">Matricule</label>
			<div class="col-sm-7">${utilToShow.matricule}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-5">Nom et prénom</label>
			<div class="col-sm-7">${utilToShow.nom} ${utilToShow.prenom}</div>
		</div>	
		
		<div class="row">
			<label class="col-sm-5">Date de naissance </label>
			<div class="col-sm-7">${utilToShow.naissance}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-5">Email</label>
			<div class="col-sm-7">${utilToShow.email}</div>
		</div>	

		<div class="row">
			<label class="col-sm-5">Numéro de téléphone</label>
			<div class="col-sm-7">${utilToShow.telephone}</div>
		</div>

		<div class="text-center mt-3 mb-3">
		<button class="btn btn-warning"	onclick="location.href='${updateUrl}'">Modifier</button>
		</div>
						
	</div>
	</div>
	</div>

</body>
</html>