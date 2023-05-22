package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class FreeCoverDTO implements DTO{
    private int driverCode;
    private int brandCode;
    private String driverName;
    private String brandName;


    public FreeCoverDTO(int driverCode, int brandCode, String driverName, String brandName) {
        this.driverCode = driverCode;
        this.brandCode = brandCode;
        this.driverName = driverName;
        this.brandName = brandName;
    }

    public FreeCoverDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "driver_code" -> driverCode = Integer.parseInt((payload));
            case "brand_code" -> brandCode = Integer.parseInt((payload));
            case "driver_name" -> driverName = (payload);
            case "brand_name" -> brandName = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "driver_code" -> result.add(String.valueOf(driverCode));
                case "brand_code" -> result.add(String.valueOf(brandCode));
                case "driver_name" -> result.add(String.valueOf(driverName));
                case "brand_name" -> result.add(String.valueOf(brandName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
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
    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getBrandName() {
        return brandName;
    }
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

}
