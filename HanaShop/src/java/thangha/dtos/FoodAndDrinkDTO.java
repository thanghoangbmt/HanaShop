/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class FoodAndDrinkDTO implements Serializable {

    private int ID;
    private String name;
    private String description;
    private double price;
    private int quantity;
    private String category;
    private String status;
    private String date;
    private String image;

    public FoodAndDrinkDTO() {
    }

    public FoodAndDrinkDTO(int ID, String name, String category, double price, String image) {
        this.ID = ID;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }
    
    public FoodAndDrinkDTO(String name, String description, double price, int quantity, String category, String image) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.image = image;
    }

    public FoodAndDrinkDTO(String name, String description, double price, int quantity, String category, String status, String date, String image) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.status = status;
        this.date = date;
        this.image = image;
    }

    public FoodAndDrinkDTO(int ID, String name, String description, double price, int quantity, String category, String status, String date, String image) {
        this.ID = ID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.status = status;
        this.date = date;
        this.image = image;
    }

    public FoodAndDrinkDTO(int ID, String name, String description, double price, int quantity, String category, String status, String image) {
        this.ID = ID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
        this.status = status;
        this.image = image;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
