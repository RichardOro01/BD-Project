package cu.edu.cujae.structbd.dto;

public class DiscrepancyDTO {
    private String monthCode;
    private int fleetNumber;
    private double plannedKms;
    private double ToursKms;
    private double differenceKms;
    private double plannedFuel;
    private double consumedFuel;
    private double difSpendingFuel;

    public DiscrepancyDTO(String monthCode, int fleetNumber, double plannedKms, double toursKms, double differenceKms, double plannedFuel, double consumedFuel, double difSpendingFuel) {
        this.monthCode = monthCode;
        this.fleetNumber = fleetNumber;
        this.plannedKms = plannedKms;
        ToursKms = toursKms;
        this.differenceKms = differenceKms;
        this.plannedFuel = plannedFuel;
        this.consumedFuel = consumedFuel;
        this.difSpendingFuel = difSpendingFuel;
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
        return ToursKms;
    }

    public void setToursKms(double toursKms) {
        ToursKms = toursKms;
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
