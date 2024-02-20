package back;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginTableOperations {

	private Connection con;
	private PreparedStatement smt;
	ResultSet rs;
	
	public boolean connectivity() {
		
		try{
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Found");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world","root","1234");
			System.out.println("Connected successfully");
		
		}
		catch(ClassNotFoundException ex) {
			ex.printStackTrace();
			terminate();
			return false;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			terminate();
			return false;
		}
		
		return true;
	}
	
	public boolean validateOrganizer(Organizer obj) throws SQLException {
		
		if(connectivity()) {
			
			String q = "select email,password from organizer where email = ? and password = ?";
			smt = con.prepareStatement(q);
			
			smt.setString(1, obj.getEmail());
			smt.setString(2, obj.getPass());
			
			rs = smt.executeQuery();
			
			if(rs.next()) {
				System.out.println("email = "+rs.getString(1));
				System.out.println("password = "+rs.getString(2));
				return true;
			}
		}
		terminate();
		return false;
	}
	
	public boolean validateJudge(Judge pbj) throws SQLException {
		
		if(connectivity()) {
			
			String p = "select j_email,password from judge where j_email = ? and password = ?";
			smt = con.prepareStatement(p);
			
			System.out.println("email = "+pbj.getEmail());
			System.out.println("pass = "+pbj.getPass());
			
			smt.setString(1, pbj.getEmail());
			smt.setString(2, pbj.getPass());
			
			rs = smt.executeQuery();
			
			if(rs.next()) {
				System.out.println("email = "+rs.getString(1));
				System.out.println("password = "+rs.getString(2));
				//System.out.println("before return true in participant");
				return true;
			}
		}
		terminate();
		return false;
	}
	
	
	public void terminate() {
		
		try {
			con.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	
}
