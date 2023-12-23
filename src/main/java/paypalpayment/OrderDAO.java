/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package paypalpayment;

import Model.OrderDetail;
import Model.OrderProduct;
import com.paypal.api.payments.Order;
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
    
    public static void updateOrderStatusPlaced(HttpSession session) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            int orderId = 1; //TODO: Get the OrderID from the session
            // Assume you have a method to get a database connection
            connection = Model.Connection.start();

            // SQL query to update OrderStatus_Placed to 1
            String updateQuery = "UPDATE order_placed SET OrderStatus_Placed = 1 WHERE OrderID = ?";

            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setInt(1, orderId);

            // Execute the update
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        } finally {
            // Close resources in a finally block
            Model.Connection.start();
        }
    }
}
