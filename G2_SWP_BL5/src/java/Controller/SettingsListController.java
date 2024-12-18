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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nocol
 */
@WebServlet(name = "SettingsListController", urlPatterns = {"/settingsList"})
public class SettingsListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            SettingDAO dao = new SettingDAO();   //tâo doi tuong settingdao để thao tác vs db
            String searchName = request.getParameter("searchName");  //lấy tham số searchname từ request
            int page = 1;
            int pageSize = 5;

            if (request.getParameter("page") != null) {  // Nếu tham số page được truyền, cập nhật giá trị của page
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<Setting> listAllSetting;   //khởi tạo dsach setting
            int totalSettings;

            if (searchName != null && !searchName.isEmpty()) {
                listAllSetting = dao.getAllSetting(searchName, page, pageSize);
                totalSettings = dao.getTotalSetting(searchName);
            } else {
                listAllSetting = dao.getAllSetting(page, pageSize);
                totalSettings = dao.getTotalSetting();
            }

            int numPages = (int) Math.ceil((double) totalSettings / pageSize);
            request.setAttribute("numPages", numPages);
            request.setAttribute("getAllSettings", listAllSetting);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchName", searchName);

            // Lấy danh sách các Role, ContactType, Subject, SettingType từ cơ sở dữ liệu
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

//            request.getRequestDispatcher("./admin/admin_contact.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/admin/admin_settinglist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
