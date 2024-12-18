/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.SettingDAO;
import Model.Setting;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author nocol
 */
@WebServlet(name = "SettingUpdateStatusController", urlPatterns = {"/settingstatus"})
public class SettingUpdateStatusController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SettingDAO dao = new SettingDAO();
        int settingId = Integer.parseInt(request.getParameter("id"));
        Setting getSettingById = dao.getSettingById(settingId);
        dao.updateStatus(settingId, !getSettingById.isStatus());
        response.sendRedirect("settingsList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
