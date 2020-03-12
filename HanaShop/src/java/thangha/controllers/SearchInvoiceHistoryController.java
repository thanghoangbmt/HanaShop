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
import thangha.daos.InvoiceDAO;
import thangha.dtos.AccountDTO;
import thangha.dtos.InvoiceDTO;

/**
 *
 * @author Admin
 */
public class SearchInvoiceHistoryController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(SearchInvoiceHistoryController.class.getName());

    private final String USER = "view_invoice_history.jsp";

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
            HttpSession session = request.getSession();
            AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
            String email = accountDTO.getEmail();
            String foodName = request.getParameter("foodName").trim();
            String dayFrom = request.getParameter("dayFrom");
            String dayTo = request.getParameter("dayTo");

            InvoiceDAO invoiceDAO = new InvoiceDAO();
            List<Integer> listInvoiceHistoryID = invoiceDAO.getListInvoiceHistoryIDForUser(email, foodName, dayFrom, dayTo);
            List<InvoiceDTO> listInvoiceSearch = new ArrayList<>();
            for (int i = 0; i < listInvoiceHistoryID.size(); i++) {
                InvoiceDTO invoiceDTO = invoiceDAO.getInvoiceByID(listInvoiceHistoryID.get(i));
                listInvoiceSearch.add(invoiceDTO);
            }

            request.setAttribute("LIST_INVOICE", listInvoiceSearch);
        } catch (Exception e) {
            LOGGER.error("Error at SearchInvoiceHistory: " + e.toString());
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
