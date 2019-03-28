<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<spring:url value="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" var="Bootstrap4JS" />
<script src="${Bootstrap4JS}"></script>

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" />

<spring:url value="/css/index.css" var="indexCss" />
<link href="${indexCss}" rel="stylesheet" /> 

</head>


<body class="bg">

		<section class="login-block">
	    <div class="container">
		<div class="row">
			<div class="col-md-4 login-sec">
			    <h2 class="text-center"><img src="images/Insarag_logo.jpg" style="height:110px; width:155px;"></img></h2>
			    <h6 class="text-center text-dark">
			    <font color = 'red'>${error}</font>
			    </h6>
			    <form action="submitConnexion" method="post" class="login-form" >
	              <div class="form-group">
	                <label for="exampleInputEmail1">Email</label>
	                <input type="text" name="user_identifiant" class="form-control" placeholder="richard.dupont@gmail.com">
	
	              </div>
	              <div class="form-group">
	                <label for="exampleInputPassword1">Mot de passe</label>
	                <input type="password" name="user_mdp" class="form-control" placeholder="********">
	              </div>
	              
	            <input class="btn btn-lg btn-danger btn-block" id="connexion"  type="submit" value="Connexion">	
	            
	            <hr class="style1">  

	            </form>
	            <div class="form-group">
	                <button onclick="location.href='${pageContext.request.contextPath}/utilisateur/new'" class="btn btn-block btn-lg inscription" id="inscription" type="submit">Inscription</button>        
	            </div>
	
			</div>
			<div class="col-md-8 banner-sec">
	            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	                 <ol class="carousel-indicators">
	                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	                  </ol>
	            <div class="carousel-inner" role="listbox">
	                <div class="carousel-item active">
	                  <img class="d-block img-fluid"  width:auto;" src="/images/pexels-photo-266403R.jpeg" alt="First slide">
	                  <div class="carousel-caption d-none d-md-block">
	                    <div class="banner-text">
	                        <h2>INSARAG</h2>
	                        <p>Site web dédié aux pompiers de l'urgence internationale qui oeuvre pour porter secours et assistance aux pays victime de catastrophes naturelles ou humanitaires.</p>
	                    </div>	
	              </div>
	                </div>
	                <div class="carousel-item">
	                  <img class="d-block img-fluid"  width:auto;" src="/images/fireman-firefighter-rubble-9-11-70573R.png" alt="Second slide">
	                  <div class="carousel-caption d-none d-md-block">
	                    <div class="banner-text">
	                        <h2>INSARAG</h2>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	                    </div>	
	                </div>
	                </div>
	                <div class="carousel-item">
	                  <img class="d-block img-fluid"  width:auto;" src="/images/firefighter-fire-portrait-trainingR.png" alt="Third slide">
	                  <div class="carousel-caption d-none d-md-block">
	                    <div class="banner-text">
	                        <h2>INSARAG</h2>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	                    </div>	
	                </div>
	              </div>
	            </div>	   
			    
			</div>
		</div>
	</div>
	</div>
	</section>

	
</body>


</html>