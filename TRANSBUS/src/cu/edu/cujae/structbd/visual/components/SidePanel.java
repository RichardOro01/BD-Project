package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import java.awt.*;
import java.util.Objects;

public class SidePanel extends JPanel {
    private JLabel copyrightLabel;
    private JLabel logo;

    public SidePanel(int x, int y, int width, int height){
        super();
        setLayout(null);
        setBounds(x, y, width, height);
        setBackground(Color.WHITE);
        add(getCopyrightLabel());
        add(getLogo());
    }

    public JLabel getCopyrightLabel(){
        if (copyrightLabel==null){
            copyrightLabel = new JLabel("©2023-Richard, Javier, Herson");
            copyrightLabel.setFont(new Font("Tahoma", Font.BOLD, 10));
            copyrightLabel.setBounds(0, 0, 120,20);
            copyrightLabel.setBounds(this.getWidth()/2-copyrightLabel.getWidth()/2, this.getHeight()-30, copyrightLabel.getWidth(),copyrightLabel.getHeight());

        }
        return copyrightLabel;
    }

    public JLabel getLogo(){
        if (logo==null){
            logo = new JLabel();
            logo.setBounds(10,0, getWidth()-50, 150);
            ImageIcon ico=new ImageIcon(Objects.requireNonNull(getClass().getResource("../img/logo.png")));
            ImageIcon img=new ImageIcon(ico.getImage().getScaledInstance(logo.getWidth(), logo.getHeight(), Image.SCALE_SMOOTH));
            logo.setIcon(img);
        }
        return logo;
    }



}
