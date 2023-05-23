package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.ContractDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class CoupleServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_couple(?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(2, (int) args[1]);
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
            call = connection.prepareCall("{ call update_couple(?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(2, (int) args[1]);
            call.setInt(3, (int) args[2]);
            call.setInt(4, (int) args[3]);
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
            call = connection.prepareCall("{ call delete_couple(?) }");
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
            SELECT couple_code, driver_1, driver_2, driver.driver_name as driver1_name, driver2.driver_name as driver2_name
            FROM couple
            JOIN driver
                ON driver.driver_code = couple.driver_1
            JOIN driver AS driver2 ON couple.driver_2 = driver2.driver_code;
            """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<ContractDTO> contracts = DTOLocator.getContractDTOS();
        contracts.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            ContractDTO contract = new ContractDTO(columnNames, list);
            contracts.add(contract);
        }
    }
}
