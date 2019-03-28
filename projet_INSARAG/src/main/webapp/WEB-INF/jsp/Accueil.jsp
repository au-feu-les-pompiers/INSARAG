<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>Accueil</title>

<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

  
<spring:url value="/css/bootstrap.min.css" var="bootstrap4Css" />
<link href="${bootstrap4Css}" rel="stylesheet" /> 
 
<spring:url value="/css/datatables.css" var="bootstrapdataTablesCss" />
<link href="${bootstrapdataTablesCss}" rel="stylesheet" /> 

<spring:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js" var="bootstrap4Bundle" />
<link href="${bootstrap4Bundle}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

<spring:url value="/css/accueil.css" var="accueil" />
<link href="${accueil}" rel="stylesheet" /> 

<spring:url value="https://code.jquery.com/jquery-3.2.1.slim.min.js" var="jqueryJS" />
<script src="${jqueryJS}"></script> 

<spring:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" var="BootstrapJS" />
<script src="${BootstrapJS}"></script> 

<spring:url value="/js/datatables.js" var="bootstrapdataTablesJs" />
<script src="${bootstrapdataTablesJs}"></script>
</head>

<body>
	<div id="header">
		<c:choose>
			<c:when test="${sessionScope.accreditation == 2}">
					<jsp:include page="common/header.jsp" />
					<spring:url value="/css/header.css" var="headerCss" />
					<link href="${headerCss}" rel="stylesheet" /> 
			</c:when>
			<c:otherwise>
				<jsp:include page="common/navbar_uti.jsp" />
				<spring:url value="/css/navbar_uti.css" var="navbar_uti" />
				<link href="${navbar_uti}" rel="stylesheet" /> 
			</c:otherwise>
		</c:choose>
	</div>
	
<div id="body">
	
<div> 


<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Set the background image for this slide in the line below -->
      <div class="carousel-item active" style="background-image: url('https://source.unsplash.com/RCAhiGJsUUE/1920x1080')">
        <div class="carousel-caption d-block">
          <h3 class="display-4">Bienvenue</h3>
          <p class="lead">L'INSARAG, porte secours et assistance aux pays victime de catastrophes naturelles ou humanitaires </p>
        </div>
      </div>
      <!-- Slide Two - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1512752191916-e728edecd1e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80')">
        <div class="carousel-caption d-block ">
          <h3 class="display-4">Un organigramme</h3>
          <p class="lead">Pour voir la liste des pompiers présents sur chaque mission</p>
        </div>
      </div>
      <!-- Slide Three - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1506402591084-12b14ad3129d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80')">
        <div class="carousel-caption d-block ">
          <h3 class="display-4">La carte</h3>
          <p class="lead">Pour vous aider à vous situer en pleine mission</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
  </div>


</div>
			
	
	
	<c:choose>
	<c:when test="${sessionScope.accreditation == 0}">
	<div class="container">
			<h2 class="text-center mt-5">Un administrateur n'a pas encore accepté votre inscription</h2>
	</div>
	</c:when>
	<c:when test="${sessionScope.accreditation == -1}">
		<div class="container">
			<h4 class="text-center mt-5">Votre inscription a été refusée, si vous pensez qu'il s'agit d'une erreur, veuillez envoyer une demande par mail</h4>
	</div>
	</c:when>
	<c:otherwise>
		<div class="container">
		<h1 class="text-center mt-5">Prochaine mission</h1>
		
		
		<div class="row justify-content-center align-items-center">
		<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
			padding: 10px 30px;
			border: 1px solid grey;">
			
			<div class="row justify-content-center align-items-center">
				<h3 class="text-center">Consulter la mission</h3>
			</div>
			<br/>
			<c:choose>
			<c:when test="${missionToShow.flagFin == 0}">
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
			
			<div>
			<spring:url value="/mission/accept/${missionToShow.idMission}" var="utilisateurActionUrl" />
				<c:choose>
					<c:when test="${utilisateurForm.enMission == 1}">
						<h4>Vous avez accepté la mission</h4>	
					</c:when>
					<c:when test="${utilisateurForm.enMission == 2}">
						<h4>Vous avez refusé la mission</h4>
					</c:when>
					<c:otherwise>
						<form:form id="utilisateurform"  class="form"  method="post"  modelAttribute="utilisateurForm"  action="${utilisateurActionUrl}" >
							<input class="btn btn-lg btn-success btn-block" id="connexion" name="Accepter" type="submit" value="Accepter la mission" href="/mission/accept/${missionToShow.idMission}">			
							<input class="btn btn-lg btn-danger btn-block" id="connexion" name="Refuser" type="submit" value="Refuser la mission" >							
						</form:form>
					</c:otherwise>
				</c:choose>
			</div>
			</c:when>
			<c:otherwise>
			<div class="container">
				<h2 class="text-center mt-5">Il n'y a pas de mission à venir</h2>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		</div>
		</div>
			</c:otherwise>
	</c:choose>

<div style="height: 30em;"></div>
	
	
 <!-- Footer -->
        <footer>
        	<div class="footer-top">
		        <div class="container">
		        	<div class="row">
		        		<div class="col-md-4 col-lg-4 footer-about wow fadeInUp">
		        			
		        			<h2 style="font-family:Raleway; color:white;">
		        				INSARAG
		        			</h2>
		        			<br>
		        			<p><a href="https://www.pompiers-urgence.org/">Pompiers Urgence</a></p>
		        			<p><a href="https://www.insarag.org/">INSARAG international</a></p>
	                    </div>
		        		<div class="col-md-4 col-lg-4 offset-lg-1 footer-contact wow fadeInDown">
		        			<h3>Contact</h3>
		                	<p><i class="fas fa-map-marker-alt"></i> Val d'Oise</p>
		                	<p><i class="fas fa-phone"></i> Phone: (+33) 06 12 22 48 54</p>
		                	<p><i class="fas fa-envelope"></i> Email: <a href="mailto: pbesson@pompiers-urgence.org"> pbesson@pompiers-urgence.org</a></p>
	                    </div>
	                    <div class="col-md-4 col-lg-3 footer-social wow fadeInUp">
	                    	<h3>Suivez nous</h3>
	                    	<p>
	                    		<a href="https://www.facebook.com/pompiers.urgence.internationale"><i class="fab fa-facebook"></i></a> 
								<a href="https://twitter.com/PUI_FRANCE"><i class="fab fa-twitter"></i></a> 
								<a href="#"><i class="fab fa-instagram"></i></a> 
	                    	</p>
	                    </div>
		            </div>
		        </div>
	        </div>
	        <div class="footer-bottom">
	        	<div class="container">
	        		<div class="row">
	           			<div class="col-md-5 footer-copyright">
	                    	<p>&copy; INSARAG - Tous droits réservés </p>
	                    </div>

	           		</div>
	        	</div>
	        </div>
        </footer>
	
	
	
	
	
	
	
	</div>
	
</body>
</html>