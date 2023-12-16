<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Vegetable Catalog</title>
  <link rel="stylesheet" href="vegetables.CSS">
</head>
<body>
     
      <div class="jumbotron d-none d-sm-block">
        <div class="jumbotron-text">
         <br><br> Vegetables
        </div>
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-6 d-flex justify-content-center mb-2">
            <select class="select-box custom-select mr-2">
              <option selected>Select Category</option>
           
            </select>
            <select class="select-box custom-select">
              <option selected>Select Price</option>
     
            </select>
          </div>
          <div class="col-12 col-md-6 d-flex justify-content-center">
            <select class="select-box custom-select mr-2">
              <option selected>Sort by: Latest</option>
              
            </select>
            <select class="select-box custom-select">
              <option selected>Show: 16</option>
             
            </select>
          </div>
        </div>
      </div>
      <br>
      <div class="container">
        <div class="justify-content-center d-flex flex-row flex-wrap">
          <%  
               var item = new FetchProduct();
               var products = item.getProduct();
               for(var product : products){
                   Model.Product Singleproducts = (Model.Product) product;
                   out.print(Helpers.Generator.generateItem(Singleproducts));
               }        
          %>
        </div>
      </div>
</body>
</html>