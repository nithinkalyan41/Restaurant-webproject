package service;

import Dao.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/tablebooking")
public class tablebooking extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("customer_name");
        String address = req.getParameter("customer_address");
        String contact = req.getParameter("contact_number");
        int tableno = Integer.parseInt(req.getParameter("table_number"));
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate booking_day = LocalDate.parse(date, formatter);
        LocalDate today = LocalDate.now();
        int comparisonResult = today.compareTo(booking_day);
        Connection con = ConnectionProvider.getConnection();
        String q = "select * from book_table where table_no=? and time_of_booking=? and date_of_booking=?";
        try {
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1,tableno);
            pstmt.setString(2,time);
            pstmt.setString(3,date);
            ResultSet rs = pstmt.executeQuery();
            boolean ans = rs.next();
            if(!ans && comparisonResult < 0){
                String s = "insert into book_table(customer_name,customer_address,contact_no,date_of_booking,time_of_booking,table_no) values(?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(s);
                ps.setString(1,name);
                ps.setString(2,address);
                ps.setString(3,contact);
                ps.setString(4,date);
                ps.setString(5,time);
                ps.setInt(6,tableno);
                ps.executeUpdate();
                HttpSession ses = req.getSession();
                ses.setAttribute("status","success");
                resp.sendRedirect("tablebooking.jsp");
            }
           else{
                HttpSession s = req.getSession();
                s.setAttribute("status","failed");
                 resp.sendRedirect("tablebooking.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
