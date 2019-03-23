<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page de contact</title>

<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<spring:url value="/css/dataTables.bootstrap.min.css"
	var="bootstrapdataTablesCss" />
<link href="${bootstrapdataTablesCss}" rel="stylesheet" />

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" />

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" />

<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script>

<spring:url value="/js/jquery.dataTables.min.js"
	var="jquerydataTablesJs" />
<script src="${jquerydataTablesJs}"></script>

<spring:url value="/js/dataTables.bootstrap.min.js"
	var="bootstrapdataTablesJs" />
<script src="${bootstrapdataTablesJs}"></script>

</head>
<body>
		<div id="header">
		<c:choose>
			<c:when test="${sessionScope.accreditation == 1}">
					<jsp:include page="../common/header.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="../common/navbar_uti.jsp" />
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