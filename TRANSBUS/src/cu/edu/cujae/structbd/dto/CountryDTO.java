package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class CountryDTO implements DTO{
    private int countryCode;
    private String countryName;

    public CountryDTO(int countryCode, String countryName) {
        this.countryCode = countryCode;
        this.countryName = countryName;
    }

    public CountryDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    public int getCountryCode() {
        return countryCode;
    }

    public void setCountryName(String brandName) {
        this.countryName = brandName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setData(String column, String payload) {
        switch (column) {
            case "country_code" -> countryCode =Integer.parseInt(payload);
            case "country_name" -> countryName =payload;
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "country_code" -> result.add(String.valueOf(countryCode));
                case "country_name" -> result.add(String.valueOf(countryName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }
}