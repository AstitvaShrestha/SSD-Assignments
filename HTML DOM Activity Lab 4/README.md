# HTML Lab 4 Activity

This project contains **two small web applications** built with **HTML, CSS, and JavaScript**:

1. **Dynamic Greeting Card**  
2. **Simple To-Do List**

---


## 💡 How to Run
1. Clone or download the project folder.  
2. Open `index.html` in your browser.  
3. Try clicking **Personalize** in the Greeting Card.  
4. Try adding tasks in the To-Do List.  

---

## 🚀 Task 1: Dynamic Greeting Card

### 📌 Features
- Displays a greeting message to the user.  
- User can **personalize** the greeting by entering their name via a prompt.  
- Updates:
  - Greeting text changes to `"Hello, [User's Name]!"`.  
  - A welcoming message is shown.  
  - The card background color changes.  
  - Greeting text color changes.  

### 🛠️ Tech Used
- **HTML** → Structure (`div`, `h2`, `p`, `button`)  
- **CSS** → Styling & layout  
- **JavaScript** → Event handling & DOM manipulation  

### 📷 Example Flow
1. Default text → `"Hello, Guest!"`  
2. Click **Personalize** → Prompt asks for your name  
3. After input → `"Hello, Alice!"` and background changes  

---

## 🚀 Task 2: Simple To-Do List

### 📌 Features
- Input field to type a task.  
- Button to add the task.  
- New tasks appear in a list (`<ul>`).  
- Input field clears after adding a task.  
- Validation → If input is empty, no task is added.  

### 🛠️ Tech Used
- **HTML** → Input field, button, unordered list  
- **CSS** → Button styling & layout adjustments  
- **JavaScript** → Event handling, list item creation, validation  

### 📷 Example Flow
1. Enter `"Buy groceries"` → Click **Add Task**  
2. `"Buy groceries"` appears in the list  
3. Input clears automatically  
4. If input is empty → Nothing happens  

---

## 📂 Project Structure

project-folder/
│
├── Q1/                  # Task 1: Greeting Card
│   ├── index.html       # HTML structure
│   ├── script.js        # JavaScript logic
│   └── style.css        # Styling
│
├── Q2/                  # Task 2: To-Do List
│   ├── index.html       # HTML structure
│   ├── script.js        # JavaScript logic
│   └── style.css        # Styling
│
└── README.md            # Documentation (this file)


