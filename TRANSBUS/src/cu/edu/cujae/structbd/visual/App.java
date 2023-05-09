package cu.edu.cujae.structbd.visual;

import cu.edu.cujae.structbd.visual.components.BarOption;
import cu.edu.cujae.structbd.visual.components.BarOptions;
import cu.edu.cujae.structbd.visual.components.SidePanel;
import cu.edu.cujae.structbd.visual.views.HomePanel;

import javax.swing.*;
import java.awt.*;

public class App extends JFrame {
    private SidePanel sidePanel;
    private JPanel bodyPanel;
    private BarOptions options;
    private int height;
    private int margin = 6;

    public static void main(String[] args){
        EventQueue.invokeLater(() -> {
            App frame = new App();
            frame.setVisible(true);
        });
    }
    public App() {
        setTitle("Transbus");
        setBounds(0, 0, Definitions.APP_WIDTH, Definitions.APP_HEIGHT);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(getOwner());

        height=Definitions.APP_HEIGHT-39;

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getSidePanel());
        panel.add(getBodyPanel());
        sidePanel.add(getOptions());
    }

    public SidePanel getSidePanel(){
        if (sidePanel==null){
            sidePanel = new SidePanel(0,margin,240, height-margin);
        }
        return sidePanel;
    }

    public JPanel getBodyPanel(){
        if (bodyPanel==null){
            bodyPanel = new JPanel();
            bodyPanel.setLayout(null);
            int x = sidePanel.getWidth()+6;
            bodyPanel.setBounds(sidePanel.getWidth()+margin,margin, this.getWidth()-x, height-margin);
            bodyPanel.setBackground(Color.WHITE);
        }
        return bodyPanel;
    }

    public BarOptions getOptions(){
        if (options==null){
            options = new BarOptions(getBodyPanel(),60);
            options.setBackground(Color.WHITE);
            options.setBounds(10,160,sidePanel.getWidth()-10,500);
            options.addOption(new BarOption("Home"), new HomePanel(), true);
        }
        return options;
    }

}
