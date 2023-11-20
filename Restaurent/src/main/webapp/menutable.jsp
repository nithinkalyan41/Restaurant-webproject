<%@ page import="java.sql.Connection" %>
<%@ page import="Dao.ConnectionProvider" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.ItemDetails" %>
<%
    ArrayList<ItemDetails> itemDetails =(ArrayList<ItemDetails>) session.getAttribute("ItemDetails");
    if(itemDetails!=null) {
        session.setAttribute("ItemDetails",itemDetails);
    }


%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="externalFiles/menutable.css">
</head>

<body style="background:url('img/restaurent.jpg');background-repeat: no-repeat; background-size: cover; ">
<nav class="navbar navbar-light justify-content-between m-0 p-0 text-white"
     style="background:#695040;padding:0;height:16vh">
    <a class="navbar-brand text-white" href="index.jsp">
        <img src="img/logo.png" alt="logo" width="100" height="90" class="d-inline-block align-top">
        <p class="text-center" style="margin-left:10px;margin-top:0;text-align:center;padding:0;">Restaurant</p>
    </a>
    <p style="margin:0; padding:0;">
    <h1 class="font-weight-bold m-0 p-0">Choose Your Favourites...</h1>
    </p>
    <form class="form-inline justify-content-between">
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="https://www.google.com/">About us</a>
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="#">Contact us</a>
    </form>
</nav>
<div class="container-fluid">
    <form method="post" action="orderconfirm.jsp">
        <div class=" form-group col-md-8" style="margin:10px auto;">
            <div class="table-responsive" style="border-radius: 10px;background-color: aliceblue;">
                <div class="d-flex justify-content-center">
                    <div class="col-md-8 p-5 d-flex justify-content-between" >
                        <input type="button" name="all" class="btn btn-success" value="All items">
                        <input type="button" name="veg" class="btn btn-success" value="Vegetarian">
                        <input type="button" name="non-veg" class="btn btn-success" value="Non-Vegetarian">
                        <input type="button" name="drinks" class="btn btn-success" value="Drinks">
                    </div>
                </div>
                <table class="table table-success" id="all-items">
                    <thead>
                    <tr class="table-primary">
                        <th scope="col"></th>
                        <th scope="col">Item name</th>
                        <th scope="col">Price per unit</th>
                        <th scope="col">Quantity</th>

                    </tr>
                    </thead>
                    <tbody>

                    <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con= ConnectionProvider.getConnection();
                            PreparedStatement pst= con.prepareStatement("select item_id,item_name,item_quantity,item_price from foodtable");
                            ResultSet rs=pst.executeQuery();


                            while (rs.next()) {
                                int item_id=rs.getInt(1);
                                String item_name=rs.getString(2);
                                int item_quantity=rs.getInt(3);
                                int item_price= rs.getInt(4);


                    %>

                    <tr>
                        <th scope="row"></th>
                        <td><%=item_name%></td>
                        <td class="number"><%=item_price%></td>
                        <td scope="col">
                            <div>
                                <a href="addItem?id=<%=item_id%>" class="btn btn-primary">Add</a>
                            </div>
                        </td>

                    </tr>


                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>

                    </tbody>

                </table>


                <table class="table table-success" id="all-veg" style="display:none">
                    <thead>
                    <tr class="table-primary">
                        <th scope="col"></th>
                        <th scope="col">Item name</th>
                        <th scope="col">Price per unit</th>
                        <th scope="col">Quantity</th>

                    </tr>
                    </thead>
                    <tbody>
                    </tbody>

                    <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con= ConnectionProvider.getConnection();
                            PreparedStatement pst= con.prepareStatement("select item_id,item_name,item_quantity,item_price from foodtable where item_type='veg'");
                            ResultSet rs=pst.executeQuery();


                            while (rs.next()) {
                                int item_id=rs.getInt(1);
                                String item_name=rs.getString(2);
                                int item_quantity=rs.getInt(3);
                                int item_price= rs.getInt(4);


                    %>
                    <tr>
                        <th scope="row"></th>
                        <td><%=item_name%></td>
                        <td class="number"><%=item_price%></td>
                        <td scope="col">
                            <div>
                                <a href="addItem?id=<%=item_id%>" class="btn btn-primary">Add</a>
                            </div>
                        </td>

                    </tr>

                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>
                </table>


                <table class="table table-success" id="all-non-veg" style="display:none">
                    <thead>
                    <tr class="table-primary">
                        <th scope="col"></th>
                        <th scope="col">Item name</th>
                        <th scope="col">Price per unit</th>
                        <th scope="col">Quantity</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con= ConnectionProvider.getConnection();
                            PreparedStatement pst= con.prepareStatement("select item_id,item_name,item_quantity,item_price from foodtable where item_type='non-veg'");
                            ResultSet rs=pst.executeQuery();
                            while (rs.next()) {
                                int item_id=rs.getInt(1);
                                String item_name=rs.getString(2);
                                int item_quantity=rs.getInt(3);
                                int item_price= rs.getInt(4);
                    %>
                    <tr>
                        <th scope="row"></th>
                        <td><%=item_name%></td>
                        <td class="number"><%=item_price%></td>
                        <td scope="col">
                            <div>
                                <a href="addItem?id=<%=item_id%>" class="btn btn-primary">Add</a>
                            </div>
                        </td>

                    </tr>

                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>
                    </tbody>

                </table>


                <table class="table table-success" id="all-drinks" style="display:none">
                    <thead>
                    <tr class="table-primary">
                        <th scope="col"></th>
                        <th scope="col">Item name</th>
                        <th scope="col">Price per unit</th>
                        <th scope="col">Quantity</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con= ConnectionProvider.getConnection();
                            PreparedStatement pst= con.prepareStatement("select item_id,item_name,item_quantity,item_price from foodtable where item_type='drinks'");
                            ResultSet rs=pst.executeQuery();
                            while (rs.next()) {
                                int item_id=rs.getInt(1);
                                String item_name=rs.getString(2);
                                int item_quantity=rs.getInt(3);
                                int item_price= rs.getInt(4);
                    %>

                    <tr>
                        <th scope="row"></th>
                        <td><%=item_name%></td>
                        <td class="number"><%=item_price%></td>
                        <td scope="col">
                            <div>
                                <a href="addItem?id=<%=item_id%>" class="btn btn-primary">Add</a>
                            </div>
                        </td>

                    </tr>

                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    %>
                    </tbody>
                </table>

                <div class="text-center">
                    <a href="tablebooking.jsp" class="btn btn-primary mb-1">Book Table</a>
                    <input type="submit" class="btn btn-primary mb-1" value="Place Order"/>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="externalFiles/menutable.js"></script>
</body>

</html>
