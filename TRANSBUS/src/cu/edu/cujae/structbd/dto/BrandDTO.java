package cu.edu.cujae.structbd.dto;

public class BrandDTO {
    private String brandName;
    private int amoSeats;
    private String fuelType;
    private double spending;
    private int brandCode;

    public BrandDTO(int brandCode, String brandName, int amoSeats, String fuelType, double spending) {
        this.brandName = brandName;
        this.amoSeats = amoSeats;
        this.fuelType = fuelType;
        this.spending = spending;
        this.brandCode = brandCode;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getAmoSeats() {
        return amoSeats;
    }

    public void setAmoSeats(int amoSeats) {
        this.amoSeats = amoSeats;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public double getSpending() {
        return spending;
    }

    public void setSpending(double spending) {
        this.spending = spending;
    }

    public int getBrandCode() {
        return brandCode;
    }
}
