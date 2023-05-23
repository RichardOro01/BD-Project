package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DriverDTO;
import cu.edu.cujae.structbd.dto.ReportDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;

public class ReportServices implements Service{
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_report(?, ?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(2, (int) args[1]);
            call.setDouble(3, (double) args[2]);
            call.setInt(4,(int) args[3]);
            call.setDouble(5,(double) args[4]);
            call.setDouble(6,(double) args[5]);
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
            call = connection.prepareCall("{ call update_report(?, ?, ?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(2, (int) args[1]);
            call.setInt(3, (int) args[2]);
            call.setDouble(4, (double) args[3]);
            call.setInt(5,(int) args[4]);
            call.setDouble(6,(double) args[5]);
            call.setDouble(7,(double) args[6]);
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
            call = connection.prepareCall("{ call delete_report(?) }");
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
            SELECT report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total
             FROM report
             ORDER BY report_code;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<ReportDTO> reports = DTOLocator.getReportDTOList();
        reports.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            ReportDTO report = new ReportDTO(columnNames, list);
            reports.add(report);
        }
    }
}
