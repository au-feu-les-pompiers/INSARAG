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

<spring:url value="https://use.fontawesome.com/releases/v5.5.0/css/all.css" var="fontawesome" />
<link href="${fontawesome}" rel="stylesheet" />

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


</head>

<body>

<div class="container">
<div class="row justify-content-center align-items-center">
        <div class="col-xs-12 col-sm-12 col-md-8 well well-sm formulaire">
            <h3 class="text-center text-dark mb-1">Victim extraction form</h3>
            <h6 class="text-center text-dark mb-3">

	       	</h6>
	<spring:url value="/utilisateur/save" var="utilisateurActionUrl"/>

	<form:form id="utilisateurform" name="frm" 
	class="form-horizontal"  method="post"  modelAttribute="utilisateurForm"  
	action="${utilisateurActionUrl}">

		<form:hidden path="id"  value="${utilisateurForm.id}" />
		
		<div class="row">	
		<spring:bind path="matricule">
		
			<div class="col-xs-6 col-md-6">
				<div class="form-group">
				<label>Matricule*</label>
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
                       	<label for="email" class="text-dark">Email*</label><br>
					<form:input type="email"   path="email"  class="form-control"  value="${utilisateurForm.email}" placeholder="richard.dupont@gmail.com" 
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
                        <label for="password" class="text-dark">Mot de passe*</label>
                        <button type="button" class="btn btn-sm btn-primary" onclick="randomPass();">Générer un mot de passe</button>
                        <br>
					<form:input type="password" path="mdp" class="form-control"  value="${utilisateurForm.mdp}" placeholder="**********" 
								id="mdp1"
								onblur='checkPass();'
								ng-model="thePassword"
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/>
	 				
	  	 			<span id="#mdp1" onclick="changePassword2Text2();" class="fa fa-fw field-icon fa-eye-slash"></span>
				
					<form:errors path="mdp" class="control-label" />
					<small class="form-text text-muted">Votre mot de passe doit contenir au moins 12 caratères.</small>
					<span id="message" class="message" ></span>
					</div>
				</div>
			
                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="password" class="text-dark">Confirmer mot de passe*</label><br>
					<form:input type="password"   path="confirmationMdp"  class="form-control"  value="${utilisateurForm.confirmationMdp}" placeholder="**********" 
								id="mdp2"
								onblur="checkPassConfirm();return false;"
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="confirmationMdp" class="control-label" />	
					<small class="form-text text-muted">Votre mot de passe doit contenir au moins 12 caratères.</small>	
					<span id="confirmMessage" class="confirmMessage" ></span>
					</div>
				</div>
			</div>
		</spring:bind>
	
		<spring:bind path="nom">
		<div class="row">
                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="username" class="text-dark">Nom*</label><br>
				
				<form:input type="text"   path="nom"  class="form-control"  value="${utilisateurForm.nom}" placeholder="Dupont" 
							id="name"
							onblur="checkNom();return false;"
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="nom" class="control-label" />
				<span id="confirmNom" class="confirmNom" ></span>
				</div>
			</div>

                <div class="col-xs-6 col-md-6">
                   <div class="form-group">
                        <label for="username" class="text-dark">Prénom*</label><br>
				<form:input type="text" path="prenom"  class="form-control"  value="${utilisateurForm.prenom}" placeholder="Richard" 
							id="firstname"
							onblur="checkPrenom();return false;"
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="prenom" class="control-label" />
				<span id="confirmPrenom" class="confirmPrenom" ></span>		
				</div>
			</div>
		</div>
		</spring:bind>
		
		
		
		<spring:bind path="telephone">
		<div class="row">
		
		<div class="col-xs-6 col-md-6">
			<div class="form-group">
               <label for="username" class="text-dark">Numéro de téléphone*</label><br>
                  <div class="form-group input-group"> 
					<form:input type="text"   path="telephone"  class="form-control"  value="${utilisateurForm.telephone}" placeholder="0687658521" 
								id="phone"
								onblur="checkPhone();return false;"
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="telephone" class="control-label" />
					<span id="confirmPhone" class="confirmPhone" ></span>	
				</div>
			</div>
		</div> 
		</spring:bind>
		
		<spring:bind path="naissance">
	
			<div class="col-xs-6 col-md-6">
				<div class="form-group">
				<label>Date de naissance*</label>
				<form:input type="text"  data-language='fr' path="naissance" autocomplete="off" class="form-control datepicker-here"  value="${utilisateurForm.naissance}" placeholder="12/05/1986" 
							id="birth"
							onblur="checkNaissance();return false;"
							position="top left" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="naissance" class="control-label" />
				<span id="confirmNaissance" class="confirmNaissance" ></span>
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="role">
		<div class="row">
			<div class="col-xs-6 col-md-6">
				<div class="form-group">
					
						<label for="username" class="text-dark">Rôle*</label><br>
		                  <div class="form-group input-group"> 
							    <form:select class="form-control" path="role">
								    <form:option value="1" label="Recherche/Secouriste/Logistique"/>
									<form:option value="2" label="Médecin"/>
									<form:option value="3" label="Management"/>   
								</form:select> 
						</div>
					</div>
				</div>
		</div>
		
		</spring:bind>
		
	
		<div class="row justify-content-center align-items-center mb-1">
			<small class="form-text text-muted">L'administrateur devra valider votre inscription.</small>
		</div>
		
		<div class="row justify-content-center align-items-center mb-2">
			<small class="form-text text-muted">* Champs obligatoires</small>
		</div>		
		
		<div class="row justify-content-center align-items-center">
			
						<button type="submit" onclick="return validateForm()" class="btn btn-lg btn-primary">S'inscrire</button>
	    

   </div>
 </form:form>
 	</div>
</div>
</div>
</div>


</body>
</html>