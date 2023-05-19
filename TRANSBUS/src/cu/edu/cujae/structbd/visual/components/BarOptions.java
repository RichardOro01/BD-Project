package cu.edu.cujae.structbd.visual.components;
import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

public class BarOptions extends JPanel{
    private ArrayList<BarOption> optionList;
    private JPanel activePanel;
    private JPanel contentPanel;
    private int optionHeight;
    private int margin;





    public BarOptions(JPanel panel,int optionHeight, int margin){
        super();
        optionList = new ArrayList<>();
        this.optionHeight = optionHeight;
        this.margin = margin;
        this.contentPanel=panel;
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    }

    public void render() {
        removeAll();
        for (BarOption option: optionList) {
            add(option);
            add(Box.createRigidArea(new Dimension(0,margin)));
        }
        refreshSize();
    }

    //default values
    public BarOptions(JPanel panel){
        this(panel, 50, 0);
    }
    public BarOptions(JPanel panel,int optionHeight){
        this(panel,optionHeight,0);
    }

    public BarOption addOption(BarOption option, JPanel panel, boolean active){

        //Default active panel
        if (active)
            activePanel=panel;
        else
            panel.setVisible(false);

        //add to container
        contentPanel.add(panel);

        //Inherit from container
        panel.setLayout(null);
        panel.setBounds(0,0,contentPanel.getWidth(),contentPanel.getHeight());
        panel.setBackground(contentPanel.getBackground());

        //add option to options container
        addToOptions(option);

        option.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                activePanel.setVisible(false);
                panel.setVisible(true);
                activePanel=panel;
            }
        });
        return option;
    }

    public BarOption addOption(BarOption option) {
        option.setDroppable(true);
        option.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                toogleDrop(option);
            }
        });
        addToOptions(option);
        return option;
    }

    public BarOption addOption(BarOption option, BarOption toOption) {

        return option;
    }

    private boolean toogleDrop(BarOption option) {
        boolean toSet = !option.getDropped();
        option.setDropped(toSet);
        return toSet;
    }

    private void addToOptions(BarOption option) {
        optionList.add(option);
        render();
    }

    public void addOption(BarOption option, JPanel panel){
        addOption(option, panel, false);
    }

    private void refreshSize(){
        setBounds(getX(),getY(),getWidth(),optionList.size()*(optionHeight+margin));
    }

}
