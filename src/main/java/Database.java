import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Database {

	static String dbUrl = "jdbc:oracle:thin:@//localhost:1521/xe";
    static String dbUser = "system";
    static String dbPassword = "saketh1234";
	private static String NULL; 
     
	 public static boolean validate(String empid, String password){
		 Boolean status = false;
	        try {
	        	
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            String sql = "SELECT * FROM logininfo WHERE emp_id = ? AND password = ?";
	                 PreparedStatement preparedStatement = connection.prepareStatement(sql);
	                 preparedStatement.setString(1, empid);
	                 preparedStatement.setString(2, password);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            status = resultSet.next();
	            } catch (ClassNotFoundException e) {
	                e.printStackTrace();

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            return status;
	    }
	 
	 public static boolean addBook(BookData ob) {
		 Boolean status = false;
		 try {
	        	
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            String sql = "INSERT INTO books VALUES (?, ?, ?, ?, ?)";
	                 PreparedStatement preparedStatement = connection.prepareStatement(sql);
	                 preparedStatement.setString(1, ob.getId());
	                 preparedStatement.setString(2, ob.getTitle());
	                 preparedStatement.setString(3, ob.getAuthorname());
	                 preparedStatement.setString(4, "available");
	                 preparedStatement.setString(5, ob.getGenre());
	            ResultSet resultSet = preparedStatement.executeQuery();
	            status = resultSet.next();
	            } catch (ClassNotFoundException e) {
	                e.printStackTrace();

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            return status;
	 }
	 
	 public static JSONObject retrieveBooks() {
		 JSONObject jsonResponse = new JSONObject();
		 JSONArray booksArray = new JSONArray();
		 try {
	        	
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            String sql = "SELECT bookid, bookname, authorname, status, genre FROM books";
	            PreparedStatement statement = connection.prepareStatement(sql);
	            ResultSet resultSet = statement.executeQuery();
	            
	            while (resultSet.next()) {
	                JSONObject book = new JSONObject();
	                book.put("bookid", resultSet.getString("bookid"));
	                book.put("title", resultSet.getString("bookname"));
	                book.put("authorname", resultSet.getString("authorname"));
	                book.put("status", resultSet.getString("status"));
	                book.put("genre", resultSet.getString("genre"));
	                booksArray.add(book);
	            }
	            connection.close();

	            jsonResponse.put("status", "success");
	            jsonResponse.put("books", booksArray);
	            
		        } catch(Exception e) {
		        	e.printStackTrace();
		        	jsonResponse.put("status", "failure");
		            jsonResponse.put("message", e.getMessage());
	            } //catch (ClassNotFoundException e) {
	              //  e.printStackTrace();

	            ////} catch (SQLException e) {
	            //    e.printStackTrace();
	            //}
		 return jsonResponse;
	 }
	 
	 public static boolean issueBook(String empid,String bookid,String bookname,String dateofissue) {
		 Boolean status = false;
		 try {
	            // Load the JDBC driver
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            // Establish a connection
	            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            String dateofreturn = NULL;
	            // Create the SQL query
	            String sql = "INSERT INTO bookmaster VALUES (?, ?, ?, ?)";
	            String sql2 = "update books set status = ? where bookid = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            PreparedStatement stmt2 = conn.prepareStatement(sql2);
	            stmt.setString(1, bookid);
	            stmt.setString(2, empid);
	            stmt.setString(3, dateofissue);
	            stmt.setString(4, dateofreturn);
	            stmt2.setString(1, "Not Available");
	            stmt2.setString(2, bookid);
	            // Execute the query
	            ResultSet resultSet = stmt.executeQuery();
	            ResultSet resultSet2 = stmt2.executeQuery();
	            status = (resultSet.next()&&resultSet2.next())?(true):(false);
	            conn.close();
	            
	        } catch (SQLException e) {
                e.printStackTrace();
            } catch(ClassNotFoundException e) {
            	e.printStackTrace();;
            }
		 return status;
	 }
	 
	 public static boolean returnBook(String empid,String bookid,String dateofreturn) {
		 Boolean status = false;
		 try {
	            // Load the JDBC driver
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            // Establish a connection
	            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            // Create the SQL query
	            String sql1 = "update bookmaster set dateofreturn = ? where bookid = ? and empid = ?";
	            String sql2 = "update books set status = ? where bookid = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql1);
	            PreparedStatement stmt2 = conn.prepareStatement(sql2);
	            stmt.setString(1, dateofreturn);
	            stmt.setString(2, bookid);
	            stmt.setString(3, empid);	 
	            stmt2.setString(1, "Available");
	            stmt2.setString(2, bookid);
	            // Execute the query
	            ResultSet resultSet = stmt.executeQuery();
	            ResultSet resultSet2 = stmt2.executeQuery();
	            status = (resultSet.next()&&resultSet2.next())?(true):(false);
	            conn.close();
	            
	        } catch (SQLException e) {
                e.printStackTrace();
            } catch(ClassNotFoundException e) {
            	e.printStackTrace();
            }
		 return status;
	 }
	 
	 public static JSONObject retrieveEmpDetails(String empid) {
		 JSONObject jsonResponse = new JSONObject();
		 JSONObject emp = new JSONObject();
		 try {
	        	
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            String sql = "SELECT empid, empname, empdept, phoneno FROM employeedetails where empid = ?";
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, empid);
	            ResultSet resultSet = statement.executeQuery();
	            
	            if(resultSet.next()) {
                    emp.put("empid", resultSet.getString("empid"));
                    emp.put("empname", resultSet.getString("empname"));
                    emp.put("empdept", resultSet.getString("empdept"));
                    emp.put("phoneno", resultSet.getString("phoneno"));
    	            jsonResponse.put("status", "success");
	            } else {
	            	jsonResponse.put("status", "failure");
	            }
	            
	            connection.close();

	            jsonResponse.put("empdetails", emp);
	            
		        } catch(Exception e) {
		        	e.printStackTrace();
		        	jsonResponse.put("status", "failure");
		            jsonResponse.put("message", e.getMessage());
	            } //catch (ClassNotFoundException e) {
	              //  e.printStackTrace();

	            ////} catch (SQLException e) {
	            //    e.printStackTrace();
	            //}
		 return jsonResponse;
	 }
	 
	 public static String checkBookID(String bookid) {
		 String status = "";
		 try {
	            // Load the JDBC driver
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            // Establish a connection
	            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	            // Create the SQL query
	            String sql = "select status from books where bookid = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, bookid);
	            // Execute the query
	            ResultSet resultSet = stmt.executeQuery();
	            
	            if(resultSet.next()) {
	            	status = resultSet.getString("status");
	            	System.out.println(status);
	            }
	            conn.close();
	            
	        } catch (SQLException e) {
                e.printStackTrace();
            } catch(ClassNotFoundException e) {
            	e.printStackTrace();
            }
		 return status;
	 }
	 
}