package service;

import Entity.ItemDetails;
import Entity.ItemOperations;
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
import java.util.ArrayList;

@WebServlet("/addItem")
public class addItem extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        ArrayList<ItemDetails> item_details;
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            item_details = new ArrayList<>();
            ItemOperations io = new ItemOperations(ConnectionProvider.getConnection());
            ItemDetails iD = io.getItemById(id);
            HttpSession session = req.getSession();
            ArrayList<ItemDetails> items = (ArrayList<ItemDetails>) session.getAttribute("ItemDetails");
            if (items==null) {
                item_details.add(iD);
                session.setAttribute("ItemDetails", item_details);
                resp.sendRedirect("menutable.jsp");

            } else {
                item_details = items;
                boolean exists = false;
                for(ItemDetails is : items){
                    if(is.getItem_id()==id){
                        exists=true;
                        out.println("<h3 style='color:crimson;text-aligin:center'>Item already Exists<a href='orderconfirm.jsp'>Go to Menu</a></h3>");
                    }
                }
                if(!exists){
                    item_details.add(iD);
                    System.out.println(item_details);
                    resp.sendRedirect("menutable.jsp");
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.println(item_details);
    }
}
