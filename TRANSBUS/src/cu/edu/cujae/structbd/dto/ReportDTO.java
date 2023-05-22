package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class ReportDTO implements DTO{
    private int reportCode;
    private int amoServices;
    private int amoRents;
    private double incomeRents;
    private int amoOthers;
    private double incomeOthers;
    private double incomeTotal;

    public ReportDTO(int reportCode, int amoServices, int amoRents, double incomeRents, int amoOthers, double incomeOthers, double incomeTotal) {
        this.reportCode = reportCode;
        this.amoServices = amoServices;
        this.amoRents = amoRents;
        this.incomeRents = incomeRents;
        this.amoOthers = amoOthers;
        this.incomeOthers = incomeOthers;
        this.incomeTotal = incomeTotal;
    }

    public ReportDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "report_code" -> reportCode = Integer.parseInt((payload));
            case "amo_services" -> amoServices = Integer.parseInt((payload));
            case "amo_rents" -> amoRents = Integer.parseInt((payload));
            case "income_rents" -> incomeRents = Double.parseDouble((payload));
            case "amo_others" -> amoOthers = Integer.parseInt((payload));
            case "income_others" -> incomeOthers = Double.parseDouble((payload));
            case "income_total" -> incomeTotal = Double.parseDouble((payload));
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "report_code" -> result.add(String.valueOf(reportCode));
                case "amo_services" -> result.add(String.valueOf(amoServices));
                case "amo_rents" -> result.add(String.valueOf(amoRents));
                case "income_rents" -> result.add(String.valueOf(incomeRents));
                case "amo_others" -> result.add(String.valueOf(amoOthers));
                case "income_others" -> result.add(String.valueOf(incomeOthers));
                case "income_total" -> result.add(String.valueOf(incomeTotal));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    public int getReportCode() {
        return reportCode;
    }

    public int getAmoServices() {
        return amoServices;
    }

    public void setAmoServices(int amoServices) {
        this.amoServices = amoServices;
    }

    public int getAmoRents() {
        return amoRents;
    }

    public void setAmoRents(int amoRents) {
        this.amoRents = amoRents;
    }

    public double getIncomeRents() {
        return incomeRents;
    }

    public void setIncomeRents(double incomeRents) {
        this.incomeRents = incomeRents;
    }

    public int getAmoOthers() {
        return amoOthers;
    }

    public void setAmoOthers(int amoOthers) {
        this.amoOthers = amoOthers;
    }

    public double getIncomeOthers() {
        return incomeOthers;
    }

    public void setIncomeOthers(double incomeOthers) {
        this.incomeOthers = incomeOthers;
    }

    public double getIncomeTotal() {
        return incomeTotal;
    }

    public void setIncomeTotal(double incomeTotal) {
        this.incomeTotal = incomeTotal;
    }
}
