package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.visual.components.TextAreaScroll;

import javax.swing.*;
import java.awt.*;

public class ServicesPanel extends JPanel {
    private JLabel logo;
    private TextAreaScroll developers;

    public ServicesPanel(){
        add(getLogo());
        //add(getDevelopers());
    }

    private JLabel getLogo() {
        if (logo == null) {
            logo = new JLabel("");
            logo.setFont(new Font("Tekton Pro", Font.PLAIN, 5));
            logo.setLabelFor(logo);
            logo.setHorizontalAlignment(SwingConstants.CENTER);

            logo.setBounds(167, 0, 400, 400);
            ImageIcon ico=new ImageIcon(getClass().getResource("../img/logo home.png"));
            ImageIcon img=new ImageIcon(ico.getImage().getScaledInstance(logo.getWidth(), logo.getHeight(), Image.SCALE_SMOOTH));
            logo.setIcon(img);

        }
        return logo;
    }

    private TextAreaScroll getDevelopers() {
        if (developers == null) {
            developers = new TextAreaScroll("ASD");
            developers.setBounds(40, 500, 100, 100);
        }
        return developers;
    }



}
