<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - Library Management System</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    body{
    background: rgb(232,233,20);
    background: linear-gradient(90deg, rgba(232,233,20,1) 20%, rgba(21,235,233,1) 80%);
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

    <div class="form-container" id="add-book-form">
        <form id="addbook">
            <h2><center>Add Book</center></h2>
            <label for="add-title">Title of Book:</label>
            <input type="text" id="add-title" placeholder="Enter the title of the book">
            <label for="add-author">Author Name:</label>
            <input type="text" id="add-author" placeholder="Enter the name of the Author">
            <!--<textarea rows="2" cols="20" id="add-description" placeholder="Enter the description"></textarea>  -->
            <label for="add-genre">Genre:</label>
            <input type="text" id="add-genre" placeholder="Genre">
            <button type="button" id="add-book-btn">Add Book</button>
        </form>
    </div>
    <script>
        $(document).ready(function () {
      	  $("#add-book-btn").click(function (e) {

      		    e.preventDefault();
      		      const bookData = {
                      title: document.getElementById('add-title').value,
                      authorname: document.getElementById('add-author').value,
                      genre: document.getElementById('add-genre').value
                  };
      		    console.log(bookData.title+" "+bookData.authorname);
      			console.log(" genre = "+bookData.genre);

      		        $.ajax({
      		          type: "POST",
      		          data: JSON.stringify(bookData),
      		          contentType: 'application/json',
      				  url: "AddBookServlet",
      		          success: function (response) {   
      					console.log("Response = "+response); 
      					if (response.status === 'success') {
                            alert('Book added successfully!');
                            location.reload();
                        } else {
                            alert('Failed to add book.');
                        }
      		          },
      		          error: function () {
      		            alert("An error occurred during the login process.");
      		          },
      		        });	   
      		    });
      		});
    </script>
</body>
</html>
