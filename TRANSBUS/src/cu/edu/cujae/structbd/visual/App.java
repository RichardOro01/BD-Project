package cu.edu.cujae.structbd.visual;

import javax.swing.*;
import java.awt.*;

public class App extends JFrame {

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
    }

}
