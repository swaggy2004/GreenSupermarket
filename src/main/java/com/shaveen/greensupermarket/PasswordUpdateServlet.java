/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Jude Darren Victoria
 */
@WebServlet(name = "PasswordUpdateServlet", urlPatterns = {"/PasswordUpdateServlet"})
public class PasswordUpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet PasswordUpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordUpdateServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve email from the session
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            // Check if the email is not null before proceeding
            if (email != null) {
                // Retrieve form data
                String currentPassword = request.getParameter("CurrentPassword");
                String newPassword = request.getParameter("NewPassword");
                String confirmPassword = request.getParameter("ConfirmPassword");

                // Validate current password before updating
                if (UserDatabaseInteraction.validateUserPassword(email, currentPassword)) {
                    // Current password is valid, proceed with password update
                    if (newPassword.equals(confirmPassword)) {
                        // Passwords match, update the password in the database
                        UserDatabaseInteraction.updateUserPassword(email, newPassword);
                        out.println("<h3>Password updated successfully!</h3>");
                    } else {
                        out.println("<h3>New password and confirmation do not match. Please try again.</h3>");
                    }
                } else {
                    out.println("<h3>Invalid current password. Please enter the correct current password.</h3>");
                }
            } else {
                // Handle the case where the email is not in the session
                out.println("<h3>Email not found in session. Please log in again.</h3>");
            }
        }
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
