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
import java.sql.SQLException;

@WebServlet("/update")
public class updateManger extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        ManagerOperations mo = new ManagerOperations(ConnectionProvider.getConnection());
        HttpSession session = req.getSession();
        ManagerDetails md = (ManagerDetails) session.getAttribute("ManagerDetails");
        int id = md.getId();
        try {
            mo.updateDetails(name,address,phone,id);
            resp.sendRedirect("ManagerDash.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
