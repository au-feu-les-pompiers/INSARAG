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



<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 
<%-- 
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script> --%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>


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
	
	
	
	<div class="d-flex justify-content-center">
	
	
	<div class="row justify-content-center align-items-center">
		
		<h5> Liste des secouristes ayant acceptés la mission </h5>				
		<div  class="row justify-content-center align-items-center">
	
		<table id="prodtable" class="table table-responsive  table-bordered">
			
				<thead class="thead-light">
					<tr>
					   <th>Id <i class="fas fa-sort"></i></th>
						<th>Nom <i class="fas fa-sort"></i></th>
						<th>Prénom <i class="fas fa-sort"></i></th>
						<th>Matricule <i class="fas fa-sort"></i></th>
						<th>Action</th>
					</tr>
				</thead>
				<tfoot>
	        	    <tr>
					   <th>Id</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Matricule</th>
						<th>Action</th>
	         	   </tr>
	       		 </tfoot>
	       	   <tbody>
				<c:forEach var="pomp" items="${pompier}">
				
					<spring:url value="/utilisateur/get/${pomp.id}"	var="missUrl" />
					
					<tr>
						<td width="8%">${pomp.id}</td>
						<td width="25%">${pomp.nom}</td>
						<td width="25%">${pomp.prenom}</td>
						<td width="22%">${pomp.matricule}</td>
						<td width="20%">
						
							<button class="btn btn-success"	onclick="location.href='${missUrl}'">
							show
							</button>
						</td>
					</tr>
					
				</c:forEach>
			 </tbody>	
			</table>
		
		</div>
		</div>
		
		
		
			<div class="row justify-content-center align-items-center">
		
				<h5> Liste des médecins ayant acceptés la mission </h5>				
				<div  class="row justify-content-center align-items-center">
		
				<table id="prodtable" class="table table-responsive  table-bordered">
				
					<thead class="thead-light">
						<tr>
						   <th>Id <i class="fas fa-sort"></i></th>
							<th>Nom <i class="fas fa-sort"></i></th>
							<th>Prénom <i class="fas fa-sort"></i></th>
							<th>Matricule <i class="fas fa-sort"></i></th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
		        	    <tr>
						   <th>Id</th>
							<th>Nom</th>
							<th>Prénom</th>
							<th>Matricule</th>
							<th>Action</th>
		         	   </tr>
		       		 </tfoot>
		       	   <tbody>
					<c:forEach var="mede" items="${medecin}">
					
						<spring:url value="/utilisateur/get/${mede.id}"	var="missUrl" />
						
						<tr>
							<td width="8%">${mede.id}</td>
							<td width="25%">${mede.nom}</td>
							<td width="15%">${mede.prenom}</td>
							<td width="15%">${mede.matricule}</td>
							<td width="30%">
							
								<button class="btn btn-success"	onclick="location.href='${missUrl}'">
								show
								</button>
							</td>
						</tr>
						
					</c:forEach>
				 </tbody>	
				</table>
				</div>
		</div>
		
			<div class="row justify-content-center align-items-center">
		
				<h5> Liste des managers ayant acceptés la mission </h5>				
		
				<div class="row justify-content-center align-items-center">
				<table id="prodtable" class="table table-responsive  table-bordered">
				
					<thead class="thead-light">
						<tr>
						   <th>Id <i class="fas fa-sort"></i></th>
							<th>Nom <i class="fas fa-sort"></i></th>
							<th>Prénom <i class="fas fa-sort"></i></th>
							<th>Matricule <i class="fas fa-sort"></i></th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
		        	    <tr>
						   <th>Id</th>
							<th>Nom</th>
							<th>Prénom</th>
							<th>Matricule</th>
							<th>Action</th>
		         	   </tr>
		       		 </tfoot>
		       	   <tbody>
					<c:forEach var="mana" items="${manager}">
					
						<spring:url value="/utilisateur/get/${mana.id}"	var="missUrl" />
						
						<tr>
							<td width="8%">${mana.id}</td>
							<td width="25%">${mana.nom}</td>
							<td width="15%">${mana.prenom}</td>
							<td width="15%">${mana.matricule}</td>
							<td width="30%">
							
								<button class="btn btn-success"	onclick="location.href='${missUrl}'">
								show
								</button>
							</td>
						</tr>
						
					</c:forEach>
				 </tbody>	
				</table>
				</div>
		</div>
		
		
	</div>
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