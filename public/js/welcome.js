var today = new Date(); // create a new date object
var hourNow = today.getHours(); // Find the current hour
var greeting;

// Display the appropiate greeting based on current time
if (hourNow > 18) {
	greeting = 'Good evening!';
} else if (hourNow > 12) {
	greeting = 'Good afternoon!';
} else if (hourNow > 0) {
	greeting = 'Good morning!';
} else {
	greeting = 'Welcome!';
}

document.write('<h3>' + greeting + '</h3>')