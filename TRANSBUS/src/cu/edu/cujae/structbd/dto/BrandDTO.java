package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class BrandDTO implements DTO{
    private String brandName;
    private int amoSeats;
    private String fuelType;
    private double spending;
    private int brandCode;

    public BrandDTO(int brandCode, String brandName, int amoSeats, String fuelType, double spending) {
        this.brandName = brandName;
        this.amoSeats = amoSeats;
        this.fuelType = fuelType;
        this.spending = spending;
        this.brandCode = brandCode;
    }

    public BrandDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getAmoSeats() {
        return amoSeats;
    }

    public void setAmoSeats(int amoSeats) {
        this.amoSeats = amoSeats;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public double getSpending() {
        return spending;
    }

    public void setSpending(double spending) {
        this.spending = spending;
    }

    public int getBrandCode() {
        return brandCode;
    }

    public boolean setData(String column, String payload) {
        switch (column) {
            case "brand_code" -> {brandCode=Integer.parseInt(payload);}
            case "brand_name" -> {brandName=payload;}
            case "amo_seats" -> {amoSeats=Integer.parseInt(payload);}
            case "fuel_type" -> {fuelType=payload;}
            case "spending" -> {spending=Double.parseDouble(payload);}
            default -> {return false;}
        }
        return true;
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "brand_code" -> {result.add(String.valueOf(brandCode));}
                case "brand_name" -> {result.add(brandName);}
                case "amo_seats" -> {result.add(String.valueOf(amoSeats));}
                case "fuel_type" -> {result.add(fuelType);}
                case "spending" -> {result.add(String.valueOf(spending));}
                default -> {}
            }
        }

        return result;
    }
}
