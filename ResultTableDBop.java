package back;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResultTableDBop {

	Connection con;
	ResultSet rs = null;
	PreparedStatement smt = null;
	
	public boolean cont(){
		
		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("driver Found");
			
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
				System.out.println("Connected...");
				return true;
		
		}catch(Exception e) {
			e.printStackTrace();
			try {
				con.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}
	}
	
	public boolean insertPoints(String pid,int cid,String jid,String points) {
		
		String q = "insert into result(pid,cid,jid,points,evaluated) values(?,?,?,?,?)";
		
		if(cont()) {
			
			try {
				smt = con.prepareStatement(q);
				
				smt.setString(1,pid);
				smt.setInt(2,cid);
				smt.setString(3,jid);
				smt.setString(4,points);
				smt.setString(5,"yes");
				
				smt.executeUpdate();
				
				return true;
				
			}catch(Exception ex) {
				ex.printStackTrace();
				return false;
			}
		}
		
		return false;
		
	}
}
