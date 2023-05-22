package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.FuelDTO;
import cu.edu.cujae.structbd.utils.Conection;

import java.util.List;

public class ReferenceTablesService {
    public void refresh() {
        String queryToExecute = "SELECT * FROM fuel";
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<FuelDTO> fuelDTOList = DTOLocator.getFuelDTOList();
        fuelDTOList.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            FuelDTO fuelDTO = new FuelDTO(columnNames, list);
            fuelDTOList.add(fuelDTO);
        }
    }
}
