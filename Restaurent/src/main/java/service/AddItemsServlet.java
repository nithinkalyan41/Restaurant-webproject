package service;

import Entity.ItemDetails;
import Entity.ItemOperations;
import Dao.ConnectionProvider;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/additems")
public class AddItemsServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw=resp.getWriter();
        resp.setContentType("text/html");
        int item_id=Integer.parseInt(req.getParameter("item-id"));
        String item_name=req.getParameter("name");
        int item_quantity=Integer.parseInt(req.getParameter("quantity"));
        String item_type = req.getParameter("type");
        int item_price=Integer.parseInt(req.getParameter("price"));
        ItemDetails item_details = new ItemDetails(item_id,item_name,item_quantity,item_type,item_price);
        ItemOperations io = new ItemOperations(ConnectionProvider.getConnection());
        RequestDispatcher dispatcher = req.getRequestDispatcher("ManagerDash.jsp");
        if (io.insertItem(item_details)) {
            req.setAttribute("status", "success");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("status", "failed");
            dispatcher.include(req,resp);
        }

    }









}
