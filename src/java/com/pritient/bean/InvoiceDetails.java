/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pritient.bean;

/**
 *
 * @author nishant.vibhute
 */
public class InvoiceDetails {

    int productId;
    String hsn;
    String uom;
    int qty;
    double price;
    double amount;
    double cgstPerc;
    double cgstAmount;
    double sgstPerc;
    double sgstAmount;
    double igstPerc;
    double igstAmount;
    double totalAmountAfterTax;
    String productName;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getCgstPerc() {
        return cgstPerc;
    }

    public void setCgstPerc(double cgstPerc) {
        this.cgstPerc = cgstPerc;
    }

    public double getCgstAmount() {
        return cgstAmount;
    }

    public void setCgstAmount(double cgstAmount) {
        this.cgstAmount = cgstAmount;
    }

    public double getSgstPerc() {
        return sgstPerc;
    }

    public void setSgstPerc(double sgstPerc) {
        this.sgstPerc = sgstPerc;
    }

    public double getSgstAmount() {
        return sgstAmount;
    }

    public void setSgstAmount(double sgstAmount) {
        this.sgstAmount = sgstAmount;
    }

    public double getIgstPerc() {
        return igstPerc;
    }

    public void setIgstPerc(double igstPerc) {
        this.igstPerc = igstPerc;
    }

    public double getIgstAmount() {
        return igstAmount;
    }

    public void setIgstAmount(double igstAmount) {
        this.igstAmount = igstAmount;
    }

    public double getTotalAmountAfterTax() {
        return totalAmountAfterTax;
    }

    public void setTotalAmountAfterTax(double totalAmountAfterTax) {
        this.totalAmountAfterTax = totalAmountAfterTax;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getHsn() {
        return hsn;
    }

    public void setHsn(String hsn) {
        this.hsn = hsn;
    }

    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

}
