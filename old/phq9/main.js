
var currentTab = 0; // Current tab is set to be the first tab (0)
var PHQ9Items = new Array(); 


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
  
  if (radio_value == -1) {
      // add an "invalid" class to the field:
      // Not for radio buttons... y[i].className += " invalid";
      // and set the current valid status to false:
	  document.getElementById("ErrorMsg").innerHTML = "<h4 style='color:red'>Por favor, indica con qué frecuencia te ha pasado esto en las últimas dos semanas.</h4>";
      valid = false;
  }
  
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	  
	// Save the value. 
	PHQ9Items.push(parseInt(radio_value));
	
	document.getElementById("ErrorMsg").innerHTML = "";
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function clearErrors() {
	document.getElementById("ErrorMsg").innerHTML = "";
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



 /* La función check() comprueba que se han contestado todas las preguntas del TAS. De no ser así aparece una alarma, en caso contrario muestra los resultados por pantalla.
 Además devuelve una lista con los cuatro resultados clave del TAS (total, F1, F2, F3 */

function check() {

	var genero_select = document.getElementById("Gender");
	var genero = genero_select.options[genero_select.selectedIndex].value;
	console.log("Genero:" + genero);
	var edad = document.formphq9.Age.value;
	console.log("Edad: " + edad);
	var email = document.formphq9.Email.value;
	console.log("Email: " + email);
	var privacidad = document.formphq9.Privacidad.checked; 
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

		var puntosPHQ9 = 0;
		for(var i = 0; i < PHQ9Items.length; i++) {			
			document.getElementById("I".concat((i+1).toString())).value = PHQ9Items[i];
			puntosPHQ9 += PHQ9Items[i];
		}
		
		document.getElementById("PHQ9").value = puntosPHQ9;
		document.getElementById("input-email").value = email;
		document.getElementById("Code").value = md5(email);		
		
		document.getElementById("thanksMsg").innerHTML = "<h4 style='color:green; text-align:center'>Gracias. Datos recibidos correctamente.</h4>";
		
		results_str = "<p style='text-align:left'>Has obtenido un total de <u><strong>" + puntosPHQ9 + " puntos</strong></u> en el cuestionario PHQ-9.<br>&nbsp;</p>" 
		+ "<p style='text-align:left'>Estos resultados indican ";
		
		if (puntosPHQ9 > 10) {
			// Clara depresión
			results_str += "<b><u>un alto riesgo de que estés sufriendo un trastorno del estado de ánimo</u></b>, por lo que es importante que te pongas en contacto con un profesional de la salud para realizar una evalución más completa.</p>";
		} else {
			// Ausencia de depresión.
			results_str += "que <b>no existe un riesgo alto de que padezcas un trastorno del ánimo</u></b>. No obstante, si notas cualquier malestar ponte en contacto con un profesional de la salud.</p>";
		}
		
		// Call to action (psy attention):
		results_str += "<p>Para interpretar estos resultados correctamente, puedes consultar en el <a href='https://www.psicobotica.com/blog/' target='_blank'>blog de Psicobōtica </a> los <a href='https://www.psicobotica.com/blog/' target='_blank'>artículos sobre la depresión</a>. Si sientes que necesitas ayuda con la gestión de las emociones, no dudes en solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p><hr>";
		
		// Call to action (prolexitim NLP):
		results_str += "<p><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'><img style='float:left' src='narrativa_320x236.jpg'></a><strong>¿Quieres saber más sobre tus emociones?</strong><br>&nbsp;<br><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'>Accede aquí al test Prolexitim NLP</a>, un test basado en tu expresión verbal. Te mostraremos unas imágenes que tendrás que describir y analizaremos tus narrativas automáticamente utilizando Inteligencia Artificial.</p>";
		
		document.getElementById("results").innerHTML = results_str;
		document.getElementById("results").style.visibility = "visible";
		document.getElementById("results").style.display = "block";		
	}
	
	return todorespondido; 

}