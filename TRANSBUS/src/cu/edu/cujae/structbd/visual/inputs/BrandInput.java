package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.InputText;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import javax.swing.*;
import java.awt.*;

public class BrandInput extends BaseInput {
    private Mode mode;
    private BrandDTO brandDTO;
    private InputText brandName;
    private InputText amoSeats;
    private InputText fuelType;
    private InputText spending;
    private PButton submitButton;

    public static void main(String[] args){
        EventQueue.invokeLater(() -> {
            BrandInput frame = new BrandInput();
            frame.setLocationRelativeTo(null);
            frame.setVisible(true);
        });
    }

    public BrandInput(BrandDTO brandDTO) {
        this.mode = Mode.Update;
        this.brandDTO = brandDTO;
        setTitle("Update brand");
        initWindow();
    }
    public BrandInput() {
        this.mode = Mode.Insert;
        setTitle("Insert brand");
        initWindow();
    }

    private void initWindow() {
        JPanel form = new JPanel(new GridLayout(2, 2, 30, 10));
        form.setPreferredSize(new Dimension(500,100));
        form.add(getBrandName());
        form.add(getAmoSeats());
        form.add(getSpending());
        form.add(getFuelType());
        form.add(getFuelType());
        init(form, getSubmitButton());
    }

    public InputText getBrandName() {
        if (brandName == null) {
            brandName = new InputText(0, 0, "Brand name:");
        }
        return brandName;
    }
    public InputText getAmoSeats() {
        if (amoSeats == null) {
            amoSeats = new InputText(220, 20, "Seats amount:");
        }
        return amoSeats;
    }
    public InputText getFuelType() {
        if (fuelType == null) {
            fuelType = new InputText(20, 70, "Fuel type:");
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
                    int fuelType = Integer.parseInt(getFuelType().getTextField().getText());
                    double spending = Double.parseDouble(getSpending().getTextField().getText());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getBrandServices().insert(brandName, amoSeats, fuelType, spending);
                    } else {
                        ServicesLocator.getBrandServices().update(brandDTO.getBrandCode(), brandName, amoSeats, fuelType, spending);
                    }
                    App.getInstance().getAssetsPanel().refresh(Table.Brands);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
