/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
=======
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
@WebServlet(name = "DeleteAdminAccountServlet", urlPatterns = {"/DeleteAdminAccountServlet"})
public class DeleteAdminAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteAdminAccountServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteAdminAccountServlet at " + request.getContextPath() + "</h1>");
            out.println("<title>Servlet DeleteAccountServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteAccountServlet at " + request.getContextPath() + "</h1>");
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
        deleteaccount(request, response);
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
<<<<<<< HEAD
        String email = request.getParameter("email");

        // Perform the deletion in the database using the ManageConnection class
        ManageConnection.deleteAccountByEmail(email);

        // Redirect back to the page displaying manager accounts
        response.sendRedirect("AdminAccount.jsp");
    }

=======
        deleteaccount(request, response);
    }


    private void deleteaccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve email from the session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Check if the email is not null before proceeding
        if (email != null) {
            // Delete the user account from the database
            UserDatabaseInteraction.deleteUserAccount(email);

            // Clear the session attributes
            session.invalidate();

            // Redirect to the login page
            response.sendRedirect("login.jsp");
        } else {
            // Handle the case where the email is not in the session
            // You can redirect to an error page or the login page
            response.sendRedirect("error.jsp");
        }
    }
>>>>>>> main
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
