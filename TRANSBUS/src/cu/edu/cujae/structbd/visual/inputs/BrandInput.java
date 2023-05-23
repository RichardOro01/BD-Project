package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.FuelDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.input.*;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import java.awt.*;

public class BrandInput extends BaseInput {
    private Mode mode;
    private Form form;
    private BrandDTO brandDTO;
    private InputText brandName;
    private InputNumber amoSeats;
    private InputSelect fuelType;
    private InputNumber spending;
    private PButton submitButton;

    public BrandInput(BrandDTO brandDTO) {
        this.mode = Mode.Update;
        this.brandDTO = brandDTO;
        setTitle("Update brand");
        initWindow();
        getBrandName().setValue(brandDTO.getBrandName());
        getAmoSeats().setValue(String.valueOf(brandDTO.getAmoSeats()));
        getSpending().setValue(String.valueOf(brandDTO.getSpending()));
        getFuelType().setValue(String.valueOf(brandDTO.getFuelType()));
        setVisible(true);
    }
    public BrandInput() {
        this.mode = Mode.Insert;
        setTitle("Insert brand");
        initWindow();
        setVisible(true);
    }

    private void initWindow() {
        form = new Form(2, 2);
        form.setContainer(this);
        form.setPreferredSize(new Dimension(500,100));
        form.addFormItem(getBrandName());
        form.addFormItem(getAmoSeats());
        form.addFormItem(getSpending());
        form.addFormItem(getFuelType());
        getBrandName().setForm(form);
        getAmoSeats().setForm(form);
        getSpending().setForm(form);
        getFuelType().setForm(form);

        //validators
        getSpending().setDecimal(true);
        getBrandName().setMaxCharacters(24);
        getAmoSeats().setMaxCharacters(3);
        getSpending().setMaxCharacters(8);

        init(form, getSubmitButton());

    }

    public InputText getBrandName() {
        if (brandName == null) {
            brandName = new InputText("Brand name:");
        }
        return brandName;
    }
    public InputNumber getAmoSeats() {
        if (amoSeats == null) {
            amoSeats = new InputNumber("Seats amount:");
        }
        return amoSeats;
    }
    public InputSelect getFuelType() {
        if (fuelType == null) {
            int size = DTOLocator.getFuelDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                FuelDTO fuelDTO = DTOLocator.getFuelDTOList().get(i);
                options[i] = new Option(String.valueOf(fuelDTO.getFuelCode()), fuelDTO.getFuelName());
            }
            fuelType = new InputSelect("Fuel type:", options);
        }
        return fuelType;
    }
    public InputNumber getSpending() {
        if (spending == null) {
            spending = new InputNumber("Spending:");
        }
        return spending;
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
                    String brandName = getBrandName().getTextField().getText();
                    int amoSeats = Integer.parseInt(getAmoSeats().getTextField().getText());
                    int fuelType = Integer.parseInt(getFuelType().getSelected());
                    double spending = Double.parseDouble(getSpending().getTextField().getText());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getBrandServices().insert(brandName, amoSeats, fuelType, spending);
                    } else {
                        ServicesLocator.getBrandServices().update(brandDTO.getBrandCode(), brandName, amoSeats, fuelType, spending);
                    }
                    dispose();
                    App.getInstance().getAssetsPanel().refresh(Table.Brands);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
