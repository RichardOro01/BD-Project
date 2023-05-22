package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class DiscrepancyDTO implements DTO{
    private String monthCode;
    private int fleetNumber;
    private double plannedKms;
    private double toursKms;
    private double differenceKms;
    private double plannedFuel;
    private double consumedFuel;
    private double difSpendingFuel;

    public DiscrepancyDTO(String monthCode, int fleetNumber, double plannedKms, double toursKms, double differenceKms, double plannedFuel, double consumedFuel, double difSpendingFuel) {
        this.monthCode = monthCode;
        this.fleetNumber = fleetNumber;
        this.plannedKms = plannedKms;
        this.toursKms = toursKms;
        this.differenceKms = differenceKms;
        this.plannedFuel = plannedFuel;
        this.consumedFuel = consumedFuel;
        this.difSpendingFuel = difSpendingFuel;
    }

    public DiscrepancyDTO(List<String> columnNames, List<String> values) throws RuntimeException {
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
                case "month_code" -> result.add(String.valueOf(monthCode));
                case "fleet_number" -> result.add(String.valueOf(fleetNumber));
                case "planned_kms" -> result.add(String.valueOf(plannedKms));
                case "tours_kms" -> result.add(String.valueOf(toursKms));
                case "difference_kms" -> result.add(String.valueOf(differenceKms));
                case "planned_fuel" -> result.add(String.valueOf(plannedFuel));
                case "consumed_fuel" -> result.add(String.valueOf(consumedFuel));
                case "dif_spending_fuel" -> result.add(String.valueOf(difSpendingFuel));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "month_code" -> monthCode = (payload);
            case "fleet_number" -> fleetNumber = Integer.parseInt((payload));
            case "planned_kms" -> plannedKms = Double.parseDouble((payload));
            case "tours_kms" -> toursKms = Double.parseDouble((payload));
            case "difference_kms" -> differenceKms = Double.parseDouble((payload));
            case "planned_fuel" -> plannedFuel = Double.parseDouble((payload));
            case "consumed_fuel" -> consumedFuel = Double.parseDouble((payload));
            case "dif_spending_fuel" -> difSpendingFuel = Double.parseDouble((payload));
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public String getMonthCode() {
        return monthCode;
    }

    public int getFleetNumber() {
        return fleetNumber;
    }

    public double getPlannedKms() {
        return plannedKms;
    }

    public void setPlannedKms(double plannedKms) {
        this.plannedKms = plannedKms;
    }

    public double getToursKms() {
        return toursKms;
    }

    public void setToursKms(double toursKms) {
        this.toursKms = toursKms;
    }

    public double getDifferenceKms() {
        return differenceKms;
    }

    public void setDifferenceKms(double differenceKms) {
        this.differenceKms = differenceKms;
    }

    public double getPlannedFuel() {
        return plannedFuel;
    }

    public void setPlannedFuel(double plannedFuel) {
        this.plannedFuel = plannedFuel;
    }

    public double getConsumedFuel() {
        return consumedFuel;
    }

    public void setConsumedFuel(double consumedFuel) {
        this.consumedFuel = consumedFuel;
    }

    public double getDifSpendingFuel() {
        return difSpendingFuel;
    }

    public void setDifSpendingFuel(double difSpendingFuel) {
        this.difSpendingFuel = difSpendingFuel;
    }
}
