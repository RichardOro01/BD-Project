package cu.edu.cujae.structbd.visual.inputs;

import cu.edu.cujae.structbd.dto.*;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.input.*;
import cu.edu.cujae.structbd.visual.views.Table;

import javax.management.relation.Role;
import java.awt.*;

public class UserInput extends BaseInput{
    private Mode mode;
    private Form form;
    private UserDTO userDTO;
    private InputText username;
    private InputText password;
    private InputSelect role;
    private InputText name;
    private PButton submitButton;

    public UserInput(UserDTO userDTO) {
        this.mode = Mode.Update;
        this.userDTO = userDTO;
        setTitle("Update user");
        initWindow();
        getPassword().setValue(userDTO.getPassword());
        getRole().setValue(String.valueOf(userDTO.getDescription()));
        getUName().setValue(String.valueOf(userDTO.getName()));
        getUsername().setValue(String.valueOf(userDTO.getUsername()));
        setVisible(true);
    }
    public UserInput() {
        this.mode = Mode.Insert;
        setTitle("Insert user");
        initWindow();
        setVisible(true);
    }

    private void initWindow() {
        form = new Form(2, 2);
        form.setContainer(this);
        form.setPreferredSize(new Dimension(500,100));
        form.addFormItem(getPassword());
        form.addFormItem(getRole());
        form.addFormItem(getUName());
        form.addFormItem(getUsername());
        getPassword().setForm(form);
        getRole().setForm(form);
        getUName().setForm(form);
        getUsername().setForm(form);
        getRole().setForm(form);

        //validators
        getUsername().setMaxCharacters(24);
        getUName().setMaxCharacters(24);
        getPassword().setMaxCharacters(8);

        init(form, getSubmitButton());

    }

    public InputText getUsername() {
        if (username == null) {
            username = new InputText("User Name:");
        }
        return username;
    }
    public InputText getPassword() {
        if (password == null) {
            password = new InputText("Password:");
        }
        return password;
    }
    public InputSelect getRole() {
        if (role == null) {
            int size = DTOLocator.getRoleDTOList().size();
            Option[] options = new Option[size];
            for (int i=0; i<size; i++) {
                RoleDTO roleDTO = DTOLocator.getRoleDTOList().get(i);
                options[i] = new Option(String.valueOf(roleDTO.getRoleCode()), roleDTO.getDescription());
            }
            role = new InputSelect("Role:", options);
        }
        return role;
    }
    public InputText getUName() {
        if (name == null) {
            name = new InputText("Name:");
        }
        return name;
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
                    String userName = getUsername().getValue();
                    String password = getPassword().getValue();
                    String name = getUName().getValue();
                    int role = Integer.parseInt(getRole().getValue());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getBrandServices().insert(userName, password, name, role);
                    } else {
                        ServicesLocator.getBrandServices().update(userDTO.getId(), userName, password, name, role);
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
