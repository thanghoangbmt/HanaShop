/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class CartDTO {

    private String customerEmail;
    private Map<Integer, FoodAndDrinkDTO> cart;

    public CartDTO() {
    }

    public CartDTO(String customerEmail, Map<Integer, FoodAndDrinkDTO> cart) {
        this.customerEmail = customerEmail;
        this.cart = cart;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public Map<Integer, FoodAndDrinkDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, FoodAndDrinkDTO> cart) {
        this.cart = cart;
    }

    public boolean add(FoodAndDrinkDTO foodAndDrinkDTO) {
        boolean result = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }

        if (this.cart.containsKey(foodAndDrinkDTO.getID())) {
            int quantity = this.cart.get(foodAndDrinkDTO.getID()).getQuantity();
            foodAndDrinkDTO.setQuantity(quantity + 1);
            cart.put(foodAndDrinkDTO.getID(), foodAndDrinkDTO);
            result = true;
        } else {
            cart.put(foodAndDrinkDTO.getID(), foodAndDrinkDTO);
            result = true;
        }
        return result;
    }
    
    public boolean updateQuantity(FoodAndDrinkDTO foodAndDrinkDTO) {
        boolean result = false;

        if (this.cart.containsKey(foodAndDrinkDTO.getID())) {
            int quantity = this.cart.get(foodAndDrinkDTO.getID()).getQuantity();
            cart.put(foodAndDrinkDTO.getID(), foodAndDrinkDTO);
            result = true;
        } 
        return result;
    }

    public void delete(int ID) {
        if (this.cart == null) {
            return;
        }

        if (this.cart.containsKey(ID)) {
            this.cart.remove(ID);
        }
    }

    public double getTotalPrice() {
        double total = 0;
        for (Map.Entry<Integer, FoodAndDrinkDTO> entry : cart.entrySet()) {
            double temp = (entry.getValue().getPrice()) * (entry.getValue().getQuantity());
            total = total + temp;
        }
        return total;
    }
}
