/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.CategoryDAO;
import thangha.daos.FoodAndDrinkStatusDAO;
import thangha.dtos.CategoryDTO;
import thangha.dtos.FoodAndDrinkStatusDTO;

/**
 *
 * @author Admin
 */
public class AdminIndexController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(AdminIndexController.class.getName());

    private final String SUCCESS = "AdminPaginationController";

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
        String url = SUCCESS;
        try {
            String search = "";
            String category = "All";
            String status = "All";
            int priceFrom = -1;
            int priceTo = -1;
            HttpSession session = request.getSession();
            session.setAttribute("search", search);
            session.setAttribute("category", category);
            session.setAttribute("status", status);
            session.setAttribute("priceFrom", priceFrom);
            session.setAttribute("priceTo", priceTo);

            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> listCategory = categoryDAO.getListCategory();

            FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
            List<FoodAndDrinkStatusDTO> listStatus = foodAndDrinkStatusDAO.getListFoodStatus();

            request.setAttribute("LIST_FOOD_CATEGORY", listCategory);
            request.setAttribute("LIST_FOOD_STATUS", listStatus);
        } catch (Exception e) {
            LOGGER.error("Error at AdminIndexController");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
