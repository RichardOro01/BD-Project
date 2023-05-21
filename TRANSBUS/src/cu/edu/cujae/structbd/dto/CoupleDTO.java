package cu.edu.cujae.structbd.dto;

public class CoupleDTO {
    private final int coupleCode;
    private int driver1;
    private int driver2;

    public CoupleDTO(int coupleCode, int driver1, int driver2) {
        this.coupleCode = coupleCode;
        this.driver1 = driver1;
        this.driver2 = driver2;
    }

    public int getCoupleCode() {
        return coupleCode;
    }

    public int getDriver1() {
        return driver1;
    }

    public void setDriver1(int driver1) {
        this.driver1 = driver1;
    }

    public int getDriver2() {
        return driver2;
    }

    public void setDriver2(int driver2) {
        this.driver2 = driver2;
    }
}
