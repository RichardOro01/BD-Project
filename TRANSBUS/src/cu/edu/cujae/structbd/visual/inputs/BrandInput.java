package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.FuelDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.input.*;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import javax.swing.*;
import java.awt.*;

public class BrandInput extends BaseInput {
    private Mode mode;
    private Form form;
    private BrandDTO brandDTO;
    private InputText brandName;
    private InputText amoSeats;
    private InputSelect fuelType;
    private InputText spending;
    private PButton submitButton;

//    public static void main(String[] args){
//        EventQueue.invokeLater(() -> {
//            BrandInput frame = new BrandInput();
//            frame.setLocationRelativeTo(null);
//            frame.setVisible(true);
//        });
//    }

    public BrandInput(BrandDTO brandDTO) {
        this.mode = Mode.Update;
        this.brandDTO = brandDTO;
        setTitle("Update brand");
        getBrandName().getTextField().setText(brandDTO.getBrandName());
        getAmoSeats().getTextField().setText(String.valueOf(brandDTO.getAmoSeats()));
        getSpending().getTextField().setText(String.valueOf(brandDTO.getSpending()));
        getFuelType().setSelectd(String.valueOf(brandDTO.getFuelType()));
        initWindow();
    }
    public BrandInput() {
        this.mode = Mode.Insert;
        setTitle("Insert brand");
        initWindow();
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
        init(form, getSubmitButton());
    }

    public InputText getBrandName() {
        if (brandName == null) {
            brandName = new InputText("Brand name:");
        }
        return brandName;
    }
    public InputText getAmoSeats() {
        if (amoSeats == null) {
            amoSeats = new InputText("Seats amount:");
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
            fuelType = new InputSelect(20, 70, "Fuel type:", options);
        }
        return fuelType;
    }
    public InputText getSpending() {
        if (spending == null) {
            spending = new InputText(220, 70, "Spending:");
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
