import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/IssueBookServlet")
public class IssueBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
    	response.setContentType("text/plain");
        String empid = request.getParameter("empid");
        String bookid = request.getParameter("bookid");
        String bookname = request.getParameter("bookname");
        String dateofissue = request.getParameter("dateofissue");
        //System.out.println(empid+" "+bookid+" "+bookname+" "+dateofissue);
        String status = Database.checkBookID(bookid);
        System.out.println(status);
        if(status.equalsIgnoreCase("Available")) {
        	if(Database.issueBook(empid, bookid, bookname, dateofissue)) {     
                out.println("Book issued successfully to Employee with ID = "+empid);
            } else {
                out.println("Failed to issue the book.");       
            }
        } else {
        	out.println("Selected Book is not available (i.e It is already issued)");
        }
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
