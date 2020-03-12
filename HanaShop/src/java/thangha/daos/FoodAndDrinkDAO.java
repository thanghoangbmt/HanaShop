/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.naming.NamingException;
import thangha.dtos.FoodAndDrinkDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class FoodAndDrinkDAO implements Serializable {

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

    public List<FoodAndDrinkDTO> getListFoodAndDrink(String name, double priceFrom,
            double priceTo, String category, String status, int start, int total) throws NamingException, SQLException {
        List<FoodAndDrinkDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Name, Description, Price, Quantity, CreateDate, "
                        + "CategoryID, StatusID, Image FROM FoodAndDrinks";
                if (!name.isEmpty()) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";
                    }
                    sql = sql + "Name LIKE '%" + name + "%'";
                }

                if (!(priceFrom < 0 && priceTo < 0)) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";
                    }
                    if (priceFrom < 0 && priceTo >= 0) {
                        sql = sql + "Price BETWEEN 0 AND " + priceTo;
                    } else if (priceFrom >= 0 && priceTo < 0) {
                        sql = sql + "Price >= " + priceFrom;
                    } else if (priceFrom >= 0 && priceTo >= 0) {
                        sql = sql + "Price BETWEEN " + priceFrom + " AND " + priceTo;
                    }
                }

                if (!category.equals("All")) {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    int categoryID = categoryDAO.getCategoryIDByDescription(category);
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";

                    }
                    sql = sql + "CategoryID = " + categoryID;
                }

                if (!status.equals("All")) {
                    FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
                    int statusID = foodAndDrinkStatusDAO.getStatusIDByDescription(status);
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";

                    }
                    sql = sql + "StatusID = " + statusID;
                }

                sql = sql + " ORDER BY CreateDate DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, start);
                ps.setInt(2, total);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String nameResult = rs.getString("Name");
                    String description = rs.getString("Description");
                    double price = rs.getDouble("Price");
                    int quantity = rs.getInt("Quantity");
                    Timestamp createDateSQL = rs.getTimestamp("CreateDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String date = dateFormater.format(createDateSQL);

                    int categoryIDResult = rs.getInt("CategoryID");
                    CategoryDAO cdao = new CategoryDAO();
                    String categoryDescription = cdao.getCategoryDescriptionByID(categoryIDResult);

                    int statusIDResult = rs.getInt("StatusID");
                    FoodAndDrinkStatusDAO fadsdao = new FoodAndDrinkStatusDAO();
                    String statusDescription = fadsdao.getStatusDescriptionByID(statusIDResult);

                    String image = rs.getString("Image");
                    FoodAndDrinkDTO dto = new FoodAndDrinkDTO(ID, nameResult, description,
                            price, quantity, categoryDescription, statusDescription, date, image);

                    result.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<FoodAndDrinkDTO> getListFoodAndDrinkForUser(String name, double priceFrom,
            double priceTo, String category, int start, int total) throws NamingException, SQLException {
        List<FoodAndDrinkDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Name, Description, Price, Quantity, CreateDate, "
                        + "CategoryID, StatusID, Image FROM FoodAndDrinks "
                        + "WHERE Quantity > 0 AND StatusID = 1";
                if (!name.isEmpty()) {
                    sql = sql + " AND Name LIKE '%" + name + "%'";
                }

                if (!(priceFrom < 0 && priceTo < 0)) {
                    if (priceFrom < 0 && priceTo >= 0) {
                        sql = sql + " AND Price BETWEEN 0 AND " + priceTo;
                    } else if (priceFrom >= 0 && priceTo < 0) {
                        sql = sql + " AND Price >= " + priceFrom;
                    } else if (priceFrom >= 0 && priceTo >= 0) {
                        sql = sql + " AND Price BETWEEN " + priceFrom + " AND " + priceTo;
                    }
                }

                if (!category.equals("All")) {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    int categoryID = categoryDAO.getCategoryIDByDescription(category);
                    sql = sql + " AND CategoryID = " + categoryID;
                }

                sql = sql + " ORDER BY CreateDate DESC OFFSET ? ROWS FETCH FIRST ? ROWS ONLY";

                ps = conn.prepareStatement(sql);
                ps.setInt(1, start);
                ps.setInt(2, total);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String nameResult = rs.getString("Name");
                    String description = rs.getString("Description");
                    double price = rs.getDouble("Price");
                    int quantity = rs.getInt("Quantity");
                    Timestamp createDateSQL = rs.getTimestamp("CreateDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy");
                    String date = dateFormater.format(createDateSQL);

                    int categoryIDResult = rs.getInt("CategoryID");
                    CategoryDAO cdao = new CategoryDAO();
                    String categoryDescription = cdao.getCategoryDescriptionByID(categoryIDResult);

                    int statusIDResult = rs.getInt("StatusID");
                    FoodAndDrinkStatusDAO fadsdao = new FoodAndDrinkStatusDAO();
                    String statusDescription = fadsdao.getStatusDescriptionByID(statusIDResult);

                    String image = rs.getString("Image");
                    FoodAndDrinkDTO dto = new FoodAndDrinkDTO(ID, nameResult, description,
                            price, quantity, categoryDescription, statusDescription, date, image);

                    result.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfFoodAndDrink(String name, int priceFrom, int priceTo, String category, String status) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) AS Result FROM FoodAndDrinks";
                if (!name.isEmpty()) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";
                    }
                    sql = sql + "Name LIKE '%" + name + "%'";
                }

                if (!(priceFrom < 0 && priceTo < 0)) {
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";
                    }
                    if (priceFrom < 0 && priceTo >= 0) {
                        sql = sql + "Price BETWEEN 0 AND " + priceTo;
                    } else if (priceFrom >= 0 && priceTo < 0) {
                        sql = sql + "Price BETWEEN 0 AND " + priceFrom;
                    } else if (priceFrom >= 0 && priceTo >= 0) {
                        if (priceFrom <= priceTo) {
                            sql = sql + "Price BETWEEN 0 AND " + priceTo;
                        } else {
                            sql = sql + "Price BETWEEN 0 AND " + priceFrom;
                        }
                    }
                }

                if (!category.equals("All")) {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    int categoryID = categoryDAO.getCategoryIDByDescription(category);
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";

                    }
                    sql = sql + "CategoryID = " + categoryID;
                }

                if (!status.equals("All")) {
                    FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
                    int statusID = foodAndDrinkStatusDAO.getStatusIDByDescription(status);
                    if (!sql.contains("WHERE")) {
                        sql = sql + " WHERE ";
                    } else {
                        sql = sql + " AND ";

                    }
                    sql = sql + "StatusID = " + statusID;
                }
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("Result");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getNumberOfFoodAndDrinkForUser(String name, double priceFrom,
            double priceTo, String category) throws SQLException, NamingException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ID) AS Result FROM FoodAndDrinks "
                        + "WHERE Quantity > 0 AND StatusID = 1";
                if (!name.isEmpty()) {
                    sql = sql + " AND Name LIKE '%" + name + "%'";
                }

                if (!(priceFrom < 0 && priceTo < 0)) {
                    if (priceFrom < 0 && priceTo >= 0) {
                        sql = sql + " AND Price BETWEEN 0 AND " + priceTo;
                    } else if (priceFrom >= 0 && priceTo < 0) {
                        sql = sql + " AND Price >= " + priceFrom;
                    } else if (priceFrom >= 0 && priceTo >= 0) {
                        sql = sql + " AND Price BETWEEN " + priceFrom + " AND " + priceTo;
                    }
                }

                if (!category.equals("All")) {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    int categoryID = categoryDAO.getCategoryIDByDescription(category);
                    sql = sql + " AND CategoryID = " + categoryID;
                }
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("Result");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addNewFoodAndDrink(FoodAndDrinkDTO foodAndDrinkDTO) throws SQLException, NamingException {
        boolean result = false;
        try {
            CategoryDAO categoryDAO = new CategoryDAO();
            int categoryID = categoryDAO.getCategoryIDByDescription(foodAndDrinkDTO.getCategory());
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO FoodAndDrinks(Name, Description, "
                        + "Price, Quantity, CreateDate, CategoryID, StatusID, Image) "
                        + "VALUES(?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, foodAndDrinkDTO.getName());
                ps.setString(2, foodAndDrinkDTO.getDescription());
                ps.setDouble(3, foodAndDrinkDTO.getPrice());
                ps.setInt(4, foodAndDrinkDTO.getQuantity());

                //Date:
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                ps.setTimestamp(5, timestamp);

                ps.setInt(6, categoryID);
                ps.setInt(7, 1);
                ps.setString(8, foodAndDrinkDTO.getImage());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public FoodAndDrinkDTO getFoodAndDrinkByID(int ID) throws SQLException, NamingException {
        FoodAndDrinkDTO result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Name, Description, Price, Quantity, "
                        + "CreateDate, CategoryID, StatusID, Image "
                        + "FROM FoodAndDrinks WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int resultID = rs.getInt("ID");
                    String nameResult = rs.getString("Name");
                    String description = rs.getString("Description");
                    double price = rs.getDouble("Price");
                    int quantity = rs.getInt("Quantity");
                    Timestamp createDateSQL = rs.getTimestamp("CreateDate");
                    SimpleDateFormat dateFormater = new SimpleDateFormat("MMMM dd, yyyy HH:mm:ss");
                    String date = dateFormater.format(createDateSQL);

                    int categoryIDResult = rs.getInt("CategoryID");
                    CategoryDAO cdao = new CategoryDAO();
                    String categoryDescription = cdao.getCategoryDescriptionByID(categoryIDResult);

                    int statusIDResult = rs.getInt("StatusID");
                    FoodAndDrinkStatusDAO fadsdao = new FoodAndDrinkStatusDAO();
                    String statusDescription = fadsdao.getStatusDescriptionByID(statusIDResult);

                    String image = rs.getString("Image");
                    result = new FoodAndDrinkDTO(resultID, nameResult, description,
                            price, quantity, categoryDescription, statusDescription, date, image);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateFoodContainsImage(FoodAndDrinkDTO foodAndDrinkDTO) throws NamingException, SQLException {
        boolean result = false;
        try {
            CategoryDAO categoryDAO = new CategoryDAO();
            int categoryID = categoryDAO.getCategoryIDByDescription(foodAndDrinkDTO.getCategory());

            FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
            int statusID = foodAndDrinkStatusDAO.getStatusIDByDescription(foodAndDrinkDTO.getStatus());
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE FoodAndDrinks SET Name = ?, Description = ?, "
                        + "Price = ?, Quantity = ?, CategoryID = ?, StatusID = ?, Image = ? "
                        + "WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, foodAndDrinkDTO.getName());
                ps.setString(2, foodAndDrinkDTO.getDescription());
                ps.setDouble(3, foodAndDrinkDTO.getPrice());
                ps.setInt(4, foodAndDrinkDTO.getQuantity());

                ps.setInt(5, categoryID);
                ps.setInt(6, statusID);

                ps.setString(7, foodAndDrinkDTO.getImage());
                ps.setInt(8, foodAndDrinkDTO.getID());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateFoodNotContainsImage(FoodAndDrinkDTO foodAndDrinkDTO) throws NamingException, SQLException {
        boolean result = false;
        try {
            CategoryDAO categoryDAO = new CategoryDAO();
            int categoryID = categoryDAO.getCategoryIDByDescription(foodAndDrinkDTO.getCategory());

            FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
            int statusID = foodAndDrinkStatusDAO.getStatusIDByDescription(foodAndDrinkDTO.getStatus());
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE FoodAndDrinks SET Name = ?, Description = ?, "
                        + "Price = ?, Quantity = ?, CategoryID = ?, StatusID = ? "
                        + "WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, foodAndDrinkDTO.getName());
                ps.setString(2, foodAndDrinkDTO.getDescription());
                ps.setDouble(3, foodAndDrinkDTO.getPrice());
                ps.setInt(4, foodAndDrinkDTO.getQuantity());

                ps.setInt(5, categoryID);
                ps.setInt(6, statusID);

                ps.setInt(7, foodAndDrinkDTO.getID());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getCurrentFoodAndDrinkStatusByID(int ID) throws SQLException, NamingException {
        String result = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT StatusID FROM FoodAndDrinks WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int statusID = rs.getInt("StatusID");
                    FoodAndDrinkStatusDAO foodAndDrinkStatusDAO = new FoodAndDrinkStatusDAO();
                    result = foodAndDrinkStatusDAO.getStatusDescriptionByID(statusID);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public double getPrice(int ID) throws SQLException, NamingException {
        double result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Price FROM FoodAndDrinks WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getDouble("Price");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public FoodAndDrinkDTO getFoodAndDrinkInfo(int ID) throws NamingException, SQLException {
        FoodAndDrinkDTO result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Name, CategoryID, Price, Image FROM FoodAndDrinks WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int IDResult = rs.getInt("ID");
                    String name = rs.getString("Name");
                    
                    int categoryID = rs.getInt("CategoryID");
                    CategoryDAO categoryDAO = new CategoryDAO();
                    String category = categoryDAO.getCategoryDescriptionByID(categoryID);
                    
                    double price = rs.getDouble("Price");
                    String image = rs.getString("Image");
                    result = new FoodAndDrinkDTO(IDResult, name, category, price, image);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean checkAvailable(int ID) throws NamingException, SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM FoodAndDrinks "
                        + "WHERE ID = ? AND StatusID = ? AND Quantity > 0";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                ps.setInt(2, 1);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getQuantity(int ID) throws NamingException, SQLException {
        int result = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Quantity FROM FoodAndDrinks "
                        + "WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("Quantity");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public void updateQuantity(FoodAndDrinkDTO dto) throws NamingException, SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE FoodAndDrinks SET Quantity = Quantity - ? "
                        + "WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, dto.getQuantity());
                ps.setInt(2, dto.getID());
                ps.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }
}
