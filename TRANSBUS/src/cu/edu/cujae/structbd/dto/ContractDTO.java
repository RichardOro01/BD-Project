package cu.edu.cujae.structbd.dto;

public class ContractDTO {
    private int contractCode;
    private String applicantName;
    private String startDate;
    private String endDate;
    private double contractkms;
    private double contractAmount;
    private String contractCountry;
    private int fleetNumber;

    public ContractDTO(int contractCode, String applicantName, String startDate, String endDate, double contractkms, double contractAmount, String contractCountry, int fleetNumber) {
        this.contractCode = contractCode;
        this.applicantName = applicantName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.contractkms = contractkms;
        this.contractAmount = contractAmount;
        this.contractCountry = contractCountry;
        this.fleetNumber = fleetNumber;
    }

    public int getContractCode() {
        return contractCode;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public double getContractkms() {
        return contractkms;
    }

    public void setContractkms(double contractkms) {
        this.contractkms = contractkms;
    }

    public double getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(double contractAmount) {
        this.contractAmount = contractAmount;
    }

    public String getContractCountry() {
        return contractCountry;
    }

    public void setContractCountry(String contractCountry) {
        this.contractCountry = contractCountry;
    }

    public int getFleetNumber() {
        return fleetNumber;
    }

    public void setFleetNumber(int fleetNumber) {
        this.fleetNumber = fleetNumber;
    }
}
