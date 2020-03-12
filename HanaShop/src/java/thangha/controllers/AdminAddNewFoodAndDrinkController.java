/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.controllers;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import thangha.daos.FoodAndDrinkDAO;
import thangha.dtos.FoodAndDrinkDTO;

/**
 *
 * @author Admin
 */
public class AdminAddNewFoodAndDrinkController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(AdminAddNewFoodAndDrinkController.class.getName());

    private final String SUCCESS = "AdminPreAddNewFoodAndDrinkController";
    private final String SAVE_DIRECTORY = "img";

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
            String appPath = request.getServletContext().getRealPath("");
            appPath = appPath.replace('\\', '/');
            int indexOfBuild = appPath.indexOf("build");
            appPath = appPath.substring(0, indexOfBuild) + appPath.substring(indexOfBuild + 6);
            String fullSavePath = null;
            if (appPath.endsWith("/")) {
                fullSavePath = appPath + SAVE_DIRECTORY;
            } else {
                fullSavePath = appPath + "/" + SAVE_DIRECTORY;
            }

            int maxFileSize = 500000 * 1024;
            MultipartRequest mreq = new MultipartRequest(request, fullSavePath, maxFileSize);

            String name = mreq.getParameter("name");
            String description = mreq.getParameter("description");
            String sPrice = mreq.getParameter("price");
            String sQuantity = mreq.getParameter("quantity");
            String category = mreq.getParameter("category");

            double price = Double.parseDouble(sPrice);
            int quantity = Integer.parseInt(sQuantity);

            Enumeration files = mreq.getFileNames();
            String upload = (String) files.nextElement();
            String image = mreq.getOriginalFileName(upload);
            image = SAVE_DIRECTORY + "/" + image;

            FoodAndDrinkDTO foodAndDrinkDTO = new FoodAndDrinkDTO(name, description,
                    price, quantity, category, image);
            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            boolean result = foodAndDrinkDAO.addNewFoodAndDrink(foodAndDrinkDTO);
            if (result) {
                request.setAttribute("INSERT_SUCCESS", "Insert new food successfully!");
            } else {
                request.setAttribute("INSERT_ERROR", "Insert new food failed!");
            }
        } catch (Exception e) {
            LOGGER.error("Error at AdminAddNewFoodAndDrinkController: " + e.toString());
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
