package cu.edu.cujae.structbd.visual.components.input;

import javax.swing.*;
import java.awt.*;
import java.util.Objects;

public class InputSelect extends JPanel implements FormItem {
    private Option[] options;
    private JComboBox comboBox;
    private Label label;

    private Form form;

    public InputSelect(int x, int y, String label, Option[] options) {
        setOptions(options);
        setBounds(x, y, 200, 48);
        setLayout(new GridLayout(2,1));
        add(getLabel(label));
        add(getComboBox());
    }

    public InputSelect( String label, Option[] options) {
        this(0,0, label, options);
    }

    public JComboBox getComboBox() {
        if (comboBox == null) {
            comboBox = new JComboBox(options);

        }
        return comboBox;
    }

    public Label getLabel(String labelText) {
        if (label == null) {
            label = new Label(labelText);
            label.setAlignment(Label.LEFT);
        }
        return label;
    }

    public String getSelected() {
        return ((Option) Objects.requireNonNull(getComboBox().getSelectedItem())).getKey();
    }

    public void setSelectd(String value) {
        getComboBox().setSelectedIndex(search(value));
    }

    public int search(String value) {
        for (int i = 0; i < options.length; i++) {
            if (options[i].getValue().equals(value)) {
                return i;
            }
        }
        return -1;
    }

    public void setOptions(Option[] options) {
        Option[] newOptions = new Option[options.length+1];
        newOptions[0] = new Option("","Select");
        for (int i = 0; i < options.length; i++) {
            newOptions[i+1] = options[i];
        }
        this.options = newOptions;
    }

    @Override
    public String getValue() {
        return getSelected();
    }

    @Override
    public Form getForm() {
        return form;
    }

    public void setForm(Form form) {
        this.form = form;
        comboBox.addActionListener(e -> getForm().update());
    }
}
