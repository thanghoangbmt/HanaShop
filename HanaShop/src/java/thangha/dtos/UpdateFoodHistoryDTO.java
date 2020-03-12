/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

/**
 *
 * @author Admin
 */
public class UpdateFoodHistoryDTO {
    private int ID;
    private String updateDate;
    private String updatingEmail;
    private String updateType;
    private int foodID;

    public UpdateFoodHistoryDTO() {
    }

    public UpdateFoodHistoryDTO(String updatingEmail, String updateType, int foodID) {
        this.updatingEmail = updatingEmail;
        this.updateType = updateType;
        this.foodID = foodID;
    }

    public UpdateFoodHistoryDTO(int ID, String updateDate, String updatingEmail, String updateType, int foodID) {
        this.ID = ID;
        this.updateDate = updateDate;
        this.updatingEmail = updatingEmail;
        this.updateType = updateType;
        this.foodID = foodID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdatingEmail() {
        return updatingEmail;
    }

    public void setUpdatingEmail(String updatingEmail) {
        this.updatingEmail = updatingEmail;
    }

    public String getUpdateType() {
        return updateType;
    }

    public void setUpdateType(String updateType) {
        this.updateType = updateType;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }
}
