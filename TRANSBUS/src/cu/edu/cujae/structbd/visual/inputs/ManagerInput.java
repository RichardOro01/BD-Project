package cu.edu.cujae.structbd.visual.inputs;

public class ManagerInput {
    private static BrandInput brandInput = null;

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
}
