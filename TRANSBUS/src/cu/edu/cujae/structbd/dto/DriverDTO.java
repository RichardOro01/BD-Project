package cu.edu.cujae.structbd.dto;

public class DriverDTO {
    private final int driverCode;
    private String idDriver;
    private String driverId;
    private String address;
    private String phone;
    private int districtCode;
    private boolean isFreeCover;

    public DriverDTO(int driverCode, String idDriver, String driverId, String address, String phone, int districtCode, boolean isFreeCover) {
        this.driverCode = driverCode;
        this.idDriver = idDriver;
        this.driverId = driverId;
        this.address = address;
        this.phone = phone;
        this.districtCode = districtCode;
        this.isFreeCover = isFreeCover;
    }

    public int getDriverCode() {
        return driverCode;
    }

    public String getIdDriver() {
        return idDriver;
    }

    public void setIdDriver(String idDriver) {
        this.idDriver = idDriver;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(int districtCode) {
        this.districtCode = districtCode;
    }

    public boolean isFreeCover() {
        return isFreeCover;
    }

    public void setFreeCover(boolean freeCover) {
        isFreeCover = freeCover;
    }
}
