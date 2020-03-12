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
import javax.naming.NamingException;
import thangha.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class AccountStatusDAO {
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
    
    public int getIDByDescription(String description) throws SQLException, NamingException {
        int result = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT ID FROM AccountStatus WHERE Description = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, description);
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

    public String getDescriptionByID(int ID) throws SQLException, NamingException {
        String result = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Description FROM AccountStatus WHERE ID = ?";
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
}
