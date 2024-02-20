package back;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;

public class OrganizerListDB {

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
	
	// code to update competition status as per todays date
	
	public void updateCompiStatus() {
		
		if(cont()) {
			
			long millis=System.currentTimeMillis();    
		    // creating a new object of the class Date  
		    java.sql.Date date = new java.sql.Date(millis);       
		    //System.out.println(date);   
		    
		    try {
		    	
		    	String q = "update competition set status = ? where end_date < ?";
				
				smt = con.prepareStatement(q);
				
				smt.setString(1, "closed");
				smt.setDate(2, date);
				
				int r = smt.executeUpdate();
				System.out.println("true = "+r);
				con.close();
				
		    }catch(Exception e) {
		    	
		    }
		}
		
	}
	// code to fetch organizer list from db
	
	public ArrayList<Judge> judgeList() {
		
		if(cont()) {
			
			String q = "select * from judge";
			
			try {
				
				smt = con.prepareStatement(q);
				rs = smt.executeQuery();
				
				ArrayList<Judge> orec = new ArrayList<Judge>();
				
				while(rs.next()) {
					
					Judge obj = new Judge();
					
					obj.setId(rs.getInt(1));
					obj.setName(rs.getString(2));
					obj.setEmail(rs.getString(3));
					obj.setStatus(rs.getString(5));
					orec.add(obj);
				}
				con.close();
				return orec;
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}
	
	// code to fetch active competitions list from db
	
	public ArrayList<Competition> activeCompiList(){
		
		updateCompiStatus();
		
		if(cont()) {
			
			String q = "select * from competition where end_date >= ?";
			
			try {
				
				smt = con.prepareStatement(q);
				
				 long millis=System.currentTimeMillis();  
			      
			    // creating a new object of the class Date  
			    java.sql.Date date = new java.sql.Date(millis);       
			    //System.out.println(date);   
				
			    smt.setDate(1,date);
				rs = smt.executeQuery();
				
				ArrayList<Competition> orec = new ArrayList<>();
				
				while(rs.next()) {
					
					Competition obj = new Competition();

					obj.setCid(rs.getInt(1));
					obj.setCname(rs.getString(2));
					obj.setStart_date(rs.getDate(3));
					obj.setEnd_date(rs.getDate(4));
					obj.setStatus(rs.getString(10));
					
					
					orec.add(obj);
				}
				con.close();
				return orec;
				
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}

	// code to fetch closed competitions list from db
	
	public ArrayList<Competition> closedCompiList(){
		
		updateCompiStatus();
		
		if(cont()) {
			
			String q = "select * from competition where end_date < ?";
			
			try {
				
				smt = con.prepareStatement(q);
				
				 long millis=System.currentTimeMillis();  
			      
			    // creating a new object of the class Date  
			    java.sql.Date date = new java.sql.Date(millis);       
			    System.out.println(date);   
				
			    smt.setDate(1,date);
				rs = smt.executeQuery();
				
				ArrayList<Competition> orec = new ArrayList<>();
				
				while(rs.next()) {
					
					Competition obj = new Competition();
	
					obj.setCid(rs.getInt(1));
					obj.setCname(rs.getString(2));
					obj.setStart_date(rs.getDate(3));
					obj.setEnd_date(rs.getDate(4));
					obj.setStatus(rs.getString(10));
					
					
					orec.add(obj);
				}
				con.close();
				return orec;
				
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					con.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		return null;
	}
}
