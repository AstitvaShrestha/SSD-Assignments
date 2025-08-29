// Get reference to the "Personalize" button
let button = document.getElementById('personalize-btn');

// Add a click event listener to the button
button.addEventListener('click', () => {
    // Ask the user to enter their name
    let name = prompt("Please enter your name");;

    if(name == null || name.trim() == ""){
        alert("You must enter a name!");
        return;  // stop further execution
    }

    // Get references to elements inside the card
    let h2 = document.getElementById('greeting-text');  // heading
    let p = document.getElementById('card-message');    // paragraph
    let div = document.getElementById('card');          // card container

    // Update greeting text with user's name
    h2.textContent = "Hello, " + name + "!";

    // Update message below greeting
    p.innerHTML = 'Welcome, <b>' + name + '</b> to my website!';

    // Change the card's background color with transparency
    div.style.backgroundColor = "rgba(0, 120, 215, 0.5)"; // semi-transparent blue

    // Change the greeting text color
    h2.style.color = "green";
    
});
