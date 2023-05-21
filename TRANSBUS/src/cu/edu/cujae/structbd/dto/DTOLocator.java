package cu.edu.cujae.structbd.dto;

import cu.edu.cujae.structbd.services.Service;
import java.util.LinkedList;
import java.util.List;

public class DTOLocator {
    private static List<BrandDTO> brandDTOList;
    private static List<CarDTO> carDTOList;
    private static List<ContractDTO> contractDTOS;
    private static List<CoupleDTO> coupleDTOList;
    private static List<DiscrepancyDTO> discrepancyDTOList;
    private static List<DistrictDTO> districtDTOList;
    private static List<DriverDTO> driverDTOList;
    private static List<FreeCoverDTO> freeCoverDTOList;
    private static List<MonthsDTO> monthsDTOList;
    private static List<ReportDTO> reportDTOList;
    private static List<RoadmapDTO> roadmapDTOList;
    private static List<Service> serviceList;
    private static List<UserDTO> userDTOList;

    public static List<BrandDTO> getBrandDTOList(){
        if(brandDTOList == null){
            brandDTOList = new LinkedList<>();
        }
        return brandDTOList;
    }

    public static List<CarDTO> getCarDTOList() {
        if (carDTOList == null) {
            carDTOList = new LinkedList<>();
        }
        return carDTOList;
    }

    public static List<ContractDTO> getContractDTOS() {
        if (contractDTOS == null) {
            contractDTOS = new LinkedList<>();
        }
        return contractDTOS;
    }

    public static List<CoupleDTO> getCoupleDTOList() {
        if (coupleDTOList == null) {
            coupleDTOList = new LinkedList<>();
        }
        return coupleDTOList;
    }

    public static List<DiscrepancyDTO> getDiscrepancyDTOList() {
        if (discrepancyDTOList == null) {
            discrepancyDTOList = new LinkedList<>();
        }
        return discrepancyDTOList;
    }

    public static List<DistrictDTO> getDistrictDTOList() {
        if (districtDTOList == null) {
            districtDTOList = new LinkedList<>();
        }
        return districtDTOList;
    }

    public static List<DriverDTO> getDriverDTOList() {
        if (driverDTOList == null) {
            driverDTOList = new LinkedList<>();
        }
        return driverDTOList;
    }

    public static List<FreeCoverDTO> getFreeCoverDTOList() {
        if (freeCoverDTOList == null) {
            freeCoverDTOList = new LinkedList<>();
        }
        return freeCoverDTOList;
    }

    public static List<MonthsDTO> getMonthsDTOList() {
        if (monthsDTOList == null) {
            monthsDTOList = new LinkedList<>();
        }
        return monthsDTOList;
    }

    public static List<ReportDTO> getReportDTOList() {
        if (reportDTOList == null) {
            reportDTOList = new LinkedList<>();
        }
        return reportDTOList;
    }

    public static List<RoadmapDTO> getRoadmapDTOList() {
        if (roadmapDTOList == null) {
            roadmapDTOList = new LinkedList<>();
        }
        return roadmapDTOList;
    }

    public static List<Service> getServiceList() {
        if (serviceList == null) {
            serviceList = new LinkedList<>();
        }
        return serviceList;
    }

    public static List<UserDTO> getUserDTO() {
        if (userDTOList == null) {
            userDTOList = new LinkedList<>();
        }
        return userDTOList;
    }
}
