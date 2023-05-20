package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class BrandServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = connection.prepareCall("{ call insert_brand(?, ?, ?, ?) }");
        call.setString(1, (String) args[0]);
        call.setInt(2, (int) args[1]);
        call.setString(3, (String) args[2]);
        call.setDouble(4,(double) args[3]);
        call.execute();
        call.close();
        connection.close();
    }
    @Override
    public void update(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call update_brand(?, ?, ?, ?, ?) }");
        call.setString(1, (String) args[0]);
        call.setString(2, (String) args[1]);
        call.setInt(3, (int) args[2]);
        call.setString(4, (String) args[3]);
        call.setDouble(5, (double) args[4]);
        call.execute();
        call.close();
        connection.close();
    }
    @Override
    public void delete(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call delete_brand(?) }");
        call.setString(1, (String) args[0]);
        call.execute();
        call.close();
        connection.close();
    }

    public List<DTO> getAll() {
        String queryToExecute = "SELECT * FROM brand";
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<DTO> brands = new LinkedList<>();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            BrandDTO brand = new BrandDTO(columnNames, list);
            brands.add(brand);
        }
        return brands;
    }
}
