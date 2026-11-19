package murach.data;

import java.io.*;
import murach.business.Product;

// Đọc sản phẩm từ file WEB-INF/products.txt (mỗi dòng: code|description|price)
public class ProductIO {

    public static Product getProduct(String productCode, String filepath) {
        try (BufferedReader in = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = in.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 3 && parts[0].equals(productCode)) {
                    Product p = new Product();
                    p.setCode(parts[0]);
                    p.setDescription(parts[1]);
                    p.setPrice(Double.parseDouble(parts[2]));
                    return p;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
