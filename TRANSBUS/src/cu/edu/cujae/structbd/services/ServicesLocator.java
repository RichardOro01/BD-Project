package cu.edu.cujae.structbd.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ServicesLocator {
    private static BrandServices brandServices = null;
    private static String username;
    private static String password;

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String username) {
        ServicesLocator.username = username;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        ServicesLocator.password = password;
    }

    public static BrandServices getBrandServices(){
        if(brandServices == null){
            brandServices = new BrandServices();
        }
        return brandServices;
    }
    public static Connection getConnection(){
        Connection connection = null;
        try {
            String url = "jdbc:postgresql://localhost:5432/transbus";
            Properties props = new Properties();
            props.setProperty("user", username);
            props.setProperty("password", password);
            connection = DriverManager.getConnection(url, props);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
