/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class AdminPaginationController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(AdminPaginationController.class.getName());

    private final String SUCCESS = "admin.jsp";

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
            HttpSession session = request.getSession();
            String search = (String) session.getAttribute("search");
            String category = (String) session.getAttribute("category");
            String status = (String) session.getAttribute("status");
            int priceFrom = (int) session.getAttribute("priceFrom");
            int priceTo = (int) session.getAttribute("priceTo");

            String spageid = request.getParameter("page");
            if (spageid == null) {
                spageid = "1";
            }
            int pageID = Integer.parseInt(spageid);
            int total = 20;
            if (pageID == 1) {
                pageID = pageID - 1;
            } else {
                pageID = pageID - 1;
                pageID = pageID * total;
            }

            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            List<FoodAndDrinkDTO> list = foodAndDrinkDAO.getListFoodAndDrink(search, priceFrom, priceTo, category, status, pageID, total);

            int numberOfArticles = foodAndDrinkDAO.getNumberOfFoodAndDrink(search, priceFrom, priceTo, category, status);

            if (numberOfArticles == 0) {
                request.setAttribute("SEARCH_MESSAGE", "There are no Food & Drink to display!");
            } else {
                int numberOfPage = (numberOfArticles - 1) / total + 1;
                ArrayList<Integer> listPage = new ArrayList<>();
                for (int i = 1; i <= numberOfPage; i++) {
                    listPage.add(i);
                }
                request.setAttribute("LIST_FOOD_AND_DRINK", list);
                request.setAttribute("NB_PAGE", listPage);
            }

            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> listCategory = categoryDAO.getListCategory();

            FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
            List<FoodAndDrinkStatusDTO> listStatus = foodAndDrinkStatusDAO.getListFoodStatus();

            request.setAttribute("LIST_FOOD_CATEGORY", listCategory);
            request.setAttribute("LIST_FOOD_STATUS", listStatus);
        } catch (Exception e) {
            LOGGER.error("Error at AdminPaginationController: " + e.toString());
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
