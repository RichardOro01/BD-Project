package cu.edu.cujae.structbd.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ServicesLocator {
    public static Connection getConnection(){
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("localhost", "admin", "admin");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
