package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;

public class DriverServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_driver(?, ?, ?, ?, ?, ?, ?) }");
            call.setString(1, (String) args[0]);
            call.setString(2, (String) args[1]);
            call.setString(3, (String) args[2]);
            call.setString(4,(String) args[3]);
            call.setInt(5,(int) args[4]);
            call.setBoolean(6,(boolean) args[5]);
            call.setInt(7,(int) args[6]);
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
            call = connection.prepareCall("{ call update_driver(?, ?, ?, ?, ?) }");
            call.setInt(1,(int) args[0]);
            call.setString(2, (String) args[1]);
            call.setString(3, (String) args[2]);
            call.setString(4, (String) args[3]);
            call.setString(5,(String) args[4]);
            call.setInt(6,(int) args[5]);
            call.setBoolean(7,(boolean) args[6]);
            call.setInt(8,(int) args[7]);
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
            call = connection.prepareCall("{ call delete_driver(?) }");
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
            SELECT driver_code, id_driver, driver_name, address, phone, district_name, is_free_cover
             FROM driver
             JOIN district ON district.district_code = driver.district_code
             ORDER BY driver_name;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<DriverDTO> drivers = DTOLocator.getDriverDTOList();
        drivers.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            DriverDTO driver = new DriverDTO(columnNames, list);
            drivers.add(driver);
        }
    }
}
