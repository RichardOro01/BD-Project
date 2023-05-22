package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class ServiceDTO implements DTO{
    private int serviceCode;
    private String serviceName;
    private String requestNumber;
    private String tourGroupCode;
    private String countryName;
    private String pickupPlace;
    private String pickupTime;
    private int pax;
    private double serviceKms;
    private double amount;

    public ServiceDTO(int serviceCode, String serviceName, String requestNumber, String tourGroupCode, String countryName, String pickupPlace, String pickupTime, int pax, double serviceKms, double amount) {
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.requestNumber = requestNumber;
        this.tourGroupCode = tourGroupCode;
        this.countryName = countryName;
        this.pickupPlace = pickupPlace;
        this.pickupTime = pickupTime;
        this.pax = pax;
        this.serviceKms = serviceKms;
        this.amount = amount;
    }

    public ServiceDTO(List<String> columnNames, List<String> values) throws RuntimeException {
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
            case "service_code" -> serviceCode = Integer.parseInt((payload));
            case "service_name" -> serviceName = (payload);
            case "request_number" -> requestNumber = (payload);
            case "tour_group_code" -> tourGroupCode = (payload);
            case "country_name" -> countryName = (payload);
            case "pickup_place" -> pickupPlace = (payload);
            case "pickup_time" -> pickupTime = (payload);
            case "pax" -> pax = Integer.parseInt((payload));
            case "service_kms" -> serviceKms = Double.parseDouble((payload));
            case "amount" -> amount = Double.parseDouble((payload));
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "service_code" -> result.add(String.valueOf(serviceCode));
                case "service_name" -> result.add(String.valueOf(serviceName));
                case "request_number" -> result.add(String.valueOf(requestNumber));
                case "tour_group_code" -> result.add(String.valueOf(tourGroupCode));
                case "country_name" -> result.add(String.valueOf(countryName));
                case "pickup_place" -> result.add(String.valueOf(pickupPlace));
                case "pickup_time" -> result.add(String.valueOf(pickupTime));
                case "pax" -> result.add(String.valueOf(pax));
                case "service_kms" -> result.add(String.valueOf(serviceKms));
                case "amount" -> result.add(String.valueOf(amount));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    public int getServiceCode() {
        return serviceCode;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getRequestNumber() {
        return requestNumber;
    }

    public void setRequestNumber(String requestNumber) {
        this.requestNumber = requestNumber;
    }

    public String getTourGroupCode() {
        return tourGroupCode;
    }

    public void setTourGroupCode(String tourGroupCode) {
        this.tourGroupCode = tourGroupCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getPickupPlace() {
        return pickupPlace;
    }

    public void setPickupPlace(String pickupPlace) {
        this.pickupPlace = pickupPlace;
    }

    public String getPickupTime() {
        return pickupTime;
    }

    public void setPickupTime(String pickupTime) {
        this.pickupTime = pickupTime;
    }

    public int getPax() {
        return pax;
    }

    public void setPax(int pax) {
        this.pax = pax;
    }

    public double getServiceKms() {
        return serviceKms;
    }

    public void setServiceKms(double serviceKms) {
        this.serviceKms = serviceKms;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
