package service;

import Entity.ManagerDetails;
import Entity.ManagerOperations;
import Dao.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/managerlogin")
public class ManagerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out  = resp.getWriter();
        String email = req.getParameter("email");
        String pass = req.getParameter("pass");
        ManagerOperations mo = new ManagerOperations(ConnectionProvider.getConnection());
        ManagerDetails md = mo.getManagerDetailsbyEmail(email,pass);

        if(md==null){
            req.setAttribute("status","failed");
            resp.sendRedirect("ManagerLoginPage.jsp");
        }
        else  {
           HttpSession session = req.getSession();
            session.setAttribute("ManagerDetails",md);
            resp.sendRedirect("ManagerDash.jsp");
        }

    }
}
