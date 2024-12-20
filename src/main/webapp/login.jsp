<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Library Management System</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    
    body {
    font-family:inherit;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    background-size: cover;
}

nav {
    background-color: #333;
    color: white;
    display: flex;
    align-items: center;
    padding: 10px;
}

nav .logo {
    height: 50px;
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
    flex-grow: 1;
    justify-content: flex-end;
}

nav ul li {
    margin: 0 15px;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-weight: bold;
}

nav ul li a:hover {
    text-decoration: underline;
}

.welcome-container {
    text-align: center;
    padding: 50px 20px;
}

.features {
    margin: 30px 0;
}

.features ul {
    list-style-type: none;
    padding: 0;
}

.features ul li {
    background: #ddd;
    margin: 10px 0;
    padding: 10px;
    border-radius: 5px;
}

.cta-buttons {
    margin: 30px 0;
}

.cta-buttons .btn {
    background-color: #333;
    color: white;
    padding: 10px 20px;
    margin: 10px;
    text-decoration: none;
    border-radius: 5px;
    display: inline-block;
}

.cta-buttons .btn:hover {
    background-color: #555;
}

footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    bottom: 0;
    width: 100%;
}

    </style>
</head>
<body>
    <nav>
        <img src="css/vsplogo.jpg" alt="Library Logo" class="logo">
        <ul class="nav-links">
            <li><a href="index.jsp">Log Out</a></li>
        </ul>
    </nav>
    <div class="welcome-container">
        <h1>Welcome to the Library Management System</h1>
        <p>Your one-stop destination for managing all your library needs.</p>
        <div class="features">
            <h2>Features</h2>
            <ul>
                <li>Browse and search our extensive collection of books.</li>
                <li>Issue and return books with ease.</li>
                <li>Manage your library account online.</li>
                <li>Stay updated with the latest additions to our collection.</li>
            </ul>
        </div>
        <div class="cta-buttons">
            <a href="books.jsp" class="btn">Explore Books</a>
            <a href="issuebook.jsp" class="btn">Issue a Book</a>
            <a href="returnbook.jsp" class="btn">Return a Book</a>
            <a href="addbook.jsp" class="btn">Add a Book</a>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </footer>
    
</body>
</html>