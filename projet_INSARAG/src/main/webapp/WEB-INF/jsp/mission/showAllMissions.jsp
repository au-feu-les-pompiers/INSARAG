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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
<spring:url value="/css/dataTables.bootstrap.min.css" var="bootstrapdataTablesCss" />
<link href="${bootstrapdataTablesCss}" rel="stylesheet" />

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

<spring:url value="/js/jquery.dataTables.min.js" var="jquerydataTablesJs" />
<script src="${jquerydataTablesJs}"></script>

<spring:url value="/js/dataTables.bootstrap.min.js" var="bootstrapdataTablesJs" />
<script src="${bootstrapdataTablesJs}"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>


<body>

	<jsp:include page="../common/header.jsp" />


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

		
 <c:choose>  <%-- Debut c:choose  --%>
		<c:when test="${empty missions}">
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				<strong>Aucune mission trouvée ! La liste est vide !</strong>
			</div>
		</c:when>
		
 <c:otherwise>  <%-- Debut c:otherwise  --%>
		
		<div class="row">
			<div class="d-flex justify-content-between">
				<div class="col-md-10 col-sm-10">
					<h1> Liste des missions </h1>
				
				</div>
				<div class="col-md-2 col-sm-2 float-sm-right">
						<button type="button" style="margin-top:20px;" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/mission/new'">
						 Nouvelle mission
						</button>
				</div>
			</div>
		</div>


<!-- 		<table  id="prodtable" class="table table-striped"> -->
		<table id="prodtable" class="table table-striped table-bordered">
		
			<thead>
				<tr>
				   <th>Id</th>
					<th>Lieu</th>
					<th>Date de début</th>
					<th>Date de fin</th>
					<th>Action</th>
				</tr>
			</thead>
			<tfoot>
        	    <tr>
				   <th>Id</th>
					<th>Lieu</th>
					<th>Date de début</th>
					<th>Date de fin</th>
					<th>Action</th>
         	   </tr>
       		 </tfoot>
       	   <tbody>
			<c:forEach var="miss" items="${missions}">
			
				<spring:url value="/mission/get/${miss.idMission}"	var="missUrl" />
				<spring:url value="/mission/update/${miss.idMission}" var="updateUrl" />
				
				<tr>
					<td width="5%">${miss.idMission}</td>
					<td width="20%">${miss.lieu}</td>
					<td width="20%">${miss.debut}</td>
					<td width="20%">${miss.fin}</td>
	
					<td>
					
						<button class="btn btn-success"	onclick="location.href='${missUrl}'">
						show
						</button>
						<button class="btn btn-primary" onclick="location.href='${updateUrl}'">
						update
						</button>
					</td>
				</tr>
				
			</c:forEach>
		 </tbody>	
		</table>
		
		
		 

</c:otherwise> <%-- Fin c:otherwise  --%>
</c:choose> <%-- Fin c:choose  --%>
</div> <%-- Fin div class="container" --%>

<!-- https://datatables.net/examples/styling/bootstrap.html -->
<script>	
// $(document).ready(function() {
//     $('#prodtable').DataTable();
// } );
// $(document).ready(function() {
//     $('#prodtable').dataTable( {
//         "language": {
//             "url": "dataTables.frensh.lang"
//         }
//     } );
// } );
$('#prodtable').DataTable( {
    language: {
        processing:     "Traitement en cours...",
        search:         "Rechercher&nbsp;:",
        lengthMenu:    "Afficher _MENU_ &eacute;l&eacute;ments",
        info:           "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        infoEmpty:      "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
        infoFiltered:   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        infoPostFix:    "",
        loadingRecords: "Chargement en cours...",
        zeroRecords:    "Aucun &eacute;l&eacute;ment &agrave; afficher",
        emptyTable:     "Aucune donnée disponible dans le tableau",
        paginate: {
            first:      "Premier",
            previous:   "Pr&eacute;c&eacute;dent",
            next:       "Suivant",
            last:       "Dernier"
        },
        aria: {
            sortAscending:  ": activer pour trier la colonne par ordre croissant",
            sortDescending: ": activer pour trier la colonne par ordre décroissant"
        }
    }
} );
</script>


</body>
</html>