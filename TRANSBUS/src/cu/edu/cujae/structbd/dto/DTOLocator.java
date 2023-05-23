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
    private static List<ServiceDTO> serviceDTOList;
    private static List<RoleDTO> roleDTOList;
    private static List<UserDTO> userDTOList;
    private static List<FuelDTO> fuelDTOList;

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

    public static List<ServiceDTO> getServiceDTOList() {
        if (serviceDTOList == null) {
            serviceDTOList = new LinkedList<>();
        }
        return serviceDTOList;
    }

    public static List<UserDTO> getUserDTOList() {
        if (userDTOList == null) {
            userDTOList = new LinkedList<>();
        }
        return userDTOList;
    }

    public static List<FuelDTO> getFuelDTOList() {
        if (fuelDTOList == null) {
            fuelDTOList = new LinkedList<>();
        }
        return fuelDTOList;
    }
    public static List<RoleDTO> getRoleDTOList() {
        if (roleDTOList == null) {
            roleDTOList = new LinkedList<>();
        }
        return roleDTOList;
    }

}
