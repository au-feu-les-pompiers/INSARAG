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


</head>


<body>

	<div id="header">
		<c:choose>
			<c:when test="${sessionScope.accreditation == 2}">
					<jsp:include page="../common/header.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="../common/navbar_uti.jsp" />
			</c:otherwise>
		</c:choose>
	</div>
		
	<iframe src="https://docs.google.com/file/d/1Uy08SvlBGGBRJzX6U4bTMRCWBCiL6z1N/preview" width="100%" height="500"></iframe>
	

</body>
</html>