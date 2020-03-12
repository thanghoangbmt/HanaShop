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
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import thangha.dtos.FoodAndDrinkStatusDTO;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class FoodAndDrinkStatusDAO implements Serializable{
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
    
    public int getStatusIDByDescription(String statusDescription) throws SQLException, NamingException {
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM FoodStatus WHERE Description = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, statusDescription);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("ID");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getStatusDescriptionByID(int ID) throws SQLException, NamingException {
        String result = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Description FROM FoodStatus WHERE ID = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, ID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    result = rs.getString("Description");
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<FoodAndDrinkStatusDTO> getListFoodStatus() throws NamingException, SQLException {
        List<FoodAndDrinkStatusDTO> result = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID, Description FROM FoodStatus";
                ps = conn.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int ID = rs.getInt("ID");
                    String description = rs.getString("Description");
                    FoodAndDrinkStatusDTO dto = new FoodAndDrinkStatusDTO(ID, description);
                    result.add(dto);
                }
            }
        } finally {
            closeConnection();
        }
        return result;
    }
}
