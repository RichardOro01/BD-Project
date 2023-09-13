package cu.edu.cujae.structbd.visual.views;

import com.toedter.calendar.JDateChooser;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.FuelDTO;
import cu.edu.cujae.structbd.dto.TourDTO;
import cu.edu.cujae.structbd.jaspersoft.JasperLocator;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TextAreaScroll;
import cu.edu.cujae.structbd.visual.components.input.InputSelect;
import cu.edu.cujae.structbd.visual.components.input.Option;

import javax.swing.*;
import java.util.Date;

public class ReportsPDFPanel extends JPanel {
    private PButton tourCountriesButton;
    private PButton top3GroupsByActivityButton;
    private PButton top5DriversByserviceButton;
    private PButton contractsInPeriodButton;
    private PButton driversWorkedTourGroupButton;
    private JDateChooser startContractDataChooser;
    private JDateChooser endContractDataChooser;
    private JDateChooser startTouristChooser;
    private JDateChooser endTouristDataChooser;
    private InputSelect groupTourSelect;
    private InputSelect driverTourSelect;
    private PButton touristGroupActivitiesButton;
    private TextAreaScroll developers;

    public ReportsPDFPanel(){

        add(getTourCountriesButton());
        add(getTop3GroupsByActivityButton());
        add(getTop5DriversByserviceButton());
        add(getContractsInPeriodButton());
        add(getDriversWorkedTourGroupButton());
        add(getTouristGroupActivitiesButton());
        add(getEndContractDataChooser());
        add(getEndTouristChooser());
        add(getStartContractDataChooser());
        add(getStartTouristChooser());
        add(getGroupTourSelect());
        add(getDriverTourSelect());
    }


    public PButton getTourCountriesButton() {
        if (tourCountriesButton ==null) {
            tourCountriesButton =  new PButton("Tour Countries");
            tourCountriesButton.setBounds(20, 20, 150, 25);
            tourCountriesButton.addActionListener(e -> {
                JasperLocator.tourCountries();
            });
        }
        return tourCountriesButton;
    }
    public PButton getTop3GroupsByActivityButton() {
        if (top3GroupsByActivityButton ==null) {
            top3GroupsByActivityButton =  new PButton("Top 3 Groups");
            top3GroupsByActivityButton.setBounds(20, 50, 150, 25);
            top3GroupsByActivityButton.addActionListener(e -> {
                JasperLocator.top3GroupsByActivity();
            });
        }
        return top3GroupsByActivityButton;
    }
    public PButton getTop5DriversByserviceButton() {
        if (top5DriversByserviceButton ==null) {
            top5DriversByserviceButton =  new PButton("Top 5 Drivers");
            top5DriversByserviceButton.setBounds(20, 80, 150, 25);
            top5DriversByserviceButton.addActionListener(e -> {
                JasperLocator.top5DriversByServiceCount();
            });
        }
        return top5DriversByserviceButton;
    }
    public PButton getContractsInPeriodButton() {
        if (contractsInPeriodButton ==null) {
            contractsInPeriodButton =  new PButton("Contracts in Period");
            contractsInPeriodButton.setBounds(20, 110, 150, 25);
            contractsInPeriodButton.addActionListener(e -> {
                Date start =getStartContractDataChooser().getDate();
                Date end =getEndContractDataChooser().getDate();
                if (start.before(end)) {
                    JasperLocator.contractsInPeriods(start, end);
                }
            });
        }
        return contractsInPeriodButton;
    }
    public PButton getDriversWorkedTourGroupButton() {
        if (driversWorkedTourGroupButton ==null) {
            driversWorkedTourGroupButton =  new PButton("Drivers Worked Tour Group");
            driversWorkedTourGroupButton.setBounds(20, 140, 150, 25);
            driversWorkedTourGroupButton.addActionListener(e -> {
                String group = getDriverTourSelect().getValue();
                if (!group.equals("")) {
                    JasperLocator.driversWorkedTourGrupo(group);
                }

            });
        }
        return driversWorkedTourGroupButton;
    }
    public PButton getTouristGroupActivitiesButton() {
        if (touristGroupActivitiesButton ==null) {
            touristGroupActivitiesButton =  new PButton("Tourist Group Activities");
            touristGroupActivitiesButton.setBounds(20, 170, 150, 25);
            touristGroupActivitiesButton.addActionListener(e -> {
                Date start =getStartTouristChooser().getDate();
                Date end =getEndTouristChooser().getDate();
                String group = groupTourSelect.getValue();
                if (start.before(end) && !group.equals("")) {
                    JasperLocator.touristGroupActivities(group, start, end);
                }
            });
        }
        return touristGroupActivitiesButton;
    }

    public JDateChooser getStartContractDataChooser() {
        if (startContractDataChooser ==null) {
            startContractDataChooser =  new JDateChooser();
            startContractDataChooser.setBounds(200, 110, 150, 25);

        }
        return startContractDataChooser;
    }

    public JDateChooser getEndContractDataChooser() {
        if (endContractDataChooser ==null) {
            endContractDataChooser =  new JDateChooser();
            endContractDataChooser.setBounds(370, 110, 150, 25);

        }
        return endContractDataChooser;
    }

    public JDateChooser getStartTouristChooser() {
        if (startTouristChooser ==null) {
            startTouristChooser =  new JDateChooser();
            startTouristChooser.setBounds(200, 170, 150, 25);

        }
        return startTouristChooser;
    }

    public JDateChooser getEndTouristChooser() {
        if (endTouristDataChooser ==null) {
            endTouristDataChooser =  new JDateChooser();
            endTouristDataChooser.setBounds(370, 170, 150, 25);

        }
        return endTouristDataChooser;
    }

    public InputSelect getGroupTourSelect() {
        if (driverTourSelect == null) {
            int size = DTOLocator.getTourDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                TourDTO fuelDTO = DTOLocator.getTourDTOList().get(i);
                options[i] = new Option(String.valueOf(fuelDTO.getGroupCode()), fuelDTO.getGroupName());
            }
            driverTourSelect = new InputSelect(550,170,"", options);
        }
        return driverTourSelect;
    }

    public InputSelect getDriverTourSelect() {
        if (groupTourSelect == null) {
            int size = DTOLocator.getTourDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                TourDTO fuelDTO = DTOLocator.getTourDTOList().get(i);
                options[i] = new Option(String.valueOf(fuelDTO.getGroupCode()), fuelDTO.getGroupName());
            }
            groupTourSelect = new InputSelect(200,140,"", options);
        }
        return groupTourSelect;
    }

}
