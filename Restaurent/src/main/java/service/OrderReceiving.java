package service;

import Entity.ItemDetails;
import Dao.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/sampleDemo")
public class OrderReceiving extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        ArrayList<ItemDetails> id = (ArrayList<ItemDetails>) session.getAttribute("ItemDetails");
        List<Integer> quant = new ArrayList<>();
        for(int i=0;i<id.size();i++){
            quant.add(Integer.valueOf(req.getParameter(String.valueOf(i))));
        }
        int table = Integer.parseInt(req.getParameter("table_number"));
        Connection con = ConnectionProvider.getConnection();
        for(int i=0;i<id.size();i++){
            try {
                PreparedStatement ps = con.prepareStatement("insert into orders(table_num,item_name,quantity,price,total_price,item_id) values(?,?,?,?,?,?)");
                int tprice= (int) ((quant.get(i)) *(id.get(i).getItem_price()));
                ps.setInt(1, table);
                ps.setString(2, id.get(i).getItem_name());
                ps.setInt(3,quant.get(i));
                ps.setInt(4, (int) id.get(i).getItem_price());
                ps.setInt(5, tprice);
                ps.setInt(6,id.get(i).getItem_id());
                int k = ps.executeUpdate();
                if(k==1){
                    RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
                    req.setAttribute("status", "success");
                    rd.forward(req, resp);
                }
                else
                {
                    RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
                    req.setAttribute("status", "failed");
                    rd.forward(req, resp);
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }



    }
}
