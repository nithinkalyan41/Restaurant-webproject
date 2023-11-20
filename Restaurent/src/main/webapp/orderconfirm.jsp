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
  <form method="post" action="sampleDemo">
    <div class="form-group text-center">
      <input class="text-center" name="table_number" type="text" pattern="\d*" maxlength="2" id="tableno" placeholder="Please Enter the table number" style="height:50px;width:300px;margin-top:10px;border-radius: 10px;border: none;" required>
    </div>

    <div class=" form-group col-md-8" style="margin:10px auto;">
      <div class="table-responsive" style="border-radius: 10px;background-color: aliceblue;">
        <table class="table table-success" id="all-items">
          <thead>
          <tr class="table-primary">
            <th scope="col"></th>
            <th scope="col">Item name</th>
            <th scope="col">Price per unit</th>
            <th scope="col">Quantity</th>
            <th scope="col">Amount</th>
          </tr>
          </thead>
          <tbody>

          <%
            for(int i=0;i<itemDetails.size();i++){
          %>

          <tr>
            <th scope="row"></th>
            <td><%=itemDetails.get(i).getItem_name()%></td>
            <td class="number"><%=itemDetails.get(i).getItem_price()%></td>
            <td scope="col">
              <div class="quantity-control">
                <button type="button" class="minus-btn btn-danger" style="border:none;border-radius: 50%;"
                        onclick="decreaseQuantity(this)">&#8722;</button>
                <input type="number" name="<%=i%>" class="quantity" id="myInput" value="0" style="margin:10px;border:none;border-radius:5px;">
                <button type="button" class="plus-btn btn-success" style="border:none;border-radius: 50%;"
                        onclick="increaseQuantity(this)">&#43;</button>
              </div>
            </td>

            <td class="total"></td>
          </tr>
          <%
              }
          %>

      </div>
    </div>
    <div class=" form-group text-center">
      <input type="hidden" name="totalprice"><h2 id="orderTotal">Total amount:</h2>
    </div>
    <div class="form-group text-center">

      <input type="submit" class="btn btn-primary mb-1" value="order"/>
    </div>
  </form>
</div>
<script>   function calculateAmount() {
  var rows = document.querySelectorAll("#all-items tbody tr");
  var total = 0;
  for (var i = 0; i < rows.length; i++) {
    var quantity = parseInt(rows[i].querySelector(".quantity").value);
    var price = parseFloat(rows[i].querySelector(".number").innerText);
    var amount = quantity * price;
    rows[i].querySelector(".total").innerText = amount.toFixed(2);
    total += amount;
  }
  document.querySelector("#orderTotal").innerText = "Total amount: " + total.toFixed(2);
}

// Event handler for the plus button
function increaseQuantity(btn) {
  var input = btn.parentNode.querySelector(".quantity");
  input.value = parseInt(input.value) + 1;
  calculateAmount();
}

// Event handler for the minus button
function decreaseQuantity(btn) {
  var input = btn.parentNode.querySelector(".quantity");
  if (parseInt(input.value) > 1) {
    input.value = parseInt(input.value) - 1;
    calculateAmount();
  }
}

// Event listener for quantity change
var quantityInputs = document.querySelectorAll(".quantity");
quantityInputs.forEach(function (input) {
  input.addEventListener("change", calculateAmount);
});

calculateAmount()

</script>
</body>

</html>
