package cu.edu.cujae.structbd.dto;

public class CarDTO {
    private final int carCode;
    private int fleetNumber;
    private String plate;
    private int brandCode;
    private int coupleCode;

    public CarDTO(int carCode, int fleetNumber, String plate, int brandCode, int coupleCode) {
        this.carCode = carCode;
        this.fleetNumber = fleetNumber;
        this.plate = plate;
        this.brandCode = brandCode;
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

    public int getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(int brandCode) {
        this.brandCode = brandCode;
    }

    public int getCoupleCode() {
        return coupleCode;
    }

    public void setCoupleCode(int coupleCode) {
        this.coupleCode = coupleCode;
    }
}
