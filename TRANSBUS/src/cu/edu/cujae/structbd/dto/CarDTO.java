package cu.edu.cujae.structbd.dto;

public class CarDTO {
    private int carCode;
    private int fleetNumber;
    private String plate;
    private String brandName;
    private int coupleCode;

    public CarDTO(int carCode, int fleetNumber, String plate, String brandName, int coupleCode) {
        this.carCode = carCode;
        this.fleetNumber = fleetNumber;
        this.plate = plate;
        this.brandName = brandName;
        this.coupleCode = coupleCode;
    }

    public int getCarCode() {
        return carCode;
    }

    public int getFleetNumber() {
        return fleetNumber;
    }

    public void setFleetNumber(int fleetNumber) {
        this.fleetNumber = fleetNumber;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getCoupleCode() {
        return coupleCode;
    }

    public void setCoupleCode(int coupleCode) {
        this.coupleCode = coupleCode;
    }
}
