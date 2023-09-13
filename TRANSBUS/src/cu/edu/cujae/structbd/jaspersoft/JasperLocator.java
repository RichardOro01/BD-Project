package cu.edu.cujae.structbd.jaspersoft;

import cu.edu.cujae.structbd.services.ServicesLocator;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;


import java.io.File;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JasperLocator {
    public static void tourCountries() {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\tour_countries.jrxml");

                Map<String, Object> parameters = new HashMap<>();
                //parameters.put("parametro1", valor1);
                //parameters.put("parametro2", valor2);

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/tour countries.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static void top5DriversByServiceCount() {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\top_5_drivers_by_service_count.jrxml");

                Map<String, Object> parameters = new HashMap<>();

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/top_5_drivers_by_service_count.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static void top3GroupsByActivity() {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\top_3_groups_by_activity_count.jrxml");

                Map<String, Object> parameters = new HashMap<>();

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/top_3_groups_by_activity_count.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static void contractsInPeriods(Date start, Date end) {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\contracts_in_period.jrxml");

                Map<String, Object> parameters = new HashMap<>();
                parameters.put("p_start_date", start);
                parameters.put("p_end_date", end);

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/contracts_in_period.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static void driversWorkedTourGrupo(String group) {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\drivers_worked_tour_group.jrxml");

                Map<String, Object> parameters = new HashMap<>();
                parameters.put("tour_group", group);

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/drivers_worked_tour_group.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public static void touristGroupActivities(String group, Date start, Date end) {
        {
            try {

                JasperReport report;
                java.sql.Connection connection = ServicesLocator.getConnection();
                report = JasperCompileManager.compileReport("C:\\Users\\Richard\\Desktop\\Cujae\\3ro\\1er semestre\\Base de datos\\Tarea Final\\TRANSBUS\\src\\cu\\edu\\cujae\\structbd\\reports\\tourist_group_activities.jrxml");

                Map<String, Object> parameters = new HashMap<>();
                parameters.put("tour_group", group);
                parameters.put("start_date", start);
                parameters.put("end_date", end);

                JasperPrint print = JasperFillManager.fillReport(report, parameters, connection);

                JRExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(print));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(new File("Reports/tourist_group_activities.pdf")));
                exporter.exportReport();

            } catch (JRException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
