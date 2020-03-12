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
public class InvoiceDetailsDTO {
    private int ID;
    private int foodID;
    private int foodQuantity;
    private double totalPrice;
    private int invoice;

    public InvoiceDetailsDTO() {
    }

    public InvoiceDetailsDTO(int foodID, int foodQuantity, double totalPrice, int invoice) {
        this.foodID = foodID;
        this.foodQuantity = foodQuantity;
        this.totalPrice = totalPrice;
        this.invoice = invoice;
    }
    
    public InvoiceDetailsDTO(int ID, int foodID, int foodQuantity, double totalPrice, int invoice) {
        this.ID = ID;
        this.foodID = foodID;
        this.foodQuantity = foodQuantity;
        this.totalPrice = totalPrice;
        this.invoice = invoice;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public int getFoodQuantity() {
        return foodQuantity;
    }

    public void setFoodQuantity(int foodQuantity) {
        this.foodQuantity = foodQuantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getInvoice() {
        return invoice;
    }

    public void setInvoice(int invoice) {
        this.invoice = invoice;
    }
}
