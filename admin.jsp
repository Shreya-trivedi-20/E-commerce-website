<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%@ page import ="com.ecommerce.pojo.*"%>
    <%@ page import ="com.ecommerce.dao.*"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="java.util.*"%>

    <%
         User user2=(User)session.getAttribute("active-user");
         if(user2==null)
         {
        	 session.setAttribute("message","You are not logged in! Login first...");
		     response.sendRedirect("login.jsp");
		     return;
         }
         
         else
         {
             if(user2.getUserType().equals("normal"))
             {
            	 session.setAttribute("message","You are not Admin! Do not Access this...");
                 session.removeAttribute("active-user");
                 response.sendRedirect("login.jsp");
    		     return;
             }     
         }
    %>
    
    <%
        List<Brand> li=new BrandDaoImp().getAllBrand(); 
        List<Cloth> lic=new ClothDaoImp().getAllCloth(); 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page-ShopRight</title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
 <%@ include file="components/navbar.jsp"%>
  
 <div class="container admin mt-2">
     <%@ include file="components/message.jsp"%>
      <div class="row mt-3">
           <div class="col-md-3">
                 <div class="card hover" data-toggle="modal" data-target="#show-users-modal">
                     <div class="card-body text-center">
                         <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/totalUser.jpg" alt="users_pic" >
                         </div>
                         <h1><%=new UserDaoImp().getTotalUser() %></h1>
                         <h2 class="text-uppercase text-muted">Users</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#show-category-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/brand.jpg" alt="users_pic" >
                         </div>
                          <h1><%=new BrandDaoImp().getTotalBrand() %></h1>
                          <h2 class="text-uppercase text-muted">Brands</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#show-cloth-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/cloth.jpg" alt="users_pic" >
                         </div>
                          <h1><%=new ClothDaoImp().getTotalCloth() %></h1>
                          <h2 class="text-uppercase text-muted">Clothes</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#show-product-modal">
                     <div class="card-body text-center">
                           <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/products.jpg" alt="users_pic" >
                           </div>
                           <h1><%=new ProductDaoImp().getTotalProduct() %></h1>
                           <h2 class="text-uppercase text-muted">Products</h2>
                     </div>
                 </div>
           </div>
      </div>
      
      <div class="row mt-3" >
           <div class="col-md-3">
                 <div class="card hover" data-toggle="modal" data-target="#total-order-modal">
                     <div class="card-body text-center">
                         <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/orders.jpg" alt="users_pic" >
                         </div>
                         <h1 class="text-lowercase text-muted"><%=new OrderDaoImp().totalOrdersCount() %></h1>
                         <h2 class="text-uppercase text-muted">Total Orders</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#add-category-modal">
                     <div class="card-body text-center">
                          <div class="container md-5">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/addbrand.jpg" alt="users_pic" >
                         </div>
                          <p class="text-lowercase text-muted mt-2 " style="font-size:22px">click to add brand</p>
                          <h2 class="text-uppercase text-muted mt-1">Add Brands here</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#add-cloth-modal">
                     <div class="card-body text-center">
                          <div class="container md-5">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/addcloth.jpg" alt="users_pic" >
                         </div>
                          <p class="text-lowercase text-muted mt-2 " style="font-size:22px">click to add cloth</p>
                          <h2 class="text-uppercase text-muted mt-1">Add Clothes Types</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-3">
                  <div class="card hover" data-toggle="modal" data-target="#add-product-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="images/addproduct.jpg" alt="users_pic" >
                         </div>
                          <p class="text-lowercase text-muted mt-2 " style="font-size:22px">click to add product</p>
                          <h2 class="text-uppercase text-muted">Add Product</h2>
                     </div>
                 </div>
           </div>
           
      </div>
      
 </div> 
  
<!-- add category modal -->
     
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Fill brand details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
               <input type="hidden" name="action" value="addCategory">
               <div class="form-group">
                   <input type="text" class="form-control" name="categoryTitle" placeholder="Enter Brand Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:250px" class="form-control" name="categoryDescription" placeholder="Enter Brand Description here" required></textarea>
               </div>
               
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Brand</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>
      
      
  <!-- end add category modal -->
  
  <!-- add cloth modal -->
     
<div class="modal fade" id="add-cloth-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Fill Cloth details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
               <input type="hidden" name="action" value="addCloth">
               <div class="form-group">
                   <input type="text" class="form-control" name="clothTitle" placeholder="Enter Cloth Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:250px" class="form-control" name="clothDescription" placeholder="Enter Cloth Description here" required></textarea>
               </div>
               
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Cloth</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>
      
      
  <!-- end add category modal -->
  
  <!-- add product modal -->
     
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add Product details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
               <input type="hidden" name="action" value="addProduct">
               <div class="form-group">
                   <input type="text" class="form-control" name="productTitle" placeholder="Enter Product Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:150px" class="form-control" name="productDescription" placeholder="Enter Product Description here" required></textarea>
               </div>
               
               <div class="form-group">
                   <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price here" required>
               </div>
               
               <div class="form-group">
                   <input type="text" class="form-control" name="productQuantity" placeholder="Enter Product Quantity here" required>
               </div>
               
               <div class="form-group">
                   <input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount in (%)" required>
               </div>
               
               <div class="form-group">
                   <select name="productBrandId" class="form-control">
                       <option value="0">Select Brand</option>
                       <%
                           for(Brand brand:li)
                           {
                       %>
                       <option value="<%=brand.getBrandId()%>"><%=brand.getBrandTitle() %></option>
                       <%
                           }
                       %>
                   </select>
               </div>
               
               <div class="form-group">
                   <select name="productClothId" class="form-control">
                       <option value="0">Select Cloth</option>
                       <%
                           for(Cloth cloth:lic)
                           {
                       %>
                       <option value="<%=cloth.getClothId()%>"><%=cloth.getClothTitle() %></option>
                       <%
                           }
                       %>
                   </select>
               </div>
               
               <div class="form-group">
               <select class="form-control text-center mt-3" id="type" name="productFor">
                <option value="0">Select Type</option>
                <option value="men">Men</option>
                <option value="women">Women</option>
                <option value="boy">Boy</option>
                <option value="girl">Girl</option>
               </select>
               </div>
               
               <div class="form-group">
                   <label>Select Product Pic</label><br>
                   <input type="file" class="form-control" name="productPic" required>
               </div>
               
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Product</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>   
   
  <!-- end add product modal -->
  
  <!-- show users modal -->
     
<div class="modal fade" id="show-users-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Users</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">User Id</th>
      <th scope="col">Photo</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
      <th scope="col">Address</th>
    </tr>
  </thead>
  <tbody>
   <%
      UserDaoImp udao=new UserDaoImp();
      List<User> l=udao.getAllUser("normal");
   %>
  
   <%
      for(User u:l)
      {
   %>
    <tr>
      <th scope="row" class="mid-align"><%=u.getUserId() %></th>
      <td><img style="max-width:70px" class="img-fluid rounded-circle" src="userProfilePic/<%=u.getUserPic() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=u.getUserName() %></td>
      <td class="mid-align"><%=u.getUserEmail() %></td>
      <td class="mid-align"><%=u.getUserPhone() %></td>
      <td class="mid-align"><%=u.getUserAddress() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>
        
<!-- end of show users modal -->

<!-- show category modal -->

<div class="modal fade" id="show-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Brand</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Brand Id</th>
      <th scope="col">Brand Name</th>
      <th scope="col">Brand Description</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   <%
      BrandDaoImp cd=new BrandDaoImp();
      List<Brand> lc=cd.getAllBrand();
   %>
  
   <%
      for(Brand c:lc)
      {
   %>
    <tr>
      <td class="mid-align"><%=c.getBrandId() %></td>
      <td class="mid-align"><%=c.getBrandTitle() %></td>
      <td class="mid-align"><%=c.getBrandDescription() %></td>
      <td class="mid-align"><a href="ProductOperationServlet?categoryId=<%=c.getBrandId()%>&action=deleteCategory"><input type="submit" class="btn btn-danger" value="Delete"></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>

<!-- ********************* -->

<!-- show Cloth modal -->

<div class="modal fade" id="show-cloth-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Clothes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Cloth Id</th>
      <th scope="col">Cloth Name</th>
      <th scope="col">Cloth Description</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   <%
      ClothDaoImp cdd=new ClothDaoImp();
      List<Cloth> lcc=cdd.getAllCloth();
   %>
  
   <%
      for(Cloth c:lcc)
      {
   %>
    <tr>
      <td class="mid-align"><%=c.getClothId() %></td>
      <td class="mid-align"><%=c.getClothTitle() %></td>
      <td class="mid-align"><%=c.getClothDescription() %></td>
      <td class="mid-align"><a href="ProductOperationServlet?clothId=<%=c.getClothId()%>&action=deleteCloth"><input type="submit" class="btn btn-danger" value="Delete"></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>

<!-- ********************* -->

<!-- show Product modal -->

<div class="modal fade" id="show-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-size" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Product Image</th>
      <th scope="col">Product Description</th>
      <th scope="col">Product Brand</th>
      <th scope="col">Product Type</th>
      <th scope="col">Product For</th>
      <th scope="col">Product Price</th>
      <th scope="col">Product Discount</th>
      <th scope="col">Product Quantity</th>
    </tr>
  </thead>
  <tbody>
   <%
      ProductDaoImp pd=new ProductDaoImp();
      List<Product> lp=pd.getAllProduct();
      BrandDaoImp c=new BrandDaoImp();
   %>
  
   <%
      for(Product p:lp)
      {
   %>
    <tr>
      <td class="mid-align"><%=p.getProductTitle() %></td>
      <td class="mid-align"><img style="max-width:70px" class="img-fluid" src="productImages/<%=p.getProductPhoto() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getProductDescription()%></td>
      <td class="mid-align"><%=c.getBrandNameById(p.getCategoryId()) %></td>
      <td class="mid-align"><%=new ClothDaoImp().getClothNameById(p.getClothId()) %></td>
      <td class="mid-align"><%=p.getProductFor() %></td>
      <td class="mid-align"><%=p.getProductPrice() %></td>
      <td class="mid-align"><%=p.getProductDiscount() %></td>
      <td class="mid-align"><%=p.getProductQuantity() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>

<!-- ********************* -->

<!-- total order modal -->

<div class="modal fade bd-example-modal-lg" id="total-order-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-size" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >TOTAL ORDERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body">
        
        <%
            List<Order> lor=new OrderDaoImp().getAllOrder();
            if(lor.isEmpty())
            {
        %>
        <div class="text-center">
        <h1>NO ORDERS MADE BY ANYONE !!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr class="text-center">
      <th scope="col">User Id</th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">User Phone</th>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th>
      <th scope="col">Product Brand</th>
      <th scope="col">Product Size</th>    
      <th scope="col">Qnty</th>
      <th scope="col">Price</th>
      <th scope="col">Ord. date</th>
      <th scope="col">Del. date</th>
      <th scope="col">Set Delivery date</th>
    </tr>
  </thead>
  
 
  
  <tbody>
  
   <%
      for(Order o:lor)
      {
    	  int productId=o.getProdctId();
    	  System.out.println(productId);
    	  Product p1=new Product();
    	  p1=new ProductDaoImp().getProductById(productId);
    	  System.out.println(p1);
    	  User us=new UserDaoImp().getUserByUserId(o.getUserId());
   %>
    <tr class="text-center">
      <td class="mid-align"><%=us.getUserId() %></td>
      <td class="mid-align"><%=us.getUserName() %></td>
      <td class="mid-align"><%=us.getUserEmail() %></td>
      <td class="mid-align"><%=us.getUserPhone() %></td>
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="productImages/<%=p1.getProductPhoto() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p1.getProductTitle() %></td>
      <td class="mid-align"><%= new BrandDaoImp().getBrandNameById(p1.getCategoryId()) %></td>
      <td class="mid-align"><%=o.getProductSize() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%=o.getPrice() %></td>
      <td class="mid-align"><%=o.getOrderesDate() %></td>
      <td class="mid-align"><%if(o.getDeliveryDate().equals("0")){ %><span style="color:red;"> <%="NA"%></span>    <%} else { %> <%=o.getDeliveryDate() %><%} %></td>
      <td class="mid-align">
      <form action="OrderServlet" method="post">
          <input type="hidden" name="action" value="addDelivery">
          <input type="hidden" name="userId" value=<%=us.getUserId() %>>
          <input type="hidden" name="productId" value="<%=p1.getProductId()%>">
          <input type="hidden" name="orderId" value="<%=o.getOrderId()%>">
          <div class="form-group mx-sm-3 mb-2">
            <input type="text" class="form-control" name="deliveryDate" placeholder="Delivery Date" size="85" required>
          </div>
          <button type="submit" class="btn custom-bg text-white mb-2">Set</button>
     </form>
     </td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
</div>
<hr>

<div class="text-center">
      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>
</div>
       <%
            }
       %>
         
      </div>
    </div>
  </div>
</div>

<!--  -->
  
</body>
</html>