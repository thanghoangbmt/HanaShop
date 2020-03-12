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
import org.apache.log4j.Logger;
import thangha.daos.CategoryDAO;
import thangha.daos.FoodAndDrinkDAO;
import thangha.daos.FoodAndDrinkStatusDAO;
import thangha.dtos.CategoryDTO;
import thangha.dtos.FoodAndDrinkDTO;
import thangha.dtos.FoodAndDrinkStatusDTO;

/**
 *
 * @author Admin
 */
public class AdminPreUpdateFoodAndDrinkController extends HttpServlet {
    private final static Logger LOGGER = Logger.getLogger(AdminPreUpdateFoodAndDrinkController.class.getName());

    private final String SUCCESS = "admin_update_food_and_drink.jsp";

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
            String sID = request.getParameter("foodID");
            int ID = Integer.parseInt(sID);
            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            FoodAndDrinkDTO dto = foodAndDrinkDAO.getFoodAndDrinkByID(ID);

            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> listCategory = categoryDAO.getListCategory();

            FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
            List<FoodAndDrinkStatusDTO> listFoodAndDrinkStatus = foodAndDrinkStatusDAO.getListFoodStatus();

            request.setAttribute("FOOD_DRINK", dto);
            request.setAttribute("LIST_CATEGORY", listCategory);
            request.setAttribute("LIST_STATUS", listFoodAndDrinkStatus);
        } catch (Exception e) {
            LOGGER.error("Error at AdminPreUpdateFoodAndDrinkController: " + e.toString());
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
