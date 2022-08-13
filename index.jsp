<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.ecommerce.pojo.*"%>
    <%@ page import ="com.ecommerce.dao.*"%>
    <%@ page import ="java.sql.*"%>
    <%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home- ShopRight</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="components/navbar.jsp"%>
    
    <%
         String searchResult=(String)request.getAttribute("enteredText");
         String prodFor=(String)request.getAttribute("prodFor");
         String bId=(String)request.getAttribute("bId");
         String cId=(String)request.getAttribute("cId");
         String prodRange=(String)request.getAttribute("prodRange");
         String cat=request.getParameter("category"); 
         String cloId=request.getParameter("cloth"); 
         ProductDaoImp pdao=new ProductDaoImp();
         BrandDaoImp cdao1=new BrandDaoImp();
         List<Product> l1=null;
         List<Brand> cl1=cdao1.getAllBrand();        
        
         if(cat==null && cloId==null)
         {
        	 cat="0";
        	 cloId="0";
        	 if(cat.trim().equals("0")&&cloId.trim().equals("0"))
             {
              	l1 =pdao.getAllProduct();
             }
         }
        
         
         else if(cloId!=null)
         {
        	 
        	 if(cloId.equals("0"))
        	 {
        		 l1 =pdao.getAllProduct();
        	 }
        	 
        	 else
        	 {
        		 int clotId=Integer.parseInt(cloId.trim());
                 l1=pdao.getProductByCloth(clotId);
        	 }
        	 	
         }
         
         else
         {
        	 if(cat.equals("0"))
        	 {
        		 l1 =pdao.getAllProduct();
        	 }
        	 
        	 else
        	 {
        	
             int categoryId=Integer.parseInt(cat.trim());
             l1=pdao.getProductByCategory(categoryId);	 
             
        	 }
              
         }
       
    %>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" style="width:100%">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/caro1.jpeg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/caro2.jpeg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/caro3.jpeg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<div class="text-center"><%@ include file="components/message.jsp"%></div>
<div class="container-fluid">

   <!-- show categories -->
   
<div class="row">
  <div class="col-md-2 mt-4 admin" >
  
  <div class="card">
          
       <div class="card-header text-center">
            <h4>Search Smartly </h4>
       </div>   
                              
       <div class="card-body">
        <form action="ProductOperationServlet" method="post">
        
        <input type="hidden" name="action" value="searchSmartly">
        
        
  <div class="form-group">
    
     <select class="form-control custom-bg text-center" id="brand" name="brandId">
            <option value="0">Select Brand</option>
            <%
                    for(Brand c: cl1)
                    {    	
            %> 
                         <option value="<%=c.getBrandId() %>"><%=c.getBrandTitle() %></option>
                              
           <%
                    }
            %>
     </select>
     
     <select class="form-control custom-bg text-center mt-3" id="cloth" name="clothId">
            <option value="0">Select Cloth</option>
            <%
                    for(Cloth c: cll)
                    {    	
            %> 
                         <option value="<%=c.getClothId() %>"><%=c.getClothTitle() %></option>
                              
           <%
                    }
            %>
     </select>

     <select class="form-control custom-bg text-center mt-3" id="type" name="productFT">
            <option value="0">Select Type</option>
            <option value="Men">Men</option>
            <option value="Women">Women</option>
            <option value="Boy">Boy</option>
            <option value="Girl">Girl</option>
            
        </select>
     
     <div class="form-check mt-3">
        <input class="form-check-input" type="radio" name="priceRange" id="exampleRadios1" value="500" checked>
        <label class="form-check-label" for="exampleRadios1">
         <b>Under price &#8377;500</b>
        </label>
     </div>
    
    <div class="form-check">
      <input class="form-check-input" type="radio" name="priceRange" id="exampleRadios2" value="1000">
      <label class="form-check-label" for="exampleRadios2">
        <b>Under price &#8377;1000</b>
      </label>
    </div>
    
    <div class="form-check">
      <input class="form-check-input" type="radio" name="priceRange" id="exampleRadios2" value="2000">
      <label class="form-check-label" for="exampleRadios2">
        <b>Under price &#8377;2000</b>
      </label>
    </div>
    
    <div class="form-check">
      <input class="form-check-input" type="radio" name="priceRange" id="exampleRadios2" value="2001">
      <label class="form-check-label" for="exampleRadios2">
        <b>Under price > &#8377;2000</b>
      </label>
    </div>
  
</div>
   
  <button type="submit" class="btn custom-bg" style="width:200px;">Search</button>

 </form>   
       </div>
                             
 </div>
  
  
</div>     
   
   
   
   <!-- ****************************************** -->

   <!-- show products -->
   
   <%
       if(searchResult!=null)
       {
    	   List<Product> listOfProductFromSearch=new ProductDaoImp().getSearchedProduct(searchResult);
   %>
     
     <div class="col-md-10">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p:listOfProductFromSearch)
                             {
                         %>
                         <div class="card p-2"  >
                        
                             <img src="productImages/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body" >
                                <h5 class="text-muted">Brand: <%=new BrandDaoImp().getBrandNameById(p.getCategoryId()) %> (<%=new ClothDaoImp().getClothNameById(p.getClothId()) %>) for: <%=p.getProductFor() %></h5>
                                <a href="product.jsp?productId=<%=p.getProductId() %>" style="text-decoration: none;color:black;"> <h5 class="card-title" ><%=p.getProductTitle() %></h5></a>
                                 <p class="card-text"><%=Helper.get10Words(p.getProductDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getProductPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getProductDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getProductQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getProductQuantity()%><% } %></span>
                             </div>
                            
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
         
     <%
         } 
   
       else if(bId!=null && cId!=null && prodFor!=null && prodRange!=null)
       {
    	  
    	   int brId=Integer.parseInt(bId);
    	   int clId=Integer.parseInt(cId);
    	   int proRange=Integer.parseInt(prodRange);

    	   List<Product> listOfProductFromSearch=new ProductDaoImp().getSearchedProduct(prodFor, brId, clId, proRange);
     %>
           <div class="col-md-10">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p:listOfProductFromSearch)
                             {
                         %>
                         <div class="card p-2"  >
                        
                             <img src="productImages/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body" >
                                <h5 class="text-muted">Brand: <%=new BrandDaoImp().getBrandNameById(p.getCategoryId()) %> (<%=new ClothDaoImp().getClothNameById(p.getClothId()) %>) for: <%=p.getProductFor() %></h5>
                                <a href="product.jsp?productId=<%=p.getProductId() %>" style="text-decoration: none;color:black;"> <h5 class="card-title" ><%=p.getProductTitle() %></h5></a>
                                 <p class="card-text"><%=Helper.get10Words(p.getProductDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getProductPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getProductDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getProductQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getProductQuantity()%><% } %></span>
                             </div>
                            
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
     <%
       }
   
       else
       {
     %> 
          <div class="col-md-10 ">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p:l1)
                             {
                         %>
                        
                         <div class="card">
                              
                             <img src="productImages/<%=p.getProductPhoto() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body">
                                 <h5 class="text-muted">Brand: <%=new BrandDaoImp().getBrandNameById(p.getCategoryId()) %> (<%=new ClothDaoImp().getClothNameById(p.getClothId()) %>) for: <%=p.getProductFor() %></h5>
                                 <h5 class="card-title"><a href="product.jsp?productId=<%=p.getProductId()%>" style="text-decoration: none;color:black;"> <%=p.getProductTitle() %></a></h5>
                                 <p class="card-text"><%=Helper.get10Words(p.getProductDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=Helper.getProductSellingPrice(p.getProductPrice(), p.getProductDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getProductPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getProductDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getProductQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getProductQuantity()%><% } %></span>
                             </div>
                             
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
     <%
       }
     %>
         
      <!-- ******* -->
 
   
         
    </div>
 </div>
</body>
</html>