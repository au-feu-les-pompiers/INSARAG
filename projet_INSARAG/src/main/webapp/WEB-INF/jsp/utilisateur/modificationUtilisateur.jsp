<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>INSARAG</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="Content-Language" content="fr" />
<meta name="Description" content="" />
<meta name="Subject" content="" />
<meta name="Content-Type" content="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
  	
<spring:url value="/css/footer.css" var="footer" />
<link href="${footer}" rel="stylesheet" />

<spring:url value="/css/bootstrap.min.css" var="bootstrap4Css" />
<link href="${bootstrap4Css}" rel="stylesheet" /> 

<spring:url value="/css/header.css" var="headerCss" />
<link href="${headerCss}" rel="stylesheet" /> 

<spring:url value="/css/normalize.css" var="normalize" />
<link href="${normalize}" rel="stylesheet" /> 

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>

<spring:url value="/js/jquery.form-validator.min.js" var="controlformJs" />
<script src="${controlformJs}"></script>

<spring:url value="/js/datepicker.min.js" var="datePickerJs" />
<script src="${datePickerJs}"></script>

<spring:url value="/js/datepicker.fr.js" var="datePickerJsFR" />
<script src="${datePickerJsFR}"></script>

<spring:url value="/css/datepicker.min.css" var="datePickerCss" />
<link href="${datePickerCss}" rel="stylesheet" /> 



</head>
<!-- http://formvalidation.io/download/ -->
<!-- http://www.formvalidator.net/ -->
<!-- http://www.formvalidator.net/#configuration_html5 -->
<!-- http://www.formvalidator.net/#localization_submit -->
<!-- http://www.jqueryscript.net/form/Powerful-Form-Validation-Plugin-For-jQuery-Bootstrap-3.html -->
<!-- http://www.jqueryscript.net/form/HTML5-Form-Validation-Plugin-For-Bootstrap-Bootstrap-Validator.html -->

<body>
<script>  
	function validateForm(){		
		if (checkPass() && checkPhone()) {
			return true
		}else{
			return false
		}
	}
 
 	function checkPass(){
	    var pass = document.getElementById('mdp');
	    var message = document.getElementById('message');
	    var goodColor = "#66cc66";
	    var badColor = "#ff6666";
	    
	    if(pass.value.length >= 12){
	        pass.style.backgroundColor = goodColor
	        message.innerHTML = ""
	        pass.type = "password"
		    return true
	    }else{
	    	if (pass.value != ""){
		        pass.style.backgroundColor = badColor
		        message.style.color = badColor
		        message.innerHTML = "Votre mot de passe n'est pas assez long!"
	    	}
	    	return false
	    }
	}

 	function randomPass(){
 		var goodColor = "#66cc66";
 		var pass = document.getElementById('mdp');
 		var image = document.getElementById("#mdp");
 		var open = "fa-eye";
 		var mdp = "";
 		var randC;
 		var randL;
 		var c;
 	 	
 	 	while (mdp.length < 12){
 	 	 	randC = Math.floor((Math.random() * 3))
 	 	 	if (randC == 0){
 	 	 	 	randL = Math.floor((Math.random() * 26) + 97)
 	 	 	 	c = String.fromCharCode(randL)
 	 	 	}else if (randC == 1){
 	 	 		randL = Math.floor((Math.random() * 26) + 65)
 	 	 	 	c = String.fromCharCode(randL)
 	 	 	}else{
 	 	 		randL = Math.floor((Math.random() * 10) + 48)
 	 	 	 	c = String.fromCharCode(randL)
 	 	 	}
 	 	 	mdp += c
		}
 		pass.style.backgroundColor = goodColor
 		pass.type = "text"
 		image.className = "fa fa-fw field-icon " + open
 		document.getElementById('mdp').value = mdp
 	}

 	function checkPhone(){
	    var phone = document.getElementById('phone');
	    var ext = document.getElementById('selectExt');
	    var telephone = phone.value.split(" ");
	    var newTelephone = "";
	    var test = "";
	    var message = document.getElementById('confirmPhone');
	    var goodColor = "#66cc66";
	    var badColor = "#ff6666";
	    var k;
	    var verif;
	    var copy;

	    for (k = 0; k < telephone.length; k++){
	    	newTelephone = newTelephone + telephone[k]
		}

		verif = parseInt(newTelephone)

		//Vérification de la validité du numéro
		if (verif != newTelephone && newTelephone != ""){
			phone.style.backgroundColor = badColor
			message.style.color = badColor
			message.innerHTML = "Numéro de téléphone invalide!"
			return false
		}else{
			//Vérification de la taille du numéro en fonction du pays
			if (newTelephone.length != 10){
				if (newTelephone != ""){
					if (phone.value.length == 17){
						telephone = phone.value.split(" ")
						for (k = 0; k < telephone.length; k++){
							test = test + telephone[k]
						}
						if (test.length == 12 && test.substring(0, 3) == "+33"){
							phone.style.backgroundColor = goodColor
							message.innerHTML = ""
							return true
						}else{
							phone.style.backgroundColor = badColor
							message.style.color = badColor
							message.innerHTML = "Numéro de téléphone invalide!"
							return false
						}
					}else{
						phone.style.backgroundColor = badColor
						message.style.color = badColor
						message.innerHTML = "(+33) Votre numéro de téléphone doit comporter 10 chiffres!"
						return false
					}					
				}else{
					message.innerHTML = ""
					return false
				}
			}else{
				if (newTelephone.substring(0, 1) != "0"){
					phone.style.backgroundColor = badColor
					message.style.color = badColor
					message.innerHTML = "Numéro de téléphone invalide! Votre numéro doit commencer par un 0!"
					return false
				}else{
					phone.style.backgroundColor = goodColor
					message.innerHTML = ""
					copy = newTelephone.substring(1, 10)
					newTelephone = copy.substring(0, 1) + " "
					copy = copy.substring(1, 9)
					k = 0
					
					while (copy != ""){
						newTelephone = newTelephone + copy.substring(0, 2) + " "
						copy = copy.substring(2, 8 - 2*k)
						k++
					}
					document.getElementById('phone').value = "+33 " + newTelephone.substring(0, newTelephone.length-1)
					return true
				}
			}
		}
	}

 	function changePassword2Text2() {
 		var open = "fa-eye";
 	 	var close = "fa-eye-slash";
 	 	var ele = document.getElementById("mdp");
 	 	var image = document.getElementById("#mdp");

 		if (image.classList.contains(close)){
	 	  	ele.type="text";
	 	  	image.className = "fa fa-fw field-icon " + open
 	  	}else{
	 	  	ele.type="password";
	 	  	image.className = "fa fa-fw field-icon " + close
 	  	}
 	}
</script>
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
	 
<div style="margin-top:100px;"></div>
<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-md-10 col-lg-8 col-xl-6" style="max-width: 500px; background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);
	padding: 15px 30px;
	border: 1px solid grey;">
	
	<div class="row justify-content-center align-items-center">
				<h3 class="text-center">Modifier votre profil</h3>
				<h6 class="text-center text-dark mb-5">
			    <font color = 'red'>${error}</font>
			    </h6>
	</div>
			
	<spring:url value="/utilisateur/save" var="utilisateurActionUrl" />

	<form:form id="utilisateurform"  class="form-horizontal"  method="post"  modelAttribute="utilisateurForm"  action="${utilisateurActionUrl}" >
	<c:choose>
 <c:when test="${sessionScope.idUtilisateur == utilisateurForm.id}">
		<form:hidden path="id"  value="${utilisateurForm.id}" />
		
		<spring:bind path="email">
		
					<div class="form-group">
						<label>Email</label>
						<form:input type="text"   path="email"  class="form-control"  value="${utilisateurForm.email}" placeholder="Email de l'utilisateur" 
									required="required" 
									data-validation-length="max100"
									data-validation-allowing="-_ éèà'&"
									data-validation="required alphanumeric length"
		  							data-validation-error-msg-required="Champs designation est Obligatoire"
		 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
		 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
						<form:errors path="email" class="control-label" />		
					</div>

		</spring:bind>
		
		<spring:bind path="mdp">
					<div class="form-group">
						<label for="password" class="text-dark">Mot de passe</label>
						<button type="button" class="btn btn-sm btn-primary" onclick="randomPass();">Générer un mot de passe</button>
                        <br>
						<form:input type="text"   path="mdp" class="form-control" value="defaultINSARAG" placeholder="Mdp de l'utilisateur" 
									id="mdp"
									onblur='checkPass();'
									ng-model="thePassword"
									required="required" 
									data-validation-length="max100"
									data-validation-allowing="-_ éèà'&"
									data-validation="required alphanumeric length"
		  							data-validation-error-msg-required="Champs designation est Obligatoire"
		 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
		 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
						
						<span id="#mdp" onclick="changePassword2Text2();" class="fa fa-fw field-icon fa-eye" 
							style="float: right;
  									right:10px;
  									margin-top: -25px;
 									position: relative;">
 						</span>
						
						<form:errors path="mdp" class="control-label" />
						<span id="message" class="message" ></span>		
					</div>
			
		</spring:bind>
	
		<spring:bind path="nom">
		<div class="row">
			<div class="col-6">
				<div class="form-group">
					<label>Nom</label>
					<form:input type="text"   path="nom"  class="form-control"  value="${utilisateurForm.nom}" placeholder="Nom de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
	 							disabled="true"/> 
					<form:errors path="nom" class="control-label" />		
				</div>
			</div>

		</spring:bind>
		
		
		<spring:bind path="prenom">
	
			<div class="col-6">
				<div class="form-group">
					<label>Prénom</label>
					<form:input type="text" path="prenom"  class="form-control"  value="${utilisateurForm.prenom}" placeholder="Prenom de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation="required length"
	  							data-validation-error-msg-required="Champs config est Obligatoire"
	 							data-validation-error-msg-length="Taille du champs config ne doit pas dépasser 100"
	 							disabled="true"/>
					<form:errors path="prenom" class="control-label" />		
				</div>
			</div>
		</div>
		</spring:bind>
		
		<spring:bind path="telephone">
		 <div class="row">
			<div class="col-6">
				<div class="form-group">
					<label>Numéro de téléphone</label>
					<form:input type="text"   path="telephone"  class="form-control"  value="${utilisateurForm.telephone}" placeholder="Téléphone de l'utilisateur" 
								id="phone"
								onblur='checkPhone();'
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"/> 
					<form:errors path="telephone" class="control-label" />
					<span id="confirmPhone" class="confirmPhone" ></span>		
				</div>
			</div>
		
		</spring:bind>
		
		<spring:bind path="naissance">
	
			<div class="col-6">
				<div class="form-group">
					<label>Date de naissance</label>
					<form:input type="text"   path="naissance"  class="form-control"  value="${utilisateurForm.naissance}" placeholder="Date de naissance de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
	 							disabled="true"/> 
					<form:errors path="naissance" class="control-label" />		
				</div>
			</div>
			</div>
		</spring:bind>
		
		<spring:bind path="matricule">

				<div class="form-group">
					<label>Matricule</label>
					<form:input type="text"   path="matricule"  class="form-control"  value="${utilisateurForm.matricule}" placeholder="Matricule de l'utilisateur" 
								required="required" 
								data-validation-length="max100"
								data-validation-allowing="-_ éèà'&"
								data-validation="required alphanumeric length"
	  							data-validation-error-msg-required="Champs designation est Obligatoire"
	 							data-validation-error-msg-alphanumeric="La designation doit contenir uniquement des cacartères alphanumérique"
	 							data-validation-error-msg-length="Taille du champs designation ne doit pas dépasser 100"
	 							disabled="true"/> 
					<form:errors path="matricule" class="control-label" />		
				</div>
		
		</spring:bind>
		
		<form:hidden path="nom"  value="${utilisateurForm.nom}" />
		<form:hidden path="prenom"  value="${utilisateurForm.prenom}" />
		<form:hidden path="naissance"  value="${utilisateurForm.naissance}" />
		<form:hidden path="matricule"  value="${utilisateurForm.matricule}" />
		<form:hidden path="autorisation"  value="${utilisateurForm.autorisation}" />
		<form:hidden path="enMission"  value="${utilisateurForm.enMission}" />
		
		
		<div class="form-group">
			<div class="row justify-content-center align-items-center">
				<button type="submit" onclick="return validateForm()" class="btn  btn-primary pull-left">Modifier</button>
	      		<button type="reset" class="btn  btn-default">Reset</button>
	       </div>
   		</div>
   		</c:when>
   		<c:otherwise>
   		<div>
   		<h6> Vous ne pouvez pas modifier le profil d'un autre utilisateur</h6></div>
   		</c:otherwise>

</c:choose>
   		
 </form:form>

</div>
</div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>