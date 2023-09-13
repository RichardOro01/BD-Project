package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.DistrictDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.utils.DTOUtils;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;

import javax.swing.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class OthersPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableTourGroup;
    private TableScroll tableFuel;
    private TableScroll tableCountry;
    private TableScroll tableDistrict;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public OthersPanel(){
        add(getTabbedPane());
        add(getInsertButton());
        add(getDeleteButton());
        add(getUpdateButton());
    }

    private JTabbedPane getTabbedPane() {
        if (tabbedPane == null) {
            tabbedPane = new JTabbedPane(JTabbedPane.TOP);
            int y = 60;
            tabbedPane.setBounds(20, y, Definitions.APP_WIDTH-Definitions.SIDE_BAR_WIDTH-Definitions.MARGING-60, Definitions.APP_HEIGHT-y-150);
            tabbedPane.addTab("District", null, getTableDistrict(), null);
            tabbedPane.addTab("Fuel", null, getTableFuel(), null);
            tabbedPane.addTab("Country", null, getTableCountry(), null);
            tabbedPane.addTab("Tour Group", null, getTableTourGroup(), null);
        }
        return tabbedPane;
    }

    public void refresh(Table table){
        try {
            switch (table){
                case TourGruop -> {
                    ServicesLocator.getTourServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getTourDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("group_code", "group_name"));
                    tableTourGroup.setTableData(data);
                }
                case Discrepancies -> {}
                case District -> {
                    ServicesLocator.getDistrictServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getDistrictDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("district_name"));
                    tableDistrict.setTableData(data);
                }
                case Fuel -> {}
            }
        } catch (Exception e) {
            App.getInstance().handleError(e);
        }

    }
    public PButton getInsertButton() {
        if (insertButton == null) {
            insertButton = new PButton("Insert");
            insertButton.setBounds(getTabbedPane().getX(), getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            insertButton.addActionListener(e -> {
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "District":
                        //new DistrictInput();

                        break;
                }
            });
        }
        return insertButton;
    }

    public PButton getDeleteButton() {
        if (deleteButton == null) {
            deleteButton = new PButton("Delete");
            deleteButton.setBounds(getInsertButton().getX()+getInsertButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            deleteButton.addActionListener(e -> {
                try {
                    int index;
                    switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())) {
                        case "District" -> {
                            index = getTableDistrict().getTable().getSelectedRow();
                            if (index >= 0) {
                                int districtCode = DTOLocator.getDistrictDTOList().get(index).getDistrictCode();
                                ServicesLocator.getDistrictServices().delete(districtCode);
                                refresh(Table.Brands);
                            }
                        }
                    }
                } catch (SQLException ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return deleteButton;
    }

    public PButton getUpdateButton() {
        if (updateButton == null) {
            updateButton = new PButton("Update");
            updateButton.setBounds(getDeleteButton().getX()+getDeleteButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            updateButton.addActionListener(e -> {
                int index;
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "District":
                        index = getTableDistrict().getTable().getSelectedRow();
                        if (index >= 0) {
                            DistrictDTO districtDTO = DTOLocator.getDistrictDTOList().get(index);
                            //new DistrictInput(districtDTO);
                        }
                        break;
                }
            });
        }
        return updateButton;
    }


    public TableScroll getTableTourGroup() {
        if (tableTourGroup == null) {
            String[] columns = new String[]{"Code", "Name"};
            tableTourGroup = new TableScroll(columns);
            refresh(Table.TourGruop);
        }
        return tableTourGroup;
    }

    public TableScroll getTableFuel() {
        if (tableFuel == null) {
            String[] columns = new String[]{"Name"};
            tableFuel = new TableScroll(columns);
            refresh(Table.Fuel);
        }
        return tableFuel;
    }

    public TableScroll getTableCountry() {
        if (tableCountry == null) {
            String[] columns = new String[]{"Name"};
            tableCountry = new TableScroll(columns);
            refresh(Table.Country);
        }
        return tableCountry;
    }

    public TableScroll getTableDistrict() {
        if (tableDistrict == null) {
            String[] columns = new String[]{"Name"};
            tableDistrict = new TableScroll(columns);
            refresh(Table.District);
        }
        return tableDistrict;
    }
}
