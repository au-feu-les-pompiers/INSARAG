<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>:::Tutoriel Spring MVC DAO JPA Hibernate Bootstrap
	Jquery- 2016-2017:::</title>
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Keywords"
	content=" Tutoriel Spring MVC DAO JPA Hibernate Bootstrap - 2016-2017" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<%-- <spring:url value="/css/bootstrap-theme.min.css" var="bootstrapThemeCss" /> --%>
<%-- <spring:url value="/css/bootstrap.min.css" var="bootstrapCss" /> --%>

<link rel="stylesheet"	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">


<spring:url value="/css/style.css" var="styleCss" />
<spring:url value="/css/footer.css" var="footerCss" />

<%-- <spring:url value="/js/bootstrap.min.js" var="bootstrapJs" /> --%>
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />


<link href="${styleCss}" rel="stylesheet" />
<link href="${footerCss}" rel="stylesheet" />


<%-- <link href="${bootstrapCss}" rel="stylesheet" /> --%>
<%-- <link href="${bootstrapThemeCss}" rel="stylesheet" /> --%>

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%-- <script src="${bootstrapJs}"></script> --%>
<script src="${jqueryJs}"></script>
</head>


<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">

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

		
						
	</div>


</body>
</html>