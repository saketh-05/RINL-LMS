<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Book - Library Management System</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
    body{
    background: rgb(232,233,20);
    background: linear-gradient(90deg, rgba(232,233,20,1) 20%, rgba(21,235,233,1) 80%);
    }
    </style>
    <!--  <style>
.form-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 80vh;
}

form {
    display: flex;
    flex-direction: column;
    gap:10px;
    width: 300px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    margin-bottom: 5px;
}
    
    </style>-->
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
            <li><a href="index.jsp">Log Out</a></li>        </ul>
    </nav>

    <div class="form-container" id="issue-book-form">
        <form id="Issuebook">
            <h2><center>Issue Book</center></h2>
            <label for="add-id">Employee id:</label>
            <input type="number" id="add-id" placeholder="Enter the Employee Id">
            <button type="button" id="getEmpDetails-btn">Get Employee Details</button>
            <div id="emp-details"></div>
            <label for="add-bookid">Book ID:</label>
            <input type="text" id="add-bookid" placeholder="Enter the ID of the Book">
            <label for="add-title">Book Name:</label>
            <input type="text" id="add-title" placeholder="Enter the name of the Book">
            <label for="issue-date">Issue Date:</label>
            <input type="date" id="issue-date" required>
            <button type="button" id="issue-book-btn">Issue Book</button>
        </form>
    </div>
    
    <script>
    $(document).ready(function() {
    	$("#getEmpDetails-btn").on('click',function(){
    		var empid = $('#add-id').val();
    		console.log(empid);
    		$.ajax({
    			type: "POST",
    			url: "EmployeeDetails",
    			data: {
    				empid: empid
    			},
    			success: function(response) {
                	console.log(response);
                	if(response.status === 'success'){
                		displayEmpDetails(response.empdetails);
                	} else{
                		alert("Employee Details not found! Please Enter correct Employee ID...");
                	}
    			},
                error: function(xhr, status, error) {
                    alert("An error occurred: " + error);
                }
    		});
    	});
    	
    	function displayEmpDetails(response){
    		$("#emp-details").html(
                  "Employee ID: " + (response.empid) + 
                 "<br>Employee Name: " + (response.empname) + 
                  "<br>Employee Department: " + (response.empdept) + 
                  "<br>Employee PhoneNo: " + (response.phoneno)
              );
    	}
    	
        $("#issue-book-btn").click(function() {
            var empid = $('#add-id').val();
            var bookid = $('#add-bookid').val();
            var bookname = $('#add-title').val();
            var dateofissue = $('#issue-date').val();
            //console.log(empid+" "+bookid+" "+bookname+" "+dateofissue);
            $.ajax({
                type: "POST",
                url: "IssueBookServlet",
                data: {
                    empid: empid,
                    bookid: bookid,
                    bookname: bookname,
                    dateofissue: dateofissue
                },
                success: function(response) {
                	//console.log(response);
                    alert(response);
                },
                error: function(xhr, status, error) {
                    alert("An error occurred: " + error);
                }
            });
        });
    });
    </script>
</body>
</html>
