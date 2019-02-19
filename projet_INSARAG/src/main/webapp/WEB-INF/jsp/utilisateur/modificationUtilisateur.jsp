<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>INSARAG</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
  	

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

<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />
<script src="${controlformJs}"></script>



</head>
<!-- http://formvalidation.io/download/ -->
<!-- http://www.formvalidator.net/ -->
<!-- http://www.formvalidator.net/#configuration_html5 -->
<!-- http://www.formvalidator.net/#localization_submit -->
<!-- http://www.jqueryscript.net/form/Powerful-Form-Validation-Plugin-For-jQuery-Bootstrap-3.html -->
<!-- http://www.jqueryscript.net/form/HTML5-Form-Validation-Plugin-For-Bootstrap-Bootstrap-Validator.html -->

<body>

<jsp:include page="../common/header.jsp" />
 
<div class="container">

	<spring:url value="/utilisateur/save" var="utilisateurActionUrl" />

	<form:form id="utilisateurform"  class="form-horizontal"  method="post"  modelAttribute="utilisateurForm"  action="${utilisateurActionUrl}" >

		<form:hidden path="id"  value="${utilisateurForm.id}" />
		
		<spring:bind path="email">
			<div class="row">
				<div class="col-md-offset-2 col-md-4">
					<div class="form-group">
					<label>Email</label>
					<form:input type="text"   path="email"  class="form-control"  value="${utilisateurForm.email}" placeholder="Email de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ ���'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"/> 
					<form:errors path="email" class="control-label" />		
					</div>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="mdp">
			<div class="row">
				<div class="col-md-offset-2 col-md-4">
					<div class="form-group">
					<label>Mot de passe</label>
					<form:input type="text"   path="mdp" class="form-control" value="defaultINSARAG" placeholder="Mdp de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ ���'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"/> 
					<form:errors path="mdp" class="control-label" />		
					</div>
				</div>
			</div>
		</spring:bind>
	
		<spring:bind path="nom">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Nom</label>
				<form:input type="text"   path="nom"  class="form-control"  value="${utilisateurForm.nom}" placeholder="Nom de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ ���'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"
 							disabled="true"/> 
				<form:errors path="nom" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		
		<spring:bind path="prenom">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Pr�nom</label>
				<form:input type="text" path="prenom"  class="form-control"  value="${utilisateurForm.prenom}" placeholder="Prenom de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas d�passer 100"
 							disabled="true"/>
				<form:errors path="prenom" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="telephone">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Num�ro de t�l�phone</label>
				<form:input type="text"   path="telephone"  class="form-control"  value="${utilisateurForm.telephone}" placeholder="T�l�phone de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ ���'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"/> 
				<form:errors path="telephone" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="naissance">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Date de naissance</label>
				<form:input type="text"   path="naissance"  class="form-control"  value="${utilisateurForm.naissance}" placeholder="Date de naissance de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ ���'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"
 							disabled="true"/> 
				<form:errors path="naissance" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="matricule">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Matricule</label>
				<form:input type="text"   path="matricule"  class="form-control"  value="${utilisateurForm.matricule}" placeholder="Matricule de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ ���'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacart�res alphanum�rique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas d�passer 100"
 							disabled="true"/> 
				<form:errors path="matricule" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<form:hidden path="nom"  value="${utilisateurForm.nom}" />
		<form:hidden path="prenom"  value="${utilisateurForm.prenom}" />
		<form:hidden path="naissance"  value="${utilisateurForm.naissance}" />
		<form:hidden path="matricule"  value="${utilisateurForm.matricule}" />
		<form:hidden path="autorisation"  value="${utilisateurForm.autorisation}" />
		<form:hidden path="enMission"  value="${utilisateurForm.enMission}" />
		
		
		<div class="row">
			<div class="col-md-offset-2 col-md-1">
						<button type="submit" class="btn  btn-primary pull-left">Modifier</button>
	       </div>
	       <div class="col-md-offset-1 col-md-1 pull-left">
						<button type="reset" class="btn  btn-default">Reset</button>
	       </div>
   </div>
 </form:form>

</div>



</body>
</html>