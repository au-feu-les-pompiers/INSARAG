function checkConfirmationFiels(element1, element2)
 {
  var passed=false

   if (element1.value=='')
   {
    alert("Veuillez entrer votre mot de passe")
    element1.focus()
   }
   else if (element2.value=='')
   {
    alert("Veuillez confirmer votre mot de passe")
    element2.focus()
   }

   else if (element1.value!=element2.value)
   {
    alert("Les deux mot de passe ne concordent pas")
    element1.select()
   }
   else
   passed=true
   return passed
 }