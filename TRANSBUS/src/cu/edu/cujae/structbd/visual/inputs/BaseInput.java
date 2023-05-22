package cu.edu.cujae.structbd.visual.inputs;

import cu.edu.cujae.structbd.visual.App;

import javax.swing.*;
import java.awt.*;

public class BaseInput extends JDialog{
    public void init(JPanel form, JButton submitButton) {
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
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, Color.GRAY));
        setVisible(true);
    }

}
