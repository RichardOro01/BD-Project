package cu.edu.cujae.structbd.utils;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;

import java.util.LinkedList;
import java.util.List;

public class DTOUtils {
    public static List<List<String>> dtoListToStringList(List<DTO> dtoList, List<String> columns) {
        List<List<String>> data = new LinkedList<>();
        if (dtoList != null && columns != null) {
            for (DTO dto: dtoList) {
                data.add(dto.getData(columns));
            }
        }
        return data;
    }

}
