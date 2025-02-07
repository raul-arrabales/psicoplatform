
var currentTab = 0; // Current tab is set to be the first tab (0)
var NLPItems = new Array();  // Array of texts from each image. 
var minTextLength = 80;  // Min length of descriptions for validation. 


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
  var text_value = "";
  
  // Get current text area response
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("textarea");

  // Get text
  text_value = y[0].value;
  console.log("Recogido: " + text_value); 
  
  // If the text is too short
  if (text_value.length < minTextLength) {
	  document.getElementById("ErrorMsg").innerHTML = "<h4 style='color:red'>Por favor, escribe una historia o narración un poco más larga.</h4>";
      valid = false;
  }
  
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
	  
	// Save the value. 
	NLPItems.push(text_value);
	
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

/* Checks everything's ready for submission */
function check() {
	
	var genero_select = document.getElementById("Gender");
	var genero = genero_select.options[genero_select.selectedIndex].value;
	console.log("Genero:" + genero);
	var edad = document.formnlp.Age.value;
	console.log("Edad: " + edad);
	var email = document.formnlp.Email.value;
	console.log("Email: " + email);
	var privacidad = document.formnlp.Privacidad.checked; 
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
		
		document.getElementById("storytat1text").value = NLPItems[0];
		// console.log("XX: " + NLPItems[0]);
		document.getElementById("storytat9VHtext").value = NLPItems[1];
		document.getElementById("storytat11text").value = NLPItems[2];
		document.getElementById("storytat13HMtext").value = NLPItems[3];
		document.getElementById("input-email").value = email;
		document.getElementById("Code").value = md5(email);		
		
		document.getElementById("thanksMsg").innerHTML = "<h4 style='color:green; text-align:center'>Gracias. Datos recibidos correctamente.</h4>";

		results_str = "<p style='text-align:center'>Recibirás los resultados de esta prueba por correo electrónico. Necesitamos ejecutar algoritmos complejos de procesamiento del lenguaje y eso puede llevarnos algún tiempo.</p>";
		
		// Call to action (psy attention):
		results_str += "<p>Para comprender en detalle el funcionamiento de la prueba que has realizado, puedes consultar en el blog de Psicobotica los <a href='https://www.psicobotica.com/blog/' target='_blank'>artículos sobre procesamiento del lenguaje</a>. Si sientes que necesitas ayuda con la gestión de las emociones, no dudes en solicitarnos una <a href='https://www.psicobotica.com/atencion-psicologica-online/' target='_blank'>entrevista online gratuita</a>.</p><hr>";
		
		// Call to action (other tests):
		results_str += "<p><a href='https://www.psicobotica.com/atencion-psicologica-online/test-psicologicos/' target='_blank'><img style='float:left' src='alexitimia_320x236.jpg'></a><strong>¿Quieres conocerte un poco mejor?</strong><br>&nbsp;<br><a href='https://www.psicobotica.com/atencion-psicologica-online/test-psicologicos/' target='_blank'>Accede aquí al centro de Tests Psicológicos de Psicobōtica</a>, donde puedes obtener una evaluación al instante sobre diferentes aspectos o problemas psicológicos.</p>";
		
		document.getElementById("results").innerHTML = results_str;
		document.getElementById("results").style.visibility = "visible";
		document.getElementById("results").style.display = "block";
	}
	
	return todorespondido; 

} 











