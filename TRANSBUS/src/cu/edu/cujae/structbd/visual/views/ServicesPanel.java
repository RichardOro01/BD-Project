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
import cu.edu.cujae.structbd.visual.components.TextAreaScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ServicesPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableContracts;
    private TableScroll tableDiscrepancies;
    private TableScroll tableRoadmaps;
    private TableScroll tableServices;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public ServicesPanel(){
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
            tabbedPane.addTab("Contracts", null, getTableContracts(), null);
            tabbedPane.addTab("Services", null, getTableServices(), null);
            tabbedPane.addTab("Discrepancies", null, getTableDiscrepancies(), null);
            tabbedPane.addTab("Roadmaps", null, getTableRoadmaps(), null);
        }
        return tabbedPane;
    }

    public void refresh(Table table){
        try {
            switch (table){
                case Roadmaps -> {
                    ServicesLocator.getRoadMapServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getRoadmapDTOList());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("roadmap_date", "fleet_number", "kms", "departure_time"));
                    tableRoadmaps.setTableData(data);
                }
                case Contracts -> {
                    ServicesLocator.getContractServices().refresh();
                    List<DTO> dataDTO = new LinkedList<>(DTOLocator.getContractDTOS());
                    List<List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("applicant_name", "start_date", "end_date", "contract_kms", "contract_amount", "contract_country", "fleet_number"));
                    tableContracts.setTableData(data);
                }
                case Services -> {
                    ServicesLocator.getServiceServices().refresh();
                    java.util.List<DTO> dataDTO = new LinkedList<>(DTOLocator.getServiceDTOList());
                    java.util.List<java.util.List<String>> data = DTOUtils.dtoListToStringList(dataDTO, java.util.List.of("request_number", "service_name", "tour_group_code", "country_name", "pickup_place", "pickup_time", "pax", "service_kms", "amount"));
                    tableServices.setTableData(data);
                }
                case Discrepancies -> {
                    ServicesLocator.getDiscrepancyServices().refresh();
                    java.util.List<DTO> dataDTO = new LinkedList<>(DTOLocator.getDiscrepancyDTOList());
                    java.util.List<java.util.List<String>> data = DTOUtils.dtoListToStringList(dataDTO, List.of("month_code", "fleet_number", "planned_kms", "tours_kms", "difference_kms", "planned_fuel", "consumed_fuel", "dif_spending_fuel"));
                    tableDiscrepancies.setTableData(data);
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
//                try {
//                    int index;
//                    switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())) {
//
//                    }
//                } catch (SQLException ex) {
//                    App.getInstance().handleError(ex);
//                }
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

                }
            });
        }
        return updateButton;
    }


    public TableScroll getTableContracts() {
        if (tableContracts == null) {
            String[] columns = new String[]{"Applicant", "Start date", "End date", "Kms", "Amount", "Country", "Fleet number"};
            tableContracts = new TableScroll(columns);
            refresh(Table.Contracts);
        }
        return tableContracts;
    }

    public TableScroll getTableDiscrepancies() {
        if (tableDiscrepancies == null) {
            String[] columns = new String[]{"Month", "Fleet number", "Planned kms", "Tours kms", "Difference kms", "Planned fuel", "Consumed fuel", "Dif spending fuel"};
            tableDiscrepancies = new TableScroll(columns);
            refresh(Table.Discrepancies);
        }
        return tableDiscrepancies;
    }


    public TableScroll getTableRoadmaps() {
        if (tableRoadmaps == null) {
            String[] columns = new String[]{"Date", "Fleet number", "kms", "Departure time"};
            tableRoadmaps = new TableScroll(columns);
            refresh(Table.Roadmaps);
        }
        return tableRoadmaps;
    }

    public TableScroll getTableServices() {
        if (tableServices == null) {
            String[] columns = new String[]{"request_number", "service_name", "tour_group_code", "country_name", "pickup_place", "pickup_time", "pax", "service_kms", "amount"};
            tableServices = new TableScroll(columns);
            refresh(Table.Services);
        }
        return tableServices;
    }

}
