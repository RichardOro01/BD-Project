package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DistrictDTO;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;

public class DistrictServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_district(?) }");
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
    public void update(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call update_district(?, ?) }");
            call.setInt(1,(int) args[0]);
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
    public void delete(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call delete_district(?) }");
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
            SELECT district_name, district_code
             FROM district
             ORDER BY district_name;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<DistrictDTO> districtDTOList = DTOLocator.getDistrictDTOList();
        districtDTOList.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            DistrictDTO districtDTO = new DistrictDTO(columnNames, list);
            districtDTOList.add(districtDTO);
        }
    }
}
