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
<meta name="Description" content="" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

  
<spring:url value="/css/bootstrap.min.css" var="bootstrap4Css" />
<link href="${bootstrap4Css}" rel="stylesheet" /> 
 
<spring:url value="/css/datatables.css" var="bootstrapdataTablesCss" />
<link href="${bootstrapdataTablesCss}" rel="stylesheet" /> 

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

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
	
	<jsp:include page="../common/header.jsp" />

 <div class="container" style="max-width:1300px;">

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
		<c:when test="${empty utilisateurs}">
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
				<strong>Aucun utilisateur trouvé ! La liste est vide !</strong>
			</div>
		</c:when>
		
 <c:otherwise>  <%-- Debut c:otherwise  --%>
		
		<div class="row justify-content-center align-items-center">
		
			<h1> Administration des utilisateurs </h1>
	
		</div>


		<table id="prodtable" class="table table-responsive table-bordered" >
		
			<thead class="thead-light">
				<tr>
				   <th>Matricule</th>
					<th>Utilisateur <i class="fas fa-sort"></i></th>
					<th>Date de naissance <i class="fas fa-sort"></i></th>
					<th>Email <i class="fas fa-sort"></i></th>
					<th>Téléphone</th>
					<th>Statut <i class="fas fa-sort"></i></th>
					<th>Action <i class="fas fa-sort"></i></th>
				</tr>
			</thead>
			<tfoot>
        	    <tr>
				   <th>Matricule</th>
					<th>Utilisateur</th>
					<th>Date de naissance</th>
					<th>Email</th>
					<th>Téléphone</th>
					<th>Statut</th>
					<th>Action</th>
         	   </tr>
       		 </tfoot>
       	   <tbody>
			<c:forEach var="util" items="${utilisateurs}">
			
				<spring:url value="/utilisateur/get/${util.id}"	var="utilUrl" />
 				<spring:url value="/utilisateur/upauto/${util.id}" var="upAutoUrl" />
 				<spring:url value="/utilisateur/down/${util.id}" var="downUrl" />
<%-- 				<spring:url value="/utilisateur/update/${util.id}" var="updateUrl" /> --%>
<%-- 				<spring:url value="/utilisateur/clear" var="clearUrl" /> --%>
				
				<tr>
					<td width="5%">${util.matricule}</td>
					<td width="15%"><font style="text-transform: uppercase;">${util.nom}</font> ${util.prenom}</td>
					<td width="17%">${util.naissance}</td>
					<td width="20%">${util.email}</td>
					<td width="10%">${util.telephone}</td>
					<td width="10%">
					
					
					<c:choose>  <%-- Debut c:choose  --%>
					<c:when test="${util.autorisation == 0}">En attente</c:when>
					<c:when test="${util.autorisation == 1}">Pompier</c:when>
					<c:when test="${util.autorisation == 2}">Administrateur</c:when>
					<c:when test="${util.autorisation == 3}">Administrateur médical</c:when>
					<c:when test="${util.autorisation == 4}">Super Admin</c:when>
					<c:when test="${util.autorisation == -1}">Refusé</c:when></c:choose></td>
					<td>
					<div class="">
					<c:choose>  <%-- Debut c:choose  --%>
						<c:when test="${util.autorisation == 0}">
							<button class="btn btn-success" onclick="location.href='${upAutoUrl}'">Confirmer</button>
							<button class="btn btn-danger"	onclick="location.href='${downUrl}'">Refuser</button>
						</c:when>
						<c:when test="${util.autorisation == 1}">
							<button class="btn btn-success" onclick="location.href='${upAutoUrl}'">Promouvoir</button>
						</c:when>
						<c:when test="${util.autorisation == -1}">
							<button class="btn btn-success" onclick="location.href='${upAutoUrl}'">Accepter</button>
						</c:when>
					</c:choose>
					
						<button class="btn btn-primary"	onclick="location.href='${utilUrl}'">show</button>
					</div>	
					</td>
				</tr>
				
			</c:forEach>
		 </tbody>	
		</table>
		  
		
		

</c:otherwise> <%-- Fin c:otherwise  --%>
</c:choose> <%-- Fin c:choose  --%>
</div> <%-- Fin div class="container" --%>

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