package cu.edu.cujae.structbd.dto;

public class ReportDTO {
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
