<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HomePage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="externalFiles/index.css">
</head>
<body style="background:url('img/restaurent.jpg');background-repeat: no-repeat; background-size: cover; ">
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" style="display: none">
    <nav class="navbar navbar-light  justify-content-between m-0 p-0 text-white" style="background:#695040;padding:0;height:16vh">
        <a class="navbar-brand text-white" href="index.jsp">
            <img src="img/logo.png" alt="logo" style="padding:0;margin:0" width="100" height="90" class="d-inline-block align-top">
            <p class="text-center" style="margin-left:10px;margin-top:0;text-align:center;padding:0;">Restaurant</p>
        </a>
        <p style="margin:0; padding:0;"><h1 class="font-weight-bold m-0 p-0" >Welcome!!!</h1></p>
        <form class="form-inline justify-content-between">
            <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="https://www.google.com/">About us</a>
            <a class="btn btn-outline-success my-2 my-sm-0 mr-3" href="#">Contact us</a>
        </form>
    </nav>
    <div class="container-fluid">
        <div class="image-container col-md-10">
            <a href="menutable.jsp" class="image-link">
                <img id="firstImage" src="img/menu.png" alt="" width="280px" height="300px">
            </a>

            <a href="#" class="image-link">
                <img id="secondImage" src="img/login.jpeg" alt="" width="280px" height="300px">
            </a>
            <a href="tablebooking.jsp" class="image-link">
                <img id="thirdImage" src="img/tbg.png" alt="" width="280px" height="300px">
            </a>
        </div>
    </div>
         <div class="box col-md-6 text-center d-flex justify-content-between" style="margin:0 auto; ">
                <a href="StaffLoginPage.jsp" style="text-decoration: none">
            <div class="boxes" style="background: #ECB390; width:280px; height:300px;border-radius:10px; display: none;">
            <img src="img/man.png" alt="logo" width="200px" height="200px" style="margin-top:10px;">
            <br>
            <br>
            <h3 class="text-white" style="font-weight:bold;text-decoration:none">Entity</h3>
            </div></a>

                <div class="boxes" style="background: #ECB390; width:280px; height:300px;border-radius:10px; display: none;">
                    <a href="ManagerLoginPage.jsp" style="text-decoration: none">
                 <img src="img/profile.png" alt="logo" width="200px" height="200px" style="margin-top:10px;">
                    <br>
                    <br>
                    <h3 class="text-white" style="font-weight:bold;text-decoration:none">Manager</h3></a>
                 </div>
        </div>

    <script>
        window.addEventListener("DOMContentLoaded", function () {
            var firstImage = document.getElementById("firstImage");
            var secondImage = document.getElementById("secondImage");
            var thirdImage = document.getElementById("thirdImage");
            var box1 = document.querySelector('.boxes:nth-child(1)');
            var box2 = document.querySelector('.boxes:nth-child(2)');
            var box3 = document.querySelector('.boxes:nth-child(3)');

            secondImage.addEventListener("click", function () {
                firstImage.style.display = "none";
                secondImage.style.display = "none";
                thirdImage.style.display = "none";
                box1.style.display = "block";
                box2.style.display = "block";
                box3.style.display = "block";
            });
        });
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
