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

<spring:url value="/css/footer.css" var="footer" />
<link href="${footer}" rel="stylesheet" />
<%-- 
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script> --%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>

<style>
#floating-panel {
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        font-family: 'Roboto','sans-serif';
        line-height: 60px;
        padding-left: 10px;
      }
      
#map {
	display : none;
}
</style>

<!-- 
<script>
			function initMap() {
			  var dakar = {lat: 14.7645042, lng: -17.3660286};
			  var map = new google.maps.Map(
			      document.getElementById('map'), {zoom: 9, center: dakar});
			  var marker = new google.maps.Marker({position: dakar, map: map});
			}
</script>
-->

<script>
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 8,
      center: {lat: -34.397, lng: 150.644}
    });
    var geocoder = new google.maps.Geocoder();

    document.getElementById('submit').addEventListener('click', function() {
      geocodeAddress(geocoder, map);
    });
  }

  function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('address').value;
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
        resultsMap.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function hideThis(_div){
	    var obj = document.getElementById(_div);
	    if(obj.style.display == "block")
	        obj.style.display = "none";
	    else
	        obj.style.display = "block";
	}
	
  </script>


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
	
	<div style="margin-top:100px;"></div>
	
	<div class="container mb-3">
	<div class="row justify-content-center align-items-center">
	<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 1500px; max-height: 1500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
		padding: 10px 30px;
		border: 1px solid grey;">
		
		<div class="row justify-content-center align-items-center">
			<h3 class="text-center">Consulter Mission</h3>
		</div>
		<br/>

		 
		<div class="row">
			<label class="col-sm-5">ID</label>
			<div class="col-sm-7">${missionToShow.idMission}</div>
		</div>
		
		<div class="row">
			<label class="col-sm-5">Lieu</label>
			<div id="localisation" class="col-sm-7">${missionToShow.lieu}</div>
			<div id="floating-panel">
		      <input id="address" type="hidden" value="${missionToShow.lieu}">
		      <button  id="submit" type="button" class="btn btn-light"  onclick="hideThis('map')">Localisation</button>
		    </div>			
			<div id="map" class="col-xl-6" style="height:500px; width:750px; border: 1px solid grey; border-radius:10px; margin-top:25px">
    										    
			</div>
		</div>		

		<div class="row" style="margin-top:25px">
			<label class="col-sm-5">Date de début</label>
			<div class="col-sm-7">${missionToShow.debut}</div>
		</div>

		<div class="row">
			<label class="col-sm-5">Date de fin</label>
			<div class="col-sm-7">${missionToShow.fin}</div>
		</div>
		<div>
		
		</div>
		
	</div>
	</div>				
	</div>
    
    <script async defer
	    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdzFj2ni5izYop3rXhtKOKC2ytCU7y3_4&callback=initMap">
	</script> 
	<jsp:include page="../common/footer.jsp" />
</body>
</html>