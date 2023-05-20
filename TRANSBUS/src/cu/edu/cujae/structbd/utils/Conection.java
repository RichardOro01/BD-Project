package cu.edu.cujae.structbd.utils;

import cu.edu.cujae.structbd.services.ServicesLocator;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Conection {
    public static List<List<String>> executeQuery (String query) {
        List<List<String>> resultList = new LinkedList<>();
        java.sql.Connection connection = null;
        try {
            connection = ServicesLocator.getConnection();
            Statement statement = connection.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            connection.setAutoCommit(false);
            ResultSet result = statement.executeQuery(query);
            ResultSetMetaData metaData = result.getMetaData();
            int columns = metaData.getColumnCount();
            List<String> columnNames = new LinkedList<>();
            for (int i = 1; i <= columns; i++) {
                columnNames.add(metaData.getColumnName(i));
            }
            resultList.add(columnNames);
            while (result.next()) {
                List<String> row = new LinkedList<>();
                for (int i = 1; i <= columns; i++) {
                    row.add(result.getString(i));
                }
                resultList.add(row);
            }
            result.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultList;
    }

}
