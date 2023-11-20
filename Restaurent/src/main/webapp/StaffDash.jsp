<%@ page import="java.sql.Connection" %>
<%@ page import="Dao.ConnectionProvider" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Entity.StaffDetails" %>
<%
    StaffDetails staff = (StaffDetails)session.getAttribute("StaffDetails");
    if(staff==null){
        response.sendRedirect("StaffLoginPage.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Restaurant Manager Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
  <link rel="stylesheet" href="externalFiles/StaffDash.css">
</head>
<body>
    <header class="m-0 d-flex justify-content-between" >
        <img src="img/logo.png" alt="Restaurant Logo" width="100px" height="100px" style="margin:0;padding:0">
        <h1 style="margin-top:25px">Entity Dashboard</h1>
        <div style="display:flex; justify-content: right;">
        <form class="form-inline" style="text-decoration: none">
            <a class="btn btn-outline my-2 my-sm-0 mr-3 " type="submit" style="background-color: #5DADE2 ;">About us</a>
            <a class="btn btn-outline my-2 my-sm-0 mr-3 text-white"  style="background-color: #5DADE2 ;" type="submit" href="stafflogout">Logout</a>
        </form>
        </div>
      </header>
      
      <nav>
        <ul>
          <li><a href="#overview" onclick="showSection('overview')">Overview</a></li>
          <li><a href="#orders" onclick="showSection('orders')">Orders</a></li>
          <li><a href="#delivered" onclick="showSection('delivered')">delivered</a></li>
          <li><a href="#reports" onclick="showSection('reports')">Reports</a></li>
        </ul>
      </nav>

    <%!
    int torders;
    int tdorders;
    %>



      <main>
        <section id="overview">
          <h2>Overview</h2>
          <div class="info-box">
            <h3>Total orders</h3>
            <p id="TotalOrders"><%=torders%></p>
          </div>
          <div class="info-box">
            <h3>Total delivered</h3>
            <p id="TotalDelivers"><%=tdorders%></p>
          </div>
        </section>


<%--        Orders Table Start--%>

        <section id="orders" style="display: none;">
          <h2>Orders</h2>
          <!-- Add inventory content and functionality here -->
          <table>
            <thead>
              <tr>
                <th>OrderId</th>
                <th>Table No:</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Actions</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con= ConnectionProvider.getConnection();
                    PreparedStatement pst1= con.prepareStatement("SELECT COUNT(*) FROM orders");
                    ResultSet rst=pst1.executeQuery();
                    if(rst.next())
                    {
                        this.torders = rst.getInt(1);
                    }
                    PreparedStatement pst= con.prepareStatement("select * from orders");
                    ResultSet rs=pst.executeQuery();
                    while (rs.next()) {

                        int orderId=rs.getInt(1);
                        int tableNum= rs.getInt(2);
                        String itemName=rs.getString(3);
                        int Quantity=rs.getInt(4);
                        int price= rs.getInt(5);
                        int tprice=rs.getInt(6);
                        int itemId=rs.getInt(7);
                        if(Quantity>0){
            %>
            <tr>
                <td><%=orderId%></td>
                <td><%=tableNum%></td>
                <td><%=itemName%></td>
                <td><%=Quantity%></td>
                <td><%=price%></td>
                <td><%=tprice%></td>
                <td>
                  <button class="btn btn-outline" onclick="processRow(this)">Process</button>
                </td>
                   <form method="post" action="dorders"><input type="hidden" name="orderId" value="<%=orderId%>"/>
                           <input type="hidden" name="itemid" value="<%=itemId%>"/>
                           <input type="hidden" name="Quantity" value="<%=Quantity%>"/>
                       <td>  <input type="submit" value="Deliver" class="btn btn-outline btn-success"></td>
                  </form>
              </tr>
            <%
                         }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            </tbody>
          </table>
        </section>


<%--        Orders Table Ending--%>





<%--        Delivered Orders--%>

        <section id="delivered" style="display: none;">
          <h2>Delivered</h2>
          <!-- Add staff content and functionality here -->
            <table>
                <thead>
                <tr>
                    <th>OrderId</th>
                    <th>Table No:</th>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total Price</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con= ConnectionProvider.getConnection();
                        PreparedStatement pst1= con.prepareStatement("SELECT COUNT(*) FROM dorders");
                        ResultSet rst=pst1.executeQuery();
                        if(rst.next())
                        {
                                this.tdorders = rst.getInt(1);
                        }
                        PreparedStatement pst= con.prepareStatement("select * from dorders");
                        ResultSet rs=pst.executeQuery();
                        while (rs.next()) {
                            int orderId=rs.getInt(1);
                            int tableNum= rs.getInt(2);
                            String itemName=rs.getString(3);
                            int Quantity=rs.getInt(4);
                            int price= rs.getInt(5);
                            int tprice=rs.getInt(6);
                %>
                <tr>
                    <td><%=orderId%></td>
                    <td><%=tableNum%></td>
                    <td><%=itemName%></td>
                    <td><%=Quantity%></td>
                    <td><%=price%></td>
                    <td><%=tprice%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </section>


<%--        Delivered Orders Closed--%>



<%--        Reports Opened--%>
        <section id="reports" style="display: none;">
          <h2>Reports</h2>
          <!-- Add reports content and functionality here -->
        </section>

<%--        Reports Closed--%>


      </main>
      <br>
      <br>
      <br>
      <footer>
        <p>&copy; 2023 Restaurant Name. All rights reserved.</p>
      </footer>


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
        // Sample data for demonstration purposes
        var TotalOrders = <%=torders%>; // Replace with your actual inventory count
        var TotalDelivers = <%=tdorders%>; // Replace with your actual staff count

        // Function to populate inventory and staff counts
        function populateCounts() {
          document.getElementById('TotalOrders').textContent = TotalOrders;
          document.getElementById('TotalDelivers').textContent = TotalDelivers;
        }

        // Function to show the default section and populate counts
        function showDefaultSection() {
          var defaultSection = document.getElementById('overview');
          defaultSection.style.display = 'block';
          populateCounts();
        }
        function processRow(button) {
      button.textContent = 'Processing';
      button.disabled = true;
      button.classList.add('processing');
      var x = document.getElementById()

      // Simulating processing delay (remove this in your actual implementation)
    //   setTimeout(function() {
    //     var row = button.parentNode.parentNode;
    //     row.parentNode.removeChild(row);
    //   }, 2000);
    }
       
    
        // Function to show a section and populate counts
        function showSection(sectionId) {
          // Hide all sections
          var sections = document.getElementsByTagName('section');
          for (var i = 0; i < sections.length; i++) {
            sections[i].style.display = 'none';
          }
    
          // Show the selected section
          var section = document.getElementById(sectionId);
          section.style.display = 'block';
    
          // Populate counts if the overview section is selected
          if (sectionId === 'overview') {
            populateCounts();
          }
        }
        function confirmInventory() {
      // Add your logic here to handle the inventory confirmation
      alert('Order confirmed!');
        }

        var status = document.getElementById("status").value;
        if(status=="success"){
            swal("Delivered");
        }
        else if(status==null || status=="failed"){
            swal("something went wrong");
        }
        else{
        }


      </script>
<%--        }--%>
    
<%--        // Call the function to show the default section and populate counts on page load--%>
<%--        showDefaultSection();--%>

</body>
</html>
