/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.FoodAndDrinkDAO;
import thangha.daos.InvoiceDAO;
import thangha.daos.InvoiceDetailsDAO;
import thangha.dtos.AccountDTO;
import thangha.dtos.CartDTO;
import thangha.dtos.FoodAndDrinkDTO;

/**
 *
 * @author Admin
 */
public class CheckOutController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(CheckOutController.class.getName());

    private final String SUCCESS = "shopping_cart.jsp";

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
            AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
            String email = accountDTO.getEmail();

            CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
            if (cartDTO.getCustomerEmail().isEmpty()) {
                cartDTO.setCustomerEmail(email);
            }

            if (cartDTO.getCart().isEmpty()) {
                request.setAttribute("CART_EMPTY_ERROR", "Empty Cart!");
                return;
            }

            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            List<Integer> listFoodID = new ArrayList<>(cartDTO.getCart().keySet());

            List<FoodAndDrinkDTO> listFoodAndDrink = new ArrayList<>(cartDTO.getCart().values());

            List<Integer> listFoodIDNotAvailable = new ArrayList<>();
            List<FoodAndDrinkDTO> listFoodNotAvailable = new ArrayList<>();

            for (int i = 0; i < listFoodID.size(); i++) {
                boolean available = foodAndDrinkDAO.checkAvailable(listFoodID.get(i));
                if (!available) {
                    listFoodIDNotAvailable.add(listFoodID.get(i));
                    listFoodNotAvailable.add(cartDTO.getCart().get(listFoodID.get(i)));
                    cartDTO.delete(listFoodID.get(i));
                }
            }

            List<FoodAndDrinkDTO> listFoodAndDrinkOutOfStock = new ArrayList<>();

            for (int i = 0; i < listFoodAndDrink.size(); i++) {
                int currentQuantity = foodAndDrinkDAO.getQuantity(listFoodAndDrink.get(i).getID());
                if (currentQuantity < listFoodAndDrink.get(i).getQuantity()) {
                    listFoodAndDrinkOutOfStock.add(listFoodAndDrink.get(i));
                }
            }

            boolean result = false;
            if (!listFoodIDNotAvailable.isEmpty()) {
                request.setAttribute("LIST_FOOD_NOT_AVAILABLE", listFoodNotAvailable);
            }
            if (!listFoodAndDrinkOutOfStock.isEmpty()) {
                request.setAttribute("LIST_FOOD_OUT_OF_STOCK", listFoodAndDrinkOutOfStock);
            }

            if (listFoodIDNotAvailable.isEmpty() && listFoodAndDrinkOutOfStock.isEmpty()) {
                InvoiceDAO invoiceDAO = new InvoiceDAO();
                InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                int invoiceID = invoiceDAO.addNewInvoice(email);
                for (int i = 0; i < listFoodAndDrink.size(); i++) {
                    invoiceDetailsDAO.addNewInvoiceDetails(listFoodAndDrink.get(i), invoiceID);
                    foodAndDrinkDAO.updateQuantity(listFoodAndDrink.get(i));
                }
                session.removeAttribute("CART");
                result = true;
            }

            if (result) {
                request.setAttribute("CHECKOUT_SUCCESSFULLY_MESSAGE", "Check out successfully!");
            } else {
                request.setAttribute("CHECKOUT_FAILED_MESSAGE", "Check out failed!");
            }
        } catch (SQLException | NamingException e) {
            LOGGER.error("Error at CheckOutController: " + e.toString());
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
