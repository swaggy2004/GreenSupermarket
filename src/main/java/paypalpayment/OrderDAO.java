/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paypalpayment;

import Model.EOrderDetail;
import Model.OrderCustomerDetail;
import Model.OrderDetail;
import Model.OrderProduct;
import com.paypal.api.payments.Order;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jude Darren Victoria
 */
public class OrderDAO {
    
    public OrderDetail getOrderDetail(HttpSession session) {
        OrderDetail orderDetail = null;
        int orderId = (int) session.getAttribute("orderId");
        try (Connection connection = Model.Connection.start()) {
            String sql = "SELECT * FROM placed_order WHERE OrderID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, orderId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        float total = resultSet.getFloat("TotalPrice");

                        List<OrderProduct> products = getOrderProducts(session);

                        orderDetail = new OrderDetail(products, total);
                        
                        
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }

        return orderDetail;
    }

    private List<OrderProduct> getOrderProducts(HttpSession session) {
        List<OrderProduct> products = new ArrayList<>();
        int orderId = (int) session.getAttribute("orderId");
        try (Connection connection = Model.Connection.start()) {
            String sql = "SELECT * FROM order_product WHERE OrderID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, orderId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int productId = resultSet.getInt("ProductID");
                        String name = resultSet.getString("Name");
                        int quantity = resultSet.getInt("OPqty");
                        float unitPrice = resultSet.getFloat("PSubTotal");

                        OrderProduct orderProduct = new OrderProduct(productId, name, quantity, unitPrice);
                        products.add(orderProduct);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }

        return products;
    }
    
    
    public OrderDetail getOrderDetailById(int orderId) {
        OrderDetail orderDetail;
        try (Connection connection = Model.Connection.start()) {
            String sql = "SELECT * FROM placed_order WHERE OrderID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, orderId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        orderDetail = extractOrderDetail(resultSet);
                        return orderDetail;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return null;
    }
    
    
     private OrderDetail extractOrderDetail(ResultSet resultSet) throws SQLException {
        int orderId = resultSet.getInt("OrderID");
        float total = resultSet.getFloat("TotalPrice");

        List<OrderProduct> orderProducts = getOrderProductsByOrderId(orderId);

        return new OrderDetail(orderProducts, total);
    }

    private List<OrderProduct> getOrderProductsByOrderId(int orderId) {
        List<OrderProduct> orderProducts = new ArrayList<>();

        try (Connection connection = Model.Connection.start()) {
            String sql = "SELECT * FROM order_product WHERE OrderID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, orderId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        OrderProduct orderProduct = extractOrderProduct(resultSet);
                        orderProducts.add(orderProduct);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        return orderProducts;
    }

    private OrderProduct extractOrderProduct(ResultSet resultSet) throws SQLException {
        int productId = resultSet.getInt("ProductID");
        String name = resultSet.getString("PName");
        int quantity = resultSet.getInt("OPqty");
        float unitPrice = resultSet.getFloat("PPrice");

        return new OrderProduct(productId, name, quantity, unitPrice);
    }
    
    public static void updateOrderStatusPlaced(int orderId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
//            int orderId = 1; //TODO: Get the OrderID from the session
            // Assume you have a method to get a database connection
            connection = Model.Connection.start();

            // SQL query to update OrderStatus_Placed to 1
            String updateQuery = "UPDATE placed_order SET OrderStatus_Placed = 1 WHERE OrderID = ?";

            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, orderId);

            // Execute the update
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            // Close resources in a finally block
            Model.Connection.end();
        }
    }
    
    
    public OrderCustomerDetail getCustomerInformationForOrder(String customerEmail) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        OrderCustomerDetail customer = null;

        try {
            // Establish database connection (replace with your connection logic)
            connection = Model.Connection.start();

            // SQL query to retrieve customer information based on email
            String sql = "SELECT FullName, Email FROM customer WHERE Email = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customerEmail);
            resultSet = preparedStatement.executeQuery();

            // If a matching customer is found, retrieve data
            if (resultSet.next()) {
                String fullName = resultSet.getString("FullName");
                String email = resultSet.getString("Email");

                // Create a Customer object
                customer = new OrderCustomerDetail(fullName, email);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        } finally {
            // Close resources (Connection, PreparedStatement, ResultSet)
            Model.Connection.end();
        }

        return customer;
    }
    
    
    public String getCustomerEmailForOrder(String orderId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String customerEmail = null;

        try {
            // Establish database connection (replace with your connection logic)
            connection = Model.Connection.start();

            // SQL query to retrieve customer email from placed_order based on OrderID
            String sql = "SELECT CEmail FROM placed_order WHERE OrderID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderId);
            resultSet = preparedStatement.executeQuery();

            // If a matching order is found, retrieve customer email
            if (resultSet.next()) {
                customerEmail = resultSet.getString("CEmail");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        } finally {
            // Close resources (Connection, PreparedStatement, ResultSet)
            Model.Connection.end();
        }

        return customerEmail;
    }
    
    
    public static EOrderDetail getOrderDetails(int orderId) {
    EOrderDetail orderDetails = null;
    try (Connection connection = Model.Connection.start()) {
        String sql = "SELECT OrderDate, CEmail, TotalPrice FROM placed_order WHERE OrderID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, orderId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String orderDate = resultSet.getString("OrderDate");
                    String customerEmail = resultSet.getString("CEmail");
                    float totalPrice = resultSet.getFloat("TotalPrice");

                    // Create an OrderDetails object to hold the retrieved data
                    orderDetails = new EOrderDetail(orderDate, customerEmail, totalPrice);
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception appropriately
    }
    return orderDetails;
}


    
    
    
   
    


   

}
