<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LIBRARY MANAGEMENT SYSTEM</title>
    <link rel="stylesheet" href="css/index.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <div id="lp">
      <h1>LOGIN PAGE</h1>
      <form id="loginForm">
        <label for="empid">Employee ID:</label>
        <input
          type="text"
          id="empid"
          name="empid"
          placeholder="Enter Employee ID"
        /><br />

        <label for="password">Password:</label>
        <input
          type="password"
          id="password"
          name="password"
          placeholder="Enter Password"
        /><br /><br />

        <!-- <label> <input type="checkbox" name="remember" /> Remember Me </label
        ><br /><br /> -->

        <!-- <a href="forget.html">Forget Password?</a><br /><br /> -->
        <button type="submit" id="login" value="login">LOGIN</button>
        <br /><br />
        <!-- <button type="submit" id="sign">SIGNUP</button> -->
      </form>
    </div>
    <script>
    $(document).ready(function () {
    	  $("#login").click(function (e) {

    		    e.preventDefault();

    		    const empid = $("#empid").val();
    		    const password = $("#password").val();
    		    console.log(empid);
    			console.log(" pass = "+password);
    		    if (empid.length === 6) {
    		      var firstLetter = empid[0];
    		      if (firstLetter == 1) {
    				//alert("MOOOSHA!");
    		        $.ajax({
    		          type: "POST",
    		          data: {
    		            empid: empid,
    		            password: password,
    		          },
    				  url: "LoginServlet",
    		          success: function (response) {   
    					console.log("Response = "+response); 
    					  if(response.includes("success")){
    						  alert("Login Successfull");
    						window.location.href = "login.jsp";
    					  } else{
    						alert("Login failed");
    					  }
    		          },
    		          error: function () {
    		            alert("An error occurred during the login process.");
    		          },
    		        });
    		      } else {
    		        alert("Please Enter correct Employee ID!");
    		        return;
    		      }
    		    } else {
    		      alert("Entered Employee ID is incorrect. Please try again!");
    		      return;
    		    }
    		  });
    		});
</script>
  </body>
</html>
