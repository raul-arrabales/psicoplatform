
var currentTab = 0; // Current tab is set to be the first tab (0)
var Tas20Items = new Array(); 


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
  var radio_value = 0;
  
  // Get current radio button response
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");

  // Get radio buttons state
  for(var i = 0; i < y.length; i++){
    if(y[i].checked){
        radio_value = y[i].value;
    }
  }
  
  // If the field is zero
  if (radio_value == 0) {
      // add an "invalid" class to the field:
      // Not for radio buttons... y[i].className += " invalid";
      // and set the current valid status to false:
	  document.getElementById("ErrorMsg").innerHTML = "<h4 style='color:red'>Por favor, indica en qué grado esta afirmación se ajusta a tu modo de ser habitual.</h4>";
      valid = false;
  }
  
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	  
	// Save the value. 
	Tas20Items.push(parseInt(radio_value));
	
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
	var edad = document.formtas20.Age.value;
	console.log("Edad: " + edad);
	var email = document.formtas20.Email.value;
	console.log("Email: " + email);
	var privacidad = document.formtas20.Privacidad.checked; 
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

		var puntosF1 = 0;
		// respuestaF1_1 + respuestaF1_3 + respuestaF1_6 + respuestaF1_7 + respuestaF1_9 + respuestaF1_13 + respuestaF1_14;
		puntosF1 = Tas20Items[0] + Tas20Items[2] + Tas20Items[5] + Tas20Items[6] + Tas20Items[8] + Tas20Items[12] + Tas20Items[13];

		var puntosF2 = 0;
		// respuestaF2_2 + respuestaF2_4 + respuestaF2_11 + respuestaF2_12 + respuestaF2_17;
		puntosF2 = Tas20Items[1] + Tas20Items[3] + Tas20Items[10] + Tas20Items[11] + Tas20Items[16];

		var puntosF3 = 0;
		// respuestaF3_5 + respuestaF3_8 + respuestaF3_10 + respuestaF3_15 + respuestaF3_16 + respuestaF3_18 + respuestaF3_19 + respuestaF3_20;		
		puntosF3 = Tas20Items[4] + Tas20Items[7] + Tas20Items[9] + Tas20Items[14] + Tas20Items[15] + Tas20Items[17] + Tas20Items[18] + Tas20Items[19];

		var total = puntosF1 + puntosF2 + puntosF3;
		
		// Se almacena la puntuación total en una variable:
		puntos = [total, puntosF1, puntosF2, puntosF3];

		document.getElementById("TAS20").value = puntos[0];
		document.getElementById("F1").value = puntos[1];
		document.getElementById("F2").value = puntos[2];
		document.getElementById("F3").value = puntos[3];
		document.getElementById("input-email").value = email;
		document.getElementById("Code").value = md5(email);		
		
		document.getElementById("thanksMsg").innerHTML = "<h4 style='color:green; text-align:center'>Gracias. Datos recibidos correctamente.</h4>";
		
		results_str = "<p style='text-align:left'>Has obtenido un total de <u><strong>" + puntos[0] + " puntos</strong></u> en el cuestionario TAS-20.<br>&nbsp;<br>" 
		+ "La puntuación del TAS-20 corresponde a estos tres factores:<br>"
		+ "<strong>F1</strong> (Confusión de la emoción con sensaciones físicas): " + puntos[1] + ".<br>"
		+ "<strong>F2</strong> (Dificultad para comunicar sentimientos): " + puntos[2] + ".<br>"
		+ "<strong>F3</strong> (Pensamiento operatorio): " + puntos[3] + ".</p>" 
		+ "<p style='text-align:left'>Estos resultados indican ";
		
		if (total >= 61) {
			// Clara alexitimia
			results_str += "<b><u>un alto grado de alexitimia</u></b>.</p>";
		} else if (total <= 51) {
			// Ausencia de alexitimia
			results_str += "<b><u>ausencia de alexitimia</u></b>.</p>";
		} else {
			// Posible alexitimia
			results_str += "<b><u>la posible presencia de alexitimia</u></b>.</p>";
		}
		
		// Call to action (psy attention):
		results_str += "<p>Para interpretar estos resultados correctamente, puedes consultar en el blog de Psicobōtica los <a href='https://www.psicobotica.com/blog/' target='_blank'>artículos sobre alexitimia</a>. Si sientes que necesitas ayuda con la gestión de las emociones, no dudes en solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p><hr>";
		
		// Call to action (prolexitim NLP):
		results_str += "<p><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'><img style='float:left' src='narrativa_320x236.jpg'></a><strong>¿Quieres saber más sobre tus emociones?</strong><br>&nbsp;<br><a href='https://psicobotica.com/prolexitim/nlp/index.html' target='_blank'>Accede aquí al test Prolexitim NLP</a>, un test basado en tu expresión verbal. Te mostraremos unas imágenes que tendrás que describir y analizaremos tus narrativas automáticamente utilizando Inteligencia Artificial.</p>";
		
		document.getElementById("results").innerHTML = results_str;
		document.getElementById("results").style.visibility = "visible";
		document.getElementById("results").style.display = "block";
	}
	
	return todorespondido; 

}