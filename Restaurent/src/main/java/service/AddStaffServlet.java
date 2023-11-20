package service;

//import constants.RestaurantConstants;
import Dao.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;



@WebServlet("/addStaff")
public class AddStaffServlet  extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");

        String  sname=req.getParameter("name");
        String sage=req.getParameter("age");
        String  sgender=req.getParameter("gender");
        String  saddress=req.getParameter("address");
        String  semail=req.getParameter("email");
        String spassword=req.getParameter("password");
        String sphone=req.getParameter("phone");
        String ssalary=req.getParameter("salary");
        String sdesignation=req.getParameter("designation");
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into staff values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, sname);
            ps.setInt(2, Integer.parseInt(sage));
            ps.setString(3, sgender);
            ps.setString(4, saddress);
            ps.setString(5, semail);
            ps.setString(6, spassword);
            ps.setString(7,sphone);
            ps.setInt(8, Integer.parseInt(ssalary));
            ps.setString(9, sdesignation);
            ps.setInt(10,2);
            int k = ps.executeUpdate();
            if(k==1){

                RequestDispatcher rd=req.getRequestDispatcher("ManagerDash.jsp");
                req.setAttribute("status", "success");
                rd.forward(req, res);
            }
            else
            {
                RequestDispatcher rd=req.getRequestDispatcher("ManagerDash.jsp");
                req.setAttribute("status", "failed");
                rd.forward(req, res);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
