/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Common.Constant;
import DAO.PageDAO;
import DAO.PagePermissionDAO;
import DAO.RoleDAO;
import Helper.Validator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Model.*;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author THTP
 */
@WebServlet("/pagePermission")
public class PagePermission extends HttpServlet {

    private final PageDAO pDAO = new PageDAO();
    private final RoleDAO roleDAO = new RoleDAO();
    private final PagePermissionDAO pagePermissionDAO = new PagePermissionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (Validator.checkPermission("/pagePermission", Constant.PAGE_PERMISSION_IS_READABLE, req, resp)) {
            try {
                String searchName = req.getParameter("searchName");
                List< Page> listPage = new ArrayList<>();
                if (searchName != null) {
                    listPage = pDAO.searchPagesByName(searchName);
                } else {
                    listPage = pDAO.getAllPages();

                }
                List<Role> listRoles = roleDAO.getAllRoles();

                req.setAttribute("listRoles", listRoles);
                req.setAttribute("getAllPage", listPage);

                req.setAttribute("pagePermissionDAO", pagePermissionDAO);
                req.setAttribute("roleDAO", roleDAO);
                req.getRequestDispatcher("./admin/admin_page_permission.jsp").forward(req, resp);
            } catch (Exception e) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Some thing wrong");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");

        try {
            switch (type) {
                case "update":
                    if (Validator.checkPermission("/pagePermission", Constant.PAGE_PERMISSION_IS_UPDATABLE, req, resp)) {
                        int roleId = Integer.parseInt(req.getParameter("page_permission_id"));
                        String permissionOptions = req.getParameter("permission_option");

                        pagePermissionDAO.togglePagePermissionOption(roleId, permissionOptions);
                        resp.sendRedirect("./pagePermission");
                    } else {
                        resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                    }
                    break;

                case "create":
                    if (Validator.checkPermission("/pagePermission", Constant.PAGE_PERMISSION_IS_CREATABLE, req, resp)) {
                        String page_name = req.getParameter("page_name");
                        String url_link = req.getParameter("url_link");

                        Page newPage = new Page();

                        newPage.setName(page_name);
                        newPage.setUrl(url_link);

                        int newPageId = pDAO.addPageAndGetId(newPage);
                        pagePermissionDAO.addPagePermissionsForRoles(newPageId);
                        resp.sendRedirect("./pagePermission");
                    } else {
                        resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
                    }
                    break;

                default:
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Permission denied");
            }

        } catch (Exception e) {
            PrintWriter out = resp.getWriter();

            String message = "CO loi gi do roi ban oi ";

            out.println(message);
        }

    }

}
