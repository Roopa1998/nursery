

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nursery", "root", "1234");
           // if (!con.isClosed())
            //{
            	
                System.out.println("Successfully connected to MySQL server...");
                PreparedStatement ps;
                String user_id=request.getParameter("user_id");
                String fname=request.getParameter("fname");
                String lname=request.getParameter("lname");
                String email_id=request.getParameter("email_id");
                String contact_no=request.getParameter("contact_no");
                String address=request.getParameter("address");
                String password=request.getParameter("password");
                String query="insert into CUSTOMER values(?,?,?,?,?,?,?);";
                ps=con.prepareStatement(query);
                ps.setString(1, user_id);
                ps.setString(2, fname);
                ps.setString(3, lname);
                ps.setString(4, email_id);
                ps.setString(5, contact_no);
                ps.setString(6, address);
                ps.setString(7, password);
                ps.execute();
                response.sendRedirect("login.jsp");
            //}
        } catch(Exception e) {
            System.err.println("Exception: " + e.getMessage());
        } 
        try {
            if (con != null)
                con.close();
        } catch(SQLException e) {}
	}

}