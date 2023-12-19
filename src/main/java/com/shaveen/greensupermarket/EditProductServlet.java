/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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


/**
 *
 * @author DELL
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProductServlet"})
@MultipartConfig
public class EditProductServlet extends HttpServlet {
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("productCategory");
        Boolean visibility = Boolean.parseBoolean(request.getParameter("Visibility"));
        String description = request.getParameter("description");
        float unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
        int unitQuantity = Integer.parseInt(request.getParameter("unitQuantity"));
        

        String imageSavedDirectoryPath = request.getServletContext().getRealPath("/assets/");
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

        // Use ManageConnection class to add the product to the database
        ManageConnection sendData = new ManageConnection();
        sendData.editProduct(productID, productName, productCategory, visibility, description, unitPrice, unitQuantity, imgName);

        }
}
