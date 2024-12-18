package Controller;

import DAO.UserDAO;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
@WebServlet("/verify")
public class VerifyController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("otp");
        HttpSession mySession = request.getSession();
        String otp = (String) mySession.getAttribute("otp");
        String email = (String) mySession.getAttribute("email");
        RequestDispatcher dispatcher = null;

        if (value.equals(otp)) {
            UserDAO userDBContext = new UserDAO();
            userDBContext.updateUserVerified(email);
            request.setAttribute("email", request.getParameter("email"));
//            request.setAttribute("status", "success");

//            dispatcher = request.getRequestDispatcher("newPassword.jsp");
//            dispatcher.forward(request, response);
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("message", "wrong otp");

            dispatcher = request.getRequestDispatcher("verify.jsp");
            dispatcher.forward(request, response);
        }
    }

}
