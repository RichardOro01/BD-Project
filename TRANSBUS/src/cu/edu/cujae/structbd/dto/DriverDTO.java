package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class DriverDTO implements DTO{
    private int driverCode;
    private String idDriver;
    private String driverName;
    private String address;
    private String phone;
    private String districtName;
    private boolean isFreeCover;

    public DriverDTO(int driverCode, String idDriver, String driverName, String address, String phone, String districtName, boolean isFreeCover) {
        this.driverCode = driverCode;
        this.idDriver = idDriver;
        this.driverName = driverName;
        this.address = address;
        this.phone = phone;
        this.districtName = districtName;
        this.isFreeCover = isFreeCover;
    }

    public DriverDTO(List<String> columnNames, List<String> values) throws RuntimeException {
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
                case "driver_code" -> result.add(String.valueOf(driverCode));
                case "id_driver" -> result.add(String.valueOf(idDriver));
                case "driver_name" -> result.add(String.valueOf(driverName));
                case "address" -> result.add(String.valueOf(address));
                case "phone" -> result.add(String.valueOf(phone));
                case "district_name" -> result.add(String.valueOf(districtName));
                case "is_free_cover" -> result.add(String.valueOf(isFreeCover));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "driver_code" -> driverCode = Integer.parseInt((payload));
            case "id_driver" -> idDriver = (payload);
            case "driver_name" -> driverName = (payload);
            case "address" -> address = (payload);
            case "phone" -> phone = (payload);
            case "district_name" -> districtName = (payload);
            case "is_free_cover" -> isFreeCover = Boolean.parseBoolean((payload));
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public int getDriverCode() {
        return driverCode;
    }

    public String getIdDriver() {
        return idDriver;
    }

    public void setIdDriver(String idDriver) {
        this.idDriver = idDriver;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public boolean isFreeCover() {
        return isFreeCover;
    }

    public void setFreeCover(boolean freeCover) {
        isFreeCover = freeCover;
    }
}
