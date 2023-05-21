package cu.edu.cujae.structbd.dto;

public class ServiceDTO {
    private int serviceCode;
    private String serviceName;
    private String requestNumber;
    private String tourGroupCode;
    private int countryCode;
    private String pickupPlace;
    private String pickupTime;
    private int pax;
    private double serviceKms;
    private double amount;

    public ServiceDTO(int serviceCode, String serviceName, String requestNumber, String tourGroupCode, int countryCode, String pickupPlace, String pickupTime, int pax, double serviceKms, double amount) {
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.requestNumber = requestNumber;
        this.tourGroupCode = tourGroupCode;
        this.countryCode = countryCode;
        this.pickupPlace = pickupPlace;
        this.pickupTime = pickupTime;
        this.pax = pax;
        this.serviceKms = serviceKms;
        this.amount = amount;
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

    public int getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(int countryCode) {
        this.countryCode = countryCode;
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
