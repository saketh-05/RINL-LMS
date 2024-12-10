import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONObject;

import jakarta.servlet.annotation.*;

@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet {   

	private static final long serialVersionUID = 1L;
	PrintWriter out;
    String empid;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
                response.setContentType("application/json");
                out = response.getWriter();
                empid = request.getParameter("empid");
                System.out.println(empid);
            JSONObject job = Database.retrieveEmpDetails(empid);
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