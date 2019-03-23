<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<!DOCTYPE html>
<html>
<head>
<title>Page de contact</title>

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

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

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

	<div class="container">

		<c:if test="${not empty msgAlert}">
			<div class="alert alert-${typeAlert} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<strong>${msgAlert}</strong>
			</div>
		</c:if>


		<c:choose>
			<%-- Debut c:choose  --%>
			<c:when test="${empty utilisateurs}">
				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>Aucun utilisateur trouvé ! La liste est vide !</strong>
				</div>
			</c:when>

			<c:otherwise>
				<%-- Debut c:otherwise  --%>

				<div class="row">
					<div class="col-md-7">
						<h1>Pompier en mission</h1>
					</div>
				</div>


				<!-- 		<table  id="prodtable" class="table table-striped"> -->
				<table id="prodtable" class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Utilisateur</th>
							<th>Email</th>
							<th>Téléphone</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Utilisateur</th>
							<th>Email</th>
							<th>Téléphone</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="util" items="${utilisateurs}">

							<spring:url value="/utilisateur/Contact/${util.id}" var="utilUrl" />
							<tr>
								<td width="15%"><font style="text-transform: uppercase;">${util.nom}</font>
									${util.prenom}</td>
								<td width="20%">${util.email}</td>
								<td width="10%">${util.telephone}</td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
			<%-- Fin c:otherwise  --%>
		</c:choose>
		<%-- Fin c:choose  --%>
	</div>
</body>
</html>