package cu.edu.cujae.structbd.dto;

public class CoupleDTO {
    private int coupleCode;
    private String driver1;
    private String driver2;

    public CoupleDTO(int coupleCode, String driver1, String driver2) {
        this.coupleCode = coupleCode;
        this.driver1 = driver1;
        this.driver2 = driver2;
    }

    public int getCoupleCode() {
        return coupleCode;
    }

    public String getDriver1() {
        return driver1;
    }

    public void setDriver1(String driver1) {
        this.driver1 = driver1;
    }

    public String getDriver2() {
        return driver2;
    }

    public void setDriver2(String driver2) {
        this.driver2 = driver2;
    }
}
