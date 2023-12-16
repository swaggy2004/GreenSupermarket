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
    
    
    
}
