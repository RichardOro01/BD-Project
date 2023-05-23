package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.ContractDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class ContractServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_contract(?, ?, ?, ?, ?, ?, ?) }");
            call.setString(1, (String) args[0]);
            call.setDate(2,(Date) args[1]);
            call.setDate(3,(Date) args[2]);
            call.setDouble(4, (Double) args[3]);
            call.setDouble(5, (Double) args[4]);
            call.setString(6, (String) args[5]);
            call.setInt(7, (int) args[6]);
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
            call = connection.prepareCall("{ call update_contract(?, ?, ?, ?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setString(2, (String) args[1]);
            call.setDate(3,(Date) args[2]);
            call.setDate(4,(Date) args[3]);
            call.setDouble(5, (Double) args[4]);
            call.setDouble(6, (Double) args[5]);
            call.setString(7, (String) args[6]);
            call.setInt(8, (int) args[7]);
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
            call = connection.prepareCall("{ call delete_contract(?) }");
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
            SELECT contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number
            FROM contract
                JOIN car
                    ON car.car_code = contract.car_code
            ORDER BY start_date;
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