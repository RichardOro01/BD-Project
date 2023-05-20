package cu.edu.cujae.structbd.visual.components;
import cu.edu.cujae.structbd.visual.App;

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
        //setLayout(null);
    }

    public void render() {
        setBackground(Color.GRAY);
        removeAll();
        int size = 0;
        //int currentY = 0;
        for (BarOption option: optionList) {
            if (!option.isHidden()) {
                add(option);
                add(Box.createRigidArea(new Dimension(0, margin)));
                //option.setBounds(0, currentY + margin, getWidth()-10, optionHeight);
                //currentY += optionHeight;
                size += optionHeight + margin;
            }
        }

        setBounds(getX(),getY(),getWidth(),size);

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

    public BarOption addParentOption(BarOption option) {
        option.setDroppable(true);
        option.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e);
                toogleDrop(option);
                App.getInstance().getOptions().revalidate();
                App.getInstance().repaint();
            }
        });
        addToOptions(option);
        return option;
    }

    public BarOption addSubOption(BarOption option, JPanel target, BarOption toOption) {
        toOption.addOption(option);
        option.setHidden(true);
        addOption(option, target);
        return option;
    }

    private boolean toogleDrop(BarOption option) {
        boolean toSet = !option.isDropped();
        option.setDropped(toSet);
        render();
        return toSet;
    }

    private void addToOptions(BarOption option) {
        optionList.add(option);
        render();
    }

    public void addOption(BarOption option, JPanel panel){
        addOption(option, panel, false);
    }

}
