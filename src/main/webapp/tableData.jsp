<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <% String table = request.getParameter("tablename").trim();
    if(table.length() > 0){ Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","saketh1234");
    if (con != null) { 
		System.out.println("Connected to database successfully!"); 
	} 
	else { System.out.println("Database connection failed!"); } 
	String Query = "SELECT * FROM "+table; 
	PreparedStatement ps = con.prepareStatement(Query); 
	ResultSet rs = ps.executeQuery();
    System.out.println("going to loop"); %>
    <table>
      <tr>
        <td>id</td>
        <td>name</td>
        <td>branch</td>
      </tr>
      <% while(rs.next()){ String id = rs.getString("id"); String name =
      rs.getString("name"); String branch = rs.getString("branch");
      System.out.println(id+name+branch); %>
      <tr>
        <td><% out.println(id); %></td>
        <td><% out.println(name); %></td>
        <td><% out.println(branch); %></td>
      </tr>
      <% } %>
    </table>
    <% } else { out.println("Table name is empty");
    response.sendRedirect("tableName.html"); } %>
  </body>
</html>
