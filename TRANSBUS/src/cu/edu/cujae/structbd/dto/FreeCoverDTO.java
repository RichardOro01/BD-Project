package cu.edu.cujae.structbd.dto;

public class FreeCoverDTO {
    private String idDriver;
    private String brandName;

    public FreeCoverDTO(String idDriver, String brandName) {
        this.idDriver = idDriver;
        this.brandName = brandName;
    }

    public String getIdDriver() {
        return idDriver;
    }

    public void setIdDriver(String idDriver) {
        this.idDriver = idDriver;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
