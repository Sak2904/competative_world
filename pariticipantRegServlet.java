package back;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/pariticipantRegServlet")
public class pariticipantRegServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1;
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String f = request.getParameter("name");
		String e = request.getParameter("email");
		long m = Long.parseLong(request.getParameter("mob"));
		String pass = request.getParameter("pass1");
		int cid = Integer.parseInt(request.getParameter("cid"));
		System.out.println(cid);
		
		Participant obj = new Participant();
		
		obj.setFname(f);
		obj.setEmail(e);
		obj.setPhone(m);
		obj.setPass(pass);
		
		//System.out.println("fname , lname , email = "+" "+obj.getFname()+" "+" "+obj.getLname()+" "+obj.getEmail());
		ParticipantTableOperation pbj = new ParticipantTableOperation();
		
		try{
			 boolean d = pbj.insertParticipant(obj);
			 
			 if(d) {
				 	boolean dd = pbj.addPart_compi(obj,cid);
				 	if(dd) {
				 		
				 		response.setContentType("text/html");  
					 	out.println("<script type=\"text/javascript\">");  
					 	out.println("alert('Sucessfull Registered..!');");  
					 	out.println("</script>");
				 		response.sendRedirect("ParticipantLogin.jsp");
				 	}
			 }
			 else
			 {  
			 	response.setContentType("text/html");  
			 	out.println("<script type=\"text/javascript\">");  
			 	out.println("alert('Already User...!');");  
			 	out.println("</script>");
			 	response.sendRedirect("ParticipantLogin.jsp");
			 }
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
}