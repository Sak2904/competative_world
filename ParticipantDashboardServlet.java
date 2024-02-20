package back;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ParticipantDashboardServlet")
public class ParticipantDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		String e = (String)s.getAttribute("email");
		System.out.println("participantSDashboardServlet email = "+e);
		
		ParticipantDashTableOp ob = new ParticipantDashTableOp();
		
		ArrayList<Participant> ar = ob.getActCompetitions(e);
		ArrayList<Participant> cr = ob.getCmplCompetitions(e);
		
		if(ar == null) {
			
			response.sendRedirect("ParticipantLogin.jsp");
		}
		else {
				request.setAttribute("ar", ar);
				request.setAttribute("cr", cr);
				RequestDispatcher rd = request.getRequestDispatcher("ParticipantDashboard.jsp");
				rd.forward(request,response);			
		}
	}

}
