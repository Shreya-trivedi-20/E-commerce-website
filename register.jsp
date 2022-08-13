<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register-ShopRight</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
  <%@ include file="components/navbar.jsp"%>
  
 <div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="images/regis.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Register here..!!</h3>
            <form action="RegisterServlet" method="post" enctype="multipart/form-data">
                 <div class="form-group">
                     <label for="name">User Name</label>
                     <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="username" placeholder="Enter Username" required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">User Email</label>
                     <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="useremail" placeholder="Enter Email" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">User Password</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="userpassword" placeholder="Enter Password" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="phone">User Phone</label>
                     <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" name="userphone" placeholder="Enter Phone" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="phone">User Address</label>
                     <textarea style="height:90px" class="form-control" placeholder="Enter Address" name="useraddress" required></textarea>
                 </div>
                 
                 <div class="form-group">
                   <label>Select Product Pic</label><br>
                   <input type="file" class="form-control" name="productPic" required>
               </div>
                 
                 <div class="container text-center">
                      <button class="btn text-white custom-bg">Register</button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>