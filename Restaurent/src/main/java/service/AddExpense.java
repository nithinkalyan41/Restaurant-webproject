package service;

import Dao.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

@WebServlet("/addex")
public class AddExpense extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=(req.getParameter("exp")).toUpperCase();
        String ex_type=req.getParameter("ex_type");
        String ex_amt=req.getParameter("ex_amt");
        try {

            Connection con= ConnectionProvider.getConnection();
            PreparedStatement pst=con.prepareStatement("insert into expense_table(expense_name,expense_type,expense_date,amount) values(?,?,?,?)");


            pst.setString(1,name);
            pst.setString(2,ex_type);
            pst.setDate(3,java.sql.Date.valueOf(LocalDate.now()));
            pst.setInt(4,Integer.parseInt(ex_amt));
            int k=pst.executeUpdate();
            if(k==1){
                RequestDispatcher rd=req.getRequestDispatcher("ManagerDash.jsp");
                req.setAttribute("status", "success");
                rd.forward(req, resp);
            }
            else {
                RequestDispatcher rd=req.getRequestDispatcher("ManagerDash.jsp");
                req.setAttribute("status", "failed");
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
