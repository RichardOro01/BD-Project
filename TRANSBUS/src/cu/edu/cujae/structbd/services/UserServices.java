package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.RoadmapDTO;
import cu.edu.cujae.structbd.dto.UserDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

public class UserServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_user(?, ?, ?, ?) }");
            call.setDate(1, (Date) args[0]);
            call.setInt(2, (int) args[1]);
            call.setDouble(3, (double) args[2]);
            call.setTime(4, (Time) args[3]);
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
            call = connection.prepareCall("{ call update_user(?, ?, ?, ?, ?, ?) }");
            call.setDate(1, (Date) args[0]);
            call.setDate(2, (Date) args[1]);
            call.setInt(3, (int) args[2]);
            call.setInt(4, (int) args[3]);
            call.setDouble(5, (double) args[4]);
            call.setTime(6, (Time) args[5]);
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
            call = connection.prepareCall("{ call delete_user(?) }");
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
        String queryToExecute = """
            SELECT username, password, name, description
             FROM users
             JOIN role ON users.role_code = role.role_code
             ORDER BY username;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<UserDTO> users = DTOLocator.getUserDTOList();
        users.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            UserDTO user = new UserDTO(columnNames, list);
            users.add(user);
        }
    }
}
