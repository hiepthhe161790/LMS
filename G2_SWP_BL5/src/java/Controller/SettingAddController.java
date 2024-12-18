/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ContactTypeDAO;
import DAO.RoleDAO;
import DAO.SettingDAO;
import DAO.SettingTypeDAO;
import DAO.SubjectDAO;
import Model.ContactType;
import Model.Role;
import Model.Setting;
import Model.SettingType;
import Model.Subject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author nocol
 */
@WebServlet(name = "SettingAddController", urlPatterns = {"/settingadd"})
public class SettingAddController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ jsp
        String raw_name = request.getParameter("name");
        String raw_type = request.getParameter("type");
        String raw_mapped_values = request.getParameter("mapped_values");
        String raw_status = request.getParameter("status");
        String raw_order = request.getParameter("order");
        String raw_description = request.getParameter("description");

        // Chuyển đổi dữ liệu từ dạng raw (chuỗi) sang các kiểu dữ liệu phù hợp
        String name = raw_name;
        String mapped_values = raw_mapped_values;
        boolean status = raw_status.equals("1") ? true : false;
        int order = Integer.parseInt(raw_order);
        String description = raw_description;
        int type = Integer.parseInt(raw_type);

        SettingDAO dbSetting = new SettingDAO();
        dbSetting.addSetting(name, mapped_values, status, order, description, type);

        response.sendRedirect("settingsList");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RoleDAO dbRole = new RoleDAO();
        List<Role> roles = dbRole.getAllRole();
        ContactTypeDAO dbContactType = new ContactTypeDAO();
        List<ContactType> contactTypes = dbContactType.getAllContactType();
        SubjectDAO dbSubject = new SubjectDAO();
        List<Subject> subjects = dbSubject.getAllSubject();
        request.setAttribute("contactTypes", contactTypes);
        request.setAttribute("roles", roles);
        request.setAttribute("subjects", subjects);
        SettingTypeDAO dbSettingType = new SettingTypeDAO();
        List<SettingType> settingTypes = dbSettingType.getAllSettingType();
        request.setAttribute("settingTypes", settingTypes);
        request.getRequestDispatcher("/admin/admin-settingadd.jsp").forward(request, response);
    }

}
