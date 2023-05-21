package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
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
        call.setInt(3, (int) args[2]);
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
        call.setInt(1, (int) args[0]);
        call.setString(2, (String) args[1]);
        call.setInt(3, (int) args[2]);
        call.setInt(4, (int) args[3]);
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
        call.setInt(1, (int) args[0]);
        call.execute();
        call.close();
        connection.close();
    }

    @Override
    public void refresh() {
        String queryToExecute = "SELECT * FROM brand";
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<BrandDTO> brands = DTOLocator.getBrandDTOList();
        brands.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            BrandDTO brand = new BrandDTO(columnNames, list);
            brands.add(brand);
        }
    }
}
