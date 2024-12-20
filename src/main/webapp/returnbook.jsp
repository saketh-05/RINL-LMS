<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Book - Library Management System</title>
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

    <div class="form-container" id="return-book-form">
        <form id="returnBookForm">
        <h2><center>Return Book</center></h2>
        <label for="empid">Employee ID:</label>
        <input type="text" id="empid" name="empid"><br>
        <button type="button" id="getEmpDetails-btn">Get Employee Details</button>
        <div id="emp-details"></div>
        <label for="bookid">Book ID:</label>
        <input type="text" id="bookid" name="bookid"><br>
        <label for="return-date">Return Date:</label>
        <input type="date" id="return-date" required>
        <button type="button" id="returnBookButton">Return Book</button>
        </form>

    </div>

    <div id="response"></div>
    
    <script>
    $(document).ready(function() {
        	$("#getEmpDetails-btn").on('click',function(){
        		var empid = $('#empid').val();
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
        	
        $("#returnBookButton").click(function() {
            var empid = $('#empid').val();
            var bookid = $('#bookid').val();
            var dateofreturn = $('#return-date').val();
            //console.log(empid+" "+bookid+" "+dateofreturn);
            $.ajax({
                type: "POST",
                url: "ReturnBookServlet",
                data: {
                    empid: empid,
                    bookid: bookid,
                    dateofreturn: dateofreturn
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
