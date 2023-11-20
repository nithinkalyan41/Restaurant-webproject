package service;

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

@WebServlet("/dorders")
public class DOrdersServlet extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");

       int orderId=Integer.parseInt(req.getParameter("orderId"));

         try {
           Connection con = ConnectionProvider.getConnection();
            String query="INSERT INTO dorders (order_id,table_num,item_name,quantity,price,total_price) SELECT order_id,table_num,item_name,quantity,price,total_price FROM orders WHERE order_id="+orderId;

            PreparedStatement ps=con.prepareStatement(query);
            int k=ps.executeUpdate();
            if(k==1){
                PreparedStatement ps1 = con.prepareStatement("delete from " + "orders" + "  where " + "order_id=" +orderId);
                int l = ps1.executeUpdate();
                if(l==1){

                    RequestDispatcher rd=req.getRequestDispatcher("StaffDash.jsp");
                    req.setAttribute("status", "success");
                    rd.forward(req, res);
                }
                else {
                    RequestDispatcher rd=req.getRequestDispatcher("StaffDash.jsp");
                    req.setAttribute("status", "failed");
                    rd.forward(req, res);
                }
            }
            else {
                RequestDispatcher rd=req.getRequestDispatcher("StaffDash.jsp");
                req.setAttribute("status", "failed");
                rd.forward(req, res);
            }
        } catch (Exception e) {
             RequestDispatcher rd=req.getRequestDispatcher("StaffDash.jsp");
             req.setAttribute("status", "failed");
             rd.forward(req, res);
            e.printStackTrace();
        }
    }
}
