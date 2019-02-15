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
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
  	

<spring:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<spring:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" var="bootstrapJs" />
<script src="${bootstrapJs}"></script>

<spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />
<script src="${controlformJs}"></script>

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 


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

   <c:choose>
		<c:when test="${missionForm.id  != null}">
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
				<h1>Modifier mission <br/> <small>Merci de renseigner ces données </small></h1>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-md-offset-2 col-md-8">
				<h1>Nouvelle mission <br/> <small>Merci de renseigner ces données </small></h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

	<spring:url value="/mission/save" var="missionActionUrl" />

	<form:form id="missionform"  class="form-horizontal"  method="post"  modelAttribute="missionForm"  action="${missionActionUrl}" >

		<form:hidden path="id"  value="${missionForm.id}" />
		
		
	
		<spring:bind path="lieu">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Lieu</label>
				<form:input type="text"   path="lieu"  class="form-control"  value="${missionForm.lieu}" placeholder="Lieu" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="lieu" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		
		<spring:bind path="debut">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Date de début</label>
				<form:input type="text" path="debut"  class="form-control"  value="${missionForm.debut}" placeholder="Date de debut" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="debut" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
				<spring:bind path="fin">
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<div class="form-group">
				<label>Date de fin</label>
				<form:input type="text" path="fin"  class="form-control"  value="${missionForm.fin}" placeholder="Date de fin" 
							required="required" 
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="fin" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>

		<spring:bind path="nbDePlaces">
			<div class="row">
				<div class="col-md-offset-2 col-md-1">
					<div class="form-group">
					<label>Nombre de place</label>
					<form:input type="text"    path="nbDePlaces"  class="form-control"  value="${missionForm.nbDePlaces}" placeholder="Nombre de places" 
								required="required"
								data-validation="required number"
								data-validation-ignore=".,,"
								data-validation-error-msg-required="Champs prixest Obligatoire"
								data-validation-error-msg-number="Champs prix doit être numérique décimal"
								/>
 
					<form:errors path="nbDePlaces" class="control-label" />		
					</div>
				</div>
		</div>
		</spring:bind>
		
		<div class="row">
			<div class="col-md-offset-2 col-md-1">
			   <c:choose>
					<c:when test="${missionForm.id  != null}">
						<button type="submit" class="btn  btn-primary pull-left">Modifier</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn  btn-primary pull-left">Enregistrer</button>
					</c:otherwise>
				</c:choose>
	       </div>
	       <div class="col-md-offset-1 col-md-1 pull-left">
						<button type="reset" class="btn  btn-default">Reset</button>
	       </div>
   </div>
 </form:form>

</div>



</body>
</html>