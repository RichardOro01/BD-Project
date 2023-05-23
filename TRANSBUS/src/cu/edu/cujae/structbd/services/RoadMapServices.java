package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.dto.RoadmapDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.*;
import java.util.List;

public class RoadMapServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_roadmap(?, ?, ?, ?) }");
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
            call = connection.prepareCall("{ call update_roadmap(?, ?, ?, ?, ?, ?) }");
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
            call = connection.prepareCall("{ call delete_roadmap(?, ?) }");
            call.setDate(1, (Date) args[0]);
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
            SELECT roadmap_date, roadmap.car_code, fleet_number, kms, departure_time
             FROM roadmap
             JOIN car ON car.car_code = roadmap.car_code
             ORDER BY roadmap_date;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<RoadmapDTO> roadmaps = DTOLocator.getRoadmapDTOList();
        roadmaps.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            RoadmapDTO roadmap = new RoadmapDTO(columnNames, list);
            roadmaps.add(roadmap);
        }
    }
}


