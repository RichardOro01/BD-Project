package cu.edu.cujae.structbd.dto;

public class DistrictDTO {
    private int districtCode;
    private String districtName;

    public DistrictDTO(int districtCode, String districtName) {
        this.districtCode = districtCode;
        this.districtName = districtName;
    }

    public int getDistrictCode() {
        return districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }
}
