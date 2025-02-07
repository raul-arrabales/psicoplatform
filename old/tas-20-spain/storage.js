
function CheckBrowserStorage() {
	if (typeof(Storage) !== "undefined") {
		alert("Storage OK");
	} else {
		alert("Sorry! No Web Storage support.");
	}
}

function GetAllStorage() {

    var archive = "",
        keys = Object.keys(localStorage),
        i = 0, key;

    for (; key = keys[i]; i++) {
		if ( key.startsWith("tas20_")) {
			archive += localStorage.getItem(key) + "\n";
		}
        
    }

    return archive;
}
