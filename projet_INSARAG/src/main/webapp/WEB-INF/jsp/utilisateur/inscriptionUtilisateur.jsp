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

<spring:url value="/css/datepicker.min.css" var="datePickerCss" />
<link href="${datePickerCss}" rel="stylesheet" />

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

<spring:url value="/css/SignUp.css" var="SignUp" />
<link href="${SignUp}" rel="stylesheet" />  

<spring:url value="/js/bootstrap.min.js" var="bootstrap3JS" />
<script src="${bootstrap3JS}"></script>

<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />
<script src="${controlformJs}"></script>

<spring:url value="/js/datepicker.min.js" var="datePickerJs" />
<script src="${datePickerJs}"></script>

<spring:url value="/js/datepicker.fr.js" var="datePickerJsFR" />
<script src="${datePickerJsFR}"></script>

<!-- 
<spring:url value="/js/checkConfirmation.js" var="checkMdp" />
<script src="${checkMdp}"></script>
-->


</head>

<body>
 <script>
 	function checkPass()
	{
	    var pass1 = document.getElementById('mdp1');
	    var pass2 = document.getElementById('mdp2');
	    //Store the Confimation Message Object ...
	    var message = document.getElementById('confirmMessage');
	    //Set the colors we will be using ...
	    var goodColor = "#66cc66";
	    var badColor = "#ff6666";
	    //Compare the values in the password field 
	    //and the confirmation field
	    if(pass1.value == pass2.value){
	        //The passwords match. 
	        //Set the color to the good color and inform
	        //the user that they have entered the correct password 
	        pass2.style.backgroundColor = goodColor;
	        message.style.color = goodColor;
	        message.innerHTML = ""
	    }else{
	        pass2.style.backgroundColor = badColor;
	        message.style.color = badColor;
	        message.innerHTML = "Mauvais mot de passe!"
	    }
	}  
 	</script>
 	 
<div class="container">
<div class="row justify-content-center align-items-center">
        <div class="col-xs-12 col-sm-12 col-md-8 well well-sm formulaire">
            <h3 class="text-center text-dark mb-5">Inscription</h3>
	<spring:url value="/utilisateur/save" var="utilisateurActionUrl" />

	<form:form id="utilisateurform" name="frm" 
	class="form-horizontal"  method="post"  modelAttribute="utilisateurForm"  
	action="${utilisateurActionUrl}">

		<form:hidden path="id"  value="${utilisateurForm.id}" />
		
		<div class="row">		
		<spring:bind path="matricule">
		
			<div class="col-xs-6 col-md-6">
				<div class="form-group">
				<label>Matricule</label>
				<form:input type="text"   path="matricule"  class="form-control"  value="${utilisateurForm.matricule}" placeholder="M8452386" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="matricule" class="control-label" />		
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="email">

                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="email" class="text-dark">Email</label><br>
					<form:input type="text"   path="email"  class="form-control"  value="${utilisateurForm.email}" placeholder="richard.dupont@gmail.com" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="email" class="control-label" />		
					</div>
				</div>
			
		</spring:bind>
		</div>
		<spring:bind path="mdp">
			<div class="row">
                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="password" class="text-dark">Mot de passe</label>
                        <br>
					<form:input type="password"   path="mdp"  class="form-control"  value="${utilisateurForm.mdp}" placeholder="**********" 
								id="mdp1"
								ng-model="thePassword"
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="mdp" class="control-label" />		
					<small class="form-text text-muted">Votre mot de passe doit contenir au moins 8 caratères.</small>
					</div>
				</div>
			
                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="password" class="text-dark">Confirmer mot de passe</label><br>
					<form:input type="password"   path="confirmationMdp"  class="form-control"  value="${utilisateurForm.confirmationMdp}" placeholder="**********" 
								id="mdp2"
								onkeyup="checkPass();return false;"
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="confirmationMdp" class="control-label" />	
					<small class="form-text text-muted">Votre mot de passe doit contenir au moins 8 caratères.</small>	
					<span id="confirmMessage" class="confirmMessage" ></span>
					</div>
				</div>
			</div>
		</spring:bind>
	
		<spring:bind path="nom">
		<div class="row">
                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="username" class="text-dark">Nom</label><br>
				
				<form:input type="text"   path="nom"  class="form-control"  value="${utilisateurForm.nom}" placeholder="Dupont" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="nom" class="control-label" />		
				</div>
			</div>

                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="username" class="text-dark">Prénom</label><br>
				<form:input type="text" path="prenom"  class="form-control"  value="${utilisateurForm.prenom}" placeholder="Richard" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="prenom" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		<div class="row">
		<spring:bind path="telephone">
		
		<div class="col-xs-6 col-md-6">
			<div class="form-group">
               <label for="username" class="text-dark">Numéro de téléphone</label><br>
                  <div class="form-group input-group"> 
                    <select class="custom-select" style="max-width: 120px;">
					    <option selected="">+33</option>
					    <option value="1">+972</option>
					    <option value="2">+198</option>
					    <option value="3">+701</option>
		</select> 
				<form:input type="text"   path="telephone"  class="form-control"  value="${utilisateurForm.telephone}" placeholder="0687658521" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="telephone" class="control-label" />		
				</div>
			</div>
		</div> 
		</spring:bind>
		
		<spring:bind path="naissance">
	
			<div class="col-xs-6 col-md-6">
				<div class="form-group">
				<label>Date de naissance</label>
				<form:input type="text"  data-language='fr' path="naissance" autocomplete="off" class="form-control datepicker-here"  value="${utilisateurForm.naissance}" placeholder="12/05/1986" 
							position="top left" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="naissance" class="control-label" />		
				</div>
			</div>
		</spring:bind>
				<spring:bind path="role">
	<div class="form-group">
			<div class="col-xs-12 col-md-12">
				<label for="username" class="text-dark">Role</label><br>
                  <div class="form-group input-group"> 
					    <form:select path="role">
    <form:option value="0" label="--Please choose--"/>
    <form:option value="1" label="Recherche / secouriste / logistique"/>
	<form:option value="2" label="Médecin"/>
	<form:option value="3" label="Management"/>   
	</form:select> 
				</div>
			</div>
			</div>
		
		</spring:bind>
		</div>
		<div class="row justify-content-center align-items-center mb-3">
			<small class="form-text text-muted">L'administrateur devra valider votre inscription.</small>

		</div>
		
		
		<div class="row justify-content-center align-items-center">
			
						<button type="submit" class="btn btn-lg btn-primary">S'inscrire</button>
	    

   </div>
 </form:form>
</div>
</div>
</div>


</body>
</html>