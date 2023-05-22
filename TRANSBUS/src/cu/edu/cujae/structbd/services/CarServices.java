package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.CarDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class CarServices implements Service {
//
//    @Override
//    public void insert(Object... args) throws SQLException{
//        java.sql.Connection connection = ServicesLocator.getConnection();
//        CallableStatement call = connection.prepareCall("{ call insert_car(?, ?, ?) }");
//        call.setString(1, (String) args[0]);
//        call.setInt(2, (int) args[1]);
//        call.setString(3, (String) args[2]);
//        call.execute();
//        call.close();
//        connection.close();
//    }
//
//    @Override
//    public void update(Object... args) throws SQLException{
//        java.sql.Connection connection = ServicesLocator.getConnection();
//        CallableStatement call = null;
//        try {
//            call = connection.prepareCall("{ call update_car(?, ?, ?, ?) }");
//            call.setInt(1, (int) args[0]);
//            call.setString(2, (String) args[1]);
//            call.setInt(3, (int) args[2]);
//            call.setString(4, (String) args[3]);
//            call.execute();
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        } finally {
//            if (call != null)
//                call.close();
//            connection.close();
//        }
//
//    }
//
//    @Override
//    public void delete(Object... args) throws SQLException{
//        java.sql.Connection connection = ServicesLocator.getConnection();
//        CallableStatement call = null;
//        try {
//            call = connection.prepareCall("{ call delete_car(?) }");
//            call.setString(1, (String) args[0]);
//            call.execute();
//        call.close();
//        connection.close();
//    }

    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_brand(?, ?, ?, ?) }");
            call.setString(1, (String) args[0]);
            call.setInt(2, (int) args[1]);
            call.setInt(3, (int) args[2]);
            call.setDouble(4,(double) args[3]);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }
    @Override
    public void update(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call update_brand(?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setString(2, (String) args[1]);
            call.setInt(3, (int) args[2]);
            call.setInt(4, (int) args[3]);
            call.setDouble(5, (double) args[4]);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }
    @Override
    public void delete(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call delete_brand(?) }");
            call.setInt(1, (int) args[0]);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }

    @Override
    public void refresh() {
        String queryToExecute = "SELECT * FROM car;";
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<CarDTO> cars = DTOLocator.getCarDTOList();
        cars.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            CarDTO car = new CarDTO(columnNames, list);
            cars.add(car);
        }
    }
}
