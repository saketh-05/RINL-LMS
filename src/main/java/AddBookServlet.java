import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.util.UUID;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	    @Override
	    public void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	    	response.setContentType("application/json");
	        PrintWriter out = response.getWriter();

	        StringBuilder sb = new StringBuilder();
	        try (BufferedReader reader = request.getReader()) {
	            String line;
	            while ((line = reader.readLine()) != null) {
	                sb.append(line);
	            }
	        }

	        JSONParser parser = new JSONParser();
	        BookData ob = new BookData();
	        try {
	        	String bookId = AddBookServlet.generateBookId().substring(0,5);
	            JSONObject json = (JSONObject) parser.parse(sb.toString());
	            ob.setTitle((String) json.get("title"));
	            ob.setAuthorname((String) json.get("authorname"));
	            ob.setGenre((String) json.get("genre"));
	            ob.setId(bookId);
	            
	            if(Database.addBook(ob)) {
	            	 out.write("{\"status\":\"success\"}");
	            } else {
	            	 out.write("{\"status\":\"error\"}");
	            }
	        } catch (ParseException e) {
	            e.printStackTrace();
	            out.write("{\"status\":\"error\", \"message\":\"Invalid JSON format\"}");
	        }
	    }
	    
	    public static String generateBookId() {
	        return UUID.randomUUID().toString();
	    }

	    @Override
	    protected void doOptions(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Add CORS headers
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setStatus(HttpServletResponse.SC_OK);
	    }
}
