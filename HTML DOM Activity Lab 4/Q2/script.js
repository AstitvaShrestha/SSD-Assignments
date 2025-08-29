// Get reference to the "Add Task" button
let button = document.getElementById('add-task-btn');

// Add a click event listener to the button
button.addEventListener('click', () => {
    
    // Get reference to the input field
    let input = document.getElementById('task-input');  
    
    // Get reference to the task list (ul element)
    let ul = document.getElementById('task-list');   
    
    // Check if input field is not empty
    if(input.value != ''){
        // Create a new list item <li>
        let li = document.createElement('li');
        
        // Set the text of <li> to the input value
        li.textContent = input.value;
        
        // Add the new <li> to the task list
        ul.appendChild(li);
        
        // Clear the input field after adding task
        input.value = '';
    }
});
