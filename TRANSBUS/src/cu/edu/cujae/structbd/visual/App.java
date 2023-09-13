package cu.edu.cujae.structbd.visual;

import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.components.BarOption;
import cu.edu.cujae.structbd.visual.components.BarOptions;
import cu.edu.cujae.structbd.visual.components.SidePanel;
import cu.edu.cujae.structbd.visual.views.*;

import javax.swing.*;
import java.awt.*;

public class App extends JFrame {
    private SidePanel sidePanel;
    private static App app;
    private JPanel bodyPanel;
    private BarOptions options;
    private int height;
    private AssetsPanel assetsPanel;
    private AdminPanel adminPanel;
    private ReportsPDFPanel reportsPDFPanel;
    private HomePanel homePanel;
    private OthersPanel othersPanel;
    private ReportsPanel reportsPanel;
    private ServicesPanel servicesPanel;



    public static void main(String[] args){
        EventQueue.invokeLater(() -> {
            App frame = App.getInstance();
            App.getInstance().init();
            frame.setLocationRelativeTo(null);
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
    }

    public void init(){
        ServicesLocator.getReferenceTablesService().refresh();
        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getSidePanel());
        panel.add(getBodyPanel());
        sidePanel.add(getOptions());
    }

    public static App getInstance() {
        if (app == null) {
            app = new App();
        }
        return app;
    }

    public void handleError (Exception e) {
        JOptionPane.showMessageDialog(this, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        e.printStackTrace();
    }

    public SidePanel getSidePanel(){
        if (sidePanel==null){
            sidePanel = new SidePanel(0, Definitions.MARGING, Definitions.SIDE_BAR_WIDTH, height-Definitions.MARGING);
        }
        return sidePanel;
    }

    public JPanel getBodyPanel(){
        if (bodyPanel==null){
            bodyPanel = new JPanel();
            bodyPanel.setLayout(null);
            int x = sidePanel.getWidth()+6;
            bodyPanel.setBounds(sidePanel.getWidth()+Definitions.MARGING,Definitions.MARGING, this.getWidth()-x, height-Definitions.MARGING);
            bodyPanel.setBackground(Color.WHITE);
        }
        return bodyPanel;
    }

    public BarOptions getOptions(){
        if (options==null){
            options = new BarOptions(getBodyPanel(),40, 0);
            options.setBackground(Color.WHITE);
            options.setBounds(10,160,sidePanel.getWidth()-10,500);
            options.addOption(new BarOption("Home"), getHomePanel(), true);
            BarOption management = options.addParentOption(new BarOption("Management"));
            options.addSubOption(new BarOption("Services"), getServicesPanel(), management);
            options.addSubOption(new BarOption("Assets"), getAssetsPanel(), management);
            options.addSubOption(new BarOption("Others"), getOthersPanel(), management);
            BarOption reports = options.addParentOption(new BarOption("Reports"));
            options.addSubOption(new BarOption("By Months"), getReportsPanel(), reports);
            options.addSubOption(new BarOption("PDF"), getReportsPDFPanel(), reports);
            options.addOption(new BarOption("Admin"), getAdminPanel());

        }
        return options;
    }

    public AssetsPanel getAssetsPanel(){
        if (assetsPanel == null) {
            assetsPanel = new AssetsPanel();
        }
        return assetsPanel;
    }

    public AdminPanel getAdminPanel() {
        if (adminPanel == null) {
            adminPanel = new AdminPanel();
        }
        return adminPanel;
    }

    public HomePanel getHomePanel() {
        if (homePanel == null) {
            homePanel = new HomePanel();
        }
        return homePanel;
    }

    public OthersPanel getOthersPanel() {
        if (othersPanel == null) {
            othersPanel = new OthersPanel();
        }
        return othersPanel;
    }

    public ReportsPanel getReportsPanel() {
        if (reportsPanel == null) {
            reportsPanel = new ReportsPanel();
        }
        return reportsPanel;
    }

    public ServicesPanel getServicesPanel() {
        if (servicesPanel == null) {
            servicesPanel = new ServicesPanel();
        }
        return servicesPanel;
    }

    public ReportsPDFPanel getReportsPDFPanel() {
        if (reportsPDFPanel == null) {
            reportsPDFPanel = new ReportsPDFPanel();
        }
        return reportsPDFPanel;
    }
}
