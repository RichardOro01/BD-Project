package cu.edu.cujae.structbd.visual.inputs;

import cu.edu.cujae.structbd.dto.*;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.input.*;
import cu.edu.cujae.structbd.visual.views.Table;

import java.awt.*;

public class DriverInput extends BaseInput {
    private Mode mode;
    private Form form;
    private DriverDTO driverDTO;
    private InputFormattedText id;
    private InputText name;
    private InputText address;
    private InputFormattedText phone;
    private InputSelect district;
    private PButton submitButton;

    public DriverInput(DriverDTO driverDTO) {
        this.mode = Mode.Update;
        this.driverDTO = driverDTO;
        setTitle("Update driver");
        initWindow();
        getId().setValue(driverDTO.getIdDriver());
        getDName().setValue(String.valueOf(driverDTO.getDriverName()));
        getPhone().setValue(String.valueOf(driverDTO.getPhone()));
        getAddress().setValue(String.valueOf(driverDTO.getAddress()));
        getDistrict().setValue(String.valueOf(driverDTO.getDistrictName()));

        setVisible(true);
    }
    public DriverInput() {
        this.mode = Mode.Insert;
        setTitle("Insert driver");
        initWindow();
        setVisible(true);
    }

    private void initWindow() {
        form = new Form(2, 3);
        form.setContainer(this);
        form.setPreferredSize(new Dimension(500,100));
        form.addFormItem(getId());
        form.addFormItem(getDName());
        form.addFormItem(getPhone());
        form.addFormItem(getAddress());
        form.addFormItem(getDistrict());
        getId().setForm(form);
        getDName().setForm(form);
        getPhone().setForm(form);
        getAddress().setForm(form);
        getDistrict().setForm(form);

        //validators
        getDName().setMaxCharacters(24);
        getAddress().setMaxCharacters(24);
        init(form, getSubmitButton());

    }

    public InputFormattedText getId() {
        if (id == null) {
            id = new InputFormattedText("ID:", "###########");
        }
        return id;
    }
    public InputText getDName() {
        if (name == null) {
            name = new InputText("Name:");
        }
        return name;
    }
    public InputText getAddress() {
        if (address == null) {
            address = new InputText("Address:");
        }
        return address;
    }

    public InputSelect getDistrict() {
        if (district == null) {
            int size = DTOLocator.getDistrictDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                DistrictDTO districtDTO = DTOLocator.getDistrictDTOList().get(i);
                options[i] = new Option(String.valueOf(districtDTO.getDistrictCode()), districtDTO.getDistrictName());
            }

            district = new InputSelect("District:", options);
        }
        return district;
    }
    public InputFormattedText getPhone() {
        if (phone == null) {
            phone = new InputFormattedText("Phone:", "########");
        }
        return phone;
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
                    String id = getId().getValue();
                    String name = getDName().getValue();
                    String address = getAddress().getValue();
                    String phone = getPhone().getValue();
                    int district = Integer.parseInt(getDistrict().getValue());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getDriverServices().insert(id, name, address, phone, district, false);
                    } else {
                        ServicesLocator.getDriverServices().update(driverDTO.getDriverCode(), id, name, address, phone, district, false );
                    }
                    dispose();
                    App.getInstance().getAssetsPanel().refresh(Table.Drivers);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
