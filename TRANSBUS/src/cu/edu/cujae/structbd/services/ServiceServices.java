package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.dto.ServiceDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

public class ServiceServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_service(?, ?, ?, ?, ?, ?, ?, ?, ?) }");
            call.setString(1, (String) args[0]);
            call.setInt(2, (int) args[1]);
            call.setString(3, (String) args[2]);
            call.setString(4,(String) args[3]);
            call.setString(5,(String) args[4]);
            call.setTime(6, (Time) args[5]);
            call.setInt(7,(int) args[6]);
            call.setDouble(8,(double) args[7]);
            call.setDouble(9,(double) args[8]);
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
            call = connection.prepareCall("{ call update_service(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setString(2, (String) args[1]);
            call.setInt(3, (int) args[2]);
            call.setString(4, (String) args[3]);
            call.setString(5,(String) args[4]);
            call.setString(6,(String) args[5]);
            call.setTime(7, (Time) args[6]);
            call.setInt(8,(int) args[7]);
            call.setDouble(9,(double) args[8]);
            call.setDouble(10,(double) args[9]);
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
            call = connection.prepareCall("{ call delete_service(?) }");
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
            SELECT service_code, service_name, request_number, tour_group_code, country_name, pickup_place, pickup_time, pax, service_kms, amount
             FROM service
             JOIN country ON service.country_code = country.country_code
             ORDER BY request_number;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<ServiceDTO> services = DTOLocator.getServiceDTOList();
        services.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            ServiceDTO service = new ServiceDTO(columnNames, list);
            services.add(service);
        }
    }
}
