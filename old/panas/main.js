
var currentTab = 0; // Current tab is set to be the first tab (0)
var PANASItems = new Array(); 


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
	  document.getElementById("ErrorMsg").innerHTML = "<h4 style='color:red'>Por favor, indica en qué grado has sentido esta emoción.</h4>";
      valid = false;
  }
  
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	  
	// Save the value. 
	PANASItems.push(parseInt(radio_value));
	
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
	var edad = document.formpanas.Age.value;
	console.log("Edad: " + edad);
	var email = document.formpanas.Email.value;
	console.log("Email: " + email);
	var privacidad = document.formpanas.Privacidad.checked; 
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

		var puntosAN = 0; // Afecto negativo
		var puntosAP = 0; // Afecto positivo
		
		// Collect and sum all responses (array index = question index - 1)
		puntosAN = PANASItems[1] + PANASItems[3] + PANASItems[5] + PANASItems[6] + PANASItems[7] + PANASItems[10] + PANASItems[12] + PANASItems[14] + PANASItems[17] + PANASItems[19];
		puntosAP = PANASItems[0] + PANASItems[2] + PANASItems[4] + PANASItems[8] + PANASItems[9] + PANASItems[11] + PANASItems[13] + PANASItems[15] + PANASItems[16] + PANASItems[18];
		
		document.getElementById("AN").value = puntosAN;
		document.getElementById("AP").value = puntosAP;
		document.getElementById("input-email").value = email;
		document.getElementById("Code").value = md5(email);		
		
		document.getElementById("thanksMsg").innerHTML = "<h4 style='color:green; text-align:center'>Gracias. Datos recibidos correctamente.</h4>";
		
		results_str = "<p style='text-align:left'>La Escala de Afecto Positivo y Negativo se compone de dos subescalas:<br>" 
		+ "En la subescala de <b>Afecto Positivo</b> has obtenido un total de <u><strong>" + puntosAP + " puntos</strong></u> (mín: 10 ptos; máx: 50 ptos).<br>"
		+ "En la subescala de <b>Afecto Negativo</b> has obtenido un total de <u><strong>" + puntosAN + " puntos</strong></u> (mín: 10 ptos; máx: 50 ptos)." 
		+ "<p style='text-align:left'>Estos resultados indican ";
		
		if (puntosAP > 36) {
			// AP
			results_str += "<b><u>un alto estado emocional positivo</u></b> y ";
		} else {
			results_str += "<b><u>un bajo estado emocional positivo</u></b> y ";
		}
		
		if (puntosAN < 15) {
			// AN
			results_str += "<b><u>un bajo estado emocional negativo</u></b>.</p>";
		} else {
			results_str += "<b><u>un alto estado emocional negativo</u></b>.</p>";
		}
		
		results_str += "<p>Si te preocupa tu estado emocional te recomendamos que contactes con un profesional de la psicología. Puedes solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p>";

		results_str += "<p>Para interpretar estos resultados correctamente, puedes consultar en el blog de Psicobōtica los <a href='https://www.psicobotica.com/blog/' target='_blank'>artículos sobre emociones</a>.</p><hr>";
		
		// Call to action (prolexitim NLP):
		results_str += "<p><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'><img style='float:left' src='narrativa_320x236.jpg'></a><strong>¿Quieres saber más sobre tus emociones?</strong><br>&nbsp;<br><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'>Accede aquí al test Prolexitim NLP</a>, un test basado en tu expresión verbal. Te mostraremos unas imágenes que tendrás que describir y analizaremos tus narrativas automáticamente utilizando Inteligencia Artificial.</p>";
		
		document.getElementById("results").innerHTML = results_str;
		document.getElementById("results").style.visibility = "visible";
		document.getElementById("results").style.display = "block";
	}
	
	return todorespondido; 

}