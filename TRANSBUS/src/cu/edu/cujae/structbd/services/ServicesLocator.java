package cu.edu.cujae.structbd.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ServicesLocator {
    private static BrandServices brandServices = null;

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
            props.setProperty("user", "postgres");
            props.setProperty("password", "admin");
            connection = DriverManager.getConnection(url, props);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
