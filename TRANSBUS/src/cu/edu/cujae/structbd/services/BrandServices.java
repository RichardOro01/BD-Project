package cu.edu.cujae.structbd.services;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BrandServices {
    public void insertBrand(String brandName) throws SQLException, ClassNotFoundException {

        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement llamada = null;
        try {

            llamada = connection.prepareCall("{ call insert_brand(?, ?, ?, ?) }");
            llamada.setString(1, brandName);
            llamada.setInt(2, 123);
            llamada.setString(3, "asd");
            llamada.setDouble(4, 123);

            llamada.execute();
            llamada.close();
        } catch (SQLException e) {
            // Manejar excepción
        }
        connection.close();
    }
}
