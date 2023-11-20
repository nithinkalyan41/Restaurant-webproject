package service;


import Entity.StaffDetails;
import Entity.StaffOperations;
import Dao.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RegisterStaff")
public class RegisterStaff extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        int salary = Integer.parseInt(req.getParameter("salary"));
        String designation = req.getParameter("designation");
        // Creating Staff object
        StaffDetails staff = new StaffDetails(name,age,gender,address,email,password,phone,salary,designation);
        StaffOperations save = new StaffOperations(ConnectionProvider.getConnection());
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManagerDash.jsp");
        try {
            if (save.SaveStaff(staff)) {
                req.setAttribute("status", "success");
                dispatcher.forward(req, resp);
            } else {
                req.setAttribute("status", "failed");
                dispatcher.include(req,resp);
            }
        } finally {

        }
    }



}
