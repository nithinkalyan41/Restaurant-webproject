<%--
  Created by IntelliJ IDEA.
  User: nithin
  Date: 17/07/23
  Time: 9:11 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-light justify-content-between m-0 p-0 text-white"
     style="background:#695040;padding:0;height:16vh">
    <a class="navbar-brand text-white" href="index.jsp">
        <img src="img/logo.png" alt="logo" width="100" height="90" class="d-inline-block align-top">
        <p class="text-center" style="margin-left:10px;margin-top:0;text-align:center;padding:0;">Restaurant</p>
    </a>
    <p style="margin:0; padding:0;">
    <h1 class="font-weight-bold m-0 p-0">Reserve your table!!.</h1>
    </p>
    <form class="form-inline justify-content-between">
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="https://www.google.com/">About us</a>
        <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="#">Contact us</a>
    </form>
</nav>
<div class="container-fluid d-flex justify-content-center mt-3" >
    <div class="booking-form card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h2>Table Booking</h2>
            </div>

            <form action="tablebooking">
                <div class="form-group">
                    <label>Name</label>
                    <input class="form-control" type="text" name="customer_name" >
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input class="form-control" type="text" name="customer_address" >
                </div>
                <div class="form-group">
                    <label>Contact Number</label>
                    <input class="form-control" type="text" maxlength="10" name="contact_number" >
                </div>
                <div class="form-group">
                    <label >Date</label>
                    <input class="form-control" type="date" name="date" >
                    <label for="time">Time</label>
                    <select class="form-control" name="time" id="time">
                        <option value="10am">10 AM</option>
                        <option value="11am">11 AM</option>
                        <option value="12pm">12 PM</option>
                        <option value="1pm">1 PM</option>
                        <option value="2pm">2 PM</option>
                        <option value="3pm">3 PM</option>
                        <option value="4pm">4 PM</option>
                        <option value="5pm">5 PM</option>
                        <option value="6pm">6 PM</option>
                        <option value="7pm">7 PM</option>
                        <option value="8pm">8 PM</option>
                        <option value="9pm">9 PM</option>
                    </select>
                </div>
                <div class="form-group">
                    <label >Select Table number:</label>
                    <select  class="form-control" name="table_number" >
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
                <input type="hidden" id="status" value="<%=session.getAttribute("status")%>" style="display: none">
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">Book now</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    var status = document.getElementById("status").value;
    console.log(status);
    if(status=="success"){
        swal("Congratulations table got reserved");
    }
   else if(status=="failed"){
        swal("This slot is already reserved please choose another table");
    }

</script>
</body>
</html>
