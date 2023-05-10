package cu.edu.cujae.structbd.services;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BrandServices {
    public void insertBrand(String brandName) throws SQLException {

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

    public List<List<String>> getBrands() throws SQLException, ClassNotFoundException {
        List<List<String>> brandList = new LinkedList<>();
        String queryToExecute = "SELECT * FROM brand";
        java.sql.Connection connection = ServicesLocator.getConnection();
        Statement statement = connection.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
        connection.setAutoCommit(false);
        ResultSet result = statement.executeQuery(queryToExecute);
        int columns = result.getMetaData().getColumnCount();
        while (result.next()) {
            List<String> row = new LinkedList<>();
            for (int i = 1; i <= columns; i++) {
                row.add(result.getString(i));
            }
            brandList.add(row);
        }
        result.close();
        statement.close();
        connection.close();

        return brandList;
    }
}
