import java.io.IOException;
import java.io.PrintWriter;
import org.json.simple.JSONObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BooksServlet")
public class BooksServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	    @Override
	    public void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	    	//response.setHeader("X-Content-Type-Options", "nosniff");
	    	response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
            JSONObject job = Database.retrieveBooks();
            out.print(job.toString());
            out.flush();
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