package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.dto.*;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.input.*;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class CarInput extends BaseInput {
    private Mode mode;
    private Form form;
    private CarDTO carDTO;
    private InputFormattedText plate;
    private InputNumber fleetNumber;
    private InputSelect brand;
    private InputSelect couple;
    private PButton submitButton;

    public CarInput(CarDTO carDTO) {
        this.mode = Mode.Update;
        this.carDTO = carDTO;
        setTitle("Update car");
        initWindow();
        getPlate().setValue(carDTO.getPlate());
        getFleetNumber().setValue(String.valueOf(carDTO.getFleetNumber()));
        getCouple().setValue(String.valueOf(carDTO.getDriver1() + " - " + carDTO.getDriver2()));
        getBrand().setValue(String.valueOf(carDTO.getBrandName()));
        setVisible(true);
    }
    public CarInput() {
        this.mode = Mode.Insert;
        setTitle("Insert car");
        initWindow();
        setVisible(true);
    }

    private void initWindow() {
        form = new Form(2, 2);
        form.setContainer(this);
        form.setPreferredSize(new Dimension(500,100));
        form.addFormItem(getPlate());
        form.addFormItem(getFleetNumber());
        form.addFormItem(getCouple());
        form.addFormItem(getBrand());
        getPlate().setForm(form);
        getFleetNumber().setForm(form);
        getCouple().setForm(form);
        getBrand().setForm(form);

        //validators
        getFleetNumber().setMaxCharacters(3);
        init(form, getSubmitButton());

    }

    public InputFormattedText getPlate() {
        if (plate == null) {
            plate = new InputFormattedText("Plate:", "A-######");
        }
        return plate;
    }
    public InputNumber getFleetNumber() {
        if (fleetNumber == null) {
            fleetNumber = new InputNumber("Fleet number:");
        }
        return fleetNumber;
    }
    public InputSelect getBrand() {
        if (brand == null) {
            int size = DTOLocator.getBrandDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                BrandDTO brandDTO = DTOLocator.getBrandDTOList().get(i);
                options[i] = new Option(String.valueOf(brandDTO.getBrandCode()), brandDTO.getBrandName());
            }

            brand = new InputSelect("Brand:", options);
        }
        return brand;
    }
    public InputSelect getCouple() {
        if (couple == null) {
            int size = DTOLocator.getCoupleDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                CoupleDTO coupleDTO = DTOLocator.getCoupleDTOList().get(i);
                options[i] = new Option(String.valueOf(coupleDTO.getCoupleCode()), coupleDTO.getDriver1Name() + " - " + coupleDTO.getDriver2Name());
            }
            couple = new InputSelect("Couple:", options);
        }
        return couple;
    }

    public PButton getSubmitButton() throws RuntimeException{
        if (submitButton == null) {
            submitButton = new PButton("Insert");
            submitButton.setBounds(getWidth()-100, 120, 60, 30);
            if (mode == Mode.Update) {
                submitButton.setText("Update");
            }
            submitButton.addActionListener(e -> {

                try {
                    String plate = getPlate().getValue();
                    int fleetNumber = Integer.parseInt(getFleetNumber().getValue());
                    int brand = Integer.parseInt(getBrand().getValue());
                    int couple = Integer.parseInt(getCouple().getValue());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getCarServices().insert(fleetNumber, plate, couple, brand);
                    } else {
                        ServicesLocator.getCarServices().update(carDTO.getCarCode(), fleetNumber, plate, brand, couple );


                    }
                    dispose();
                    App.getInstance().getAssetsPanel().refresh(Table.Cars);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
