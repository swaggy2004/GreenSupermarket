package com.shaveen.greensupermarket;

import jakarta.servlet.annotation.WebServlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
//import java.nio.file.Files;
//import java.nio.file.StandardCopyOption;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;


@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
@MultipartConfig
public class AddProductServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("productCategory");
        Boolean visibility = Boolean.parseBoolean(request.getParameter("Visibility"));
        String description = request.getParameter("description");
        float unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
        int unitQuantity = Integer.parseInt(request.getParameter("unitQuantity"));
        
        
        String imageSavedDirectoryPath = request.getServletContext().getRealPath("/assets/productimages");
        File imageSavedDirectory = new File(imageSavedDirectoryPath);
        if (!imageSavedDirectory.exists()) {
            try {
                imageSavedDirectory.mkdirs();
            } catch (SecurityException ex) {
                System.out.println("Please fix directory permissions");
                return;
            }
        }

    
        Part imgPart = request.getPart("productImage");
        String imgName = imgPart.getSubmittedFileName();
        imgPart.write(imageSavedDirectoryPath + File.separator + imgName);
        String imgNameWithPath = "assets/productimages/" + imgName;

        ManageConnection sendData = new ManageConnection();
        sendData.addProduct(productName, productCategory, visibility, description, unitPrice, unitQuantity, imgNameWithPath);
        response.sendRedirect("AdminAddProduct.jsp");
        }
}


      
