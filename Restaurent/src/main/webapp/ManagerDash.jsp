<%@ page import="java.sql.*" %>
<%@ page import="Dao.ConnectionProvider" %>
<%@ page import="Entity.ManagerDetails" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    ManagerDetails md = (ManagerDetails) session.getAttribute("ManagerDetails");
    if(md==null){
        response.sendRedirect("ManagerLoginPage.jsp");
    }
%>
<% System.out.println("STARTED"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link rel="stylesheet" href="externalFiles/ManagerDash.css">
</head>

<body>

<nav class="navbar navbar-light bg-light justify-content-between m-0 p-0" style="background-color: #909497;">
    <a class="navbar-brand text-white" href="index.jsp">
        <img src="img/logo.png" alt="logo" width="100" height="90" class="d-inline-block align-top"
             style="margin:0">
        <p class="text-center" style="padding:0;margin:0;text-align:center;">Restaurant</p>
    </a>
    <p style="margin:0; padding:0;">
    <h1 class="font-weight-bold">Dashboard</h1></p>
    <form class="form-inline justify-content-between">
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="#">About us</a>
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="managerlogout">Logout</a>
    </form>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2" style="height:100vh;padding:0;background-color: aqua; ">
            <a href="#" onclick="showDiv('addstaff')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1" style="border: 1px solid white; border-radius:15px;">
                <span class="navbar-brand text-white text-center" href="#" >Add Entity</span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('addexpenses')" style="text-decoration: none">
                <nav class="navbar navbar-light bg-dark m-1" style="border: 1px solid white; border-radius:15px;">
                    <span class="navbar-brand text-white text-center" href="#">Add Expense</span>
                </nav>
            </a>
            <a href="#" onclick="showDiv('additems')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white; border-radius:15px;">
                <span class="navbar-brand text-white" >Add Fooditems </span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('itemslist')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white; border-radius:15px;">
                <span class="navbar-brand text-white text-center"  >Items list </span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('staff')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white;border-radius:15px;">
                <span class="navbar-brand text-white" >Entity list</span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('expenses')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white;border-radius:15px;">
                <span class="navbar-brand text-white"  >Expenses</span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('income')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white;border-radius:15px;">
                <span class="navbar-brand text-white" >Income</span>
            </nav>
            </a>
            <a href="#" onclick="showDiv('profile')" style="text-decoration: none">
            <nav class="navbar navbar-light bg-dark m-1 text-center" style="border: 1px solid white;border-radius:15px;">
                <span class="navbar-brand text-white"  >Manager profile</span>
            </nav></a>
        </div>


<%--        ITEM LIST VIEW--%>


        <div class="col-md-10" style="margin:0;padding:0;">
            <div id="itemslist" style="display: none">
                <div class="navbar navbar-light bg-dark text-center justify-content-center">
                    <a class="navbar-brand text-white">
                        <h3>Items List</h3>
                    </a>
                </div>
                <div class="table-responsive" style="background-color: #979A9A;">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Item Id</th>
                            <th scope="col">Item Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Category</th>
                            <th scope="col">Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con= ConnectionProvider.getConnection();
                                PreparedStatement pst= con.prepareStatement("select * from foodtable");
                                ResultSet rs=pst.executeQuery();
                                while (rs.next()) {
                                    int item_id=rs.getInt(1);
                                    String item_name=rs.getString(2);
                                    int item_quantity=rs.getInt(3);
                                    String item_type = rs.getString(4);
                                    float item_price= rs.getFloat(5);
                        %>
                        <tr>
                            <th scope="row"><%=item_id%></th>
                            <td><%=item_name%></td>
                            <td><%=item_price%></td>
                            <td><%=item_type%></td>
                            <td><%=item_quantity%></td>
                        </tr>
                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>

            <%--    ITEM LIST VIEW CLOSED--%>





     <%--  Entity View  --%>

            <div id="staff" style="display: none;">
                <div class="navbar navbar-light bg-dark text-center justify-content-center">
                    <a class="navbar-brand text-white">
                        <h3>Entity List</h3>
                    </a>
                </div>
                <div class="table-responsive p-0" style="background-color: #AEB6BF;">
                    <table class="table table-bordered">
                        <thead >
                        <tr class="table-warning">
                            <th scope="col">Name</th>
                            <th scope="col">Age</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Address</th>
                            <th scope="col">Email</th>
                            <th scope="col">Password</th>
                            <th scope="col">Contact Number</th>
                            <th scope="col">Salary</th>
                            <th scope="col">Designation</th>
                            <th scope="col">Date of joinied</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                               Connection con= ConnectionProvider.getConnection();
                            PreparedStatement pst= con.prepareStatement("select * from staff where type is null");
                            ResultSet rs=pst.executeQuery();
                            while (rs.next()) {
                                String sname=rs.getString(2);
                                int sage=rs.getInt(3);
                                String sgender=rs.getString(4);
                                String saddr=rs.getString(5);
                                String email=rs.getString(6);
                                String pass=rs.getString(7);
                                String pnum=rs.getString(8);
                                int salary=rs.getInt(9);
                                String designation=rs.getString(10);
                                Timestamp ts = rs.getTimestamp(12);
                                %>
                        <tr class="table-light">
                            <th scope="row"><%=sname%></th>
                            <td><%=sage%></td>
                            <td><%=sgender%></td>
                            <td><%=saddr%></td>
                            <td><%=email%></td>
                            <td><%=pass%></td>
                            <td><%=pnum%></td>
                            <td><%=salary%></td>
                            <td><%=designation%></td>
                            <td><%=ts%></td>
                        </tr>
                            <%
                            }
                                } catch (Exception e) {
                                  e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>


            <%--  Entity View  Closed --%>






            <div id="expenses" style="display: none;">
                <div class="navbar navbar-light bg-dark text-center justify-content-center">
                    <a class="navbar-brand text-white">
                        <h3>Expenses</h3>
                    </a>
                </div>
                <div class="table-responsive" style="background-color: #D5D8DC;">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Expense name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Date</th>
                            <th scope="col">Amount</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con= ConnectionProvider.getConnection();
                                PreparedStatement pst= con.prepareStatement("select * from expense_table");
                                ResultSet rs=pst.executeQuery();
                                while (rs.next()) {
                                    String ex_name=(rs.getString(2)).toUpperCase();
                                    String  ex_type=rs.getString(3);
                                    Date  date=rs.getDate(4);
                                    int ex_amt= rs.getInt(5);
                        %>
                        <tr>
                            <td scope="row"><%=ex_name%></td>
                            <td><%=ex_type%></td>
                            <td><%=date%></td>
                            <td><%=ex_amt%></td>
                        </tr>
                        <%
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="income" style="display: none;">
                <div class="navbar navbar-light bg-dark text-center justify-content-center">
                    <a class="navbar-brand text-white">
                        <h3>Income</h3>
                    </a>
                </div>
                <div class="table-responsive" style="background-color: #E5E7E9;">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">First</th>
                            <th scope="col">Last</th>
                            <th scope="col">Handle</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>the Bird</td>
                            <td>@twitter</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="profile" style="display: none;">
                <div class="navbar navbar-light bg-dark text-center justify-content-center" style="border-radius:15px;">
                    <a class="navbar-brand text-white">
                        <h3>Profile</h3>
                    </a>
                </div>
                <div style="height:100vh;background-color: rgb(255 255 255 / 0.3);">
                <%@include file="profile.jsp"%>
                </div>
            </div>
            <div id="addstaff" style="display: none; margin:auto;border:1px solid black">
                <div class="navbar navbar-light bg-dark text-center justify-content-center text-white"
                     style="border-radius:15px;">
                    <h1>Enter Entity Details</h1>
                </div>
                <div class="col-md-4" style="margin:auto;padding-bottom: 5px; margin: 10px auto 10px; background-color: rgb(255 255 255 / 0.3); backdrop-filter:blur(10px);border-radius:10px; ">
                    <form id="myform" method="post" action="RegisterStaff">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" required>
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="text" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="form-group">
                            <label for="salary">Salary</label>
                            <input type="text" class="form-control" id="salary" name="salary" required>
                        </div>
                        <div class="form-group">
                            <label for="designation">Designation</label>
                            <input type="text" class="form-control" id="designation" name="designation" required>
                        </div>
                            <button id="submit" type="submit" class="btn btn-primary">Add</button>
                    </form>

                </div>
            </div>



        <%-- Add Items--%>


            <div id="additems" style="display: none; margin:auto;border:1px solid black">
                <div class="navbar navbar-light bg-dark text-center justify-content-center text-white"
                     style="border-radius:15px;">
                    <h1>Enter Item Details</h1>
                </div>
                <div class="col-md-4" style="margin:auto;padding-bottom: 5px; margin: 10px auto 10px; background-color: rgb(255 255 255 / 0.3); backdrop-filter:blur(10px);border-radius:10px; ">
                    <form method="post" action="additems">
                        <!-- Item Id -->
                        <div class="form-group">
                            <label for="item-id">Item Id</label>
                            <input type="text" class="form-control" id="item-id" name="item-id" required>
                        </div>
                        <!-- Item Name -->
                        <div class="form-group">
                            <label for="item-name">Item Name</label>
                            <input type="text" class="form-control" id="item-name" name="name" required>
                        </div>
                        <!-- Quantity -->
                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                        <!-- Type -->
                        <div class="form-group">
                            <label for="type">Choose category</label>
                            <select class="form-control" id="type" name="type" required>
                            <option value="veg">VEG</option>
                            <option value="non-veg">NON-VEG</option>
                            <option value="drinks">DRINKS</option>
                            </select>
                        </div>
                        <!-- Price -->
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="addexpenses" style="display: none; margin:auto;border:1px solid black">
                <div class="navbar navbar-light bg-dark text-center justify-content-center text-white"
                     style="border-radius:15px;">
                    <h1>Enter Expenses Details</h1>
                </div>
                <div class="col-md-4" style="margin:auto;padding-bottom: 5px; margin: 10px auto 10px; background-color: rgb(255 255 255 / 0.3); backdrop-filter:blur(10px);border-radius:10px; ">
                    <form method="post" action="addex">
                        <!-- Item Id -->

                        <!-- Item Name -->
                        <div class="form-group">
                            <label for="item-name">Expenses Name</label>
                            <input type="text" class="form-control" id="ex-name" name="exp" required>
                        </div>
                        <!-- Quantity -->
                        <div class="form-group">
                            <label for="ex-type">Expenses Type</label>
                            <select class="form-control" id="ex-type" name="ex_type" required>
                                <option value="MONTH">Month</option>
                                <option value="WEEK">Week</option>
                                <option value="DAY">Day</option>
                            </select>
                        </div>
                        <!-- Price -->
                        <div class="form-group">
                            <label for="price">Amount</label>
                            <input type="number" step="0.01" class="form-control" id="ex-amt" name="ex_amt" required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
            </div>

            <%-- Add Items Closed--%>

        </div>
    </div>
</div>
<!-- Add Inventory Modal -->
<!-- Rest of your HTML code -->

<!-- Add Entity Modal -->
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" style="display: none">

<%--<!-- Rest of your HTML code -->--%>
<script src="https://cdn.jsdelivr.net/npm/mysql2"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    function showDiv(divId) {
        var divs = document.querySelectorAll('[id^="itemslist"],[id="expenses"] ,[id^="staff"], [id^="addexpenses"], [id^="income"], [id^="profile"],[id^="addstaff"],[id^="additems"]');
        for (var i = 0; i < divs.length; i++) {
            divs[i].style.display = 'none';
        }
        document.getElementById(divId).style.display = 'block';
    }



    var status = document.getElementById("status").value;
    if(status=="success"){
        swal("successful");
    }
    else if(status==null || status=="failed"){
        swal("something went wrong");
    }
    else{
    }
</script>

</body>

</html>
