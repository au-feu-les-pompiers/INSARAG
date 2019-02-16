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


<%-- 
<spring:url value="/resources/css/main.css" var="mainCss" />
	<spring:url value="/resources/js/jquery.1.10.2.min.js" var="jqueryJs" />
	<spring:url value="/resources/js/main.js" var="mainJs" />
	
	<link href="${mainCss}" rel="stylesheet" />
    <script src="${jqueryJs}"></script>
    <script src="${mainJs}"></script>
 --%>

<spring:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" var="BootstrapCSS4_1" />
<link href="${BootstrapCSS4_1}" rel="stylesheet" />

<spring:url value="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" var="BootstrapJS4_1" />
<script src="${BootstrapJS4_1}"></script>


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
			    <h2 class="text-center"><img src="http://www.entente-valabre.com/img/blog/cover/insarag-logo.png" style="height:105px; width:155px;"></img></h2>
			    <form class="login-form">
	              <div class="form-group">
	                <label for="exampleInputEmail1">Email</label>
	                <input type="text" class="form-control" placeholder="richard.dupont@gmail.com">
	
	              </div>
	              <div class="form-group">
	                <label for="exampleInputPassword1">Mot de passe</label>
	                <input type="password" class="form-control" placeholder="********">
	              </div>
	              
	            <div class="form-group">
	                <button class="btn btn-lg btn-danger btn-block" id="connexion" type="submit">Connexion</button>        
	            </div>
	            <hr class="style1">
	            <div class="form-group">
	                <button class="btn btn-lg btn-danger btn-block" style="color: white; background-color: firebrick" id="inscription" type="submit">Inscription</button>        
	            </div>
	            </form>
	
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
	                  <img class="d-block img-fluid" style="height: 536px; width:auto;" src="https://images.pexels.com/photos/36031/firefighter-fire-portrait-training.jpg" alt="First slide">
	                  <div class="carousel-caption d-none d-md-block">
	                    <div class="banner-text">
	                        <h2>INSARAG</h2>
	                        <p>Site web dédié aux pompiers de l'urgence internationale qui oeuvre pour porter secours et assistance aux pays victime de catastrophes naturelles ou humanitaires.</p>
	                    </div>	
	              </div>
	                </div>
	                <div class="carousel-item">
	                  <img class="d-block img-fluid" style="height: 536px; width:auto;" src="https://images.pexels.com/photos/266403/pexels-photo-266403.jpeg" alt="Second slide">
	                  <div class="carousel-caption d-none d-md-block">
	                    <div class="banner-text">
	                        <h2>INSARAG</h2>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
	                    </div>	
	                </div>
	                </div>
	                <div class="carousel-item">
	                  <img class="d-block img-fluid" style="height: 536px; width:auto;" src="https://images.pexels.com/photos/70573/fireman-firefighter-rubble-9-11-70573.jpeg" alt="Third slide">
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