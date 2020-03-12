/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.FoodAndDrinkDAO;
import thangha.daos.InvoiceDetailsDAO;
import thangha.dtos.AccountDTO;
import thangha.dtos.FoodAndDrinkDTO;
import thangha.dtos.InvoiceDetailsDTO;

/**
 *
 * @author Admin
 */
public class ViewInvoiceDetailsController extends HttpServlet {
    private final static Logger LOGGER = Logger.getLogger(ViewInvoiceDetailsController.class.getName());

    private final String USER = "view_invoice_details.jsp";
    private final String ADMIN = "admin_view_invoice_details.jsp";
    
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
        String url = USER;
        try {
            String sInvoiceID = request.getParameter("invoiceID");
            int invoiceID = Integer.parseInt(sInvoiceID);
            InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
            ArrayList<InvoiceDetailsDTO> listInvoiceDetails = invoiceDetailsDAO.getListInvoiceDetailsByInvoiceID(invoiceID);
            ArrayList<FoodAndDrinkDTO> listFoodAndDrinkDetails = new ArrayList<>();
            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            for (int i = 0; i < listInvoiceDetails.size(); i++) {
                FoodAndDrinkDTO dto = foodAndDrinkDAO.getFoodAndDrinkByID(listInvoiceDetails.get(i).getFoodID());
                dto.setQuantity(listInvoiceDetails.get(i).getFoodQuantity());
                dto.setPrice(listInvoiceDetails.get(i).getTotalPrice());
                listFoodAndDrinkDetails.add(dto);
            }
            HttpSession session = request.getSession();
            AccountDTO accountDTO = (AccountDTO)session.getAttribute("USER");
            if (accountDTO != null) {
                if (accountDTO.getRole().equals("Admin")) {
                    url = ADMIN;
                }
            }
            request.setAttribute("LIST_FOOD_DETAILS", listFoodAndDrinkDetails);
        } catch (Exception e) {
            LOGGER.error("Error at ViewInvoiceDetailsController: " + e.toString());
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
