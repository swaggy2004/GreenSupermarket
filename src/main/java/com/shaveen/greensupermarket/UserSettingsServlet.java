/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author Jude Darren Victoria
 */
@WebServlet (name = "UserSettingsServlet", urlPatterns = {"/UserSettingsServlet"})
@MultipartConfig
public class UserSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet UserSettingsServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserSettingsServlet at " + request.getContextPath() + "</h1>");
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
        // Retrieve email from the session

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
        // Retrieve form data
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("UserPhone");
        String b_adress = request.getParameter("Bill-Address");
        String b_city = request.getParameter("Bill-City");
        String b_Zipc = request.getParameter("Bill-PC");
        String b_Country = request.getParameter("Bill-country");
        String b_Phone = request.getParameter("Bill-Phone");
         String s_adress = request.getParameter("Shipping-Address");
        String s_city = request.getParameter("Shipping-City");
        String s_Zipc = request.getParameter("Shipping-PC");
        String s_Country = request.getParameter("Shipping-country");
        String s_Phone = request.getParameter("Shipping-UserPhone");
        
        
        
        
        String avatarSavedDirectoryPath = request.getServletContext().getRealPath("/assets/");
        File avatarSavedDirectory = new File(avatarSavedDirectoryPath);
        if (!avatarSavedDirectory.exists()) {
            try {
                avatarSavedDirectory.mkdirs();
            } catch (SecurityException ex) {
                System.out.println("Please fix directory permissions");
                return;
            }
        }

        Part avatarPart = request.getPart("inputGroupFile01");
        String avatar_userprof = avatarPart.getSubmittedFileName();
//        in the log its pointing out the below line as the error
        avatarPart.write(avatarSavedDirectoryPath + File.separator + avatar_userprof);


        // Update user data in the database
        UserDatabaseInteraction.updateUserData(email, fullName, phoneNumber,b_adress,b_city, b_Zipc, b_Country, b_Phone, s_adress, s_city, s_Zipc, s_Country, s_Phone, avatar_userprof);

        response.sendRedirect("UserSettings.jsp");
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
