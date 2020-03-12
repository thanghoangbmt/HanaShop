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
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.NamingException;
import thangha.dtos.InvoiceDTO;
import thangha.dtos.InvoiceDetailsDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class InvoiceDAO {

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

    public int addNewInvoice(String buyerEmail) throws NamingException, SQLException {
        int ID = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Invoices(DateOfPurchase, BuyerEmail) VALUES(?, ?)";

                ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                ps.setTimestamp(1, timestamp);
                ps.setString(2, buyerEmail);
                ps.executeUpdate();
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    ID = rs.getInt(1);
                }
            }
        } finally {
            closeConnection();
        }
        return ID;
    }

    public List<InvoiceDTO> getListInvoiceByUserEmail(String email) throws SQLException, NamingException {
        List<InvoiceDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, DateOfPurchase, BuyerEmail "
                        + "FROM Invoices WHERE BuyerEmail = ? ORDER BY DateOfPurchase DESC";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    Timestamp date = rs.getTimestamp("DateOfPurchase");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String dateOfPurchase = dateFormater.format(date);
                    String emailResult = rs.getString("BuyerEmail");

                    InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                    ArrayList<InvoiceDetailsDTO> listInvoiceDetails = invoiceDetailsDAO.getListInvoiceDetailsByInvoiceID(ID);

                    double totalPrice = 0;
                    for (int i = 0; i < listInvoiceDetails.size(); i++) {
                        totalPrice += listInvoiceDetails.get(i).getTotalPrice();
                    }

                    InvoiceDTO invoiceDTO = new InvoiceDTO(ID, dateOfPurchase, emailResult, totalPrice, listInvoiceDetails);
                    result.add(invoiceDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<Integer> getListInvoiceHistoryIDForUser(String email, String foodName, String dayFrom, String dayTo) throws NamingException, SQLException {
        List<Integer> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT t1.ID AS ID "
                        + "FROM Invoices t1, InvoiceDetails t2, FoodAndDrinks t3 "
                        + "WHERE t1.BuyerEmail = ? AND t3.ID = t2.FoodAndDrinkID "
                        + "AND t2.InvoiceID = t1.ID";

                if (!foodName.isEmpty()) {
                    sql = sql + " AND t3.Name LIKE '%" + foodName + "%'";
                }

                if (!dayFrom.isEmpty() && !dayTo.isEmpty()) {
                    sql = sql + " AND t1.DateOfPurchase BETWEEN '" + dayFrom + "' AND '" + dayTo + " 23:59:59.997'";
                } else {
                    if (!dayFrom.isEmpty() && dayTo.isEmpty()) {
                        sql = sql + " AND t1.DateOfPurchase >= '" + dayFrom + "'";
                    }

                    if (dayFrom.isEmpty() && !dayTo.isEmpty()) {
                        sql = sql + " AND t1.DateOfPurchase <= '" + dayTo + " 23:59:59.997'";
                    }
                }

                sql = sql + " ORDER BY DateOfPurchase DESC";
                ps = conn.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    result.add(ID);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public List<Integer> getListInvoiceHistoryIDForAdmin(String foodName, String dayFrom, String dayTo) throws NamingException, SQLException {
        List<Integer> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT t1.ID AS ID "
                        + "FROM Invoices t1, InvoiceDetails t2, FoodAndDrinks t3 "
                        + "WHERE t3.ID = t2.FoodAndDrinkID "
                        + "AND t2.InvoiceID = t1.ID";

                if (!foodName.isEmpty()) {
                    sql = sql + " AND t3.Name LIKE '%" + foodName + "%'";
                }

                if (!dayFrom.isEmpty() && !dayTo.isEmpty()) {
                    sql = sql + " AND t1.DateOfPurchase BETWEEN '" + dayFrom + "' AND '" + dayTo + " 23:59:59.997'";
                } else {
                    if (!dayFrom.isEmpty() && dayTo.isEmpty()) {
                        sql = sql + " AND t1.DateOfPurchase >= '" + dayFrom + "'";
                    }

                    if (dayFrom.isEmpty() && !dayTo.isEmpty()) {
                        sql = sql + " AND t1.DateOfPurchase <= '" + dayTo + " 23:59:59.997'";
                    }
                }

                sql = sql + " ORDER BY DateOfPurchase DESC";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    result.add(ID);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public InvoiceDTO getInvoiceByID(int ID) throws NamingException, SQLException {
        InvoiceDTO result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, DateOfPurchase, BuyerEmail "
                        + "FROM Invoices WHERE ID = ? ";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int IDResult = rs.getInt("ID");
                    Timestamp date = rs.getTimestamp("DateOfPurchase");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String dateOfPurchase = dateFormater.format(date);
                    String emailResult = rs.getString("BuyerEmail");

                    InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                    ArrayList<InvoiceDetailsDTO> listInvoiceDetails = invoiceDetailsDAO.getListInvoiceDetailsByInvoiceID(ID);

                    double totalPrice = 0;
                    for (int i = 0; i < listInvoiceDetails.size(); i++) {
                        totalPrice += listInvoiceDetails.get(i).getTotalPrice();
                    }

                    result = new InvoiceDTO(IDResult, dateOfPurchase, emailResult, totalPrice, listInvoiceDetails);
                }
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public List<InvoiceDTO> getListInvoice() throws NamingException, SQLException {
        List<InvoiceDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, DateOfPurchase, BuyerEmail FROM Invoices";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    Timestamp date = rs.getTimestamp("DateOfPurchase");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String dateOfPurchase = dateFormater.format(date);
                    String emailResult = rs.getString("BuyerEmail");

                    InvoiceDetailsDAO invoiceDetailsDAO = new InvoiceDetailsDAO();
                    ArrayList<InvoiceDetailsDTO> listInvoiceDetails = invoiceDetailsDAO.getListInvoiceDetailsByInvoiceID(ID);

                    double totalPrice = 0;
                    for (int i = 0; i < listInvoiceDetails.size(); i++) {
                        totalPrice += listInvoiceDetails.get(i).getTotalPrice();
                    }

                    InvoiceDTO invoiceDTO = new InvoiceDTO(ID, dateOfPurchase, emailResult, totalPrice, listInvoiceDetails);
                    result.add(invoiceDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
