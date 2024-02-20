package back;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrganizerListServlet")
public class OrganizerListServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		OrganizerListDB obj = new OrganizerListDB();
		
		request.setAttribute("compiAct",obj.activeCompiList());
		request.setAttribute("compiCls",obj.closedCompiList());
		request.setAttribute("rec", obj.judgeList());
		
		RequestDispatcher rd = request.getRequestDispatcher("OrganizerDashboard.jsp");
		rd.forward(request, response);
	
	}

}
