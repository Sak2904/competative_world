package back;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ParticipantLoginServlet")
public class ParticipantLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      String cid;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e = request.getParameter("email");
		String p = request.getParameter("pass");
		
		//System.out.println("cc = "+cid);
		
		ParticipantTableOperation op = new ParticipantTableOperation();
		
		if(op.validateParticipantLogin(e, p)) {
			
			System.out.println("validation login participnat sucess....");
			HttpSession s = request.getSession();
			s.setAttribute("email", e);
			cid = (String)s.getAttribute("cid");
			System.out.println("cid using session = "+cid);
			// code to Registered for existing Participant......
			
			if(cid != null) {
				
				System.out.println("in side if cid!=null "+(String)request.getParameter("cid"));
				Participant pbj = new Participant();
				
				pbj.setEmail(e);
				op.addPart_compi(pbj, Integer.parseInt(cid));
				s.removeAttribute(cid);
			}
			 
			response.sendRedirect("ParticipantDashboardServlet");
			//System.out.println("inside cid == null");
				
			
		}
		else
			response.sendRedirect("ParticipantLogin.jsp");
	}

}
