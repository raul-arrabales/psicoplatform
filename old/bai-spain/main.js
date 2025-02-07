
var currentTab = 0; // Current tab is set to be the first tab (0)
var BAIItems = new Array(); 


function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
	document.getElementById("nextBtn").style.display = "none";
	document.getElementById("prevBtn").style.display = "none";
	// submission_btn.innerHTML = "Obtener Resultados";
	// submission_btn.id = "button_enviar";
  } else {
    document.getElementById("nextBtn").innerHTML = "Siguiente";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    // document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of each of the step questions
  // console.log("checking step...");
  
  var x, y, i, valid = true;
  var radio_value = -1;
  
  // Get current radio button response
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");

  // Get radio buttons state
  for(var i = 0; i < y.length; i++){
    if(y[i].checked){
        radio_value = y[i].value;
    }
  }
  
  // If the field is not set
  if (radio_value == -1) {
      // add an "invalid" class to the field:
      // Not for radio buttons... y[i].className += " invalid";
      // and set the current valid status to false:
	  document.getElementById("ErrorMsg").innerHTML = "<h4 style='color:red'>Por favor, indica el grado en que has sido afectado/a por este síntoma.</h4>";
      valid = false;
  }
  
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	  
	// Save the value. 
	BAIItems.push(parseInt(radio_value));
	
	document.getElementById("ErrorMsg").innerHTML = "";
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}


function EmailInvalid(inputText) {
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(inputText.match(mailformat)) {
		return false;
	} 
	else {
		return true;
	}
}

function clearErrors() {
	document.getElementById("ErrorMsg").innerHTML = "";
}



 /* La función check() comprueba que se han contestado todas las preguntas del TAS. De no ser así aparece una alarma, en caso contrario muestra los resultados por pantalla.
 Además devuelve una lista con los cuatro resultados clave del TAS (total, F1, F2, F3 */

function check() {

	var genero_select = document.getElementById("Gender");
	var genero = genero_select.options[genero_select.selectedIndex].value;
	console.log("Genero:" + genero);
	var edad = document.formbai.Age.value;
	console.log("Edad: " + edad);
	var email = document.formbai.Email.value;
	console.log("Email: " + email);
	var privacidad = document.formbai.Privacidad.checked; 
	console.log("Privacidad: " + privacidad);
	
	var todorespondido = true;

	if (Number.isNaN(genero)) {
		// alert("No has indicado tu identidad de género.");
		document.getElementById("ErrorMsg2").innerHTML = "<h4 style='color:red'>No has indicado tu identidad de género.</h4>";
		todorespondido = false;
	} else if ( edad < 18 || edad > 100) {
		// alert("No has indicado una edad válida.");
		document.getElementById("ErrorMsg2").innerHTML = "<h4 style='color:red'>No has indicado una edad válida.</h4>";
		todorespondido = false;
	} else if (EmailInvalid(email)) {
		document.getElementById("ErrorMsg2").innerHTML = "<h4 style='color:red'>El email introducido no es correcto.</h4>";
		// alert("El email introducido no es correcto.");
		todorespondido = false;
	} else if (!privacidad) {
		// alert("Es necesario que aceptes la política de privacidad.");
		document.getElementById("ErrorMsg2").innerHTML = "<h4 style='color:red'>Es necesario que aceptes la política de privacidad.</h4>";
		todorespondido = false; 
	}


	if (todorespondido) {
		
		var results_str = ""; 

		var puntosBAI = 0;
		
		// Collect and sum all responses
		for (i = 0; i < BAIItems.length; i++) {
			puntosBAI += BAIItems[i];
		}
		
		document.getElementById("BAI").value = puntosBAI;
		document.getElementById("input-email").value = email;
		document.getElementById("Code").value = md5(email);		
		
		document.getElementById("thanksMsg").innerHTML = "<h4 style='color:green; text-align:center'>Gracias. Datos recibidos correctamente.</h4>";
		
		results_str = "<p style='text-align:left'>Has obtenido un total de <u><strong>" + puntosBAI + " puntos</strong></u> en el inventario de ansiedad BAI.<br>&nbsp;" 
		+ "<p style='text-align:left'>Estos resultados indican ";
		
		if (puntosBAI >= 36) {
			// Ansiedad severa
			results_str += "<b><u>una ansiedad severa</u></b>.</p>";
			results_str += "<p>En vista de estos resultados te recomendamos encarecidamente que contactes con un profesional de la salud. Puedes solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p>";
		} else if (puntosBAI <= 21) {
			// Ansiedad muy baja.
			results_str += "<b><u>una ansiedad muy baja</u></b>.</p>";
			results_str += "<p>Nos alegra saber que no tienes síntomas graves de ansiedad. No obstante, si te preocupa cualquier otra cosa, puedes solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p>";
		} else {
			// Ansiedad moderada
			results_str += "<b><u>una ansiedad moderada</u></b>.</p>";
			results_str += "<p>Aunque no tienes síntomas muy severos de ansiedad te recomendamos que contactes con un profesional de la salud si ves que no puedes manejar adecuadamente la situación. Puedes solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p>";
		}
		
		// Call to action (psy attention):
		results_str += "<p>Para interpretar estos resultados correctamente, puedes consultar en el blog de Psicobōtica los <a href='https://www.psicobotica.com/blog/' target='_blank'>artículos sobre ansiedad</a>.</p><hr>";
		
		// Call to action (prolexitim NLP):
		results_str += "<p><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'><img style='float:left' src='narrativa_320x236.jpg'></a><strong>¿Quieres saber más sobre tus emociones?</strong><br>&nbsp;<br><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'>Accede aquí al test Prolexitim NLP</a>, un test basado en tu expresión verbal. Te mostraremos unas imágenes que tendrás que describir y analizaremos tus narrativas automáticamente utilizando Inteligencia Artificial.</p>";
		
		document.getElementById("results").innerHTML = results_str;
		document.getElementById("results").style.visibility = "visible";
		document.getElementById("results").style.display = "block";
	}
	
	return todorespondido; 

}