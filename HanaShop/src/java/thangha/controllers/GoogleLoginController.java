/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.AccountDAO;
import thangha.dtos.AccountDTO;
import thangha.gooogleaccess.GooglePojo;
import thangha.gooogleaccess.GoogleUtils;

/**
 *
 * @author Admin
 */
public class GoogleLoginController extends HttpServlet {
    private final static Logger LOGGER = Logger.getLogger(GoogleLoginController.class.getName());

    private final String ADMIN = "AdminIndex";
    private final String USER = "Index";
    private final String ERROR = "login.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean result = false;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                return;
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                String name = googlePojo.getName();
                String email = googlePojo.getEmail();
                AccountDAO accountDAO = new AccountDAO();
                boolean existUser = accountDAO.checkExistUser(email);

                AccountDTO dto;
                if (existUser) {
                    dto = accountDAO.googleLogin(email);
                } else {
                    dto = new AccountDTO(email, name, "******", "User", "Actived");
                    result = accountDAO.registerUser(dto);
                }

                if (dto != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", dto);
                    if (dto.getStatus().equals("Actived")) {
                        if (dto.getRole().equals("Admin")) {
                            url = ADMIN;
                        } else if (dto.getRole().equals("User")) {
                            url = USER;
                        }
                        result = true;
                    } else {
                        request.setAttribute("LOGINERROR", "Incorrect Email or Password!");
                        result = false;
                    }
                }
            }

        } catch (Exception e) {
            LOGGER.error("Error at GoogleLoginController: " + e.toString());
        } finally {
            if (result) {
                response.sendRedirect(url);
            } else {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
