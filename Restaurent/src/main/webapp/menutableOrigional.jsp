<%@ page import="java.sql.Connection" %>
<%@ page import="Dao.ConnectionProvider" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <a class="navbar-brand">
        <img src="img/logo.png" alt="logo" width="100" height="90" class="d-inline-block align-top">
        <p class="text-center" style="margin-left:10px;margin-top:0;text-align:center;padding:0;">Restaurant</p>
    </a>
    <p style="margin:0; padding:0;">
    <h1 class="font-weight-bold m-0 p-0">Choose Your Favourites...</h1>
    </p>
    <form class="form-inline justify-content-between">
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="https://www.google.com/">About Us</a>
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="#">Contact us</a>
    </form>
</nav>
<div class="container-fluid">

    <div class="text-center">
        <input class="text-center" type="text" pattern="\d*" maxlength="2" id="tableno"
               placeholder="Please Enter the table number"
               style="height:50px;width:300px;margin-top:10px;border-radius: 10px;border: none;">
    </div>


    <div class="col-md-10" style="margin:10px auto;">
        <div class="table-responsive" style="border-radius: 10px;background-color: aliceblue;">
            <table class="table table-success">
                <thead>
                <tr class="table-primary">
                    <th scope="col"></th>
                    <th scope="col">Item name</th>
                    <th scope="col">Price per unit</th>
                    <th scope="col">Type</th>
                    <th scope="col">Quantity</th>
                    <th>Total Cost</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = ConnectionProvider.getConnection();
                        PreparedStatement pst = con.prepareStatement("select item_name,item_quantity,item_type,item_price from foodtable");
                        ResultSet rs = pst.executeQuery();
                        while (rs.next()) {
                            String item_name = rs.getString(1);
                            int item_quantity = rs.getInt(2);
                            String item_type = rs.getString(3);
                            int item_price = rs.getInt(4);
                %>

                <tr>
                    <th scope="row"><input type="checkbox"></th>
                    <td><%=item_name%></td>
                    <td class="number"><%=item_price%></td>
                    <td><%=item_type%></td>
                    <td scope="col">
                        <div class="quantity-control">
                            <button type="button" class="minus-btn btn-danger"
                                    style="border:none;border-radius: 50%;">&#8722;</button>
                            <span class="quantity" style="margin:10px;">0</span>
                            <button type="button" class="plus-btn btn-success"
                                    style="border:none;border-radius: 50%;">&#43;</button>
                        </div>
                    </td>
                    <td class="total"></td>
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
                <h2 id="orderTotal">Total amount:</h2>
                <form id="orderForm" action="">
                    <button type="submit" class="btn btn-primary mb-1">order</button>
                </form>
            </div>

        </div>

    </div>

</div>

<script>
    var quantityControls = document.querySelectorAll('.quantity-control');

    quantityControls.forEach(function (control) {
        var minusBtn = control.querySelector('.minus-btn');
        var plusBtn = control.querySelector('.plus-btn');
        var quantity = control.querySelector('.quantity');
        var number = control.closest('tr').querySelector('.number');
        var total = control.closest('tr').querySelector('.total');

        minusBtn.addEventListener('click', function () {
            var value = parseInt(quantity.textContent);
            if (value >= 1) {
                value--;
                quantity.textContent = value;
                calculateTotal(number, value, total);
                calculateOrderTotal();
            }
        });

        plusBtn.addEventListener('click', function () {
            var value = parseInt(quantity.textContent);
            value++;
            quantity.textContent = value;
            calculateTotal(number, value, total);
            calculateOrderTotal();
        });
    });

    function calculateTotal(numberElement, quantity, totalElement) {
        var number = parseInt(numberElement.textContent);
        var total = number * quantity;
        totalElement.textContent = total;
    }

    function calculateOrderTotal() {
        var totalCosts = document.querySelectorAll('.total');
        var orderTotal = 0;

        totalCosts.forEach(function (totalCost) {
            var value = parseInt(totalCost.textContent);
            if (value > 0) {
                orderTotal += value;
            }
        });

        var orderTotalElement = document.getElementById('orderTotal');
        orderTotalElement.textContent = 'Total Amount: ' + orderTotal;
    }

    function calculateAllTotals() {
        var rows = document.querySelectorAll('tbody tr');
        rows.forEach(function (row) {
            var number = row.querySelector('.number');
            var quantity = row.querySelector('.quantity');
            var total = row.querySelector('.total');
            var numberValue = parseInt(number.textContent);
            var quantityValue = parseInt(quantity.textContent);
            var totalValue = numberValue * quantityValue;
            total.textContent = totalValue;
        });
        calculateOrderTotal();
    }

    calculateAllTotals(); // Initial calculation
</script>
</body>

</html>
