/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jude Darren Victoria
 */
public class UserSettingRetServlet extends HttpServlet {

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
            out.println("<title>Servlet UserSettingRetServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserSettingRetServlet at " + request.getContextPath() + "</h1>");
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
//            String email = request.getParameter("email");
//        try {
//            var con = Model.Connection.start();
//
//            String query = "SELECT * FROM customer WHERE Email = ?";
//            try (PreparedStatement statement = con.prepareStatement(query)) {
//                statement.setString(1, email);
//
//                try (ResultSet resultSet = statement.executeQuery()) {
//                    if (resultSet.next()) {
//                        // Retrieve data from the result set
//                        String fullName = resultSet.getString("FullName");
//                        String phoneNumber = resultSet.getString("PhoneNumber");
//                        // Add more fields as needed
//
//                        // Set the retrieved data as request attributes
//                        request.setAttribute("fullName", fullName);
//                        request.setAttribute("phoneNumber", phoneNumber);
//                        // Add more attributes as needed
//
//                        // Forward the request to the user settings JSP page
//                        request.getRequestDispatcher("userSettings.jsp").forward(request, response);
//                    } else {
//                        // Handle case when user is not found
//                        response.sendRedirect("errorPage.jsp");
//                    }
//                }
//
//                con.close();
//            } catch (SQLException e) {
//                // Re-throw the SQLException to be caught in the calling method (servlet)
//                throw e;
//            } catch (Exception e) {
//                System.out.println(e);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        }
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
