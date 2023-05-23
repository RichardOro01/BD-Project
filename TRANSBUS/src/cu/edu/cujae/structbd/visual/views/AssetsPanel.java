package cu.edu.cujae.structbd.visual.views;
import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.utils.DTOUtils;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AssetsPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableBrands;
    private TableScroll tableCars;
    private TableScroll tableContracts;
    private TableScroll tableCouples;
    private TableScroll tableDiscrepancies;
    private TableScroll tableDistricts;
    private TableScroll tableDrivers;
    private TableScroll tableFreeCovers;
    private TableScroll tableReports;
    private TableScroll tableRoadmaps;
    private TableScroll tableServices;
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
            tabbedPane.addTab("Contracts", null, getTableContracts(), null);
            tabbedPane.addTab("Free Covers", null, getTableFreeCovers(), null);
            tabbedPane.addTab("Services", null, getTableServices(), null);
            tabbedPane.addTab("Couples", null, getTableCouples(), null);
            tabbedPane.addTab("Discrepancies", null, getTableDiscrepancies(), null);
            tabbedPane.addTab("Reports", null, getTableReports(), null);
            tabbedPane.addTab("Roadmaps", null, getTableRoadmaps(), null);
            tabbedPane.addTab("District", null, getTableDistricts(), null);
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
                case Couples -> {}
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
                case Reports -> {}
                case District -> {}
                case Roadmaps -> {}
                case Services -> {}
                case Contracts -> {
                    ServicesLocator.getContractServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getContractDTOS());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("applicant_name", "start_date", "end_date", "contract_kms", "contract_amount", "contract_country", "fleet_number"));
                    tableContracts.setTableData(data);
                }
                case Free_Covers -> {}
                case Discrepancies -> {}
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
                        //ManagerInput.showCarInput();
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
                                String number = (String) getTableCars().getTable().getValueAt(index, 0);
                                ServicesLocator.getCarServices().delete(number);
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
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "Brands":
                        int index = getTableBrands().getTable().getSelectedRow();
                        if (index >= 0) {
                            BrandDTO brandDTO = DTOLocator.getBrandDTOList().get(index);
                            new BrandInput(brandDTO);
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

    public TableScroll getTableContracts() {
        if (tableContracts == null) {
            String[] columns = new String[]{"Applicant", "Start date", "End date", "Kms", "Amount", "Country", "Fleet number"};
            tableContracts = new TableScroll(columns);
            refresh(Table.Contracts);
        }
        return tableContracts;
    }

    public TableScroll getTableCouples() {
        if (tableCouples == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableCouples = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableCouples.setTableData(data);
        }
        return tableCouples;
    }

    public TableScroll getTableDiscrepancies() {
        if (tableDiscrepancies == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableDiscrepancies = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableDiscrepancies.setTableData(data);
        }
        return tableDiscrepancies;
    }

    public TableScroll getTableDistricts() {
        if (tableDistricts == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableDistricts = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableDistricts.setTableData(data);
        }
        return tableDistricts;
    }

    public TableScroll getTableDrivers() {
        if (tableDrivers == null) {
            String[] columns = new String[]{"ID", "Name", "Address", "Phone", "District name", "Is free cover"};
            tableDrivers = new TableScroll(columns);
            refresh(Table.Drivers);
        }
        return tableDrivers;
    }

    public TableScroll getTableReports() {
        if (tableReports == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableReports = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableReports.setTableData(data);
        }
        return tableReports;
    }

    public TableScroll getTableRoadmaps() {
        if (tableRoadmaps == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableRoadmaps = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableRoadmaps.setTableData(data);
        }
        return tableRoadmaps;
    }

    public TableScroll getTableServices() {
        if (tableServices == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableServices = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableServices.setTableData(data);
        }
        return tableServices;
    }

    public TableScroll getTableFreeCovers() {
        if (tableFreeCovers == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableFreeCovers = new TableScroll(columns);
            //List<List<String>> data = ServicesLocator.getBrandServices().getAll();
            //tableFreeCovers.setTableData(data);
        }
        return tableFreeCovers;
    }
}
