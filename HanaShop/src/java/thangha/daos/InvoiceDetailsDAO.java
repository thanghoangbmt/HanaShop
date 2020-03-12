/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import thangha.dtos.FoodAndDrinkDTO;
import thangha.dtos.InvoiceDetailsDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class InvoiceDetailsDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean addNewInvoiceDetails(FoodAndDrinkDTO dto, int invoiceID) throws NamingException, SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO InvoiceDetails(FoodAndDrinkID, FoodAndDrinkQuantity, "
                        + "TotalPrice, InvoiceID) VALUES(?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, dto.getID());
                ps.setInt(2, dto.getQuantity());
                ps.setDouble(3, dto.getPrice() * dto.getQuantity());
                ps.setInt(4, invoiceID);
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public ArrayList<InvoiceDetailsDTO> getListInvoiceDetailsByInvoiceID(int invoiceID) throws NamingException, SQLException {
        ArrayList<InvoiceDetailsDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, FoodAndDrinkID, FoodAndDrinkQuantity, "
                        + "TotalPrice, InvoiceID FROM InvoiceDetails WHERE InvoiceID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, invoiceID);
                rs = ps.executeQuery();
                while(rs.next()) {
                    int ID = rs.getInt("ID");
                    int foodAndDrinkID = rs.getInt("FoodAndDrinkID");
                    int foodAndDrinkQuantity = rs.getInt("FoodAndDrinkQuantity");
                    double totalPrice = rs.getDouble("TotalPrice");
                    int invoiceIDResult = rs.getInt("InvoiceID");
                    
                    InvoiceDetailsDTO invoiceDetailsDTO = new InvoiceDetailsDTO(ID, 
                            foodAndDrinkID, foodAndDrinkQuantity, totalPrice, invoiceIDResult);
                    result.add(invoiceDetailsDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
