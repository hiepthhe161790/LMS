/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Helper.EncryptionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author THTP
 */
@WebServlet(name = "verifyUser", urlPatterns = {"/verifyUser"})
public class VerifyRegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailToken = req.getParameter("emailToken");
        EncryptionUtil md5 = new EncryptionUtil();
        UserDAO uDAO = new UserDAO();
        try {
            String email = md5.decryptAES(emailToken);

            if (uDAO.checkEmail(email)) {
                uDAO.updateUserVerified(email);
                req.setAttribute("email", email);
                req.getRequestDispatcher("emailVerify.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("emailVerify.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();

            String message = "Ban dinh hack web minh a ";

            out.println(message);
        }

    }
}
