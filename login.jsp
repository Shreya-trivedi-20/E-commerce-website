<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login-ShopRight</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
  <%@ include file="components/navbar.jsp"%>
  <div class="container">
     <div class="row">
         <div class="col-md-6 offset-md-3 admin">
            
              <div class="card mt-3">
              <%@ include file="components/message.jsp"%>
                 <div class="card-header custom-bg text-white">
                     <h3>Login here.!!</h3>
                 </div>
                 
                 <div class="card-body">
                     <form action="LoginServlet" method="post">
                       <div class="form-group">
                           <label for="exampleInputEmail1">Email address</label>
                           <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter email" required>
                       </div>
                       <div class="form-group">
                           <label for="exampleInputPassword1">Password</label>
                           <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
                       </div>
                       
                       <div class="container text-center mb-3">
                            If not registered,<a href="register.jsp"> Click here.</a>
                       </div>
                       
                       <div class="container text-center">
                            <button type="submit" class="btn text-white custom-bg">Submit</button>
                       </div>
                     </form>
                 </div>
                 
              </div>
            
         </div>
     </div>
  </div>
</body>
</html>