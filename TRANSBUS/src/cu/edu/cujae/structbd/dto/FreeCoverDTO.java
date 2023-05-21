package cu.edu.cujae.structbd.dto;

public class FreeCoverDTO {
    private int driverCode;
    private int brandCode;

    public FreeCoverDTO(int driverCode, int brandName) {
        this.driverCode = driverCode;
        this.brandCode = brandName;
    }

    public int getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(int driverCode) {
        this.driverCode = driverCode;
    }

    public int getBrandCode() {
        return brandCode;
    }

    public void setBrandCode(int brandCode) {
        this.brandCode = brandCode;
    }
}
