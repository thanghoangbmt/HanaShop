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
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.daos.FoodAndDrinkDAO;
import thangha.daos.UpdateFoodHistoryDAO;
import thangha.dtos.AccountDTO;
import thangha.dtos.FoodAndDrinkDTO;
import thangha.dtos.UpdateFoodHistoryDTO;

/**
 *
 * @author Admin
 */
public class AdminUpdateFoodAndDrinkController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(AdminUpdateFoodAndDrinkController.class.getName());

    private final String SUCCESS = "admin_update_food_and_drink.jsp";
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

            String sID = mreq.getParameter("ID");
            String name = mreq.getParameter("name");
            String description = mreq.getParameter("description");
            String sPrice = mreq.getParameter("price");
            String sQuantity = mreq.getParameter("quantity");
            String category = mreq.getParameter("category");
            String status = mreq.getParameter("status");

            int ID = Integer.parseInt(sID);
            double price = Double.parseDouble(sPrice);
            int quantity = Integer.parseInt(sQuantity);

            Enumeration files = mreq.getFileNames();
            String upload = (String) files.nextElement();
            String image = mreq.getOriginalFileName(upload);
            if ((image != null) && (!image.isEmpty())) {
                image = SAVE_DIRECTORY + "/" + image;
            }

            FoodAndDrinkDTO foodAndDrinkDTO = new FoodAndDrinkDTO(ID, name,
                    description, price, quantity, category, status, image);
            FoodAndDrinkDAO foodAndDrinkDAO = new FoodAndDrinkDAO();
            String currentFoodAndDrinkStatus = foodAndDrinkDAO.getCurrentFoodAndDrinkStatusByID(ID);

            boolean result;
            if ((image != null) && (!image.isEmpty())) {
                result = foodAndDrinkDAO.updateFoodContainsImage(foodAndDrinkDTO);
            } else {
                result = foodAndDrinkDAO.updateFoodNotContainsImage(foodAndDrinkDTO);
            }

            if (result) {
                request.setAttribute("UPDATE_SUCCESS", "Update successfully!");

                HttpSession session = request.getSession();
                AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
                String updatingEmail = accountDTO.getEmail();
                String updateType = "Updated";
                if (!currentFoodAndDrinkStatus.equals(status)) {
                    if (status.equals("Actived")) {
                        updateType = "ReActived";
                    } else if (status.equals("Deleted")) {
                        updateType = "Deleted";
                    }
                }
                UpdateFoodHistoryDTO updateFoodHistoryDTO = new UpdateFoodHistoryDTO(updatingEmail, updateType, ID);
                UpdateFoodHistoryDAO updateFoodHistoryDAO = new UpdateFoodHistoryDAO();
                updateFoodHistoryDAO.addNewUpdateHistory(updateFoodHistoryDTO);
            } else {
                request.setAttribute("UPDATE_ERROR", "Update failed!");
            }
        } catch (Exception e) {
            LOGGER.error("Error at AdminUpdateFoodAndDrinkController: " + e.toString());
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
