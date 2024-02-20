package back;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginValidationServlet")
public class LoginValidationServlet extends HttpServlet {
	
	Organizer obj; 
	Judge pbj;
	LoginTableOperations lto;
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String pid = request.getParameter("judgeEmailId");
		String pps = request.getParameter("judgePassword");
		
		System.out.println("pemail and pass = "+pid);
		String oid = request.getParameter("adminEmailId");
		String ops = request.getParameter("adminPassword");
		
		HttpSession sess = request.getSession();
		// this code is used to validate the participant.wheather email and password is correct or not
	
		if( pid!=null ) {
		
			pbj = new Judge();
			lto = new LoginTableOperations();
			
			pbj.setEmail(pid);
			pbj.setPass(pps);
			
			sess.setAttribute("jid",pid);
			
			try {
				if(lto.validateJudge(pbj)) {
				
					response.setContentType("text/html");
					response.sendRedirect("JudgeDashboard.jsp");
				}
				else {
					out.println("<html><head><h1><b>Not Found</b></h1></head></html>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		//this code is used to validate the organizer.wheather email and password is correct or not
		 
		if(oid != null) {
			
			obj = new Organizer();
			lto = new LoginTableOperations();
			
			obj.setEmail(oid);
			obj.setPass(ops);
			sess.setAttribute("oid",oid);
			
			try {
				
				if(lto.validateOrganizer(obj)) {
					
					RequestDispatcher rd = request.getRequestDispatcher("OrganizerListServlet");
					rd.forward(request,response);	
				}
				else 
					out.println("<html><head><h1><b>Not Found</b></h1></head></html>");
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

}
