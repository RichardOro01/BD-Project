package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.utils.Conection;

import javax.swing.*;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BrandServices {
    public void insertBrand(String brandName, int amoSeats, String fuelType, double spending) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = connection.prepareCall("{ call insert_brand(?, ?, ?, ?) }");
        call.setString(1, brandName);
        call.setInt(2, amoSeats);
        call.setString(3, fuelType);
        call.setDouble(4, spending);
        call.execute();
        call.close();
        connection.close();
    }

    public void updateBrand(String oldBrandName, String brandName, int amoSeats, String fuelType, double spending) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call update_brand(?, ?, ?, ?, ?) }");
        call.setString(1, oldBrandName);
        call.setString(2, brandName);
        call.setInt(3, amoSeats);
        call.setString(4, fuelType);
        call.setDouble(5, spending);
        call.execute();
        call.close();
        connection.close();
    }

    public void deleteBrand(String brandName) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call delete_brand(?) }");
        call.setString(1, brandName);
        call.execute();
        call.close();
        connection.close();
    }

    public List<List<String>> getBrands() {
        String queryToExecute = "SELECT * FROM brand";
        return Conection.executeQuery(queryToExecute);
    }
}
