/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class InvoiceDTO {
    private int ID;
    private String dateOfPurchase;
    private String buyerEmail;
    private double totalPrice;
    private ArrayList<InvoiceDetailsDTO> listInvoiceDetails;

    public InvoiceDTO() {
    }

    public InvoiceDTO(int ID, String dateOfPurchase, String buyerEmail, double totalPrice) {
        this.ID = ID;
        this.dateOfPurchase = dateOfPurchase;
        this.buyerEmail = buyerEmail;
        this.totalPrice = totalPrice;
    }

    public InvoiceDTO(int ID, String dateOfPurchase, String buyerEmail, double totalPrice, ArrayList<InvoiceDetailsDTO> listInvoiceDetails) {
        this.ID = ID;
        this.dateOfPurchase = dateOfPurchase;
        this.buyerEmail = buyerEmail;
        this.totalPrice = totalPrice;
        this.listInvoiceDetails = listInvoiceDetails;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getDateOfPurchase() {
        return dateOfPurchase;
    }

    public void setDateOfPurchase(String dateOfPurchase) {
        this.dateOfPurchase = dateOfPurchase;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public ArrayList<InvoiceDetailsDTO> getListInvoiceDetails() {
        return listInvoiceDetails;
    }

    public void setListInvoiceDetails(ArrayList<InvoiceDetailsDTO> listInvoiceDetails) {
        this.listInvoiceDetails = listInvoiceDetails;
    }
}
