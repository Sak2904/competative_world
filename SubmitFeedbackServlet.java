package back;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*
;

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s = request.getSession();
		
		String cid =(String) s.getAttribute("cid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String des = request.getParameter("comment");
		
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			//out.println("Druver found");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
			//out.println("connected");
			
			String q = "insert into feedback values(?,?,?,?)";
			
			PreparedStatement smt = c.prepareStatement(q);
			
			smt.setInt(1,Integer.parseInt(cid));
			smt.setString(2,name);
			smt.setString(3,email);
			smt.setString(4,des);
			
			smt.executeUpdate();
			c.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		response.sendRedirect("ParticipantDashboardServlet");
		
	}
	
}
