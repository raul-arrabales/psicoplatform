var timer_start = Date.now(); 
var timer_stop = Date.now(); 
var elapsed_time = 0;

function resetTimer() {
	timer_start = Date.now(); 
	timer_stop = timer_start ; 
	timer_lap = 0; 
} 

function startTimer(){
	timer_start = Date.now(); 
}

function stopTimer(){
	timer_stop = Date.now(); 
}

function getElapsedTime(){
	return timer_stop - timer_start; 
}

function getCurrentMillis(){
	return Date.now();
}
