package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.utils.Conection;

import javax.swing.*;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class CarServices implements Service {
    @Override
    public List<List<String>> getAll() {
        String queryToExecute = "SELECT * FROM car";
        return Conection.executeQuery(queryToExecute);
    }

    @Override
    public void insert(Object... args) throws SQLException{
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = connection.prepareCall("{ call insert_car(?, ?, ?) }");
        call.setString(1, (String) args[0]);
        call.setInt(2, (int) args[1]);
        call.setString(3, (String) args[2]);
        call.execute();
        call.close();
        connection.close();
    }

    @Override
    public void update(Object... args) throws SQLException{
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call update_car(?, ?, ?, ?) }");
        call.setInt(1, (int) args[0]);
        call.setString(2, (String) args[1]);
        call.setInt(3, (int) args[2]);
        call.setString(4, (String) args[3]);
        call.execute();
        call.close();
        connection.close();
    }

    @Override
    public void delete(Object... args) throws SQLException{
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        call = connection.prepareCall("{ call delete_car(?) }");
        call.setString(1, (String) args[0]);
        call.execute();
        call.close();
        connection.close();
    }
}
