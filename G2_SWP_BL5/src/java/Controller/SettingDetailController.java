/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.ContactDAO;
import DAO.ContactTypeDAO;
import DAO.RoleDAO;
import DAO.SettingDAO;
import DAO.SettingTypeDAO;
import DAO.SubjectDAO;
import Model.Contact;
import Model.ContactType;
import Model.Role;
import Model.Setting;
import Model.SettingType;
import Model.Subject;
import com.google.gson.Gson;
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
@WebServlet(name = "SettingDetailController", urlPatterns = {"/settingdetail"})
public class SettingDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SettingDAO dao = new SettingDAO();
        int settingId = Integer.parseInt(request.getParameter("id"));
        Setting setting = dao.getSettingById(settingId);

        request.setAttribute("setting", setting);

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

        request.getRequestDispatcher("/admin/admin-settingdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_type = request.getParameter("type");
        String raw_mapped_values = request.getParameter("mapped_values");
        String raw_status = request.getParameter("status");
        String raw_order = request.getParameter("order");
        String raw_description = request.getParameter("description");

        String name = raw_name;
        String mapped_values = raw_mapped_values;
        boolean status = raw_status.equals("1") ? true : false;
        int order = Integer.parseInt(raw_order);
        String description = raw_description;
        int id = Integer.parseInt(raw_id);
        int type = Integer.parseInt(raw_type);

        SettingDAO dbSetting = new SettingDAO();
        Setting setting = dbSetting.getSettingById(id);
        setting.setName(name);
        setting.setMapped_values(mapped_values);
        setting.setStatus(status);
        setting.setOrder(order);
        setting.setDescription(description);
        SettingType tempSettingType = setting.getSettingType();
        tempSettingType.setId(type);
        setting.setSettingType(tempSettingType);

        dbSetting.updateSetting(setting);

        response.sendRedirect("settingsList");

    }

}
