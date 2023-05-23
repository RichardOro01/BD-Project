package cu.edu.cujae.structbd.visual.views;
import cu.edu.cujae.structbd.dto.*;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.utils.DTOUtils;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;
import cu.edu.cujae.structbd.visual.inputs.CarInput;
import cu.edu.cujae.structbd.visual.inputs.DriverInput;

import javax.swing.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AssetsPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableBrands;
    private TableScroll tableCars;
    private TableScroll tableDrivers;
    private TableScroll tableCouples;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public AssetsPanel(){
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
            tabbedPane.addTab("Brands", null, getTableBrands(), null);
            tabbedPane.addTab("Cars", null, getTableCars(), null);
            tabbedPane.addTab("Drivers", null, getTableDrivers(), null);
            tabbedPane.addTab("Couples", null, getTableCouples(), null);
        }
        return tabbedPane;
    }

    public void refresh(Table table){
        try {
            switch (table){
                case Brands -> {
                    ServicesLocator.getBrandServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getBrandDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("brand_name", "amo_seats", "fuel_name", "spending"));
                    tableBrands.setTableData(data);
                }
                case Drivers -> {
                    ServicesLocator.getDriverServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getDriverDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("id_driver", "driver_name", "address", "phone", "district_name", "is_free_cover"));
                    tableDrivers.setTableData(data);
                }
                case Cars -> {
                    ServicesLocator.getCarServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getCarDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("fleet_number", "plate", "brand_name", "driver1", "driver2"));
                    tableCars.setTableData(data);
                }
                case Couples -> {
                    ServicesLocator.getCoupleServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getCoupleDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("driver1_name", "driver2_name"));
                    tableCouples.setTableData(data);
                }
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
                    case "Brands":
                        new BrandInput();

                        break;
                    case "Cars":
                        new CarInput();
                        break;
                    case "Drivers":
                        new DriverInput();
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
                        case "Brands" -> {
                            index = getTableBrands().getTable().getSelectedRow();
                            if (index >= 0) {
                                int brandCode = DTOLocator.getBrandDTOList().get(index).getBrandCode();
                                ServicesLocator.getBrandServices().delete(brandCode);
                                refresh(Table.Brands);
                            }
                        }
                        case "Cars" -> {
                            index = getTableCars().getTable().getSelectedRow();
                            if (index >= 0) {
                                int carCode =  DTOLocator.getCarDTOList().get(index).getCarCode();
                                ServicesLocator.getCarServices().delete(carCode);
                                refresh(Table.Cars);
                            }
                        }
                        case "Drivers" -> {
                            index = getTableDrivers().getTable().getSelectedRow();
                            if (index >= 0) {
                                int driverCode =  DTOLocator.getDriverDTOList().get(index).getDriverCode();
                                ServicesLocator.getDriverServices().delete(driverCode);
                                refresh(Table.Drivers);
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
                int index = -1;
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "Brands":
                        index = getTableBrands().getTable().getSelectedRow();
                        if (index >= 0) {
                            BrandDTO brandDTO = DTOLocator.getBrandDTOList().get(index);
                            new BrandInput(brandDTO);
                        }
                        break;
                    case "Cars":
                        index = getTableCars().getTable().getSelectedRow();
                        if (index >= 0) {
                            CarDTO carDTO = DTOLocator.getCarDTOList().get(index);
                            new CarInput(carDTO);
                        }
                        break;
                    case "Drivers":
                        index = getTableDrivers().getTable().getSelectedRow();
                        if (index >= 0) {
                            DriverDTO driverDTO = DTOLocator.getDriverDTOList().get(index);
                            new DriverInput(driverDTO);
                        }
                        break;

                }
            });
        }
        return updateButton;
    }

    public TableScroll getTableBrands() {
        if (tableBrands == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableBrands = new TableScroll(columns);
            refresh(Table.Brands);
        }
        return tableBrands;
    }

    public TableScroll getTableCars() {
        if (tableCars == null) {
            String[] columns = new String[]{"Number", "Plate", "Brand", "Driver 1", "Driver 2"};
            tableCars = new TableScroll(columns);
            refresh(Table.Cars);
        }
        return tableCars;
    }

    public TableScroll getTableCouples() {
        if (tableCouples == null) {
            String[] columns = new String[]{"Driver 1", "Driver 2"};
            tableCouples = new TableScroll(columns);
            refresh(Table.Couples);
        }
        return tableCouples;
    }

    public TableScroll getTableDrivers() {
        if (tableDrivers == null) {
            String[] columns = new String[]{"ID", "Name", "Address", "Phone", "District name", "Is free cover"};
            tableDrivers = new TableScroll(columns);
            refresh(Table.Drivers);
        }
        return tableDrivers;
    }

}
