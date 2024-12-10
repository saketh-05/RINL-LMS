import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.*;

@WebServlet("LoginServlet")
public class LoginServlet extends HttpServlet {   

	private static final long serialVersionUID = 1L;
	PrintWriter out;
    String empid, password;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
                response.setContentType("text/plain");
                out = response.getWriter();
                empid = request.getParameter("empid");
                password = request.getParameter("password");
            if(Database.validate(empid,password)){
               out.print("success");
            }  else{
               out.print("failure");
            }

            out.close();
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