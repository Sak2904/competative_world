package back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/JudgeEvaluateSubServlet")
public class JudgeEvaluateSubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		String pid = request.getParameter("pid");
		int cid = Integer.parseInt(request.getParameter("cid"));
		String ss = request.getParameter("point");
		HttpSession s = request.getSession();
		String jid = (String)s.getAttribute("jid");
		
		PrintWriter out = response.getWriter();
		response.setContentType("html");
		
		/*out.println("pid = "+pid);
		out.println("jid = "+jid);
		out.println("cid = "+cid);
		out.println("ss = "+ss);
		*/
		ResultTableDBop obj = new ResultTableDBop();
		
		if(obj.insertPoints(pid,cid,jid,ss)) 
			response.sendRedirect("photo_c.jsp?cid="+cid);
			//out.println("<html><h1>Already Evaluted...</h1></html>");
		else {
			out.println("<html><h1>Already Evaluted...</h1></html>");
		}
	}
}
