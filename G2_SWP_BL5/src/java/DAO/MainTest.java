
package DAO;

import Context.DBContext;

public class MainTest {

     public static void main(String[] args) {
        // Khởi tạo một đối tượng DBContext
        DBContext dbContext = new DBContext();

        // Kiểm tra xem connection đã được thiết lập hay không
        if (dbContext.connection != null) {
            System.out.println("Kết nối đến CSDL thành công!");
        } else {
            System.out.println("Không thể kết nối đến CSDL.");
        }
    }
}

