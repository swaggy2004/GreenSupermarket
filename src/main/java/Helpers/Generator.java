/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helpers;

/**
 *
 * @author Shaveen
 */
public class Generator {
    
    public static String generateCard(Model.ManagerAccount manager_acc){
        String role = "M".equals(manager_acc.getType()) ? "Manager" : "Admin";
        return "<div\n" +
"                class=\"row text-start gx-auto gx-md-0 my-auto py-2 px-md-5 border-bottom border-1 text-center text-md-start gap-2 gap-md-0\"\n" +
"        >\n" +
"          <!-- these are the items that will be include in the grid once received from the database -->\n" +
"          <div class=\"col col-md-5 col-sm-12 col-12\">\n" +
"            <div class=\"fs-4\">"+ manager_acc.getFullName()+ "</div>\n" +
"            <!-- made the overflow of the email scrollable because it will be too long -->\n" +
"            <div\n" +
"                    class=\"fs-6 float-center overflow-x-scroll overflow-md-none\"\n" +
"            >\n" +
"              "+ manager_acc.getEmail() +"\n" +
"            </div>\n" +
"          </div>\n" +
"          <div class=\"col col-md-3 col-sm-12 col-12 align-self-md-center\">\n" +
"            "+ role +"\n" +
"          </div>\n" +
"          <div class=\"col col-md-1 col-12 align-self-md-center\">\n" +
"            <button type=\"button\" class=\"btn edit-btn\" onClick = \"window.location='AccountEdit.jsp?email="+manager_acc.getEmail()+"'\" >\n" +
"              <i class=\"bi bi-pencil-square\"></i>\n" +
"            </button>\n" +
"            <button type=\"button\" class=\"btn delete-btn\">\n" +
"              <i class=\"bi bi-trash\"></i>\n" +
"            </button>\n" +
"          </div>\n" +
"        </div>";
    }
    
<<<<<<< HEAD
    
    
=======
    public static String generateItem(Model.Product product){
        return"<div class=\"col-lg-3 col-md-6 mb-3\">\n" +
"            <div class=\"card card-custom\">\n" +
"              <img src=\"assets/images/individual-catalogs/vegetables/img1.svg\" class=\"card-img-top\" alt=\"Ladies Fingers\">\n" +
"              <div class=\"card-body\">\n" +
"                <h5 class=\"card-title1\">" + product.getProductName() + " " + product.getUnitQty() + "g" + "</h5>\n" +
"                <h5 class=\"card-title2\">LKR " + product.getPrice() + "</h5>\n" +
"                <div class=\"circle\">\n" +
"                  <img src=\"assets/images/individual-catalogs/vegetables/cart-icon.svg\" class=\"circle-img\" alt=\"cart-icon\">\n" +
"                </div>\n" +
"              </div>\n" +
"            </div>\n" +
"          </div>";
    }
    
    public static String generateCartItem(Model.Product cartItem){
        return "<div class=\"card mb-3\" style=\"max-width: 1280px;border-radius: 20px;\">\n" +
"                <div class=\"row g-0\">\n" +
"                    <div class=\"col-md-2 \">\n" +
"                        <img src=\"assets/vegi1.png\" style=\"width: 100px\" class=\"img-fluid rounded-start  \" alt=\"...\">\n" +
"                    </div>\n" +
"                    <div class=\"col-md-4 my-auto \">\n" +
"                        <div class=\"card-body\">\n" +
"                            <h5>" + cartItem.getProductName() + "</h5>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-2 my-auto \">\n" +
"                        <div class=\"card-body\">\n" +
"                            <h5>LKR " + cartItem.getPrice() + "</h5>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-2 my-auto \">\n" +
"                        <div class=\"card-body\">\n" +
"                            <div class=\"dropdown\" >\n" +
"                                <button\n" +
"                                        class=\"btn btn-secondary dropdown-toggle \"\n" +
"                                        type=\"button\"\n" +
"                                        data-bs-toggle=\"dropdown\"\n" +
"                                        aria-expanded=\"false\"\n" +
"                                        style=\"background-color:#F6F7F8; color:black;border: none;\"\n" +
"                                >\n" +
"                                    100g\n" +
"                                </button>\n" +
"                                <ul class=\"dropdown-menu\" style=\"background-color: white;\">\n" +
"                                    <li><button class=\"dropdown-item\" type=\"button\">100g</button></li>\n" +
"                                    <li>\n" +
"                                        <button class=\"dropdown-item\" type=\"button\">200g</button>\n" +
"                                    </li>\n" +
"                                    <li>\n" +
"                                        <button class=\"dropdown-item\" type=\"button\">300g</button>\n" +
"                                    </li>\n" +
"                                </ul>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-1 my-auto \">\n" +
"                        <div class=\"card-body\">\n" +
"                            <h5>$569</h5>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                    <div class=\"col-md-1 my-auto \">\n" +
"                        <div class=\"card-body\">\n" +
"                            <button type=\"button\" class=\"btn-close\" aria-label=\"Close\"></button>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>";
    }
>>>>>>> ae2c17c996a3ac1af1917eef87dd44ef8eb13ac8
}
