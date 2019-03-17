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

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 
<%-- 
<spring:url value="/js/jquery-3.1.1.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>

<spring:url value="/js/bootstrap.min.js" var="bootstrap3Js" />
<script src="${bootstrap3Js}"></script> --%>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>

<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>



	<%-- 	<script
		    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
		<script>
		var map;
		function initialize() {
		  var mapOptions = {
		    zoom: 6,
		    center: new google.maps.LatLng(-34.397, 150.644)
		  };
		  map = new google.maps.Map(document.getElementById('map-canvas'),
		      mapOptions);
		}
		
		google.maps.event.addDomListener(window, 'load', initialize);
		</script>
--%>
</head>


<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container">
	<div class="row justify-content-center align-items-center">
	<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
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
			<div class="col-sm-7">${missionToShow.lieu}</div>
		</div>		

		<div class="row">
			<label class="col-sm-5">Date de début</label>
			<div class="col-sm-7">${missionToShow.debut}</div>
		</div>

		<div class="row">
			<label class="col-sm-5">Date de fin</label>
			<div class="col-sm-7">${missionToShow.fin}</div>
		</div>
		<div>
			<spring:url value="/mission/accept" var="utilisateurActionUrl" />
			
			<form:form id="utilisateurform"  class="form"  method="post"  modelAttribute="utilisateurForm"  action="${utilisateurActionUrl}" >
				<input class="btn btn-lg btn-danger btn-block" id="connexion"  type="submit" value="Accepter la mission">			
			</form:form>
		
		</div>
		
	</div>
	</div>				
	</div>
	

<div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key= AIzaSyDdzFj2ni5izYop3rXhtKOKC2ytCU7y3_4 &callback=initMap">
    </script>


	<%--	 <div id="map-canvas" style="height:400px; width:600px; float:right; margin-right:100px; margin-bottom:100px"></div>
 --%>
</body>
</html>