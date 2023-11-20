<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-image: url(img/pic1.jpg); background-size:cover; background-repeat: no-repeat;">
    <nav class="navbar navbar-light bg-light justify-content-between m-0 p-0" style="background-color: #e3e8e8;" >
        <a class="navbar-brand text-white" href="index.jsp">
            <img src="img/logo.png" alt="logo" width="100" height="90" class="d-inline-block align-top" style="margin:0"> 
        </a>
        <p style="margin:0; padding:0;"> <h1 class="font-weight-bold">Restaurant</h1> </p>
        <form class="form-inline justify-content-between">
            <a class="btn btn-outline-success my-2 my-sm-0 mr-3" type="submit">About us</a>
            <a class="btn btn-outline-success my-2 my-sm-0 mr-3" type="submit">Contact us</a>
        </form>
    </nav>
    <div class="container col-md-4" style=" background-color: #e3e8e8; margin: 20px auto; padding:10px; border-radius: 5px;">
            <div class="image text-center">
                <img src="img/man.png" alt="" width="150" height="150">
            </div>
        <form method="post" action="stafflogin">
        <div class="form-group">
          <label for="exampleInputName">Email</label>
          <input type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Username" name="email" required>
          
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Password</label>
          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass" required>
        </div>
        <div class="text-center">
        <button type="submit" class="btn btn-outline-success my-2 my-sm-0 mr-3 ">submit</button>
        </div>
      </form>
    </div>


    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>" style="display: none">

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
    var status = document.getElementById("status").value;
    if(status=="success"){
        swal("Added successfully");
    }
    else if(status==null || status=="failed"){
        swal("something went wrong");
    }
    else{
    }
</script>

    
</body>
</html>