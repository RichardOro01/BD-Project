package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class ContractDTO implements DTO{
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

    public ContractDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
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

    public void setData(String column, String payload) {
        switch (column) {
            case "contract_code" -> contractCode = Integer.parseInt(payload);
            case "applicant_name" -> applicantName = payload;
            case "start_date" -> startDate = payload;
            case "end_date" -> endDate = payload;
            case "contract_kms" -> contractkms = Double.parseDouble(payload);
            case "contract_amount" -> contractAmount = Double.parseDouble(payload);
            case "contract_country" -> contractCountry = payload;
            case "fleet_number" -> fleetNumber = Integer.parseInt(payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "contract_code" -> result.add(String.valueOf(contractCode));
                case "applicant_name" -> result.add(String.valueOf(applicantName));
                case "start_date" -> result.add(String.valueOf(startDate));
                case "end_date" -> result.add(String.valueOf(endDate));
                case "contract_kms" -> result.add(String.valueOf(contractkms));
                case "contract_amount" -> result.add(String.valueOf(contractAmount));
                case "contract_country" -> result.add(String.valueOf(contractCountry));
                case "fleet_number" -> result.add(String.valueOf(fleetNumber));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }
}
