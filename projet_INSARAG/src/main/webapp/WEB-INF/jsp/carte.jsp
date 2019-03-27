<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>Carte de la mission</title>

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

	<div id="header">
		<c:choose>
			<c:when test="${sessionScope.accreditation == 2}">
					<jsp:include page="common/header.jsp" />
					<spring:url value="/css/header.css" var="headerCss" />
					<link href="${headerCss}" rel="stylesheet" /> 
			</c:when>
			<c:otherwise>
				<jsp:include page="common/navbar_uti.jsp" />
				<spring:url value="/css/navbar_uti.css" var="navbar_uti" />
				<link href="${navbar_uti}" rel="stylesheet" /> 
			</c:otherwise>
		</c:choose>
	</div>

<div id="map"></div>
    <script>
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 10
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
            //infoWindow.setContent('Location found.');
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
    
    <div id="map">
	    <script async defer
	    	src="https://maps.googleapis.com/maps/api/js?key= AIzaSyDdzFj2ni5izYop3rXhtKOKC2ytCU7y3_4 &callback=initMap">
	    </script>
    </div>

</body>
</html>