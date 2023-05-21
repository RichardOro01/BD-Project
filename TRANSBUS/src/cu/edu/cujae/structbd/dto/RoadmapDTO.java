package cu.edu.cujae.structbd.dto;

public class RoadmapDTO {
    private String roadmapDate;
    private int carCode;
    private double kms;
    private String departureTime;

    public RoadmapDTO(String roadmapDate, int carCode, double kms, String departureTime) {
        this.roadmapDate = roadmapDate;
        this.carCode = carCode;
        this.kms = kms;
        this.departureTime = departureTime;
    }

    public String getRoadmapDate() {
        return roadmapDate;
    }

    public int getCarCode() {
        return carCode;
    }

    public double getKms() {
        return kms;
    }

    public void setKms(double kms) {
        this.kms = kms;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }
}
