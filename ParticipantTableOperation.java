package back;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ParticipantTableOperation {
	
	private Connection con;
	private PreparedStatement smt;
	
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
	
	public boolean exists(String e) throws SQLException {
		
		
		String q = "select * from participant where email = ?";
		smt = con.prepareStatement(q);
		
		smt.setString(1,e);
		ResultSet r = smt.executeQuery();
		
		if(r.next()) {	
			System.out.println("name = "+r.getString(3));
			return true;
		}
		return false;
	}
	
	public boolean insertParticipant(Participant obj){
		
		try {
		if(connectivity()) {
			
			if(exists(obj.getEmail())) 
				return false;
			//System.out.println("inside insertParticipant");
			smt = con.prepareStatement("insert into participant(name,mob,email,password) values(?,?,?,?)");
			
			smt.setString(1,obj.getFname());
			smt.setLong(2,obj.getPhone());
			smt.setString(3,obj.getEmail());
			smt.setString(4,obj.getPass());
			
			int s = smt.executeUpdate();
			
			if(s > 0)
				return true;
			terminate();
			return false;
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		terminate();
		return false;
	}
	
	public boolean validateParticipantLogin(String email,String pass) {
			
		try {
			
			if(connectivity()) {
				
				System.out.println("email in participant table op ; "+email);
				System.out.println("pass in participant table op ; "+pass);
				String q = "select * from participant where email = ? and password = ?";
				smt = con.prepareStatement(q);
				
				smt.setString(1,email);
				smt.setString(2, pass);
				ResultSet r = smt.executeQuery();
				
				if(r.next()) {	
					System.out.println("name = "+r.getString(3));
					return true;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			terminate();
			return false;
		}
		return false;
		
	}
	
	public boolean addPart_compi(Participant obj,int cid) {
		
		try {
			
			String q = "insert into part_compi(email,cid,status) values(?,?,?) ";
			smt = con.prepareStatement(q);
			smt.setString(1, obj.getEmail());
			smt.setInt(2,cid);
			smt.setString(3,"incomplete");
			
			smt.executeUpdate();
			return true;
			
		}catch(Exception e) {
			e.printStackTrace();
			terminate();
			return false;
		}
			
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
