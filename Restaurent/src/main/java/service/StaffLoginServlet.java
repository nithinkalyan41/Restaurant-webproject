package service;

import Entity.StaffDetails;
import Entity.StaffOperations;
import Dao.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/stafflogin")
public class StaffLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        StaffOperations so = new StaffOperations(ConnectionProvider.getConnection());
        try {
            StaffDetails sd = so.getStaffDetailsByEmailAndPassword(email,pass);
            if(sd==null){
                req.setAttribute("status","failed");
                resp.sendRedirect("StaffLoginPage.jsp");
            }
            else{
                HttpSession session = req.getSession();
                session.setAttribute("StaffDetails",sd);
                resp.sendRedirect("StaffDash.jsp");
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
