package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class CarDTO implements DTO{
    private int carCode;
    private int fleetNumber;
    private String plate;
    private String brandName;
    private String driver1;
    private String driver2;

    public CarDTO(int carCode, int fleetNumber, String plate, String brandName, String driver1, String driver2) {
        this.carCode = carCode;
        this.fleetNumber = fleetNumber;
        this.plate = plate;
        this.brandName = brandName;
        this.driver1 = driver1;
        this.driver2 = driver2;
    }

    public CarDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    public int getCarCode() {
        return carCode;
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

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
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

    public void setData(String column, String payload) {
        switch (column) {
            case "car_code" -> carCode = Integer.parseInt(payload);
            case "fleet_number" -> fleetNumber = Integer.parseInt(payload);
            case "plate" -> plate = payload;
            case "driver1" -> driver1 = payload;
            case "driver2" -> driver2 = payload;
            case "brand_name" -> brandName = payload;
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "car_code" -> result.add(String.valueOf(carCode));
                case "fleet_number" -> result.add(String.valueOf(fleetNumber));
                case "plate" -> result.add(String.valueOf(plate));
                case "driver1" -> result.add(String.valueOf(driver1));
                case "driver2" -> result.add(String.valueOf(driver2));
                case "brand_name" -> result.add(String.valueOf(brandName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }
}
