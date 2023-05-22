package cu.edu.cujae.structbd.visual.inputs;

import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.input.Form;
import cu.edu.cujae.structbd.visual.components.input.FormItem;

import javax.swing.*;
import java.awt.*;
import java.util.Objects;

public class BaseInput extends JDialog implements FormConatiner{
    private Form form;
    private JButton submitButton;
    public void init(Form form, JButton submitButton) {
        this.form = form;
        this.submitButton = submitButton;
        JPanel formContainer = new JPanel(new FlowLayout(FlowLayout.CENTER, 40, 20));
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 40, 10));
        setBounds(0, 0, 600, 200);
        setLayout(new BorderLayout());
        setResizable(false);
        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(App.getInstance());
        setModal(true);

        add(formContainer, BorderLayout.CENTER);
        formContainer.add(form);
        add(footer, BorderLayout.SOUTH);
        footer.add(submitButton);
        submitButton.setPreferredSize(new Dimension(50,20));
        submitButton.setEnabled(false);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, Color.GRAY));
    }

    @Override
    public void onFormUpdate() {
        boolean enabled = true;
        for (FormItem item: form.getFormItemList()) {
            if (Objects.equals(item.getValue(), "") || item.getValue()==null) {
                enabled = false;
                break;
            }
        }
        submitButton.setEnabled(enabled);
    }
}
