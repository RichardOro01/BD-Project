package cu.edu.cujae.structbd.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ServicesLocator {
    private static ReferenceTablesServices referenceTablesServices = null;
    private static BrandServices brandServices = null;
    private static ContractServices contractServices = null;
    private static ServiceServices serviceServices = null;
    private static DriverServices driverServices = null;
    private static RoadMapServices roadMapServices = null;
    private static CarServices carServices = null;
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
    public static ReferenceTablesServices getReferenceTablesService(){
        if(referenceTablesServices == null){
            referenceTablesServices = new ReferenceTablesServices();
        }
        return referenceTablesServices;
    }
    public static BrandServices getBrandServices(){
        if(brandServices == null){
            brandServices = new BrandServices();
        }
        return brandServices;
    }
    public static CarServices getCarServices(){
        if(carServices == null){
            carServices = new CarServices();
        }
        return carServices;
    }
    public static ServiceServices getServiceServices(){
        if(serviceServices == null){
            serviceServices = new ServiceServices();
        }
        return serviceServices;
    }
    public static RoadMapServices getRoadMapServices(){
        if(roadMapServices == null){
            roadMapServices = new RoadMapServices();
        }
        return roadMapServices;
    }
    public static ContractServices getContractServices(){
        if(contractServices == null){
            contractServices = new ContractServices();
        }
        return contractServices;
    }
    public static DriverServices getDriverServices(){
        if(driverServices == null){
            driverServices = new DriverServices();
        }
        return driverServices;
    }
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            String url = "jdbc:postgresql://localhost:5432/transbus";
            Properties props = new Properties();
            props.setProperty("user", username);
            props.setProperty("password", password);
            connection = DriverManager.getConnection(url, props);
        } catch (SQLException e) {
            throw new SQLException("Error");
        }
        return connection;
    }
}
