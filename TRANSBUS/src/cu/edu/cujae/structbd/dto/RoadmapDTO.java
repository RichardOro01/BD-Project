package cu.edu.cujae.structbd.dto;

public class RoadmapDTO {
    private String roadmapDate;
    private int fleetNumber;
    private double kms;
    private String departureTime;

    public RoadmapDTO(String roadmapDate, int fleetNumber, double kms, String departureTime) {
        this.roadmapDate = roadmapDate;
        this.fleetNumber = fleetNumber;
        this.kms = kms;
        this.departureTime = departureTime;
    }

    public String getRoadmapDate() {
        return roadmapDate;
    }

    public int getFleetNumber() {
        return fleetNumber;
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
