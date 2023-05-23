package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DiscrepancyDTO;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class DiscrepancyServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_discrepancy(?, ?, ?, ?, ?, ?, ?, ?) }");
            call.setDate(1, (Date) args[0]);
            call.setInt(2, (int) args[1]);
            call.setDouble(3, (double) args[2]);
            call.setDouble(4,(double) args[3]);
            call.setDouble(5,(double) args[4]);
            call.setDouble(6,(double) args[5]);
            call.setDouble(7,(double) args[6]);
            call.setDouble(8,(double) args[7]);
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
            call = connection.prepareCall("{ call update_discrepancy(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }");
            call.setDate(1, (Date) args[0]);
            call.setInt(2, (int) args[1]);
            call.setDate(3, (Date) args[2]);
            call.setInt(4, (int) args[3]);
            call.setDouble(5, (double) args[4]);
            call.setDouble(6,(double) args[5]);
            call.setDouble(7,(double) args[6]);
            call.setDouble(8,(double) args[7]);
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
            call = connection.prepareCall("{ call delete_discrepancy(?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(1, (int) args[1]);
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
            SELECT month_code, discrepancy.car_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel
             FROM discrepancy
             JOIN car ON car.car_code = discrepancy.car_code
             ORDER BY month_code;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<DiscrepancyDTO> discrepancies = DTOLocator.getDiscrepancyDTOList();
        discrepancies.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            DiscrepancyDTO discrepancys = new DiscrepancyDTO(columnNames, list);
            discrepancies.add(discrepancys);
        }
    }
}
