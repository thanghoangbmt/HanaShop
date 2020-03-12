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
import java.util.Calendar;
import javax.naming.NamingException;
import thangha.dtos.UpdateFoodHistoryDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UpdateFoodHistoryDAO {
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
    
    public boolean addNewUpdateHistory(UpdateFoodHistoryDTO dto) throws SQLException, NamingException {
        boolean result = false;
        try {
            UpdateFoodAndDrinkTypeDAO updateFoodAndDrinkTypeDAO = new UpdateFoodAndDrinkTypeDAO();
            int updateTypeID = updateFoodAndDrinkTypeDAO.getUpdateIDByDescription(dto.getUpdateType());
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO UpdateFoodHistory(UpdateDate, "
                        + "UpdatingEmail, UpdateTypeID, FoodID) VALUES(?,?,?,?)";
                ps = conn.prepareStatement(sql);
                
                Calendar cal = Calendar.getInstance();
                java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
                ps.setTimestamp(1, timestamp);
                ps.setString(2, dto.getUpdatingEmail());
                ps.setInt(3, updateTypeID);
                ps.setInt(4, dto.getFoodID());
                result = (ps.executeUpdate() > 0);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
