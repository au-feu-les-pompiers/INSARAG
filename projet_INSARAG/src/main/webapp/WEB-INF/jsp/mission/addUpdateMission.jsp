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

<spring:url value="/js/datepicker.min.js" var="datePickerJs" />
<script src="${datePickerJs}"></script>

<spring:url value="/js/datepicker.fr.js" var="datePickerJsFR" />
<script src="${datePickerJsFR}"></script>

<spring:url value="/css/datepicker.min.css" var="datePickerCss" />
<link href="${datePickerCss}" rel="stylesheet" /> 


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
<div class="row justify-content-center align-items-center">
<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px;">

   <c:choose>
		<c:when test="${missionForm.idMission  != null}">
			<div class="row">
				<h3 class="text-center text-dark">Nouvelle mission</h3>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<h3 class="text-center text-dark">Nouvelle mission</h3>
			</div>
		</c:otherwise>
	</c:choose>

	<spring:url value="/mission/save" var="missionActionUrl" />

	<form:form id="missionform"  class="form"  method="post"  modelAttribute="missionForm"  action="${missionActionUrl}" >

		<form:hidden path="idMission"  value="${missionForm.idMission}" />
		
	
		<spring:bind path="lieu">

				<div class="form-group">
				<label for="username" class="text-dark">Lieu</label><br>
				<form:input type="text"   path="lieu"  class="form-control"  value="${missionForm.lieu}" placeholder="Dakar" 
							required="required" 
							data-validation-length="max100"
							data-validation-allowing="-_ éèà'&"
							data-validation="required alphanumeric length"
  							data-validation-error-msg-required="Champs designation est Obligatoire"
 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
				<form:errors path="lieu" class="control-label" />		
				</div>
		</spring:bind>
		
		
		<spring:bind path="debut">
		<div class="form-row">
			<div class="col-6">
				<div class="form-group">
				<label class="text-dark">Date de début</label>
				<form:input type="text" path="debut" data-language='fr' class="form-control datepicker-here"  value="${missionForm.debut}" placeholder="Date de debut" 
							required="required" 
							data-position="bottom left" 
							id="minMaxExample"
							data-validation-length="max100"
							data-validation="required length"
  							data-validation-error-msg-required="Champs config est Obligatoire"
 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"/>
				<form:errors path="debut" class="control-label" />		
				</div>
			</div>
		
		</spring:bind>
		
		<spring:bind path="fin">
			<div class="col-6">
				<div class="form-group">
				<label class="text-dark">Date de fin</label>
				<form:input type="text" path="fin" data-language='fr' class="form-control datepicker-here" value="${missionForm.fin}" placeholder="Date de fin" 
							 data-position="bottom left" id="end"
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
		

		 <div class="form-group">
                   <label class="text-dark">Nombre de places</label><br>
                   <input type="text" name="nbPlaces" id="nbPlaces" class="form-control" placeholder="60">
                   <small class="form-text text-muted">Le nombre de places ne doit pas exéder 71 personnes.</small>
         </div>
    
		
		<div class="form-group">
			<div class="mx-auto">
			   <c:choose>
			   
					<c:when test="${missionForm.idMission  != null}">
						<button type="submit" class="btn btn-lg btn-primary">Modifier</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-lg btn-danger">Valider</button>
					</c:otherwise>
				</c:choose>
	
					<button type="reset" class="btn btn-lg btn-default">Reset</button>
			</div>
   </div>
   
   
 </form:form>
 
 </div>
</div>


</body>
</html>