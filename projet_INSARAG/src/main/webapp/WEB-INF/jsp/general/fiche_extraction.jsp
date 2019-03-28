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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>

<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />
<script src="${controlformJs}"></script>

<spring:url value="/js/datepicker.min.js" var="datePickerJs" />
<script src="${datePickerJs}"></script>

<spring:url value="/js/datepicker.fr.js" var="datePickerJsFR" />
<script src="${datePickerJsFR}"></script>

<spring:url value="/css/datepicker.min.css" var="datePickerCss" />
<link href="${datePickerCss}" rel="stylesheet" /> 


</head>

<body>

	<div id="header">
		<c:choose>
			<c:when test="${sessionScope.accreditation == 2}">
					<jsp:include page="../common/header.jsp" />
					<spring:url value="/css/header.css" var="headerCss" />
					<link href="${headerCss}" rel="stylesheet" />
			</c:when>
			<c:otherwise>
				<jsp:include page="../common/navbar_uti.jsp" />
				<spring:url value="/css/navbar_uti.css" var="navbar_uti" />
				<link href="${navbar_uti}" rel="stylesheet" /> 
			</c:otherwise>
		</c:choose>
	</div>
  
  <style>
    .formulaire{
	margin-top:15px;
	background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
	padding: 20px 30px;
	border: 1px solid grey;
    }
    
</style>
    

  <body>
  	<div style="margin-top:100px;"></div>
  <div class="container mb-3">
    <div class="row justify-content-center align-items-center">
        <div class="col-xs-12 col-sm-12 col-md-8 well well-sm formulaire">
        <h3 class="text-center text-dark">Fiche d'extraction</h3>
            <br>
        <form action="#" method="post" class="form" role="form">
         <div class="row">
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">WorksiteID</label><br>
                    <input class="form-control" placeholder="Richard" type="text"
                        required autofocus />
                    </div>
                </div>
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">Numéro de victime</label><br>
                        <input class="form-control" placeholder="2" type="text" required />
                    </div>
                </div>
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">Coordonnées GPS</label><br>
                        <input class="form-control" placeholder="(48.951628;2.138652)" type="text" required />
                    </div>
                </div>
                
        </div>
                
        <div class="row">
                <div class="col-xs-12 col-md-12">
                   <div class="form-group">
                        <label class="text-dark">Adresse</label><br>
                        <input class="form-control" placeholder="113 Parcelles Assainies, Sénégal" type="text" required />
                    </div>
                </div>
        </div>
                
            <div class="row">
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">Team ID</label><br>
                        <input class="form-control" placeholder="18" type="text" required />
                    </div>
                </div>
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">Date</label><br>
                        <input class="form-control" placeholder="15/05/2017" type="text" required />
                    </div>
                </div>
                <div class="col-xs-4 col-md-4">
                   <div class="form-group">
                        <label class="text-dark">Heure</label><br>
                        <input class="form-control" placeholder="12:26" type="text" required />
                    </div>
                </div>
            </div>
            
            <div class="row">
             <div class="col-xs-12 col-md-12">
                  <div class="form-group">
                        <label >Information sur la victime</label>
                        <textarea class="form-control" placeholder="Ralph Lawrence, seychellois, 27 ans, homme ..." rows="3"></textarea>
                  </div>
                </div>
            </div>
            
             <div class="row">
             	<div class="col-xs-6 col-md-6">
                  <div class="form-group">
                        <label class="text-dark">Lieu où se trouve la victime</label><br>
                        <input class="form-control" placeholder="cuisine" type="text" required />
                    </div>
                </div>
                <div class="col-xs-6 col-md-6">
                  <div class="form-group">
                        <label class="text-dark">Durée d'extraction de la victime</label><br>
                        <input class="form-control" placeholder="1:10" type="text" required />
                    </div>
                </div>
            </div>
            
            <div class="row">
            	<div class="col-xs-4 col-md-4">
                  <div class="form-group">
                   <label class="text-dark">Niveau de travail nécessaire pour extraire la victime</label><br>
			  		 <div class="custom-control custom-radio">
			  			 <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
			          	<label class="custom-control-label" for="customRadio1">Assistance</label>
			        </div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio2">Extrait de débris</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio3">ASR3</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio4">ASR4</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio5" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio5">ASR5</label>
					</div>
				   </div>
			     </div>
			     
			     <div class="col-xs-4 col-md-4">
                  <div class="form-group">
                   <label class="text-dark">Condition de la victime</label><br>
			  		 <div class="custom-control custom-radio">
			  			 <input type="radio" id="customRadio6" name="customRadio" class="custom-control-input">
			          	<label class="custom-control-label" for="customRadio6">Live</label>
			        </div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio7" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio7">Decreased</label>
					</div>
				   </div>
			     </div>
			     
			     <div class="col-xs-4 col-md-4">
                  <div class="form-group">
                   <label class="text-dark">Etat des blessures de la victime</label><br>
			  		 <div class="custom-control custom-radio">
			  			 <input type="radio" id="customRadio8" name="customRadio" class="custom-control-input">
			          	<label class="custom-control-label" for="customRadio8">None</label>
			        </div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio9" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio9">Stable</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio10" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio10">Critique</label>
					</div>
				   </div>
			     </div>
			  </div>
			     
			    <div class="row">
             	<div class="col-xs-6 col-md-6">
                  <div class="form-group">
                   <label class="text-dark">La victime à été transféré à :</label><br>
                   
			  		 <div class="custom-control custom-radio">
			  			 <input type="radio" id="customRadio11" name="customRadio" class="custom-control-input">
			          	<label class="custom-control-label" for="customRadio11">Sa famille</label>
			        </div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio12" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio12">Ambulance</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio13" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio13">Hopital</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio14" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio14">Hélicoptère</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio15" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio15">Morgue</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio16" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio16">Equipe médicale</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio17" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio17">Field hospital</label>
					</div>
					<div class="custom-control custom-radio">
					    <input type="radio" id="customRadio18" name="customRadio" class="custom-control-input">
					    <label class="custom-control-label" for="customRadio18">Autre</label>
					</div>
				   </div>
                </div>
                
                <div class="col-xs-6 col-md-6">
                  <div class="form-group">
                        <label>Noms et contacts des personnes prenant en charge la victime </label>
                        <textarea class="form-control" placeholder="Linda Gonzalez, infirmière" rows="3"></textarea>
                  </div>
                </div>
            </div>
			     
			<div class="row">
             <div class="col-xs-12 col-md-12">
                  <div class="form-group">
                        <label>Autres informations (ex: d'autres équipes présentes)</label>
                        <textarea class="form-control"  rows="3"></textarea>
                  </div>
                </div>
            </div>
            
               <div class="row">
             	<div class="col-xs-6 col-md-6">
                  <div class="form-group">
                        <label class="text-dark">Fiche complétée par : </label><br>
                        <input class="form-control" placeholder="Richard Dupont" type="text" required />
                    </div>
                </div>
                <div class="col-xs-6 col-md-6">
                  <div class="form-group">
                        <label class="text-dark">Rôle/position</label><br>
                        <input class="form-control" placeholder="Médecin" type="text" required />
                    </div>
                </div>
            </div>


    </form>
        </div>
    </div>
 </div> 
  
 
  </body>
</body>
</html>