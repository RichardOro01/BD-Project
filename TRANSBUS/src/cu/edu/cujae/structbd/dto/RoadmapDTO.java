package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class RoadmapDTO implements DTO{
    private String roadmapDate;
    private int carCode;
    private int fleetNumber;
    private double kms;
    private String departureTime;

    public RoadmapDTO(String roadmapDate, int carCode, int fleetNumber, double kms, String departureTime) {
        this.roadmapDate = roadmapDate;
        this.carCode = carCode;
        this.fleetNumber = fleetNumber;
        this.kms = kms;
        this.departureTime = departureTime;
    }

    public RoadmapDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "roadmap_date" -> result.add(String.valueOf(roadmapDate));
                case "car_code" -> result.add(String.valueOf(carCode));
                case "fleet_number" -> result.add(String.valueOf(fleetNumber));
                case "kms" -> result.add(String.valueOf(kms));
                case "departure_time" -> result.add(String.valueOf(departureTime));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "roadmap_date" -> roadmapDate = (payload);
            case "car_code" -> carCode = Integer.parseInt((payload));
            case "fleet_number" -> fleetNumber = Integer.parseInt((payload));
            case "kms" -> kms = Double.parseDouble((payload));
            case "departure_time" -> departureTime = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
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

    public void setRoadmapDate(String roadmapDate) {
        this.roadmapDate = roadmapDate;
    }

    public void setCarCode(int carCode) {
        this.carCode = carCode;
    }

    public int getFleetNumber() {
        return fleetNumber;
    }

    public void setFleetNumber(int fleetNumber) {
        this.fleetNumber = fleetNumber;
    }
}
