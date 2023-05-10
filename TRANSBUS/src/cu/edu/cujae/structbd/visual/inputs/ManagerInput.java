package cu.edu.cujae.structbd.visual.inputs;

public class ManagerInput {
    private static BrandInput brandInput = null;
    private static CarInput carInput = null;

    public static void showBrandInput() {
        if (brandInput==null || !brandInput.isVisible()) {
            brandInput = new BrandInput();
        }
    }
    public static void showBrandInput(String brandName, String amoSeats, String fuelType, String spending) {
        if (brandInput==null || !brandInput.isVisible()) {
            brandInput = new BrandInput(brandName, amoSeats, fuelType, spending);
        }
    }

    public static void showCarInput() {
        if (carInput==null || !carInput.isVisible()) {
            carInput = new CarInput();
        }
    }
    public static void showCarInput(int number, String plate, String couple, String brandName) {
        if (carInput==null || !carInput.isVisible()) {
            carInput = new CarInput(number, plate, couple, brandName);
        }
    }
}
