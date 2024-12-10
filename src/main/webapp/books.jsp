<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books - Library Management System</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            background: rgb(232,233,20);
            background: linear-gradient(90deg, rgba(232,233,20,1) 20%, rgba(21,235,233,1) 80%);
            font-family: Arial, sans-serif;
        }
        td{
            color: black;
        }
    </style>
</head>
<body>
    <nav>
        <img src="css/vsplogo.jpg" alt="Visakhapatnam Steel Plant">
        <div class="logo"></div>
        <ul class="nav-links">
            <li><a href="login.jsp">Home</a></li>
            <li><a href="books.jsp">Books</a></li>
            <li><a href="issuebook.jsp">Issue Book</a></li>
            <li><a href="returnbook.jsp">Return Book</a></li>
            <li><a href="addbook.jsp">Add Book</a></li>
            <li><a href="index.jsp">Log Out</a></li>
        </ul>
    </nav>
        <div class="book-list" id="book-list">
        <h2>Book List</h2>
        <!-- <label for="category">Select Category:</label>
        <select id="category">
            <option value="All">All</option>
            <option value="Genre1">Genre1</option>
            <option value="Genre2">Genre2</option>
        </select> -->
        <!-- <div class="search-bar">
            <select id="search-category">
                <option value="title">Title</option>
                <option value="author">Author</option>
                <option value="genre">Genre</option>
                <option value="everything">ALL</option>
            </select>
            <input type="text" id="search-input" placeholder="Search for books, authors, or genres...">
            <button type="button" id="search-btn">Search</button>
        </div>-->
        
        <label for="category">Select Category:</label>
        <select id="category">
            <option value="All">All</option>
            <option value="programming">Programming</option>
            <option value="novels">Novels</option>
        </select>
        
        <table id="book-list-table">
            <thead id="thead">
                <tr>
                    <th>BookId</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
        </table>
    </div>
    <script>
 // Function to retrieve data from the database
    function retrieveData() {
        $.ajax({
            type: "POST",
            url: "BooksServlet", // The servlet or endpoint to retrieve data
            success: function (response) {
                console.log("Data retrieved successfully:", response);
                // Process the response data here
                if(response.status === 'success'){
                	displayData(response.books);
                } else{
                	console.log(response.message);
                }
            },
            error: function () {
                console.error("An error occurred while retrieving data.");
            }
        });
    }
    function displayData(books){
    	const bookTableBody = document.querySelector("#book-list-table tbody");
        bookTableBody.innerHTML = '';
        if (books.length > 0) {
            books.forEach(book => {
                const row = document.createElement("tr");

                const idCell = document.createElement("td");
                idCell.textContent = book.bookid;
                row.appendChild(idCell);
                
                const titleCell = document.createElement("td");
                titleCell.textContent = book.title;
                row.appendChild(titleCell);

                const authorCell = document.createElement("td");
                authorCell.textContent = book.authorname;
                row.appendChild(authorCell);

                const genreCell = document.createElement("td");
                genreCell.textContent = book.genre;
                row.appendChild(genreCell);

                const statusCell = document.createElement("td");
                statusCell.textContent = book.status;
                row.appendChild(statusCell);

                bookTableBody.appendChild(row);
            });
        } else {
            const noBookRow = document.createElement('tr');
            const noBookCell = document.createElement('td');
            noBookCell.textContent = 'No book found.';
            noBookCell.colSpan = 4;
            noBookCell.classList.add('no-book');
            noBookRow.appendChild(noBookCell);
            bookTableBody.appendChild(noBookRow);
        }

         
    }
    // Call the function to retrieve data when the page is loaded
    retrieveData();
    
    </script>
</body>
</html>
