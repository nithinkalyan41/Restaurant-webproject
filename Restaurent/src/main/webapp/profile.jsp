<%--
  Created by IntelliJ IDEA.
  User: nithin
  Date: 01/07/23
  Time: 10:53 am
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Manager Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>
<body style="margin-top:10px;height:100vh;background-color: rgb(255 255 255 / 0.3);">
<div class="col-md-6 card"  style="margin:10px auto">
    <div class="card-body text-center d-flex justify-content-between">
        <div class="text-center" style="margin-right:10px">
            <img src="img/profile.png" alt="" width="250px" height="250px">
            <br>
            <br>
            <h3><%=md.getName()%></h3>
        </div>
        <div class="profile-info" style="margin-left:10px">
            <table class="table text-center">
                <tbody>
                <tr>
                    <th scope="row" >Id:</th>
                    <td><%=md.getId()%></td>
                </tr>
                <tr>
                    <th scope="row">Address:</th>
                    <td><%=md.getAddress()%></td>
                </tr>


                <tr >
                    <th scope="row">Gender:</th>
                    <td><%=md.getGender()%></td>
                </tr>
                <tr>
                    <th scope="row">Phone no:</th>
                    <td><%=md.getPhone()%></td>
                </tr>
                <tr>
                    <th scope="row">E-mail:</th>
                    <td><%=md.getEmail()%></td>
                </tr>
                <tr>
                    <th scope="row">Designation:</th>
                    <td><%=md.getDesignation()%></td>
                </tr>
                <tr>
                    <th scope="row">Salary:</th>
                    <td><%=md.getSalary()%></td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
    <div class="text-center" style="margin-bottom: 5px">
        <button type="button" class="btn btn-primary" style="font-size: 20px;" data-toggle="modal" data-target="#editModal">
            <span class="fas fa-edit"></span>Edit
        </button>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Manager Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Add your form fields here -->
                <form action="update">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="name">Address:</label>
                        <input type="text" class="form-control" name="address" id="address" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="name">Phone:</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                    <!-- Add more form fields as needed -->
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>
