package com.shaveen.greensupermarket;

import jakarta.servlet.annotation.WebServlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "assets";
    public String dbFileName = "";

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
        String productID = request.getParameter("productID");
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("productCategory");
        String visibility = request.getParameter("Visibility");
        String description = request.getParameter("description");
        float unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
        int unitQuantity = Integer.parseInt(request.getParameter("unitQuantity"));
        

        Part filePart = request.getPart("productImage");
        String fileName = extractFileName(filePart);

        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File fileUploadDirectory = new File(uploadPath);
        if (!fileUploadDirectory.exists()) {
            fileUploadDirectory.mkdirs();
        }
        String savePath = uploadPath + File.separator + fileName;

        try {
            if (filePart != null) {
                try (var input = filePart.getInputStream()) {
                    Files.copy(input, new File(savePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                dbFileName = UPLOAD_DIR + File.separator + fileName;

                // Use ManageConnection class to add the product to the database
                ManageConnection sendData = new ManageConnection();
                sendData.addProduct(productID, productName, productCategory, visibility, description, unitPrice, unitQuantity, dbFileName);

                

                

                // Redirect to a success page or display a success message
                /*response.sendRedirect("success.jsp");*/
            } else {
                response.getWriter().println("No file selected.");
            }

        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String extractFileName(Part part) {
        if (part != null) {
            String contentDisp = part.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                if (s.trim().startsWith("filename")) {
                    return s.substring(s.indexOf("=") + 2, s.length() - 1);
                }
            }
        }
        return "";
    }
}
