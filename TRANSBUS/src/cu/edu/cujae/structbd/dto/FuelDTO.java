package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class FuelDTO implements DTO{
    private int fuelCode;
    private String fuelName;

    public FuelDTO(int fuelCode, String fuelName) {
        this.fuelCode = fuelCode;
        this.fuelName = fuelName;
    }

    public FuelDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    public int getFuelCode() {
        return fuelCode;
    }

    public void setFuelName(String brandName) {
        this.fuelName = brandName;
    }

    public String getFuelName() {
        return fuelName;
    }

    public void setData(String column, String payload) {
        switch (column) {
            case "fuel_code" -> fuelCode=Integer.parseInt(payload);
            case "fuel_name" -> fuelName=payload;
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "fuel_code" -> result.add(String.valueOf(fuelCode));
                case "fuel_name" -> result.add(String.valueOf(fuelName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }
}
