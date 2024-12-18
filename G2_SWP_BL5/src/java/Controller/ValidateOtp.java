package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urlOTP = request.getParameter("OTP");
        HttpSession mySession = request.getSession();
        String sessionOTP = (String) mySession.getAttribute("otp");
        RequestDispatcher dispatcher;

        if (urlOTP != null && urlOTP.equals(sessionOTP)) {
            // Mã OTP khớp, chuyển hướng đến trang nhập mật khẩu mới
            dispatcher = request.getRequestDispatcher("newPassword.jsp");
            dispatcher.forward(request, response);
        } else {
            // Mã OTP không khớp, thông báo lỗi
            request.setAttribute("message", "You can't hack");
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}