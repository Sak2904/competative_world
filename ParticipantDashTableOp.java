package back;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ParticipantDashTableOp {

	Connection con;
	PreparedStatement smt;
	ResultSet rs;
	
	public boolean connectivity() throws SQLException{
			
		try {
			
			System.out.println("inside connevtivity");
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
			System.out.println("connection successfully");
			
			return true;
			
		}catch(Exception ex) {
			terminate();
			ex.printStackTrace();
			return false;
		}
	}
	
	public void updateStatus() {
		
		try {
			
			if(connectivity()) {
				
				long millis=System.currentTimeMillis();    
			    // creating a new object of the class Date  
			    java.sql.Date date = new java.sql.Date(millis);       
			    //System.out.println(date);   
			    
		    	
		    	String q = "update competition set status = ? where end_date < ?";
				
				smt = con.prepareStatement(q);
				
				smt.setString(1, "closed");
				smt.setDate(2, date);
				
				int r = smt.executeUpdate();
				System.out.println("true = "+r);
			}	
		}catch(Exception e) {
		    	
		 }
	}
	public ArrayList<Participant> getActCompetitions(String e) {
		
		try {
			
			if(connectivity()) {
			
			
				String q = "select part_compi.cid,cname,start_date,end_date,part_compi.status from competition,part_compi where competition.cid = part_compi.cid and competition.status = ? and email=?";
				smt = con.prepareStatement(q);
				smt.setString(1,"active");
				smt.setString(2,e);
				rs = smt.executeQuery();
				
				ArrayList<Participant> ar = new ArrayList<Participant>();
				
				while(rs.next()) {
					
					Participant obj = new Participant();
					
					obj.setCid(rs.getInt(1));
					obj.setCname(rs.getString(2));
					obj.setStart(rs.getDate(3));
					obj.setEnd(rs.getDate(4));
					obj.setStatus(rs.getString(5));
					
					ar.add(obj);
				}
				
				return ar;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			terminate();
			return null;
		}
		
		return null;
	}
	
	public ArrayList<Participant> getCmplCompetitions(String e) {
		
		try {
			
			if(connectivity()) {
			
			
				String q = "select part_compi.cid,competition.cname,competition.start_date,competition.end_date,competition.status from competition,part_compi where competition.cid = part_compi.cid and competition.status = ? and part_compi.email=?";
				smt = con.prepareStatement(q);
				
				smt.setString(1,"closed");
				smt.setString(2, e);
				rs = smt.executeQuery();
				
				ArrayList<Participant> ar = new ArrayList<Participant>();
				
				while(rs.next()) {
					
					Participant obj = new Participant();
					
					obj.setCid(rs.getInt(1));
					obj.setCname(rs.getString(2));
					obj.setStart(rs.getDate(3));
					obj.setEnd(rs.getDate(4));
					obj.setStatus(rs.getString(5));
					
					ar.add(obj);
				}
				
				return ar;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			terminate();
			return null;
		}
		
		return null;
	}
	
	public void terminate() {
		
		try{
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
