package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.TourDTO;
import cu.edu.cujae.structbd.dto.UserDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

public class TourServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_tourist_group(?, ?) }");
            call.setString(1, (String) args[0]);
            call.setString(2, (String) args[1]);
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
            call = connection.prepareCall("{ call update_tourist_group(?, ?, ?) }");
            call.setString(1, (String) args[0]);
            call.setString(2, (String) args[1]);
            call.setString(3, (String) args[2]);
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
            call = connection.prepareCall("{ call delete_tourist_group(?) }");
            call.setString(1, (String) args[0]);
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
            SELECT group_code, group_name
             FROM tourist_group
             ORDER BY group_name;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<TourDTO> tours = DTOLocator.getTourDTOList();
        tours.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            TourDTO tour = new TourDTO(columnNames, list);
            tours.add(tour);
        }
    }
}
