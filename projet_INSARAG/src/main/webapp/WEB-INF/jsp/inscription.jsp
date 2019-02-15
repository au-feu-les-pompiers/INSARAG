<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Inscription</title>
        <link type="text/css" rel="stylesheet" href="form.css" />
    </head>
    <body>
        <form:form method="post" action="inscription" modelAttribute = "inscriptionForm">
           <!--   <fieldset> -->
                <legend>Inscription</legend>
                <p>Vous pouvez vous inscrire via ce formulaire.</p>

			<table>
				<tr>
					<td><spring:message code="champ.email"/> </td>
					<td><form:input path="email"/></td>
					<td><form:errors path="email" cssClass="errors" /></td>
				</tr>
				<tr>
					<td><spring:message code="champ.password"/> </td>
					<td><form:input path="password"/></td>
					<td><form:errors path="password" cssClass="errors" /></td>
				</tr>
				<tr>
					<td><spring:message code="champ.confirmation"/> </td>
					<td><form:input path="password"/></td>
					<td><form:errors path="password" cssClass="errors" /></td>
				</tr>
				<tr>
					<td><spring:message code="champ.nom"/> </td>
					<td><form:input path="nom"/></td>
					<td><form:errors path="nom" cssClass="errors" /></td>
				</tr>	
						
			</table>		
               <!-- <label for="email">Adresse email <span class="requis">*</span></label>
                <input type="text" id="email" name="email" value="" size="20" maxlength="60" />
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
                <br />

                <label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>
                <input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" />
                <br />

                <label for="nom">Nom d'utilisateur</label>
                <input type="text" id="nom" name="nom" value="" size="20" maxlength="20" />
                <br />

                <input type="submit" value="Inscription" class="sansLabel" />
                <br />
            </fieldset> -->
        </form:form>
    </body>
</html>