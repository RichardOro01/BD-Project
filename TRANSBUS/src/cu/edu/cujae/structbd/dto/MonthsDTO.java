package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class MonthsDTO implements DTO{
    private int reportCode;
    private String monthCode;

    public MonthsDTO(int reportCode, String monthCode) {
        this.reportCode = reportCode;
        this.monthCode = monthCode;
    }

    public MonthsDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "reportCode" -> result.add(String.valueOf(reportCode));
                case "monthCode" -> result.add(String.valueOf(monthCode));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "reportCode" -> reportCode = Integer.parseInt((payload));
            case "monthCode" -> monthCode = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public int getReportCode() {
        return reportCode;
    }

    public String getMonthCode() {
        return monthCode;
    }
}
