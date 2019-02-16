<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Inscription</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Keywords" content=" Tutoriel Spring MVC DAO JPA Hibernate Bootstrap - 2016-2017" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
  	
<spring:url value="/css/bootstrap-theme.min.css" var="bootstrapThemeCss" />
<spring:url value="/css/bootstrap.min.css" var="bootstrapCss" />

<!--  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!--  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->


<spring:url value="/css/style.css" var="styleCss" />
<spring:url value="/css/footer.css" var="footerCss" />
 
<spring:url value="/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />


<link href="${styleCss}" rel="stylesheet" />
<link href="${footerCss}" rel="stylesheet" />


<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${bootstrapThemeCss}" rel="stylesheet" />

<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="${bootstrapJs}"></script>
<script src="${jqueryJs}"></script>
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
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
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
					<form:input type="text"   path="mdp"  class="form-control"  value="${utilisateurForm.mdp}" placeholder="Mdp de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
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
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
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
				<label>Prénom</label>
				<form:input type="text" path="prenom"  class="form-control"  value="${utilisateurForm.prenom}" placeholder="Prenom de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"
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
				<label>Numéro de téléphone</label>
				<form:input type="text"   path="telephone"  class="form-control"  value="${utilisateurForm.telephone}" placeholder="Téléphone de l'utilisateur" 
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
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Date de naissance</label>
				<form:input type="text"   path="naissance"  class="form-control"  value="${utilisateurForm.naissance}" placeholder="Date de naissance de l'utilisateur" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
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
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
 							disabled="true"/> 
				<form:errors path="matricule" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		
		<div class="row">
			<div class="col-md-offset-2 col-md-1">
						<button type="submit" class="btn  btn-primary pull-left">S'inscrire</button>
	       </div>
	       <div class="col-md-offset-1 col-md-1 pull-left">
						<button type="reset" class="btn  btn-default">Reset</button>
	       </div>
   </div>
 </form:form>

</div>



</body>
</html>