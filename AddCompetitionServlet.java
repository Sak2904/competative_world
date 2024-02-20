package back;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddCompetition")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
				maxFileSize = 1024 * 1024 * 10, // 10MB
				maxRequestSize = 1024 * 1024 * 50)

public class AddCompetitionServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    int cid;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    	response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //int id = Integer.parseInt(request.getParameter("id"));
        String cname = request.getParameter("com_name");
        String des = request.getParameter("com_description");
        Date sdate = Date.valueOf(request.getParameter("start_date"));
        Date ldate = Date.valueOf(request.getParameter("end_date"));
        
        int judge = Integer.parseInt(request.getParameter("judge"));
        //System.out.println("start date = "+sdate);
        //System.out.println("start date = "+ldate);
        System.out.println("judge = "+judge);
        
        Part part = request.getPart("com_photo");//
        String fileName = extractFileName(part);//file name

        /**
         * *** Get The Absolute Path Of The Web Application ****
         */
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        System.out.println("applicationPath:" + applicationPath);
        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;
        System.out.println("savePath: " + savePath);
        String sRootPath = new File(savePath).getAbsolutePath();
        System.out.println("sRootPath: " + sRootPath);
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/competative_world", "root", "1234");
            PreparedStatement pst = con.prepareStatement("insert into competition(cname,start_date,end_date,description,filename,cphoto,j_id,status) values(?,?,?,?,?,?,?,?)");
            
            //pst.setInt(1, id);
            pst.setString(1, cname);
            pst.setDate(2, sdate);
            pst.setDate(3, ldate);
            pst.setString(4, des);
            pst.setString(5, dbFileName);
            pst.setString(6, savePath);
            pst.setInt(7, judge);
            pst.setString(8,"Active");
            pst.executeUpdate();
            request.getRequestDispatcher("OrganizerListServlet").forward(request,response);
            
           
            // code to fetch cid of current competition from table.....
            
            String q = "select cid from competition where j_id = ? and cname = ? and start_date = ? and end_date = ?";
            
            pst = con.prepareStatement(q);
            
            pst.setInt(1,judge);
            pst.setString(2,cname);
            pst.setDate(3,sdate);
            pst.setDate(4,ldate);
            
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()) {
            	
            	cid = rs.getInt(1);
            }
            
            // code to update judge status availble to competition...
            
            q = "update judge set cid = ?,status = ?,cname = ?,start_date = ?,end_date = ? where j_id = ?";
            
            pst = con.prepareStatement(q);
            
            pst.setInt(1,cid);
            pst.setString(2,"allocated");
            pst.setString(3,cname);
            pst.setDate(4,sdate);
            pst.setDate(5,ldate);
            pst.setInt(6,judge);
            
            pst.executeUpdate();
            con.close();
            
        } catch (Exception e) {
            out.println(e);
        }
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}