<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
/* 	function checkConfirmationFiels()
	{
		var passed= false;
		var mdp1 = document.getElementById("mdp1");
		var mdp2 = document.getElementById("mdp2");
		if (mdp1.value == mdp2.value )
		{
			alert("je suis un connard")
			passed = true;
		}
		else {
			mdp1.focus();
		}
		return passed;
	} */

	function checkPass()
	{
	    var pass1 = document.getElementById('mdp1');
	    var pass2 = document.getElementById('mdp2');
	    //Store the Confimation Message Object ...
	    var message = document.getElementById('confirmMessage');
	    //Set the colors we will be using ...
	    var goodColor = "#66cc66";
	    var badColor = "#ff6666";
	    //Compare the values in the password field 
	    //and the confirmation field
	    if(pass1.value == pass2.value){
	        //The passwords match. 
	        //Set the color to the good color and inform
	        //the user that they have entered the correct password 
	        pass2.style.backgroundColor = goodColor;
	        message.style.color = goodColor;
	        message.innerHTML = ""
	    }else{
	        pass2.style.backgroundColor = badColor;
	        message.style.color = badColor;
	        message.innerHTML = "Mauvais mot de passe!"
	    }
	}  
	</script>
	
	<spring:url value="form" var="utilisateurActionUrl" />
	
<form:form id="utilisateurform" name="frm" method="post"  modelAttribute="utilisateurForm"  
	action="${utilisateurActionUrl}">	
	
				<label>Mdp</label>
				<form:input type="text"   id="mdp1" path="mdp" 
				value="${utilisateurForm.mdp}" required="required" />
				<br>
				
				<label>Mdp confirmation</label>
				<form:input type="text"  id="mdp2" path="confirmationMdp" onkeyup="checkPass();return false;"
				value="${utilisateurForm.confirmationMdp}" required="required" />
				<span id="confirmMessage" class="confirmMessage" ></span>
				<br>
							
		<button type="submit" > <!-- onclick="return checkConfirmationFiels()"-->Inscipriton</button>
	</form:form>
</body>
</html>